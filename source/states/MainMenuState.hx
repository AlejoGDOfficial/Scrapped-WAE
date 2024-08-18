package states;

import haxe.Json;
import flixel.addons.transition.FlxTransitionableState;
import flixel.input.keyboard.FlxKey;
import lime.app.Application;
import options.OptionsState;
import states.editors.MasterEditorMenu;

typedef MenuData =
{
	bpm:Float
}

class MainMenuState extends MusicBeatState
{
	var titleJSON:MenuData;

	var bg:FlxSprite;

	var storyModeButton:FlxSprite;

	var extrasButton:FlxSprite;

	var optionsButton:FlxSprite;

	var upBar:FlxSprite;

	var downBar:FlxSprite;

	var desc:FlxText;

	var instructions:FlxText;

	var modVersion:FlxText;

	var selInt:Int = CoolVars.mainMenuSelInt;

	var canSelect:Bool = true;

	var confirmPlayed:Bool = false;

	var character:FlxSprite;

	override function create()
	{
		titleJSON = tjson.TJSON.parse(Paths.getTextFromFile('images/gfDanceTitle.json'));
		Conductor.bpm = titleJSON.bpm;

		bg = new FlxSprite().loadGraphic(Paths.image('mainmenu/bg'));
		bg.scrollFactor.set();
		add(bg);

		storyModeButton = new FlxSprite(25, 0).loadGraphic(Paths.image('mainmenu/selection/storyMode'));
		storyModeButton.scrollFactor.set();
		storyModeButton.y = FlxG.height / 8 * 2 - storyModeButton.height / 2; 

		extrasButton = new FlxSprite(25, 0).loadGraphic(Paths.image('mainmenu/selection/extras'));
		extrasButton.scrollFactor.set();
		extrasButton.y = FlxG.height / 8 * 4 - extrasButton.height / 2; 

		optionsButton = new FlxSprite(25, 0).loadGraphic(Paths.image('mainmenu/selection/options'));
		optionsButton.scrollFactor.set();
		optionsButton.y = FlxG.height / 8 * 6 - optionsButton.height / 2; 

		add(extrasButton);
		add(storyModeButton);
		add(optionsButton);

		desc = new FlxText(0, 2, FlxG.width, 'Play the songs from story mode!');
		desc.setFormat(Paths.font('odinRounded.ttf'), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		desc.scrollFactor.set();

		instructions = new FlxText(0, 0, FlxG.width, 'Press UP or DOWN to select a Menu');
		instructions.setFormat(Paths.font('odinRounded.ttf'), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		instructions.scrollFactor.set();

		character = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('mainmenu/characters/alejo'));
		character.scrollFactor.set();
		add(character);

		upBar = new FlxSprite().makeGraphic(FlxG.width, Math.floor(desc.height) + 4, FlxColor.BLACK);

		downBar = new FlxSprite().makeGraphic(FlxG.width, Math.floor(instructions.height) + 4, FlxColor.BLACK);

		add(upBar);
		add(downBar);
		downBar.y = FlxG.height - downBar.height;

		add(desc);
		add(instructions);
		instructions.y = FlxG.height - instructions.height - 2;

		modVersion = new FlxText(10, 0, 'ALE Engine 1.7 (PE)\nWeekend Afternoon Extended 2.6', 12);
		modVersion.scrollFactor.set();
		modVersion.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(modVersion);
		modVersion.y = FlxG.height - modVersion.height - 2;

		changeStuff();

		super.create();
	}

	function cancelStuffTweens(tween:FlxTween)
	{
		if (tween != null && tween.active)
		{
			tween.cancel();
		}
	}

	var storyModeButtonTweenNormal:FlxTween;
	var storyModeButtonTweenScale:FlxTween;
	var extrasButtonTweenNormal:FlxTween;
	var extrasButtonTweenScale:FlxTween;
	var optionsButtonTweenNormal:FlxTween;
	var optionsButtonTweenScale:FlxTween;
	
	var characterTween:FlxTween;

	function changeStuff()
	{
		cancelStuffTweens(storyModeButtonTweenNormal);
		cancelStuffTweens(storyModeButtonTweenScale);
		cancelStuffTweens(extrasButtonTweenNormal);
		cancelStuffTweens(extrasButtonTweenScale);
		cancelStuffTweens(optionsButtonTweenNormal);
		cancelStuffTweens(optionsButtonTweenScale);

		switch (selInt)
		{
			case 0:
				desc.text = 'Play the songs from story mode!';

				character.loadGraphic(Paths.image('mainmenu/characters/alejo'));
				character.y = FlxG.height / 2 - character.height / 2;

				storyModeButtonTweenNormal = FlxTween.tween(storyModeButton, {x: 75, alpha: 1}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				storyModeButtonTweenScale = FlxTween.tween(storyModeButton.scale, {x: 1, y: 1}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				extrasButtonTweenNormal = FlxTween.tween(extrasButton, {x: -50, alpha: 0.5}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				extrasButtonTweenScale = FlxTween.tween(extrasButton.scale, {x: 0.75, y: 0.75}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				optionsButtonTweenNormal = FlxTween.tween(optionsButton, {x: -50, alpha: 0.5}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				optionsButtonTweenScale = FlxTween.tween(optionsButton.scale, {x: 0.75, y: 0.75}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
			case 1:
				desc.text = 'Play the bonus songs!';

				character.loadGraphic(Paths.image('mainmenu/characters/movistarGuy'));
				character.y = FlxG.height - character.height - downBar.height;

				storyModeButtonTweenNormal = FlxTween.tween(storyModeButton, {x: -50, alpha: 0.5}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				storyModeButtonTweenScale = FlxTween.tween(storyModeButton.scale, {x: 0.75, y: 0.75}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				extrasButtonTweenNormal = FlxTween.tween(extrasButton, {x: 75, alpha: 1}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				extrasButtonTweenScale = FlxTween.tween(extrasButton.scale, {x: 1, y: 1}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				optionsButtonTweenNormal = FlxTween.tween(optionsButton, {x: -50, alpha: 0.5}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				optionsButtonTweenScale = FlxTween.tween(optionsButton.scale, {x: 0.75, y: 0.75}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
			case 2:
				desc.text = 'Set up the game to play comfortably!';

				character.loadGraphic(Paths.image('mainmenu/characters/disturbedAleja'));
				character.y = FlxG.height - character.height - downBar.height;

				storyModeButtonTweenNormal = FlxTween.tween(storyModeButton, {x: -50, alpha: 0.5}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				storyModeButtonTweenScale = FlxTween.tween(storyModeButton.scale, {x: 0.75, y: 0.75}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				extrasButtonTweenNormal = FlxTween.tween(extrasButton, {x: -50, alpha: 0.5}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				extrasButtonTweenScale = FlxTween.tween(extrasButton.scale, {x: 0.75, y: 0.75}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				optionsButtonTweenNormal = FlxTween.tween(optionsButton, {x: 75, alpha: 1}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
				optionsButtonTweenScale = FlxTween.tween(optionsButton.scale, {x: 1, y: 1}, 60 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});
		}

		character.x = FlxG.width;

		cancelStuffTweens(characterTween);

		characterTween = FlxTween.tween(character, {x: FlxG.width / 6 * 5 - character.width / 2}, 60 / Conductor.bpm, {
			ease: FlxEase.cubeOut
		});
	}

	override function update(elapsed:Float)
	{
		if (canSelect)
		{
			if (selInt > 0 && controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				selInt -= 1;
				changeStuff();
			}

			if (selInt < 2 && controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				selInt += 1;
				changeStuff();
			}

			if (controls.ACCEPT)
			{
				canSelect = false;
	
				changeState();
			}
	
			if (controls.justPressed('debug_1'))
			{
				MusicBeatState.switchState(new MasterEditorMenu());
			}
		}

		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, Math.exp(-elapsed * 3.125));

		super.update(elapsed);
	}

	function changeState()
	{
		CoolVars.mainMenuSelInt = selInt;

		FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0xFFFFFFFF, 120 / Conductor.bpm);

		if (!confirmPlayed)
		{
			FlxG.sound.play(Paths.sound('confirm'));
			confirmPlayed = true;
		}

		cancelStuffTweens(characterTween);

		FlxTween.tween(character, {x: FlxG.width}, 120 / Conductor.bpm, {
			ease: FlxEase.cubeIn
		});
		
		desc.text = 'Loading...';
		
		switch (selInt)
		{
			case 0:
				cancelStuffTweens(storyModeButtonTweenNormal);

				FlxTween.tween(storyModeButton, {x: FlxG.width / 2 - storyModeButton.width / 2, y: FlxG.height / 2 - storyModeButton.height / 2}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				storyModeButton.loadGraphic(Paths.image('mainmenu/selection/storyModeSelected'));

				cancelStuffTweens(extrasButtonTweenScale);
				cancelStuffTweens(optionsButtonTweenScale);

				FlxTween.tween(extrasButton.scale, {x: 0.75, y: 0}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeIn
				});
				FlxTween.tween(optionsButton.scale, {x: 0.75, y: 0}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeIn
				});
			case 1:
				cancelStuffTweens(extrasButtonTweenNormal);

				FlxTween.tween(extrasButton, {x: FlxG.width / 2 - extrasButton.width / 2, y: FlxG.height / 2 - extrasButton.height / 2}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				extrasButton.loadGraphic(Paths.image('mainmenu/selection/extrasSelected'));

				cancelStuffTweens(storyModeButtonTweenScale);
				cancelStuffTweens(optionsButtonTweenScale);

				FlxTween.tween(storyModeButton.scale, {x: 0.75, y: 0}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeIn
				});
				FlxTween.tween(optionsButton.scale, {x: 0.75, y: 0}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeIn
				});
			case 2:
				cancelStuffTweens(optionsButtonTweenNormal);

				FlxTween.tween(optionsButton, {x: FlxG.width / 2 - optionsButton.width / 2, y: FlxG.height / 2 - optionsButton.height / 2}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeOut
				});

				optionsButton.loadGraphic(Paths.image('mainmenu/selection/optionsSelected'));

				cancelStuffTweens(storyModeButtonTweenScale);
				cancelStuffTweens(extrasButtonTweenScale);

				FlxTween.tween(storyModeButton.scale, {x: 0.75, y: 0}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeIn
				});
				FlxTween.tween(extrasButton.scale, {x: 0.75, y: 0}, 120 / Conductor.bpm, {
					ease: FlxEase.cubeIn
				});
		}

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			switch (selInt)
			{
				case 0:
					MusicBeatState.switchState(new StoryMenuState());
				case 1:
					MusicBeatState.switchState(new FreeplayState());
				case 2:
					MusicBeatState.switchState(new OptionsState());
			}
		});
	}

	override function beatHit()
	{
		FlxG.camera.zoom += 0.005;

		super.beatHit();
	}
}
