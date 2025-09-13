// library
import flixel.util.FlxDirectionFlags;
// functions
function create(){
    add(redSpringGroup = new FlxGroup());
    for(i in 0...sonicList.objects.redSprings.length){
        redSpringGroup.add(redSpring = new FlxSprite(sonicList.objects.redSprings[i][0] * 16, sonicList.objects.redSprings[i][1] * 16).loadGraphic(Paths.image('sonic/objects/redSpring')));
        redSpring.origin.y = redSpring.height;
        redSpring.immovable = true;
        redSpring.ID = i;
    }
}
function postUpdate(elapsed){
    if(!isDead){
        // redSpringGroup
        redSpringGroup.forEach(function(redSpringGroup){
            // collide
            FlxG.collide(sonicHB, redSpringGroup, function(){
                if(sonicHB.isTouching(FlxDirectionFlags.FLOOR)){
                    // sound
                    FlxG.sound.play(Paths.sound('sonic/spring'), 0.5);
                    // sonicHB
                    sonicHB.velocity.y = -sonicHB.maxVelocity.y / 1.3;
                    // redSpring
                    redSpring.scale.set(1.3, 0.7);
                }
            });
            //
            redSpring.scale.set(lerp(redSpring.scale.x, 1, 0.3), lerp(redSpring.scale.y, 1, 0.3));
        });
    }
}