package states;

import flixel.addons.transition.FlxTransitionableState;
import backend.Song;
import haxe.Json;

import states.weeks.END3Introduction;

import openfl.filters.ShaderFilter;
import shaders.TVStaticShader;
import shaders.WavyShader;

typedef StoryIntroductionData =
{
	bpm:Float
}

class StoryIntroduction extends MusicBeatState
{
	var titleJSON: StoryIntroductionData;

	var selInt: Int = CoolVars.storyMenuSelInt;

	var week0bg0: FlxSprite;
	var week0sel0: FlxSprite;
	var week0sel1: FlxSprite;
	var week0sel2: FlxSprite;
	var week0grad: FlxSprite;

	var week1bg0: FlxSprite;
	var week1sel0: FlxSprite;
	var week1grad: FlxSprite;

	var week2sky0: FlxSprite;
	var week2sky1: FlxSprite;
	var week2sky2: FlxSprite;
	var week2bg0: FlxSprite;
	var week2sel0: FlxSprite;
	var week2sel1: FlxSprite;
	var week2sel2: FlxSprite;
	var week2grad: FlxSprite;

	var week3sky0: FlxSprite;
	var week3bg0: FlxSprite;
	var week3sel0: FlxSprite;
	var week3grad: FlxSprite;

	var week4bg0: FlxSprite;
	var week4sel0: FlxSprite;
	var week4grad: FlxSprite;

	var week5bg0: FlxSprite;
	var week5sel0: FlxSprite;
	var week5grad: FlxSprite;

	var week6bg0: FlxSprite;
	var week6sel0: FlxSprite;
	var week6front0: FlxSprite;
	var week6grad: FlxSprite;

	var week7sky0: FlxSprite;
	var week7sky1: FlxSprite;
	var week7sky2: FlxSprite;
	var week7bg0: FlxSprite;
	var week7sel0: FlxSprite;
	var week7sel1: FlxSprite;
	var week7sel2: FlxSprite;
	var week7grad: FlxSprite;

	var week8bg0: FlxSprite;
	var week8sel0: FlxSprite;
	var week8grad: FlxSprite;

	var week9bg0: FlxSprite;
	var week9sel0: FlxSprite;
	var week9grad: FlxSprite;

	var week10sky0: FlxSprite;
	var week10bg0: FlxSprite;
	var week10sel0: FlxSprite;
	var week10grad: FlxSprite;

	var week11bg0: FlxSprite;
	var week11sel0: FlxSprite;
	var week11grad: FlxSprite;

	var week12bg0: FlxSprite;
	var week12sel0: FlxSprite;
	var week12grad: FlxSprite;

	var week13bg0: FlxSprite;
	var week13sel0: FlxSprite;
	var week13grad: FlxSprite;

	var songInfo: FlxText;
	var weekInfo: FlxText;

	var upBar: FlxSprite;
	var downBar: FlxSprite;

	var curTime: Float;

	var wavyShader: WavyShader;

	var shaderAllowed: Bool = true;

	var tvStaticShader: TVStaticShader;

	var tvStaticAllowed: Bool = false;

	var theTween: FlxTween;

	var confirmPlayed: Bool = false;
	
	var tickPlayed: Bool = false;

