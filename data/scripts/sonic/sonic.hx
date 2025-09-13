// library
import flixel.util.FlxDirectionFlags;
import flixel.text.FlxTextBorderStyle;
// variables
public var sonicHB:FlxSprite;
public var sonicSprite:FlxSprite;
public var isRolling:Bool = false;
public var isSpindashing:Bool = false;
public var isHurt:Bool = false;
public var isDead:Bool = false;
public var spinVelocity:Int = 0;
// functions
function create(){
    // sonicHB
    add(sonicHB = new FlxSprite(2 * 16, 26 * 16).makeGraphic(19, 39, 0xaa6c6cfc));
    sonicHB.updateHitbox();
    insert(2, sonicHB);
    // sonicSprite
    add(sonicSprite = new FlxSprite());
	sonicSprite.frames = Paths.getFrames('sonic/characters/sonic');
	sonicSprite.animation.addByPrefix('idle', 'idle');
	sonicSprite.animation.addByPrefix('hurt', 'hurt');
	sonicSprite.animation.addByPrefix('death', 'death');
	sonicSprite.animation.addByPrefix('lookUp', 'lookUp', 12, false);
	sonicSprite.animation.addByPrefix('lookDown', 'lookDown', 12, false);
	sonicSprite.animation.addByPrefix('spindash', 'spindash', 12);
	sonicSprite.animation.addByPrefix('walk', 'walk', 12);
	sonicSprite.animation.addByPrefix('run', 'run', 12);
	sonicSprite.animation.addByPrefix('roll', 'roll', 12);
	sonicSprite.animation.play('idle');
    sonicSprite.origin.set(0, 0);
    insert(2, sonicSprite);
}
function update(elapsed){
    // sonicHB
    sonicHB.maxVelocity.y = charsMaxVelocity[0][2];
    sonicHB.acceleration.y = charsAcceleration[0];
    sonicHB.drag.x = sonicHB.maxVelocity.x;
    // isDead
    if(isDead){
        sonicSprite.animation.play('death');
    }else{
        // collide
        FlxG.collide(sonicHB, map);
        // isHurt
        if(isHurt){
            // flipped
            if(sonicSprite.flipX){
                sonicHB.velocity.x -= charsVelocity[0];
            }else{
                sonicHB.velocity.x += charsVelocity[0];
            }
            // isTouching
            if(sonicHB.isTouching(FlxDirectionFlags.FLOOR)){
                isHurt = false;
            }
            // animation
            sonicSprite.animation.play('hurt');
        }else{
            // not rolling and spindashing
            if(!isRolling && !isSpindashing){
                // controls
                if(controls.LEFT){
                    // velocity
                    sonicHB.velocity.x -= charsVelocity[0];
                    // flipped
                    sonicSprite.flipX = true;
                }
                if(controls.RIGHT){
                    // velocity
                    sonicHB.velocity.x += charsVelocity[0];
                    // flipped
                    sonicSprite.flipX = false;
                }
                // maxVelocity
                sonicHB.maxVelocity.x = charsMaxVelocity[0][0];
            }
            // ground
            if((sonicHB.velocity.y >= 0) && sonicHB.isTouching(FlxDirectionFlags.FLOOR)){
                if(sonicHB.velocity.x < 0 || sonicHB.velocity.x > 0){
                    if(controls.DOWN_P){
                        // sound
                        FlxG.sound.play(Paths.sound('sonic/roll'), 0.5);
                        // isRolling
                        isRolling = true;
                    }
                }else{
                    if(controls.DOWN){
                        if(FlxG.keys.justPressed.X){
                            // sound
                            FlxG.sound.play(Paths.sound('sonic/charge'), 0.3);
                            // isRolling
                            isSpindashing = true;
                        }
                    }
                }
            }
            // rolling
            if(sonicHB.velocity.x == 0){
                isRolling = false;
            }
            // spindash
            if(isSpindashing){
                // controls
                if(controls.DOWN){
                    if(FlxG.keys.justPressed.X){
                        if(spinVelocity < sonicHB.maxVelocity.x){
                            spinVelocity += 100;
                        }
                    }
                }else{
                    // isRolling
                    isRolling = true;
                    // isSpindashing
                    isSpindashing = false;
                    // flipped
                    if(sonicSprite.flipX){
                        sonicHB.velocity.x -= spinVelocity;
                    }else{
                        sonicHB.velocity.x += spinVelocity;
                    }
                    // spinVelocity
                    spinVelocity = 0;
                }
                // maxVelocity
                sonicHB.maxVelocity.x = charsMaxVelocity[0][1];
            }else{
                if((sonicHB.velocity.y >= 0) && sonicHB.isTouching(FlxDirectionFlags.FLOOR)){
                    if(FlxG.keys.justPressed.X){
                        // sound
                        FlxG.sound.play(Paths.sound('sonic/jump'), 0.5);
                        // isRolling
                        isRolling = false;
                        // velocity
                        sonicHB.velocity.y = -sonicHB.maxVelocity.y / 2;
                        // animation
                        sonicSprite.animation.play('roll');
                    }
                }
            }
        }
    }
    // flipped
    if(sonicSprite.flipX){
        sonicSprite.setPosition(sonicHB.x - 10, sonicHB.y - 1);
    }else{
        sonicSprite.setPosition(sonicHB.x - 12, sonicHB.y - 1);
    }
    // animation
    if((sonicHB.velocity.y >= 0) && sonicHB.isTouching(FlxDirectionFlags.FLOOR)){
        if((sonicHB.velocity.x < 0 || sonicHB.velocity.x > 0) && !sonicHB.isTouching(FlxDirectionFlags.WALL)){
            if(isRolling){
                sonicSprite.animation.play('roll');
            }else{
                if((sonicHB.velocity.x <= -sonicHB.maxVelocity.x) || (sonicHB.velocity.x >= sonicHB.maxVelocity.x)){
                    sonicSprite.animation.play('run');
                }else{
                    sonicSprite.animation.play('walk');
                }
            }
        }else{
            if(isSpindashing){
                sonicSprite.animation.play('spindash');
            }else{
                if(controls.UP){
                    if(!sonicSprite.animation.finished){
                        sonicSprite.animation.play('lookUp');
                    }
                }else if(controls.DOWN){
                    if(!sonicSprite.animation.finished){
                        sonicSprite.animation.play('lookDown');
                    }
                }else{
                    sonicSprite.animation.play('idle');
                }
            }
        }
    }
}