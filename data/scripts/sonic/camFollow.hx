// libraries
import flixel.util.FlxDirectionFlags;
// functions
function create(){
    add(camFollow = new FlxSprite().makeGraphic(1, 1, FlxColor.TRANSPARENT));
}
function update(elapsed){
    // camera
    FlxG.camera.follow(camFollow);
    // horizontal
    if((sonicHB.velocity.x <= -300) || (sonicHB.velocity.x >= 300)){
        if(!isRolling){
            if(sonicHB.velocity.x >= 300){
                camFollow.x = lerp(camFollow.x, sonicHB.x + 150, 0.07);
            }else{
                camFollow.x = lerp(camFollow.x, sonicHB.x - 130, 0.07);
            }
        }else{
            camFollow.x = lerp(camFollow.x, sonicHB.x + 10, 0.3);
        }
    }else{
        if(isSpindashing){
            if(sonicSprite.flipX){
                camFollow.x = lerp(camFollow.x, sonicHB.x - 70, 0.3);
            }else{
                camFollow.x = lerp(camFollow.x, sonicHB.x + 90, 0.3);
            }
        }else{
            camFollow.x = lerp(camFollow.x, sonicHB.x + 10, 0.3);
        }
    }
    // vertical
    if((sonicHB.velocity.y >= 0) && sonicHB.isTouching(FlxDirectionFlags.FLOOR)){
        if(isSpindashing){
            camFollow.y = lerp(camFollow.y, sonicHB.y - 50, 0.3);
        }else{
            if(sonicHB.velocity.x == 0){
                if(controls.UP){
                    camFollow.y = lerp(camFollow.y, sonicHB.y - 50, 0.07);
                }else if(controls.DOWN){
                    camFollow.y = lerp(camFollow.y, sonicHB.y + 90, 0.07);
                }else{
                    camFollow.y = lerp(camFollow.y, sonicHB.y - 30, 0.3);
                }
            }else{
                camFollow.y = lerp(camFollow.y, sonicHB.y - 30, 0.3);
            }
        }
    }else{
        camFollow.y = lerp(camFollow.y, sonicHB.y, 0.3);
    }
}