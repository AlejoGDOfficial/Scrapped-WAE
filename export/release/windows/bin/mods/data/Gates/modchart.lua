function onCreate()
    triggerEvent('Set GF Speed', 2)
end
function onCountdownTick(counter)
    if counter == 0 then
        doTweenAlpha('camHUD', 'camHUD', 0, 60 / bpm)
    end
end
function onSongStart()
    doTweenAlpha('camHUD', 'camHUD', 1, 1920 / bpm)
end
function onSectionHit()
    noteXOffset = getRandomInt(-50, 50)
    noteAngleOffset = getRandomInt(-360, 360)
    for i = 0, 7 do
        noteTweenY('noteY'..i, i, 50, 240 / bpm, 'cubeOut')
        setPropertyFromGroup('strumLineNotes', i, 'angle', noteAngleOffset)
        noteTweenAngle('noteAngle'..i, i, 0, 120 / bpm, 'cubeOut')
    end
    setPropertyFromGroup('strumLineNotes', 0, 'x', 62 + noteXOffset)
    setPropertyFromGroup('strumLineNotes', 1, 'x', 181 + noteXOffset)
    setPropertyFromGroup('strumLineNotes', 2, 'x', 331 + noteXOffset)
    setPropertyFromGroup('strumLineNotes', 3, 'x', 458 + noteXOffset)
    setPropertyFromGroup('strumLineNotes', 4, 'x', 702 + noteXOffset)
    setPropertyFromGroup('strumLineNotes', 5, 'x', 829 + noteXOffset)
    setPropertyFromGroup('strumLineNotes', 6, 'x', 971 + noteXOffset)
    setPropertyFromGroup('strumLineNotes', 7, 'x', 1098 + noteXOffset)
    noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
    noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
    noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
    noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
    noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
    noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
    noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
    noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
    if curSection == 24 then
        triggerEvent('Set GF Speed', 2)
    end
    if curSection == 64 then
        triggerEvent('Set GF Speed', 2)
    end
end