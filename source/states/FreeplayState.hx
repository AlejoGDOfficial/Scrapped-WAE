package states;

import flixel.addons.transition.FlxTransitionableState;
import backend.Song;
import haxe.Json;

import substates.GameplayChangersSubstate;

import openfl.filters.ShaderFilter;
import shaders.WavyShader;

typedef FreeplayData =
{
	bpm:Float
}

class FreeplayState extends MusicBeatState
{
	var titleJSON: FreeplayData;

	var underBg: FlxSprite;

	var bg: FlxSprite;

	var coolBlueText: FlxText;

	var extrasAlejo: FlxSprite;

	var songText: FlxText;

	var curTime: Float;

	var wavyShader: WavyShader;

	var canSelect: Bool = true;

	var selInt: Int = CoolVars.freeplaySelInt;
	
	var theSongTextTween: FlxTween;

	var theImageTween: FlxTween;

	var confirmPlayed: Bool = false;

	var coolBarText: FlxText;
	var desc: FlxText;

	var upBar: FlxSprite;
	var downBar: FlxSprite;

	var coolTexts: Array<String> = [
		"Pollito con Papa",
		"Ganador de Mil Batallas",
		"Cuando se te moja la tarea",
		"Mama, soy un Angry Bird",
		"Cuando se te seca la tarea",
		"El lado misterioso de la isla",
		"Haxeflixel",
		"Haxe",
		"Flixel",
		"Psych Engine Supremacy",
		"Your mom",
		"ALE Engine Supremacy",
		"Como tan muchacho'",
		"Yo lo' veo a ustede' muy bien",
		"Las frutas de la derrota",
		"I recommend Mime and Dash",
		"Elsa Pato",
		"El Zapato",
		"The Extras State",
		"ExtrasState.hx",
		"Chicos, estoy comiendo mortadela",
		"You should play a song",
		"ESCUCHO BORROSO",
		"This mod is zzz...",
		"Let's play a 20 minutes song!",
		"PiltrafaBG",
		"ivomartin7",
		"Ban Juan412gamer",
		"Me encontre al patito Juan",
		"ELmatiasYT",
		"Jana G..",
		"El Master",
		"piZZ-YouTube",
		"tu ere el jolou nai?",
		"Alice (Alexa)",
		"lord star bass",
		"Screw You :3",
		"Bye bye...",
		"eletric-cockadoodledo",
		"No more texts",
		"El yate titan",
		"Viviendo la vida del deunde",
		"Ahora no Robin...",
		"Dios bajo del cielo y dijo...",
		"Presiona el boton de Saltar para Saltar",
		"MAESTRA SE ME SECO LA TAREA",
		"Digital Fortnite Chamba",
		"ESTE ES EL RAP DE PERU",
		"FACILISIMO VERDAD???",
		"Pero no cantes victoria...",
		"QUE PASO MASTER???",
		"FIRE IN THE HOLE"
	];
	
