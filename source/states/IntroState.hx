package states;

import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import haxe.Json;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

import shaders.ColorSwap;

import openfl.filters.ShaderFilter;

import shaders.ChromaticAberrationShader;

typedef IntroData =
{
	bpm:Float
}

class IntroState extends MusicBeatState
{
	public static var initialized:Bool = false;

	var titleJSON:IntroData;

	var logo:FlxSprite;

	var gfDance:FlxSprite;

	var canSelect:Bool = true;

	var confirmPlayed:Bool = false;

	override public function create():Void
	{
		titleJSON = tjson.TJSON.parse(Paths.getTextFromFile('images/gfDanceTitle.json'));

		FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

		Conductor.bpm = titleJSON.bpm;

		logo = new FlxSprite().loadGraphic(Paths.image('title/logo'));
		add(logo);

		gfDance = new FlxSprite(600, 100).loadGraphic(Paths.image('title/gf'));
		gfDance.frames = Paths.getSparrowAtlas('title/gf');
		gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		add(gfDance);
		
		super.create();
	}
	
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		
		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, Math.exp(-elapsed * 3.125));

		if (canSelect)
		{
			if (controls.ACCEPT)
			{
				canSelect = false;
	
				changeState();
			}
		}

		super.update(elapsed);
	}

	function changeState()
	{
		FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0xFFFFFFFF, 120 / Conductor.bpm);

		if (!confirmPlayed)
		{
			FlxG.sound.play(Paths.sound('confirm'));
			confirmPlayed = true;
		}

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			MusicBeatState.switchState(new MainMenuState());
		});
	}

	private var sickBeats:Int = -1;
	override function beatHit()
	{
		super.beatHit();
		
		if (curBeat >= 16 && curBeat < 28)
		{
			FlxG.camera.zoom += 0.05;
		}
		if (curBeat == 32)
		{
			FlxG.camera.zoom += 1;
		}
		if (curBeat > 32)
		{
			FlxG.camera.zoom += 0.05;
		}
		
		if (curBeat >= 32)
		{
			FlxTween.tween(logo.scale, {x: 1.25, y: 1.25}, 5 / Conductor.bpm, {
				onComplete: (twn:FlxTween) -> {
					FlxTween.tween(logo.scale, {x: 1, y: 1}, 45 / Conductor.bpm, {
						ease: FlxEase.quadOut,
					});
				},
				ease: FlxEase.cubeIn
			});

			if (curBeat % 2 == 0)
			{
				FlxTween.tween(logo, {angle: 2.5}, 60 / Conductor.bpm, {
					ease: FlxEase.quadOut,
				});
				gfDance.animation.play('danceRight');
			}
				
			if (curBeat % 2 == 1)
			{
				FlxTween.tween(logo, {angle: -2.5}, 60 / Conductor.bpm, {
						ease: FlxEase.quadOut,
				});
				gfDance.animation.play('danceLeft');
			}
		}

		sickBeats = sickBeats + 1;
		switch (sickBeats)
		{
			case 0:
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 1);
		}
	}
}
