// libraries
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxStringUtil;
// variables
public var scoreCounter:Int = 0;
public var ringCounter:Int = 0;
var timer:Float = 0;
// functions
function create(){
    // scoreTimeRings
    add(scoreTimeRings = new FlxSprite(30, 30).loadGraphic(Paths.image('sonic/miscellaneous/scoreTimeRings')));
    scoreTimeRings.scale.set(3, 3);
    scoreTimeRings.origin.set(0, 0);
    scoreTimeRings.cameras = [sonicCam];
    // scoreTxt
    add(scoreTxt = new FlxText(scoreTimeRings.x + 148, scoreTimeRings.y - 14, FlxG.width, '0', 12));
    scoreTxt.setFormat(Paths.font('sonicKnuckles.ttf'), 48, FlxColor.WHITE, 'left', FlxTextBorderStyle.SHADOW, FlxColor.BLACK);
    scoreTxt.borderQuality = 0;
    scoreTxt.borderSize = 4;
    scoreTxt.cameras = [sonicCam];
    // timeTxt
    add(timeTxt = new FlxText(scoreTimeRings.x + 127, scoreTimeRings.y + 33, FlxG.width, '0:00', 12));
    timeTxt.setFormat(Paths.font('sonicKnuckles.ttf'), 48, FlxColor.WHITE, 'left', FlxTextBorderStyle.SHADOW, FlxColor.BLACK);
    timeTxt.borderQuality = 0;
    timeTxt.borderSize = 4;
    timeTxt.cameras = [sonicCam];
    // ringsTxt
    add(ringsTxt = new FlxText(scoreTimeRings.x + 148, scoreTimeRings.y + 82, FlxG.width, '0', 12));
    ringsTxt.setFormat(Paths.font('sonicKnuckles.ttf'), 48, FlxColor.WHITE, 'left', FlxTextBorderStyle.SHADOW, FlxColor.BLACK);
    ringsTxt.borderQuality = 0;
    ringsTxt.borderSize = 4;
    ringsTxt.cameras = [sonicCam];
}
function update(elapsed){
    // isDead
    if(isDead){
        ringsTxt.text = 0;
    }else{
        ringsTxt.text = ringCounter;
    }
    // timer
    timer += 1 * elapsed;
    // timeTxt
    timeTxt.text = FlxStringUtil.formatTime(timer);
}