	override function create()
	{
		titleJSON = tjson.TJSON.parse(Paths.getTextFromFile('images/gfDanceTitle.json'));
		Conductor.bpm = titleJSON.bpm;
		DiscordClient.changePresence("In the Menus", null);
		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		wavyShader = new WavyShader();

		underBg = new FlxSprite(0, 0).loadGraphic(Paths.image('extras/underBg0'));
		underBg.scrollFactor.set();
		add(underBg);

		bg = new FlxSprite(0, 0).loadGraphic(Paths.image('extras/bg'));
		bg.scrollFactor.set();
		add(bg);

		coolBlueText = new FlxText(0, 0, FlxG.width, 
			'Weekend Afternoon Extended' +
			'\n' +
			'The Beggining Of A New Era' +
			'\n' +
			'END 3' +
			'\n' +
			'Alejo' +
			'\n' +
			'Jana' +
			'\n' +
			'El Master' +
			'\n' +
			'The Extras' +
			'\n' +
			'Select A Song!' +
			'\n' +
			'Arthritis: The Mod' +
			'\n' +
			'No Downscroll support!' +
			'\n' +
			'Only on Gamebanana!' +
			'\n' +
			'Years of development!' +
			'\n' +
			'The Source Code will NEVER be PUBLIC' +
			'\n' +
			'Enjoy! :3' +
			'\n' +
			'No Midscroll Support!' +
			'\n' +
			'Weekend Afternoon Extended' +
			'\n' +
			'The Beggining Of A New Era' +
			'\n' +
			'END 3' +
			'\n' +
			'Alejo' +
			'\n' +
			'Jana' +
			'\n' +
			'El Master' +
			'\n' +
			'The extras' +
			'\n' +
			'Select A Song!' +
			'\n' +
			'Arthritis: The Mod' +
			'\n' +
			'No Downscroll support!' +
			'\n' +
			'Only on Gamebanana!' +
			'\n' +
			'Years of development!' +
			'\n' +
			'The Source Code will NEVER be PUBLIC' +
			'\n' +
			'Enjoy! :3' +
			'\n' +
			'No Midscroll Support!'
		);
		coolBlueText.setFormat(Paths.font('odinRounded.ttf'), 48, FlxColor.TRANSPARENT, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.CYAN);
		coolBlueText.scrollFactor.set();
		add(coolBlueText);
		coolBlueText.x = 0 - coolBlueText.width;

		FlxTween.tween(coolBlueText, {x: 10}, 120 / Conductor.bpm, {
			ease: FlxEase.cubeOut
		});

		extrasAlejo = new FlxSprite(25, 0).loadGraphic(Paths.image('extras/extrasAlejo'));
		extrasAlejo.scrollFactor.set();
		extrasAlejo.frames = Paths.getSparrowAtlas('extras/extrasAlejo');
		extrasAlejo.animation.addByPrefix('idle', "idle", 24, false);
		add(extrasAlejo);

		songText = new FlxText(FlxG.width / 2, 0, FlxG.width / 2, '');
		songText.setFormat(Paths.font('odinRounded.ttf'), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		songText.scrollFactor.set();
		add(songText);

		coolBarText = new FlxText(0, 0, FlxG.width, 'Welcome to Extras!');
		coolBarText.setFormat(Paths.font('odinRounded.ttf'), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		coolBarText.scrollFactor.set();

		desc = new FlxText(0, 0, FlxG.width, 'Press UP or DOWN to select a Song | Press CONTROL to change the Gameplay');
		desc.setFormat(Paths.font('odinRounded.ttf'), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		desc.scrollFactor.set();

		upBar = new FlxSprite(0, 0).makeGraphic(FlxG.width, Math.floor(coolBarText.height) + 4, FlxColor.BLACK);

		downBar = new FlxSprite(0, 0).makeGraphic(FlxG.width, Math.floor(desc.height) + 4, FlxColor.BLACK);

		add(upBar);
		add(downBar);
		downBar.y = 720 - downBar.height;

		add(coolBarText);
		add(desc);
		coolBarText.y = 0 - coolBarText.height;
		desc.y = 720 - desc.height - 2;

		FlxTween.tween(coolBarText, {y: 2}, 60 / Conductor.bpm, {
			ease: FlxEase.cubeOut
		});

		changeStuff();

		super.create();
	}

	override function update(elapsed:Float)
	{
		curTime = curTime + elapsed;

		wavyShader.uTime.value = [curTime];
		wavyShader.uWaveAmplitude.value = [0.15];
		wavyShader.uSpeed.value = [2];
		wavyShader.uFrequency.value = [5];

		coolBlueText.alpha = 0.25 + Math.sin(curTime) * 0.1;

		if (coolBlueText.y <= -720)
		{
			coolBlueText.y = 0;
		} else {
			coolBlueText.y = coolBlueText.y - elapsed * 50;
		}

		if (canSelect)
		{
			if (selInt > 0 && controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				selInt -= 1;
				changeStuff();
			}
			
			if (selInt < 6 && controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				selInt += 1;
				changeStuff();
			}
		}

		if (controls.BACK)
		{
			CoolVars.freeplaySelInt = selInt;
			
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if(FlxG.keys.justPressed.CONTROL)
		{
			openSubState(new GameplayChangersSubstate());
		}

		if (controls.ACCEPT)
		{
			canSelect = false;
			
			songText.text = 'Loading...';
			
			songText.y = FlxG.height / 2;
			if (theSongTextTween != null && theSongTextTween.active) {
				theSongTextTween.cancel();
			}
			theSongTextTween = FlxTween.tween(songText, {y: FlxG.height / 2 - songText.height / 2}, 60 / Conductor.bpm, {
				ease: FlxEase.cubeOut
			});

			switch (selInt)
			{
				case 0:
					changeState('team-work', 'insane');
				case 1:
					changeState('dehydrated', 'insane');
				case 2:
					changeState('cheating', 'insane');
				case 3:
					changeState('8-28-63', 'insane');
				case 4:
					changeState('duro-2-horas', 'insane');
				case 5:
					changeState('spyware', 'insane');
				case 6:
					changeState('inculeable', 'insane');
			}
		}
		
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		
		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, Math.exp(-elapsed * 3.125));

		super.update(elapsed);
	}

	function changeStuff()
	{
		CoolVars.freeplaySelInt = selInt;

		songText.y = FlxG.height / 2;
		if (theSongTextTween != null && theSongTextTween.active) {
			theSongTextTween.cancel();
		}
		theSongTextTween = FlxTween.tween(songText, {y: FlxG.height / 2 - songText.height / 2}, 60 / Conductor.bpm, {
			ease: FlxEase.cubeOut
		});

		underBg.x = 25;
		if (theImageTween != null && theImageTween.active) {
			theImageTween.cancel();
		}
		theImageTween = FlxTween.tween(underBg, {x: 0}, 60 / Conductor.bpm, {
			ease: FlxEase.cubeOut
		});

		if (selInt == 1 || selInt == 2 || selInt == 6)
		{
			underBg.shader = wavyShader;
		} else {
			underBg.shader = null;
		}

		switch (selInt)
		{
			case 0:
				songText.text = 'Team Work';
				underBg.loadGraphic(Paths.image('extras/underBg0'));
			case 1:
				songText.text = 'Dehydrated';
				underBg.loadGraphic(Paths.image('extras/underBg1'));
			case 2:
				songText.text = 'Cheating';
				underBg.loadGraphic(Paths.image('extras/underBg2'));
			case 3:
				songText.text = '8-28-63';
				underBg.loadGraphic(Paths.image('extras/underBg3'));
			case 4:
				songText.text = 'Duro 2 Horas';
				underBg.loadGraphic(Paths.image('extras/underBg4'));
			case 5:
				songText.text = 'Spyware';
				underBg.loadGraphic(Paths.image('extras/underBg5'));
			case 6:
				songText.text = 'Inculeable';
				underBg.loadGraphic(Paths.image('extras/underBg6'));
		}
	}

	override function beatHit()
	{
		FlxG.camera.zoom += 0.005;

		extrasAlejo.animation.stop();
		extrasAlejo.animation.play('idle');

		if (curBeat % 16 == 0 || curBeat == 0)
		{
			var randomIndex = Std.random(coolTexts.length);
			coolBarText.text = coolTexts[randomIndex];
			coolBarText.x = 0;
			coolBarText.y = 0 - coolBarText.height;
			FlxTween.tween(coolBarText, {y: 2}, 60 / Conductor.bpm, {
				ease: FlxEase.cubeOut,
			});
		} else if (curBeat % 16 == 4 || curBeat == 4) {
			FlxTween.tween(coolBarText, {x: 0 - coolBarText.width}, 700 / Conductor.bpm, {
				ease: FlxEase.cubeIn
			});
		}

		super.beatHit();
	}

	function changeState(song:String, difficulty:String)
	{
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
			PlayState.isStoryMode = false;
		});
	}
}