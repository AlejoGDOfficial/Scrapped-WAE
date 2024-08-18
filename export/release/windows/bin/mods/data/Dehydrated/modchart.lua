function onCreatePost()
    makeLuaSprite('offset', nil, 0, 0)
    makeGraphic('offset', 1, 1, 'FFFFFF')
    setProperty('offset.alpha', 0)
    addLuaSprite('offset')
end
local t = 0
local health = nil
local offset = false
function onUpdate(e)
    t = t + 5 * e
    health = getProperty('health')
    setProperty('dad.y', 100 + math.sin(t / 2) * 200)
    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    end
    setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t * 2 + 0) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t * 2 + 1) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t * 2 + 2) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t * 2 + 3) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t * 2 + 4) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t * 2 + 5) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t * 2 + 6) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t * 2 + 7) * getProperty('offset.x') + getRandomInt(-2.5, 2.5))
    if curBeat >= 944 and curBeat < 952 then
        setProperty('health', health + 0.05)
    end
end
function onSongStart()
    doTweenZoom('camGame', 'camGame', 1, 240 / bpm, 'cubeOut')
end
function onBeatHit()
    if curBeat % 8 == 4 and offset then
        setProperty('offset.x', 100)
        doTweenX('offset', 'offset', 0, 240 / bpm, 'cubeOut')
        triggerEvent('Add Camera Zoom', 0.25, 0.125)
    end
    if health < 0.5 then
        setProperty('health', health + 0.1)
    end
    if curBeat == 64 then
        for i = 0, 7 do
            noteTweenAlpha('note'..i, i, 0, 240 / bpm)
        end
    end
    if curBeat == 128 then
        offset = true
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    end
    if curBeat == 768 then
        offset = false
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 0, 240 / bpm)
        end
        doTweenAlpha('camHUD', 'camHUD', 0.5, 240 / bpm)
        doTweenZoom('camGame', 'camGame', 0.75, 7680 / bpm)
    end
    if curBeat == 896 then
        offset = true
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 1, 120 / bpm)
        end
        doTweenAlpha('camHUD', 'camHUD', 1, 120 / bpm)
    end
    if curBeat == 1024 then
        offset = false
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 0, 240 / bpm)
        end
        doTweenAlpha('camHUD', 'camHUD', 0.5, 240 / bpm)
        doTweenZoom('camGame', 'camGame', 0.75, 7680 / bpm)
    end
end
function opponentNoteHit()
    if health > 0.5 then
        setProperty('health', health - 0.01125)
    end
    cameraShake('camHUD', 0.01, 60 / bpm)
    cameraShake('camGame', 0.01, 60 / bpm)
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    setProperty('health', getProperty('health') + 0.02)
end