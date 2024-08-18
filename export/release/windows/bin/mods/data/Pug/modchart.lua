function onCreate()
    makeLuaSprite('circleBlackScreen', 'other/gradients/circleBlackScreen', 0, 0)
    addLuaSprite('circleBlackScreen')
    setObjectCamera('circleBlackScreen', 'other')
    setProperty('circleBlackScreen.alpha', 0.25)
    doTweenZoom('camHUD', 'camHUD', 10, 15 / bpm)
	makeLuaSprite('whiteScreen', 'whiteScreen', -1750, -1000)
    makeGraphic('whiteScreen', 6000, 3000, 'FFFFFF')
	setLuaSpriteScrollFactor('whiteScreen', 1)
    setObjectCamera('whiteScreen', 'camGame')
    addLuaSprite('whiteScreen')
    setProperty('whiteScreen.scale.x', 3)
    setProperty('whiteScreen.scale.y', 3)
    setProperty('whiteScreen.alpha', 0)
    setProperty('gf.alpha', 0)
    addCharacterToList('alexa', 'dad')
end
function onBeatHit()
    if curBeat == 128 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
    end
    if curBeat == 768 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 1024 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 1536 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
    end
    if curBeat == 1664 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        setProperty('whiteScreen.alpha', 1)
        setProperty('boyfriend.color', '000000')
        setProperty('dad.color', '000000')
        setProperty('gf.color', '000000')
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
        setProperty('healthBar.alpha', 0)
        setProperty('scoreTxt.alpha', 0)
        setProperty('clouds.alpha', 0)
        setProperty('defaultCamZoom', 0.4)
        setProperty('circleBlackScreen.alpha', 0.75)
    end
    if curBeat >= 1664 and curBeat < 2048 then
        cameraShake('camGame', 0.005, 60 / bpm)
        cameraShake('camHUD', 0.005, 60 / bpm)
    end
    if curBeat == 2048 then
        removeLuaSprite('whiteScreen')
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        setProperty('iconP1.alpha', 1)
        setProperty('iconP2.alpha', 1)
        setProperty('healthBar.alpha', 1)
        setProperty('scoreTxt.alpha', 1)
        setProperty('clouds.alpha', 1)
        setProperty('gf.alpha', 1)
        setProperty('defaultCamZoom', 0.9)
        setProperty('circleBlackScreen.alpha', 0.25)
    end
    if curBeat == 2304 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2368 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2384 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2432 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
    end
    if curBeat == 2464 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2532 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2544 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2548 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2560 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2564 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2576 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2580 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2592 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2596 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2608 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2612 then
        triggerEvent('Change Character', 'dad', 'alexa')
    end
    if curBeat == 2624 then
        triggerEvent('Change Character', 'dad', 'mari')
    end
    if curBeat == 2656 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        setProperty('camGame.alpha', 0)
        setProperty('camHUD.alpha', 0)
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteData == 0 then
        setPropertyFromGroup('strumLineNotes', 0, 'angle', 0)
        setPropertyFromGroup('strumLineNotes', 1, 'angle', 90)
        setPropertyFromGroup('strumLineNotes', 2, 'angle', 270)
        setPropertyFromGroup('strumLineNotes', 3, 'angle', 180)
    end
    if noteData == 1 then
        setPropertyFromGroup('strumLineNotes', 0, 'angle', 270)
        setPropertyFromGroup('strumLineNotes', 1, 'angle', 0)
        setPropertyFromGroup('strumLineNotes', 2, 'angle', 180)
        setPropertyFromGroup('strumLineNotes', 3, 'angle', 90)
    end
    if noteData == 2 then
        setPropertyFromGroup('strumLineNotes', 0, 'angle', 90)
        setPropertyFromGroup('strumLineNotes', 1, 'angle', 180)
        setPropertyFromGroup('strumLineNotes', 2, 'angle', 0)
        setPropertyFromGroup('strumLineNotes', 3, 'angle', 270)
    end
    if noteData == 3 then
        setPropertyFromGroup('strumLineNotes', 0, 'angle', 180)
        setPropertyFromGroup('strumLineNotes', 1, 'angle', 270)
        setPropertyFromGroup('strumLineNotes', 2, 'angle', 90)
        setPropertyFromGroup('strumLineNotes', 3, 'angle', 0)
    end
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'y', 25)
        noteTweenY('note'..i, i, 50, 60 / bpm, 'cubeOut')
    end
    runTimer('noteAngleOpponent', 240 / bpm)
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteData == 0 then
        setPropertyFromGroup('strumLineNotes', 4, 'angle', 0)
        setPropertyFromGroup('strumLineNotes', 5, 'angle', 90)
        setPropertyFromGroup('strumLineNotes', 6, 'angle', 270)
        setPropertyFromGroup('strumLineNotes', 7, 'angle', 180)
    end
    if noteData == 1 then
        setPropertyFromGroup('strumLineNotes', 4, 'angle', 270)
        setPropertyFromGroup('strumLineNotes', 5, 'angle', 0)
        setPropertyFromGroup('strumLineNotes', 6, 'angle', 180)
        setPropertyFromGroup('strumLineNotes', 7, 'angle', 90)
    end
    if noteData == 2 then
        setPropertyFromGroup('strumLineNotes', 4, 'angle', 90)
        setPropertyFromGroup('strumLineNotes', 5, 'angle', 180)
        setPropertyFromGroup('strumLineNotes', 6, 'angle', 0)
        setPropertyFromGroup('strumLineNotes', 7, 'angle', 270)
    end
    if noteData == 3 then
        setPropertyFromGroup('strumLineNotes', 4, 'angle', 180)
        setPropertyFromGroup('strumLineNotes', 5, 'angle', 270)
        setPropertyFromGroup('strumLineNotes', 6, 'angle', 90)
        setPropertyFromGroup('strumLineNotes', 7, 'angle', 0)
    end
    for i = 4, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'y', 75)
        noteTweenY('note'..i, i, 50, 60 / bpm, 'cubeOut')
    end
    runTimer('noteAnglePlayer', 240 / bpm)
end
function onTimerCompleted(tag)
    if tag == 'noteAngleOpponent' then
        for i = 0, 3 do
            noteTweenAngle('defaultNoteAngleOpponent'..i, i, 0, 240 / bpm, 'backInOut')
        end
    end
    if tag == 'noteAnglePlayer' then
        for i = 4, 7 do
            noteTweenAngle('defaultNoteAnglePlayer'..i, i, 0, 240 / bpm, 'backInOut')
        end
    end
end