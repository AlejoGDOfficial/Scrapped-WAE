local t = 0
function onCreate()
    addCharacterToList('floatingAlejo', 'dad')
end
function onCountdownTick(counter)
    if counter == 0 then
        doTweenAlpha('camHUD', 'camHUD', 0, 60 / bpm)
    end
end
function onUpdate(e)
    t = t + e * 5
    if curBeat < 64 then
        triggerEvent('Camera Follow Pos', 700 + math.sin(t / 5) * 300, 400 + math.cos(t / 1.25) * -25)
    end
    if curBeat >= 160 and curBeat < 192 then
        setProperty('health', 1)
    end
    if curBeat >= 448 and curBeat < 480 then
        setProperty('health', 1)
    end
    if curBeat >= 640 and curBeat < 704 then
        triggerEvent('Camera Follow Pos', 700 + math.sin(t / 5) * 300, 400)
    end
    if curBeat >= 704 and curBeat < 768 then
        triggerEvent('Camera Follow Pos', 700 + math.sin(t / 5) * 300, 400 + math.cos(t / 1.25) * -50)
    end
    if curBeat > 768 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t + i) * 50)
        end
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t + i) * 50)
        end
        setProperty('dad.x', 500 + math.sin(t) * 300)
        setProperty('dad.y', -150 + math.cos(t) * 100)
    end
    if curBeat >= 800 and curBeat < 832 then
        setProperty('health', 1)
    end
    if curBeat >= 960 and curBeat < 1024 then
        setProperty('health', 1)
    end
    if curBeat >= 1152 and curBeat < 1184 then
        setProperty('health', 1)
    end
    if curBeat >= 1248 and curBeat < 1312 then
        setProperty('health', 1)
    end
    if curBeat >= 1312 then
        triggerEvent('Camera Follow Pos', 700 + math.sin(t / 5) * 300, 400 + math.cos(t / 1.25) * -25)
    end
end
function onSongStart()
    doTweenAlpha('camHUD', 'camHUD', 1, 3840 / bpm)
end
function onBeatHit()
    if curBeat == 64 then
        triggerEvent('Camera Follow Pos')
        triggerEvent('Add Camera Zoom', 1, 0.5)
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'angle', -360)
            noteTweenAngle('note'..i, i, 0, 240 / bpm, 'cubeOut')
        end
    end
    if curBeat >= 68 then
        if curBeat % 2 == 0 then
            for i = 0, 7 do
                setPropertyFromGroup('strumLineNotes', i, 'angle', 5.625)
                noteTweenAngle('note'..i, i, 11.25, 30 / bpm, 'cubeOut')
            end
        end
        if curBeat % 2 == 1 then
            for i = 0, 7 do
                setPropertyFromGroup('strumLineNotes', i, 'angle', -5.625)
                noteTweenAngle('note'..i, i, -11.25, 30 / bpm, 'cubeOut')
            end
        end
    end
    if curBeat == 640 then
        doTweenAlpha('camHUD', 'camHUD', 0, 480 / bpm)
    end
    if curBeat == 696 then
        doTweenAlpha('camHUD', 'camHUD', 0.5, 480 / bpm)
    end
    if curBeat == 768 then
        triggerEvent('Camera Follow Pos')
        triggerEvent('Change Character', 'dad', 'floatingAlejo')
        cameraFlash('camHUD', 'FFFFFF', 240 / bpm)
        setProperty('camHUD.alpha', 1)
    end
    if curBeat == 950 then
        doTweenAlpha('camHUD', 'camHUD', 0.5, 28080 / bpm)
    end
end
function onStepHit()
    if curStep % 2 == 0 then
        setProperty('camGame.y', -2)
        setProperty('camGame.x', 2)
        setProperty('camHUD.y', 2)
        setProperty('camHUD.x', -2)
    end
    if curStep % 2 == 1 then
        setProperty('camGame.y', 2)
        setProperty('camGame.x', -2)
        setProperty('camHUD.y', -2)
        setProperty('camHUD.x', 2)
    end
end
function opponentNoteHit()
    if curBeat >= 768 then
        cameraShake('camGame', 0.015, 0.1) 
        cameraShake('camHUD', 0.015, 0.1) 
    end
end