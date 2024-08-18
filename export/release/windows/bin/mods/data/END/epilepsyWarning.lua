local proceed = false
function onCreate()
	if not seenCutscene then
		makeLuaSprite('blackScreenFaded', nil, 0, 0, 0)
		makeGraphic('blackScreenFaded', screenWidth, screenHeight, '000000')
		setObjectCamera('blackScreenFaded', 'other')
		setProperty('blackScreenFaded.alpha', 0)
		addLuaSprite('blackScreenFaded')
		makeLuaSprite('epilepsyWarning', 'warnings/epilepsy', 0, screenHeight)
		setObjectCamera('epilepsyWarning', 'other')
		setProperty('epilepsyWarning.alpha', 0)
		addLuaSprite('epilepsyWarning')
		doTweenY('epilepsyWarning0', 'epilepsyWarning', 0, 240 / bpm, 'backInOut')
		doTweenAlpha('epilepsyWarning1', 'epilepsyWarning', 1, 240 / bpm)
		doTweenAlpha('blackScreenFaded', 'blackScreenFaded', 0.5, 240 / bpm)
		runTimer('epilepsyWarningTimer', 240 / bpm)
	end
end
function onUpdate()
    if not seenCutscene and keyboardJustPressed('X') and proceed then
        startCountdown()
		doTweenY('epilepsyWarning0', 'epilepsyWarning', -720, 240 / bpm, 'backInOut')
		doTweenAlpha('epilepsyWarning1', 'epilepsyWarning', 0, 240 / bpm)
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
    if tag == 'epilepsyWarningTimer' then
        proceed = true
    end
end