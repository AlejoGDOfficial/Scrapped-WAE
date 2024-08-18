local proceed = false
function onCreate()
	if not seenCutscene then
		makeLuaSprite('blackScreenFaded', nil, 0, 0, 0)
		makeGraphic('blackScreenFaded', screenWidth, screenHeight, '000000')
		setObjectCamera('blackScreenFaded', 'other')
		setProperty('blackScreenFaded.alpha', 0)
		addLuaSprite('blackScreenFaded')
		makeLuaSprite('desktopWarningScreen', 'warnings/desktop', 0, screenHeight)
		setObjectCamera('desktopWarningScreen', 'other')
		setProperty('desktopWarningScreen.alpha', 0)
		addLuaSprite('desktopWarningScreen')
		doTweenY('desktopWarningScreen0', 'desktopWarningScreen', 0, 240 / bpm, 'backInOut')
		doTweenAlpha('desktopWarningScreen1', 'desktopWarningScreen', 1, 240 / bpm)
		doTweenAlpha('blackScreenFaded', 'blackScreenFaded', 0.5, 240 / bpm)
		runTimer('desktopWarningScreenTimer', 240 / bpm)
	end
end
function onUpdate()
    if not seenCutscene and keyboardJustPressed('X') and proceed then
        startCountdown()
		doTweenY('desktopWarningScreen0', 'desktopWarningScreen', -720, 240 / bpm, 'backInOut')
		doTweenAlpha('desktopWarningScreen1', 'desktopWarningScreen', 0, 240 / bpm)
		doTweenAlpha('blackScreenFaded', 'blackScreenFaded', 0, 240 / bpm)
		playSound('cancelMenu', 1)
		proceed = false
    end
end
function onStartCountdown()
	if not seenCutscene then
		if not proceed then
			proceed = true
			return Function_Stop;
		end
		return Function_Continue;
	end
end
function onTimerCompleted(tag)
    if tag == 'desktopWarningScreenTimer' then
        proceed = true
    end
end