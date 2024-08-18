function onCreate()
    setProperty('camHUD.alpha', 0)
    setProperty('gf.alpha', 0)
    addCharacterToList('dad', 'dad')
    triggerEvent('Set GF Speed', 2)
end
function onBeatHit()
    if curBeat == 128 then
        doTweenAlpha('camHUD', 'camHUD', 1, 120 / bpm)
    end
    if curBeat >= 128 and curBeat < 256 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 448 then
        doTweenZoom('camGame', 'camGame', 1.25, 240 / bpm, 'cubeOut')
        doTweenAlpha('camHUD', 'camHUD', 0, 240 / bpm)
        doTweenAlpha('dad', 'dad', 0, 240 / bpm)
    end
    if curBeat == 452 then
        triggerEvent('Change Character', 'dad', 'dad')
        setProperty('defaultCamZoom', 1.25)
    end
    if curBeat == 480 then
        doTweenZoom('camGame', 'camGame', 0.9, 120 / bpm, 'cubeOut')
        doTweenAlpha('dad', 'dad', 1, 120 / bpm)
        doTweenAlpha('gf', 'gf', 1, 120 / bpm)
    end
    if curBeat == 482 then
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 544 then
        setProperty('camHUD.x', -1280)
        setProperty('camHUD.alpha', 1)
        doTweenX('camHUD', 'camHUD', 0, 240 / bpm, 'cubeOut')
    end
    if curBeat >= 608 and curBeat < 736 then
        triggerEvent('Add Camera Zoom', 0.05, 0.05)
    end
    if curBeat >= 864 and curBeat < 928 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curBeat % 2 == 1 then
            triggerEvent('Add Camera Zoom', 0.025, 0.025)
        end
    end
    if curBeat == 1056 then
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'angle', 360)
            noteTweenAngle('note'..i, i, 0, 240 / bpm, 'cubeOut')
        end
    end
    if curBeat == 1060 then
        doTweenAlpha('camHUD', 'camHUD', 0, 240 / bpm)
    end
end