// functions
function create(){
    add(waterSquare = new FlxSprite(0 * 16, 33 * 16).makeGraphic(150 * 16, 60 * 16, 0xaa0090fc));
}
function postUpdate(elapsed){
    if(FlxG.overlap(sonicHB, waterSquare)){
        // sonic
        charsMaxVelocity[0][0] = 200;
        charsMaxVelocity[0][1] = 600;
        charsMaxVelocity[0][2] = 800;
        charsVelocity[0] = 3;
        charsAcceleration[0] = 850;
    }else{
        // sonic
        charsMaxVelocity[0][0] = 300;
        charsMaxVelocity[0][1] = 700;
        charsMaxVelocity[0][2] = 900;
        charsVelocity[0] = 4;
        charsAcceleration[0] = 950;
    }
}