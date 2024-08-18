package states.weeks;

import states.weeks.END3Prologue;

import flixel.addons.transition.FlxTransitionableState;

class END3Introduction extends MusicBeatState
{
    var canContinue: Bool = false;

    var selInt: Int;

	var title: FlxText;

	var paragraph: FlxText;

    var allTickPlayed: Bool = false;
    
	var help: FlxText;
    
	override function create()
    {
		Conductor.bpm = 70;

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

        selInt == 0;

		title = new FlxText(0, 100, 1280, 'INTRODUCTION');
		title.setFormat("VCR OSD Mono", 64, FlxColor.RED, CENTER);
		title.scrollFactor.set();
        add(title);
        title.alpha = 0;

		paragraph = new FlxText(0, 225, 1280, "After the events of END 2, Alejo couldn't fulfill his mission, which was to end Alejandra's life. Unfortunately, OG returned to Aleja, and Alejo's whole plan fucked up...");
		paragraph.setFormat("VCR OSD Mono", 64, FlxColor.WHITE, CENTER);
		paragraph.scrollFactor.set();
        add(paragraph);
        paragraph.alpha = 0;

		help = new FlxText(0, 0, FlxG.width, 'Press ENTER to Continue');
		help.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		help.scrollFactor.set();
		add(help);
		help.y = 720 - help.height - 2;
        help.alpha = 0;

        FlxG.sound.playMusic(Paths.music('end3Introduction'), 0);
        FlxG.sound.music.fadeIn(480 / Conductor.bpm, 0, 0.7);
		Conductor.bpm = 92;

        new FlxTimer().start(480 / Conductor.bpm, function(tmr:FlxTimer)
        {
            canContinue = true;
			FlxTween.tween(help, {alpha: 1}, 60 / Conductor.bpm);
        });

		FlxTween.tween(title, {alpha: 1}, 480 / Conductor.bpm);
		FlxTween.tween(paragraph, {alpha: 1}, 480 / Conductor.bpm);

		super.create();
    }

	override function update(elapsed:Float)
	{
        title.x = FlxG.random.int(-5, 5);
        title.y = 100 + FlxG.random.int(-5, 5);

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

        if (selInt < 7)
        {
            paragraph.y = 250;
            
            canContinue = false;

            FlxTween.tween(paragraph, {y: 215}, 60 / Conductor.bpm, {
                ease: FlxEase.cubeOut,
				onComplete: function(twn:FlxTween) {
					canContinue = true;
				}
            });
        }

        switch (selInt)
        {
            case 1:
                paragraph.text = "A few months later, Alejo saw OG again together with Aleja, but he had to end that shitty relationship in one way or another, apart from ending what he started...";
            case 2:
                paragraph.text = "Alejo was gathering all the Alejos, he was easily able to contact TSO (The Screwed One) even though at first he refused to go with him due to all the rejection he suffered from him...";
            case 3:
                paragraph.text = "Finding GD (A version of OG who is 9 years old and quite childish) was much more difficult, since he was in the custody of Kazut (A character we will see later) in a place that Alejo did not know...";
            case 4:
                paragraph.text = "After months of searching, Alejo managed to find GD and basically kidnap him, but according to him it was for the good of The Four Alejos...";
            case 5:
                paragraph.text = "Once GD, TSO and Alejo were reunited, the only thing left to do was achieve Alejo's main objective, as said before, ending Aleja's life, so with a short search he managed to find her apartment to finally end all this shit...";
            case 6:
                paragraph.text = "After a fairly simple plan, which was to end either Aleja or the fucking town she lived in, he decided to use a paper figure that she had to start a rap battle with her, like in every FNF mod...";
            case 7:
                allTickPlayed = true;

                help.text = 'Loading Prologue...';

                FlxTween.tween(title, {alpha: 0}, 120 / Conductor.bpm);
                FlxTween.tween(paragraph, {alpha: 0}, 120 / Conductor.bpm);
                FlxTween.tween(help, {alpha: 0}, 120 / Conductor.bpm);

				new FlxTimer().start(120 / Conductor.bpm, function(tmr:FlxTimer)
				{
					MusicBeatState.switchState(new END3Prologue());
				});
        }
    }
}