	override function create()
	{
		titleJSON = tjson.TJSON.parse(Paths.getTextFromFile('images/gfDanceTitle.json'));
		Conductor.bpm = titleJSON.bpm;
		DiscordClient.changePresence("In the Menus", null);
		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;
		
		tvStaticShader = new TVStaticShader();
		FlxG.game.setFilters([new ShaderFilter(tvStaticShader)]);

		wavyShader = new WavyShader();

		week0bg0 = new FlxSprite(0, 0).loadGraphic(Paths.image('storymenu/week0/bg0'));
		week0bg0.scrollFactor.set();
		add(week0bg0);
		week0bg0.x = -1280 * selInt;
		week0sel0 = new FlxSprite(215, 235).loadGraphic(Paths.image('storymenu/week0/sel0'));
		week0sel0.scrollFactor.set();
		add(week0sel0);
		week0sel1 = new FlxSprite(830, 305).loadGraphic(Paths.image('storymenu/week0/sel1'));
		week0sel1.scrollFactor.set();
		add(week0sel1);
		week0sel2 = new FlxSprite(470, 100).loadGraphic(Paths.image('storymenu/week0/sel2'));
		week0sel2.scrollFactor.set();
		add(week0sel2);
		week0grad = new FlxSprite(0, 0).loadGraphic(Paths.image('storymenu/week0/grad'));
		week0grad.scrollFactor.set();
		add(week0grad);

		week1bg0 = new FlxSprite(1280, 0).loadGraphic(Paths.image('storymenu/week1/bg0'));
		week1bg0.scrollFactor.set();
		add(week1bg0);
		week1sel0 = new FlxSprite(450, 0).loadGraphic(Paths.image('storymenu/week1/sel0'));
		week1sel0.scrollFactor.set();
		add(week1sel0);
		week1grad = new FlxSprite(1280, 0).loadGraphic(Paths.image('storymenu/week1/grad'));
		week1grad.scrollFactor.set();
		add(week1grad);

		week2sky0 = new FlxSprite(2560, 0).loadGraphic(Paths.image('storymenu/week2/sky0'));
		week2sky0.scrollFactor.set();
		add(week2sky0);
		week2sky0.alpha = 0;
		week2sky1 = new FlxSprite(2560, 0).loadGraphic(Paths.image('storymenu/week2/sky1'));
		week2sky1.scrollFactor.set();
		add(week2sky1);
		week2sky1.alpha = 0;
		week2sky2 = new FlxSprite(2560, 0).loadGraphic(Paths.image('storymenu/week2/sky2'));
		week2sky2.scrollFactor.set();
		add(week2sky2);
		week2sky2.alpha = 0;
		week2bg0 = new FlxSprite(2560, 0).loadGraphic(Paths.image('storymenu/week2/bg0'));
		week2bg0.scrollFactor.set();
		add(week2bg0);
		week2sel0 = new FlxSprite(190, 410).loadGraphic(Paths.image('storymenu/week2/sel0'));
		week2sel0.scrollFactor.set();
		add(week2sel0);
		week2sel1 = new FlxSprite(495, 220).loadGraphic(Paths.image('storymenu/week2/sel1'));
		week2sel1.scrollFactor.set();
		add(week2sel1);
		week2sel2 = new FlxSprite(850, 455).loadGraphic(Paths.image('storymenu/week2/sel2'));
		week2sel2.scrollFactor.set();
		add(week2sel2);
		week2grad = new FlxSprite(2560, 0).loadGraphic(Paths.image('storymenu/week2/grad'));
		week2grad.scrollFactor.set();
		add(week2grad);

		week3sky0 = new FlxSprite(3840, 0).loadGraphic(Paths.image('storymenu/week3/sky0'));
		week3sky0.scrollFactor.set();
		add(week3sky0);
		week3sky0.shader = wavyShader;
		week3bg0 = new FlxSprite(3840, 0).loadGraphic(Paths.image('storymenu/week3/bg0'));
		week3bg0.scrollFactor.set();
		add(week3bg0);
		week3sel0 = new FlxSprite(250, 240).loadGraphic(Paths.image('storymenu/week3/sel0'));
		week3sel0.scrollFactor.set();
		add(week3sel0);
		week3grad = new FlxSprite(3840, 0).loadGraphic(Paths.image('storymenu/week3/grad'));
		week3grad.scrollFactor.set();
		add(week3grad);

		week4bg0 = new FlxSprite(5120, 0).loadGraphic(Paths.image('storymenu/week4/bg0'));
		week4bg0.scrollFactor.set();
		add(week4bg0);
		week4bg0.shader = wavyShader;
		week4sel0 = new FlxSprite(514, 255).loadGraphic(Paths.image('storymenu/week4/sel0'));
		week4sel0.scrollFactor.set();
		add(week4sel0);
		week4grad = new FlxSprite(5120, 0).loadGraphic(Paths.image('storymenu/week4/grad'));
		week4grad.scrollFactor.set();
		add(week4grad);

		week5bg0 = new FlxSprite(6400, 0).loadGraphic(Paths.image('storymenu/week5/bg0'));
		week5bg0.scrollFactor.set();
		add(week5bg0);
		week5sel0 = new FlxSprite(315, 115).loadGraphic(Paths.image('storymenu/week5/sel0'));
		week5sel0.scrollFactor.set();
		add(week5sel0);
		week5grad = new FlxSprite(6400, 0).loadGraphic(Paths.image('storymenu/week5/grad'));
		week5grad.scrollFactor.set();
		add(week5grad);

		week6bg0 = new FlxSprite(7680, 0).loadGraphic(Paths.image('storymenu/week6/bg0'));
		week6bg0.scrollFactor.set();
		add(week6bg0);
		week6sel0 = new FlxSprite(575, 270).loadGraphic(Paths.image('storymenu/week6/sel0'));
		week6sel0.scrollFactor.set();
		add(week6sel0);
		week6front0 = new FlxSprite(7680, 0).loadGraphic(Paths.image('storymenu/week6/front0'));
		week6front0.scrollFactor.set();
		add(week6front0);
		week6grad = new FlxSprite(7680, 0).loadGraphic(Paths.image('storymenu/week6/grad'));
		week6grad.scrollFactor.set();
		add(week6grad);

		week7sky0 = new FlxSprite(8960, 0).loadGraphic(Paths.image('storymenu/week7/sky0'));
		week7sky0.scrollFactor.set();
		add(week7sky0);
		week7sky0.alpha = 0;
		week7sky1 = new FlxSprite(8960, 0).loadGraphic(Paths.image('storymenu/week7/sky1'));
		week7sky1.scrollFactor.set();
		add(week7sky1);
		week7sky1.alpha = 0;
		week7sky2 = new FlxSprite(8960, 0).loadGraphic(Paths.image('storymenu/week7/sky2'));
		week7sky2.scrollFactor.set();
		add(week7sky2);
		week7sky2.alpha = 0;
		week7bg0 = new FlxSprite(8960, 0).loadGraphic(Paths.image('storymenu/week7/bg0'));
		week7bg0.scrollFactor.set();
		add(week7bg0);
		week7sel0 = new FlxSprite(0, 85).loadGraphic(Paths.image('storymenu/week7/sel0'));
		week7sel0.scrollFactor.set();
		add(week7sel0);
		week7sel1 = new FlxSprite(660, 505).loadGraphic(Paths.image('storymenu/week7/sel1'));
		week7sel1.scrollFactor.set();
		add(week7sel1);
		week7sel2 = new FlxSprite(705, 160).loadGraphic(Paths.image('storymenu/week7/sel2'));
		week7sel2.scrollFactor.set();
		add(week7sel2);
		week7grad = new FlxSprite(8960, 0).loadGraphic(Paths.image('storymenu/week7/grad'));
		week7grad.scrollFactor.set();
		add(week7grad);

		week8bg0 = new FlxSprite(10240, 0).loadGraphic(Paths.image('storymenu/week8/bg0'));
		week8bg0.scrollFactor.set();
		add(week8bg0);
		week8bg0.shader = wavyShader;
		week8sel0 = new FlxSprite(440, 230).loadGraphic(Paths.image('storymenu/week8/sel0'));
		week8sel0.scrollFactor.set();
		add(week8sel0);
		week8grad = new FlxSprite(10240, 0).loadGraphic(Paths.image('storymenu/week8/grad'));
		week8grad.scrollFactor.set();
		add(week8grad);

		week9bg0 = new FlxSprite(11520, 0).loadGraphic(Paths.image('storymenu/week9/bg0'));
		week9bg0.scrollFactor.set();
		add(week9bg0);
		week9sel0 = new FlxSprite(245, 95).loadGraphic(Paths.image('storymenu/week9/sel0'));
		week9sel0.scrollFactor.set();
		add(week9sel0);
		week9grad = new FlxSprite(11520, 0).loadGraphic(Paths.image('storymenu/week9/grad'));
		week9grad.scrollFactor.set();
		add(week9grad);

		week10sky0 = new FlxSprite(11520, 0).loadGraphic(Paths.image('storymenu/week10/sky0'));
		week10sky0.scrollFactor.set();
		add(week10sky0);
		week10sky0.shader = wavyShader;
		week10bg0 = new FlxSprite(11520, 0).loadGraphic(Paths.image('storymenu/week10/bg0'));
		week10bg0.scrollFactor.set();
		add(week10bg0);
		week10sel0 = new FlxSprite(465, 75).loadGraphic(Paths.image('storymenu/week10/sel0'));
		week10sel0.scrollFactor.set();
		add(week10sel0);
		week10grad = new FlxSprite(11520, 0).loadGraphic(Paths.image('storymenu/week10/grad'));
		week10grad.scrollFactor.set();
		add(week10grad);

		week11bg0 = new FlxSprite(14080, 0).loadGraphic(Paths.image('storymenu/week11/bg0'));
		week11bg0.scrollFactor.set();
		add(week11bg0);
		week11bg0.shader = wavyShader;
		week11sel0 = new FlxSprite(475, 245).loadGraphic(Paths.image('storymenu/week11/sel0'));
		week11sel0.scrollFactor.set();
		add(week11sel0);
		week11grad = new FlxSprite(14080, 0).loadGraphic(Paths.image('storymenu/week11/grad'));
		week11grad.scrollFactor.set();
		add(week11grad);

		week12bg0 = new FlxSprite(15360, 0).loadGraphic(Paths.image('storymenu/week12/bg0'));
		week12bg0.scrollFactor.set();
		add(week12bg0);
		week12sel0 = new FlxSprite(335, 275).loadGraphic(Paths.image('storymenu/week12/sel0'));
		week12sel0.scrollFactor.set();
		add(week12sel0);
		week12grad = new FlxSprite(15360, 0).loadGraphic(Paths.image('storymenu/week12/grad'));
		week12grad.scrollFactor.set();
		add(week12grad);

		week13bg0 = new FlxSprite(16640, 0).loadGraphic(Paths.image('storymenu/week13/bg0'));
		week13bg0.scrollFactor.set();
		add(week13bg0);
		week13sel0 = new FlxSprite(50, 100).loadGraphic(Paths.image('storymenu/week13/sel0'));
		week13sel0.scrollFactor.set();
		add(week13sel0);
		week13grad = new FlxSprite(16640, 0).loadGraphic(Paths.image('storymenu/week13/grad'));
		week13grad.scrollFactor.set();
		add(week13grad);

		weekInfo = new FlxText(0, 2, FlxG.width, '');
		weekInfo.setFormat(Paths.font('odinRounded.ttf'), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		weekInfo.scrollFactor.set();

		songInfo = new FlxText(0, 0, FlxG.width, '');
		songInfo.setFormat(Paths.font('odinRounded.ttf'), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		songInfo.scrollFactor.set();

		upBar = new FlxSprite(0, 0).makeGraphic(FlxG.width, Math.floor(weekInfo.height) + 4, FlxColor.BLACK);

		downBar = new FlxSprite(0, 0).makeGraphic(FlxG.width, Math.floor(songInfo.height) + 4, FlxColor.BLACK);

		add(upBar);
		add(downBar);
		downBar.y = 720 - downBar.height;

		add(weekInfo);
		add(songInfo);
		songInfo.y = 720 - songInfo.height - 2;

		super.create();
	}

	override function update(elapsed:Float)
	{
		FlxG.mouse.visible = true;

		curTime = curTime + elapsed;

		wavyShader.uTime.value = [curTime];
		wavyShader.uWaveAmplitude.value = [0.15];
		wavyShader.uSpeed.value = [2];
		wavyShader.uFrequency.value = [5];

		if (shaderAllowed)
		{
			if (tvStaticAllowed)
			{
				tvStaticShader.time.value = [curTime];
				tvStaticShader.strength.value = [1.25];
				tvStaticShader.speed.value = [1];
			} else {
				tvStaticShader.time.value = [0];
				tvStaticShader.strength.value = [0];
				tvStaticShader.speed.value = [0];
			}
		} else {
			tvStaticShader.time.value = [0];
			tvStaticShader.strength.value = [0];
			tvStaticShader.speed.value = [0];
		}

		switch (selInt)
		{
			case 0:
				weekInfo.text = '1. Alexa Week';
			case 1:
				weekInfo.text = '2. Practice';
			case 2:
				weekInfo.text = '3. Alejo Week';
			case 3:
				weekInfo.text = '4. Reality';
			case 4:
				weekInfo.text = '5. Flip Flop';
			case 5:
				weekInfo.text = '6. LATAM';
			case 6:
				weekInfo.text = '7. Pug';
			case 7:
				weekInfo.text = '8. Void Week';
			case 8:
				weekInfo.text = '9. Idiot';
			case 9:
				weekInfo.text = '10. END';
			case 10:
				weekInfo.text = '11. END 2';
			case 11:
				weekInfo.text = '12. Calamity';
			case 12:
				weekInfo.text = '13. Brain Failure';
			case 13:
				weekInfo.text = '14. THE BEGINNING OF A NEW ERA';
		}

		if (selInt == 9 || selInt == 10 || selInt == 13)
		{
			tvStaticAllowed = true;
		} else {
			tvStaticAllowed = false;
		}

		week0sel0.x = week0bg0.x + 215;
		week0sel1.x = week0bg0.x + 830;
		week0sel2.x = week0bg0.x + 470;
		week0grad.x = week0bg0.x;
		if (FlxG.mouse.overlaps(week0sel0))
		{
			songInfo.text = '1. Sugary';
			week0sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('sugary', 'normal');
			}
		} else {
			week0sel0.alpha = 0.75;
		}
		if (FlxG.mouse.overlaps(week0sel1))
		{
			songInfo.text = '2. Energetic';
			week0sel1.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('energetic', 'normal');
			}
		} else {
			week0sel1.alpha = 0.75;
		}
		if (FlxG.mouse.overlaps(week0sel2))
		{
			songInfo.text = '3. Sweet Fight';
			week0sel2.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('sweet-fight', 'normal');
			}
		} else {
			week0sel2.alpha = 0.75;
		}

