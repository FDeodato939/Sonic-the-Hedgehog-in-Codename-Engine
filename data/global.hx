// library
import funkin.backend.utils.WindowUtils;
import openfl.system.Capabilities;
// functions
function preStateSwitch(){
    // winTitle
    WindowUtils.winTitle = "Friday Night Funkin': Sonic the Hedgehog in Codename Engine";
    // codenameBuildField
    Main.framerateSprite.codenameBuildField.visible = false;
    // camera
    FlxG.camera.bgColor = FlxColor.BLACK;
    // playMenuSong
    if(FlxG.sound.music == null || !FlxG.sound.music.playing){
        CoolUtil.playMenuSong();
    }
}
function resizeWindow(w, h){
    // resize
    window.resize(w, h);
    // size
    FlxG.width = FlxG.initialWidth = w;
    FlxG.height = FlxG.initialHeight = h;
    // position
    window.x = (Capabilities.screenResolutionX / 2) - (w / 2);
    window.y = (Capabilities.screenResolutionY / 2) - (h / 2);
}
function destroy(){
    // resetTitle
    WindowUtils.resetTitle();
    // resizeWindow
    resizeWindow(1280, 720);
    // mouse
    FlxG.mouse.visible = false;
    // enableAntialiasing
	FlxG.enableAntialiasing = true;
}
// resizeWindow
resizeWindow(960, 720);
// enableAntialiasing
FlxG.enableAntialiasing = false;