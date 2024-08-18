package states;

import flixel.addons.transition.FlxTransitionableState;
import backend.Song;
import haxe.Json;

import openfl.filters.ShaderFilter;
import shaders.WavyShader;

typedef StoryMenuData =
{
	bpm:Float
}

class StoryMenuState extends MusicBeatState
{
	var titleJSON: StoryMenuData;

	var songInfo: FlxText;
	var weekInfo: FlxText;

	var upBar: FlxSprite;
	var downBar: FlxSprite;

	var curTime: Float;

	var wavyShader: WavyShader;

	var confirmPlayed: Bool = false;
	
	var tickPlayed: Bool = false;

	override function create()
	{
		titleJSON = tjson.TJSON.parse(Paths.getTextFromFile('images/gfDanceTitle.json'));
		Conductor.bpm = titleJSON.bpm;
		DiscordClient.changePresence("In the Menus", null);
		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		super.create();
	}

	override function update(elapsed:Float)
	{
		FlxG.mouse.visible = true;

		if (tickPlayed)
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

		if (controls.BACK)
		{
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
		FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0xFFFFFFFF, 120 / Conductor.bpm);

		if (!confirmPlayed)
		{
			FlxG.sound.play(Paths.sound('confirm'));
			confirmPlayed = true;
		}

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
		});
	}
}