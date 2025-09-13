function postUpdate(elapsed){
    if(FlxG.keys.justPressed.H){
        FlxG.switchState(new ModState('custom/sonic'));
    }
}