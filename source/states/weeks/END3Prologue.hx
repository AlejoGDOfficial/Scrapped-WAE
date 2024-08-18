package states.weeks;

import flixel.addons.transition.FlxTransitionableState;
import backend.Song;
import haxe.Json;

typedef END3PrologueData =
{
	bpm:Float
}

class END3Prologue extends MusicBeatState
{
	var titleJSON: END3PrologueData;

    var canContinue: Bool = false;

    var selInt: Int;
    
    var image0: FlxSprite;
    var image1: FlxSprite;
    var image2: FlxSprite;
    var image3: FlxSprite;
    var image4: FlxSprite;

    var allTickPlayed: Bool = false;
    
	var help: FlxText;

	override function create()
    {
        transIn = FlxTransitionableState.defaultTransIn;
        transOut = FlxTransitionableState.defaultTransOut;

		titleJSON = tjson.TJSON.parse(Paths.getTextFromFile('images/gfDanceTitle.json'));
		Conductor.bpm = titleJSON.bpm;

        FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

		image0 = new FlxSprite(0, 0).loadGraphic(Paths.image('weeks/end3Prologue/0'));
		image0.scrollFactor.set();
		add(image0);
		image0.alpha = 0;
		image1 = new FlxSprite(1280, 0).loadGraphic(Paths.image('weeks/end3Prologue/1'));
		image1.scrollFactor.set();
		add(image1);
		image1.alpha = 0;
		image2 = new FlxSprite(2560, 0).loadGraphic(Paths.image('weeks/end3Prologue/2'));
		image2.scrollFactor.set();
		add(image2);
		image2.alpha = 0;
		image3 = new FlxSprite(3840, 0).loadGraphic(Paths.image('weeks/end3Prologue/3'));
		image3.scrollFactor.set();
		add(image3);
		image3.alpha = 0;
		image4 = new FlxSprite(5120, 0).loadGraphic(Paths.image('weeks/end3Prologue/4'));
		image4.scrollFactor.set();
		add(image4);
		image4.alpha = 0;

		help = new FlxText(0, 0, FlxG.width, 'Press ENTER to Continue');
		help.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		help.scrollFactor.set();
		add(help);
		help.y = 720 - help.height - 2;
		help.alpha = 0;

        new FlxTimer().start(480 / Conductor.bpm, function(tmr:FlxTimer)
        {
            canContinue = true;
			FlxTween.tween(help, {alpha: 1}, 60 / Conductor.bpm);
        });

		FlxTween.tween(image0, {alpha: 1}, 480 / Conductor.bpm);
		FlxTween.tween(image1, {alpha: 1}, 480 / Conductor.bpm);
		FlxTween.tween(image2, {alpha: 1}, 480 / Conductor.bpm);
		FlxTween.tween(image3, {alpha: 1}, 480 / Conductor.bpm);
		FlxTween.tween(image4, {alpha: 1}, 480 / Conductor.bpm);

		super.create();
    }

	override function update(elapsed:Float)
	{	
		image1.x = image0.x + 1280;
		image2.x = image1.x + 1280;
		image3.x = image2.x + 1280;
		image4.x = image3.x + 1280;

		if (canContinue && controls.ACCEPT)
		{
			selInt += 1;
            toContinue();
		}
        
		super.update(elapsed);
    }

	function toContinue()
	{
        if (!allTickPlayed)
        {
            FlxG.sound.play(Paths.sound('END3Tick'));
        }

		if (selInt < 5)
		{
			canContinue = false;

			FlxTween.tween(image0, {x: -1280 * selInt}, 60 / Conductor.bpm, {
				ease: FlxEase.cubeOut,
				onComplete: function(twn:FlxTween) {
					canContinue = true;
				}
			});
		}
		
		if (selInt == 5) 
		{
			allTickPlayed = true;

            help.text = 'Loading END 3...';

			FlxTween.tween(image0, {alpha: 0}, 480 / Conductor.bpm);
			FlxTween.tween(image1, {alpha: 0}, 480 / Conductor.bpm);
			FlxTween.tween(image2, {alpha: 0}, 480 / Conductor.bpm);
			FlxTween.tween(image3, {alpha: 0}, 480 / Conductor.bpm);
			FlxTween.tween(image4, {alpha: 0}, 480 / Conductor.bpm);
			
			FlxTween.tween(help, {alpha: 0}, 480 / Conductor.bpm);

			new FlxTimer().start(480 / Conductor.bpm, function(tmr:FlxTimer)
			{
				trace(Paths.modsJson('end-3/end-3-insane'));
				PlayState.SONG = Song.loadFromJson('end-3-insane', 'end-3');
				LoadingState.loadAndSwitchState(new PlayState());
				PlayState.isStoryMode = true;
			});
		}
	}
}