// variables
public var sonicList:Array;
public var sonicCam:FlxCamera;
public var charsMaxVelocity:Array<Array<Float>> = [[300, 700, 900]];
public var charsVelocity:Array<Float> = [4];
public var charsAcceleration:Array<Float> = [950];
var isSelected:Bool = false;
// functions
function create(){
    // playMusic
    FlxG.sound.playMusic(Paths.music('sonic/greenHillZone'), 0.5);
    // camera
    FlxG.camera.zoom = 3;
    FlxG.camera.bgColor = 0xff00e8d8;
    // worldBounds
    FlxG.worldBounds.set(-100000, -100000, 200000, 200000);
    // sonicList
    sonicList = Json.parse(Assets.getText(Paths.json('../data/sonicList')));
    // importScript
    importScript('data/scripts/sonic/background');
    importScript('data/scripts/sonic/sonic');
    importScript('data/scripts/sonic/camFollow');
    for(i in 0...sonicList.scripts.objects.length){
        importScript('data/scripts/sonic/'+sonicList.scripts.objects[i]);
    }
    for(i in 0...sonicList.scripts.badniks.length){
        importScript('data/scripts/sonic/badniks/'+sonicList.scripts.badniks[i]);
    }
    importScript('data/scripts/sonic/frontground');
    importScript('data/scripts/sonic/hud');
    importScript('data/scripts/sonic/water');
    // sonicCam
    sonicCam = new FlxCamera();
    sonicCam.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(sonicCam, false);
}
function update(elapsed){
    if(!isSelected){
        if(controls.BACK){
            // sound
            FlxG.sound.play(Paths.sound('menu/cancel'));
            // state
            new FlxTimer().start(0.25, function(){FlxG.switchState(new MainMenuState());});
            // isSelected
            isSelected = true;
        }
    }
}
function destroy(){
    FlxG.camera.bgColor = FlxColor.BLACK;
}