		week1bg0.x = week0bg0.x + 1280;
		week1sel0.x = week1bg0.x + 450;
		week1grad.x = week1bg0.x;
		if (FlxG.mouse.overlaps(week1sel0))
		{
			songInfo.text = 'Practice';
			week1sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('practice', 'normal');
			}
		} else {
			week1sel0.alpha = 0.75;
		}

		week2sky0.x = week2bg0.x;
		week2sky1.x = week2bg0.x;
		week2sky2.x = week2bg0.x;
		week2bg0.x = week1bg0.x + 1280;
		week2sel0.x = week2bg0.x + 190;
		week2sel1.x = week2bg0.x + 495;
		week2sel2.x = week2bg0.x + 850;
		week2grad.x = week2bg0.x;
		if (FlxG.mouse.overlaps(week2sel0))
		{
			week2sky0.alpha = 1;
			week2sky1.alpha = 0;
			week2sky2.alpha = 0;
			songInfo.text = '1. Backyard';
			week2sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('backyard', 'hard');
			}
		} else {
			week2sel0.alpha = 0.75;
		}
		if (FlxG.mouse.overlaps(week2sel1))
		{
			week2sky0.alpha = 0;
			week2sky1.alpha = 1;
			week2sky2.alpha = 0;
			songInfo.text = '2. Gates';
			week2sel1.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('gates', 'hard');
			}
		} else {
			week2sel1.alpha = 0.75;
		}
		if (FlxG.mouse.overlaps(week2sel2))
		{
			week2sky0.alpha = 0;
			week2sky1.alpha = 0;
			week2sky2.alpha = 1;
			songInfo.text = '3. Nostalgia';
			week2sel2.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('nostalgia', 'hard');
			}
		} else {
			week2sel2.alpha = 0.75;
		}

		week3sky0.x = week3bg0.x;
		week3bg0.x = week2bg0.x + 1280;
		week3sel0.x = week3bg0.x + 250;
		week3grad.x = week3bg0.x;
		if (FlxG.mouse.overlaps(week3sel0))
		{
			songInfo.text = 'Reality';
			week3sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('reality', 'hard');
			}
		} else {
			week3sel0.alpha = 0.75;
		}

		week4bg0.x = week3bg0.x + 1280;
		week4sel0.x = week4bg0.x + 514;
		week4sel0.y = 255 + Math.cos(curTime * 2) * 50;
		week4grad.x = week4bg0.x;
		if (FlxG.mouse.overlaps(week4sel0))
		{
			songInfo.text = 'Flip Flop';
			week4sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('flip-flop', 'normal');
			}
		} else {
			week4sel0.alpha = 0.75;
		}

		week5bg0.x = week4bg0.x + 1280;
		week5sel0.x = week5bg0.x + 315;
		week5grad.x = week5bg0.x;
		if (FlxG.mouse.overlaps(week5sel0))
		{
			songInfo.text = 'LATAM';
			week5sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('latam', 'normal');
			}
		} else {
			week5sel0.alpha = 0.75;
		}

		week6bg0.x = week5bg0.x + 1280;
		week6sel0.x = week6bg0.x + 575;
		week6front0.x = week6bg0.x;
		week6grad.x = week6bg0.x;
		if (FlxG.mouse.overlaps(week6sel0))
		{
			songInfo.text = 'Pug';
			week6sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('pug', 'hard');
			}
		} else {
			week6sel0.alpha = 0.75;
		}

		week7sky0.x = week7bg0.x;
		week7sky1.x = week7bg0.x;
		week7sky2.x = week7bg0.x;
		week7bg0.x = week6bg0.x + 1280;
		week7sel0.x = week7bg0.x + 0;
		week7sel1.x = week7bg0.x + 660;
		week7sel2.x = week7bg0.x + 705;
		week7sel2.y = 160 + Math.cos(curTime / 2) * 25;
		week7sel2.angle = Math.sin(curTime) * 5.625;
		week7grad.x = week7bg0.x;
		if (FlxG.mouse.overlaps(week7sel0))
		{
			week7sky0.alpha = 1;
			week7sky1.alpha = 0;
			week7sky2.alpha = 0;
			songInfo.text = '1. Base';
			week7sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('base', 'hard');
			}
		} else {
			week7sel0.alpha = 0.75;
		}
		if (FlxG.mouse.overlaps(week7sel1))
		{
			week7sky0.alpha = 0;
			week7sky1.alpha = 1;
			week7sky2.alpha = 0;
			songInfo.text = '2. Changing';
			week7sel1.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('changing', 'hard');
			}
		} else {
			week7sel1.alpha = 0.75;
		}
		if (FlxG.mouse.overlaps(week7sel2))
		{
			week7sky0.alpha = 0;
			week7sky1.alpha = 0;
			week7sky2.alpha = 1;
			songInfo.text = '3. Royal Night';
			week7sel2.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('royal-night', 'hard');
			}
		} else {
			week7sel2.alpha = 0.75;
		}

		week8bg0.x = week7bg0.x + 1280;
		week8sel0.x = week8bg0.x + 440;
		week8sel0.angle = curTime * 20;
		week8grad.x = week8bg0.x;
		if (FlxG.mouse.overlaps(week8sel0))
		{
			songInfo.text = 'Idiot';
			week8sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('idiot', 'hard');
			}
		} else {
			week8sel0.alpha = 0.75;
		}

		week9bg0.x = week8bg0.x + 1280;
		week9sel0.x = week9bg0.x + 245;
		week9grad.x = week9bg0.x;
		if (FlxG.mouse.overlaps(week9sel0))
		{
			songInfo.text = 'END';
			week9sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('end', 'insane');
			}
		} else {
			week9sel0.alpha = 0.75;
		}

		week10sky0.x = week10bg0.x;
		week10bg0.x = week9bg0.x + 1280;
		week10sel0.x = week10bg0.x + 465;
		week10sel0.y = 75 + Math.sin(curTime * 2) * 30;
		week10grad.x = week10bg0.x;
		if (FlxG.mouse.overlaps(week10sel0))
		{
			songInfo.text = 'END 2';
			week10sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('end-2', 'insane');
			}
		} else {
			week10sel0.alpha = 0.75;
		}

		week11bg0.x = week10bg0.x + 1280;
		week11sel0.x = week11bg0.x + 475;
		week11sel0.y = 245 + Math.cos(curTime * 2) * 50;
		week11grad.x = week11bg0.x;
		if (FlxG.mouse.overlaps(week11sel0))
		{
			songInfo.text = 'Calamity';
			week11sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('calamity', 'hard');
			}
		} else {
			week11sel0.alpha = 0.75;
		}

		week12bg0.x = week11bg0.x + 1280;
		week12sel0.x = week12bg0.x + 335;
		week12grad.x = week12bg0.x;
		if (FlxG.mouse.overlaps(week12sel0))
		{
			songInfo.text = 'Brain Failure';
			week12sel0.alpha = 1;
			if (FlxG.mouse.justPressed)
			{
				changeState('brain-failure', 'normal');
			}
		} else {
			week12sel0.alpha = 0.75;
		}

		week13bg0.x = week12bg0.x + 1280;
		week13sel0.x = week13bg0.x + 50;
		week13grad.x = week13bg0.x;
		if (FlxG.mouse.overlaps(week13sel0))
		{
			songInfo.text = 'END 3';
			week13sel0.alpha = 1;
			
			if (FlxG.mouse.justPressed)
			{
				shaderAllowed = false;
		
				FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0xFFFFFFFF, 120 / Conductor.bpm);
		
				if (!confirmPlayed)
				{
					FlxG.sound.play(Paths.sound('confirm'));
					confirmPlayed = true;
				}

				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					MusicBeatState.switchState(new END3Introduction());
				});
			}
		} else {
			week13sel0.alpha = 0.75;
		}

		if (FlxG.mouse.overlaps(week0sel0) || FlxG.mouse.overlaps(week0sel1) || FlxG.mouse.overlaps(week0sel2) || FlxG.mouse.overlaps(week1sel0) || FlxG.mouse.overlaps(week2sel0) || FlxG.mouse.overlaps(week2sel1) || FlxG.mouse.overlaps(week2sel2) || FlxG.mouse.overlaps(week3sel0) || FlxG.mouse.overlaps(week4sel0) || FlxG.mouse.overlaps(week5sel0) || FlxG.mouse.overlaps(week6sel0) || FlxG.mouse.overlaps(week7sel0) || FlxG.mouse.overlaps(week7sel1) || FlxG.mouse.overlaps(week7sel2) || FlxG.mouse.overlaps(week8sel0) || FlxG.mouse.overlaps(week9sel0) || FlxG.mouse.overlaps(week10sel0) || FlxG.mouse.overlaps(week11sel0) || FlxG.mouse.overlaps(week12sel0) || FlxG.mouse.overlaps(week13sel0))
		{
			if (!tickPlayed)
			{
				FlxG.sound.play(Paths.sound('tick'));
				tickPlayed = true;
			}
		} else {
			tickPlayed = false;
			songInfo.text = '';
		}
	
		if (selInt > 0 && controls.UI_LEFT_P)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			selInt -= 1;
			if (theTween != null && theTween.active) {
				theTween.cancel();
			}
			theTween = FlxTween.tween(week0bg0, {x: -1280 * selInt}, 60 / Conductor.bpm, {
				ease: FlxEase.cubeOut
			});
		}
		if (selInt < 13 && controls.UI_RIGHT_P)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			selInt += 1;
			if (theTween != null && theTween.active) {
				theTween.cancel();
			}
			theTween = FlxTween.tween(week0bg0, {x: -1280 * selInt}, 60 / Conductor.bpm, {
				ease: FlxEase.cubeOut
			});
		}

		if (controls.BACK)
		{
			shaderAllowed = false;
			
			CoolVars.storyMenuSelInt = selInt;

			FlxG.sound.play(Paths.sound('cancelMenu'));
			
			new FlxTimer().start(0.25, function(tmr:FlxTimer)
			{
				MusicBeatState.switchState(new MainMenuState());
			});
		}
		
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		
		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, Math.exp(-elapsed * 3.125));

		super.update(elapsed);
	}

	override function beatHit()
	{
		FlxG.camera.zoom += 0.005;

		super.beatHit();
	}

	function changeState(song:String, difficulty:String)
	{
		CoolVars.storyMenuSelInt = selInt;

		shaderAllowed = false;

		FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0xFFFFFFFF, 120 / Conductor.bpm);

		if (!confirmPlayed)
		{
			FlxG.sound.play(Paths.sound('confirm'));
			confirmPlayed = true;
		}

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			if (difficulty == 'normal')
			{
				trace(Paths.modsJson(song + '/' + song));
				PlayState.SONG = Song.loadFromJson('' + song, '' + song);
			} else {
				trace(Paths.modsJson(song + '/' + song + '-' + difficulty));
				PlayState.SONG = Song.loadFromJson(song + '-' + difficulty, '' + song);
			}
			LoadingState.loadAndSwitchState(new PlayState());
			PlayState.isStoryMode = true;
		});
	}
}