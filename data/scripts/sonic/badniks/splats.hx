// library
import flixel.util.FlxDirectionFlags;
// functions
function create(){
    // splatsGroup
    add(splatsGroup = new FlxGroup());
    for(i in 0...sonicList.badniks.splats.length){
        splatsGroup.add(splats = new FlxSprite(sonicList.badniks.splats[i][0] * 16, sonicList.badniks.splats[i][1] * 16));
        splats.frames = Paths.getFrames('sonic/badniks/splats');
        splats.animation.addByPrefix('idle', 'idle');
        splats.animation.addByPrefix('jump', 'jump');
        splats.animation.play('idle');
        splats.maxVelocity.set(300, 900);
        splats.acceleration.y = 950;
        splats.ID = i;
    }
    // explosionGroup
    add(explosionGroup = new FlxGroup());
}
function update(elapsed){
    // splatsGroup
    splatsGroup.forEach(function(splats){
        // collide
        FlxG.collide(splats, map);
        // overlap
        FlxG.overlap(sonicHB, splats, function(){
            if(sonicSprite.animation.name == 'spindash' || sonicSprite.animation.name == 'roll'){
                // sound
                FlxG.sound.play(Paths.sound('sonic/destroy'));
                // scoreCounter
                scoreCounter += 100;
                // splats
                splats.kill();
                // explosion
                explosionGroup.add(explosion = new FlxSprite(splats.x, splats.y));
                explosion.frames = Paths.getFrames('sonic/effects/explosion');
                explosion.animation.addByPrefix('idle', 'idle', 12, false);
                explosion.animation.play('idle');
            }else{
                if(!isHurt){
                    // sound
                    FlxG.sound.play(Paths.sound('sonic/hurt'));
                    // ringCounter
                    for(i in 0...ringCounter){
                        losingRingGroup.add(losingRing = new FlxSprite(sonicHB.x, sonicHB.y));
                        losingRing.frames = Paths.getFrames('sonic/objects/ring');
                        losingRing.animation.addByPrefix('idle', 'idle', 8);
                        losingRing.animation.play('idle');
                        losingRing.maxVelocity.set(300, 900);
                        losingRing.acceleration.y = 950;
                        losingRing.velocity.x += FlxG.random.int(-100, 100);
                        losingRing.ID = i;
                    }
                    // ringCounter
                    ringCounter -= ringCounter;
                    // isHurt
                    isHurt = true;
                    // velocity
                    sonicHB.velocity.y = -sonicHB.maxVelocity.y / 3;
                }
            }
        });
        // splats
        splats.drag.x = splats.maxVelocity.x;
        // moving
        if(splats.x < sonicHB.x){
            // velocity
            splats.velocity.x += 4;
            // flipX
            splats.flipX = true;
        }else{
            // velocity
            splats.velocity.x -= 4;
            // flipX
            splats.flipX = false;
        }
        // jump
        if((splats.velocity.y >= 0) && splats.isTouching(FlxDirectionFlags.FLOOR)){
            splats.velocity.y = -splats.maxVelocity.y / 3;
        }
        // animation
        if(splats.velocity.y >= 0){
            splats.animation.play('idle');
        }else{
            splats.animation.play('jump');
        }
    });
    // explosionGroup
    explosionGroup.forEach(function(explosion){
        FlxTween.tween(explosion, {alpha: 0}, 0.5, {onComplete: function(){
            explosion.kill();
        }});
    });
}