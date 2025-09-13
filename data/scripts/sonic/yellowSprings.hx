// library
import flixel.util.FlxDirectionFlags;
// functions
function create(){
    add(yellowSpringGroup = new FlxGroup());
    for(i in 0...sonicList.objects.yellowSprings.length){
        yellowSpringGroup.add(yellowSpring = new FlxSprite(sonicList.objects.yellowSprings[i][0] * 16, sonicList.objects.yellowSprings[i][1] * 16).loadGraphic(Paths.image('sonic/objects/yellowSpring')));
        yellowSpring.origin.y = yellowSpring.height;
        yellowSpring.immovable = true;
        yellowSpring.ID = i;
    }
}
function postUpdate(elapsed){
    if(!isDead){
        // yellowSpringGroup
        yellowSpringGroup.forEach(function(yellowSpringGroup){
            // collide
            FlxG.collide(sonicHB, yellowSpringGroup, function(){
                if(sonicHB.isTouching(FlxDirectionFlags.FLOOR)){
                    // sound
                    FlxG.sound.play(Paths.sound('sonic/spring'), 0.5);
                    // sonicHB
                    sonicHB.velocity.y = -sonicHB.maxVelocity.y / 1.5;
                    // redSpring
                    yellowSpring.scale.set(1.3, 0.7);
                }
            });
            //
            yellowSpring.scale.set(lerp(yellowSpring.scale.x, 1, 0.3), lerp(yellowSpring.scale.y, 1, 0.3));
        });
    }
}