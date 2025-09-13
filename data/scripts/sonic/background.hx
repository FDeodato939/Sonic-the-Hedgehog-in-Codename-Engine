// libraries
import flixel.addons.display.FlxBackdrop;
import flixel.addons.tile.FlxTilemapExt;
// variable
var cloudVel:Array<Float> = [-15, -10, -5];
// function
function create(){
    // clouds
    add(cloudGroup = new FlxGroup());
    for(i in 0...3){
        cloudGroup.add(clouds = new FlxBackdrop(Paths.image('sonic/backgrounds/greenHillZone/clouds'+i)));
        clouds.velocity.x = cloudVel[i];
        clouds.scrollFactor.set(0.1);
        clouds.screenCenter();
    }
    // mountains
    add(mountains = new FlxBackdrop(Paths.image('sonic/backgrounds/greenHillZone/mountains')));
    mountains.scrollFactor.set(0.1);
    mountains.screenCenter();
    // waterfalls
    add(waterfalls = new FlxBackdrop());
	waterfalls.frames = Paths.getFrames('sonic/backgrounds/greenHillZone/waterfalls');
	waterfalls.animation.addByPrefix('idle', 'idle', 8);
	waterfalls.animation.play('idle');
    waterfalls.scrollFactor.set(0.1);
    waterfalls.screenCenter();
    // water
    add(water = new FlxBackdrop());
	water.frames = Paths.getFrames('sonic/backgrounds/greenHillZone/water');
	water.animation.addByPrefix('idle', 'idle', 8);
	water.animation.play('idle');
    water.velocity.x = -5;
    water.scrollFactor.set(0.1);
    water.screenCenter();
    // othersMisc
    add(othersMisc = new FlxTilemapExt().loadMapFromCSV('data/tiled/greenHillZone_othersMisc.csv', Assets.getBitmapData(Paths.image('sonic/tilesets/greenHillZone'), true, false)));
}