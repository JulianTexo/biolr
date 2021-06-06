state("Biomutant-Win64-Shipping"){
    int gameState : 0x035CA448, 0xBA0, 0x8;
    float gameTimer : 0x038096F0, 0xA0, 0x1AC;    
}

startup{
    vars.trigger = false;
}

start{
    vars.trigger = false;
}

update{
    if(current.gameTimer < 3){
        vars.trigger = true;
    }
    if(vars.trigger == true && old.gameState == 2 && current.gameState == 0 ||
    vars.trigger == true && old.gameState == 3 && current.gameState == 2){
        vars.trigger = false;
    }
}

isLoading
{    
    return current.gameState == 4 || current.gameState == 5 || (vars.trigger == true && (current.gameState == 2 || current.gameState == 3));
}
