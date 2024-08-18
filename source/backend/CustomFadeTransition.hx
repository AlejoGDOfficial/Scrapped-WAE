package backend;

import flixel.util.FlxGradient;

class CustomFadeTransition extends MusicBeatSubstate {
	public static var finishCallback:Void->Void;
	var isTransIn:Bool = false;
	var transBlack:FlxSprite;
	var transGradient:FlxSprite;

	var duration:Float;
	public function new(duration:Float, isTransIn:Bool)
	{
		this.duration = duration;
		this.isTransIn = isTransIn;
		super();
	}

	override function create()
	{
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length-1]];
		var width:Int = Std.int(FlxG.width / Math.max(camera.zoom, 0.001));
		var height:Int = Std.int(FlxG.height / Math.max(camera.zoom, 0.001));
		transGradient = FlxGradient.createGradientFlxSprite(1, width, (isTransIn ? [0x0, FlxColor.BLACK] : [FlxColor.BLACK, 0x0]));
		transGradient.scale.x = width;
		transGradient.updateHitbox();
		transGradient.scrollFactor.set();
		transGradient.screenCenter(X);
		transGradient.angle = -90;
		add(transGradient);

		transBlack = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		transBlack.scale.set(width + 400, height + 400);
		transBlack.updateHitbox();
		transBlack.scrollFactor.set();
		transBlack.screenCenter(X);
		add(transBlack);

		if(isTransIn)
			transGradient.x = transBlack.x - transBlack.width;
		else
			transGradient.x = -transGradient.width;

		super.create();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		final width:Float = FlxG.width * Math.max(camera.zoom, 0.001);
		final targetPos:Float = transGradient.width + 50 * Math.max(camera.zoom, 0.001);
		if(duration > 0)
			transGradient.x += (width + targetPos) * elapsed / duration;
		else
			transGradient.x = (targetPos) * elapsed;

		if(isTransIn)
			transBlack.x = transGradient.x + transGradient.width;
		else
			transBlack.x = transGradient.x - transBlack.width;

		if(transGradient.x >= targetPos)
		{
			close();
			if(finishCallback != null) finishCallback();
			finishCallback = null;
		}
	}
}