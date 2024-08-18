function onCreate()
    addCharacterToList('bf-christmas', 'bf')
end
function onUpdate()
    setPropertyFromGroup('strumLineNotes', 0, 'alpha', 0.5)
    setPropertyFromGroup('strumLineNotes', 1, 'alpha', 0.5)
    setPropertyFromGroup('strumLineNotes', 2, 'alpha', 0.5)
    setPropertyFromGroup('strumLineNotes', 3, 'alpha', 0.5)
end
function onBeatHit()
    if curBeat % 2 == 0 then
        triggerEvent("Add Camera Zoom", 0.015 * 2, 0.03 * 2)
    end
    if curBeat % 8 == 0 then
        doTweenAngle('hud', 'camHUD', -5.625, 240 / bpm, 'circInOut')
        doTweenAngle('cam', 'camGame', 5.625, 240 / bpm, 'circInOut')
        noteTweenX('note0', 0, 62, 240 / bpm, 'circInOut')
        noteTweenX('note1', 1, 762, 240 / bpm, 'circInOut')
        noteTweenX('note2', 2, 286, 240 / bpm, 'circInOut')
        noteTweenX('note3', 3, 986, 240 / bpm, 'circInOut')
        noteTweenX('note4', 4, 174, 240 / bpm, 'circInOut')
        noteTweenX('note5', 5, 874, 240 / bpm, 'circInOut')
        noteTweenX('note6', 6, 398, 240 / bpm, 'circInOut')
        noteTweenX('note7', 7, 1098, 240 / bpm, 'circInOut')
        triggerEvent('Change Character', 'bf', 'bf')
    end
    if curBeat % 8 == 4 then
        doTweenAngle('hud', 'camHUD', 5.625, 240 / bpm, 'circInOut')
        doTweenAngle('cam', 'camGame', -5.625, 240 / bpm, 'circInOut')
        noteTweenX('note0', 0, 92, 240 / bpm, 'circInOut')
        noteTweenX('note1', 1, 204, 240 / bpm, 'circInOut')
        noteTweenX('note2', 2, 316, 240 / bpm, 'circInOut')
        noteTweenX('note3', 3, 428, 240 / bpm, 'circInOut')
        noteTweenX('note4', 4, 732, 240 / bpm, 'circInOut')
        noteTweenX('note5', 5, 844, 240 / bpm, 'circInOut')
        noteTweenX('note6', 6, 965, 240 / bpm, 'circInOut')
        noteTweenX('note7', 7, 1068, 240 / bpm, 'circInOut')
        triggerEvent('Change Character', 'bf', 'bf-christmas')
    end
    if curBeat % 4 == 0 then
        setProperty('gf.x', 800)
        setProperty('gf.angle', -5.625)
        doTweenX('gf', 'gf', 1075, 120 / bpm, 'circInOut')
        doTweenAngle('gf0', 'gf', 0, 120 / bpm, 'circInOut')
    end
    if curBeat % 4 == 2 then
        setProperty('gf.x', 1350)
        setProperty('gf.angle', 5.625)
        doTweenX('gf', 'gf', 1075, 120 / bpm, 'circInOut')
        doTweenAngle('gf0', 'gf', 0, 120 / bpm, 'circInOut')
    end
    if curBeat == 256 then
        doTweenAlpha('hud', 'camHUD', 0, 60 / bpm)
    end
    if curBeat == 384 then
        doTweenAlpha('hud', 'camHUD', 1, 60 / bpm)
    end
    if curBeat == 640 then
        doTweenAlpha('hud', 'camHUD', 0, 60 / bpm)
    end
end
function opponentNoteHit()
    setProperty('health', getRandomFloat(1, 2))
end