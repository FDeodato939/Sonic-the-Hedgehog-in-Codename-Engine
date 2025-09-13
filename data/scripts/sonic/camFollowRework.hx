// libraries
import flixel.util.FlxDirectionFlags;
// functions
function create(){
    add(camSquare = new FlxSprite(sonicHB.x, sonicHB.y).makeGraphic(19, 39, FlxColor.RED));
    camSquare.alpha = 0.7;
}
function postUpdate(elapsed){
    // camera
    FlxG.camera.follow(camSquare);
    if(camSquare.x > sonicHB.x + 1){
        camSquare.x += 1;
    }
}