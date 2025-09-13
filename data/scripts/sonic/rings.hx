// library
import flixel.util.FlxDirectionFlags;
// variable
public var losingRingGroup:FlxGroup;
// functions
function create(){
    // ringGroup
    add(ringGroup = new FlxGroup());
    for(i in 0...sonicList.objects.rings.length){
        ringGroup.add(ring = new FlxSprite(sonicList.objects.rings[i][0] * 16, sonicList.objects.rings[i][1] * 16));
        ring.frames = Paths.getFrames('sonic/objects/ring');
        ring.animation.addByPrefix('idle', 'idle', 8);
        ring.animation.play('idle');
        ring.ID = i;
    }
    // groups
    add(sparklesGroup = new FlxGroup());
    add(losingRingGroup = new FlxGroup());
}
function postUpdate(elapsed){
    // isDead
    if(!isDead){
        ringGroup.forEach(function(ring){
            FlxG.overlap(sonicHB, ring, function(){
                // sound
                FlxG.sound.play(Paths.sound('sonic/ringLeftEar'));
                // ringCounter
                ringCounter += 1;
                // kill
                ring.kill();
                // sparkles
                sparklesGroup.add(sparkles = new FlxSprite(ring.x, ring.y));
                sparkles.frames = Paths.getFrames('sonic/effects/sparkles');
                sparkles.animation.addByPrefix('idle', 'idle', 12);
                sparkles.animation.play('idle');
            });
        });
    }
    // sparklesGroup
    sparklesGroup.forEach(function(sparkles){
        FlxTween.tween(sparkles, {alpha: 0}, 0.5, {onComplete: function(){
            sparkles.kill();
        }});
    });
    // losingRingGroup
    losingRingGroup.forEach(function(losingRing){
        // collide
        FlxG.collide(losingRing, map);
        // tween
        FlxTween.tween(losingRing, {alpha: 0}, 3, {onComplete: function(){
            losingRing.kill();
        }});
        // jump
        if((losingRing.velocity.y >= 0) && losingRing.isTouching(FlxDirectionFlags.FLOOR)){
            losingRing.velocity.y = -losingRing.maxVelocity.y / 3;
        }
    });
}