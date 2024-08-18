function onCreate()
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('healthBar.alpha', 0)
    makeLuaSprite('circleBlackScreen', 'circleBlackScreen', 0, 0)
    addLuaSprite('circleBlackScreen')
    setObjectCamera('circleBlackScreen', 'other')
    setProperty('circleBlackScreen.alpha', 0)
end
local t = 0
function onUpdate(e)
    t = t + e
    if curBeat < 256 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', screenWidth / 2 - getPropertyFromGroup('strumLineNotes', i, 'width') / 2 + math.sin(t * 2 + i) * math.cos(t) * 500)
        end
    end
    if curBeat >= 640 and curBeat < 768 then
        setProperty('camHUD.angle', math.sin(t) * 5)
    end
    if curBeat >= 1408 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * 25)
            setPropertyFromGroup('strumLineNotes', i, 'angle', t * 25)
            setPropertyFromGroup('strumLineNotes', 0, 'x', 412 + math.sin(t * 2) * 50)
            setPropertyFromGroup('strumLineNotes', 1, 'x', 524 + math.sin(t * 2) * 50)
            setPropertyFromGroup('strumLineNotes', 2, 'x', 636 + math.sin(t * 2) * 50)
            setPropertyFromGroup('strumLineNotes', 3, 'x', 748 + math.sin(t * 2) * 50)
            setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 2) * 50)
            setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 2) * 50)
            setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 2) * 50)
            setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 2) * 50)
        end
    end
end
function onBeatHit()
    if curBeat == 256 then
        noteTweenX('noteX0', 0, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 1068, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 428, 240 / bpm, 'cubeOut')
    end
    if curBeat == 384 then
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 0.5, 60 / bpm)
        end
        noteTweenX('noteX0', 0, 412, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 524, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 636, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 748, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 412, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 524, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 636, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 748, 240 / bpm, 'cubeOut')
    end
    if curBeat >= 384 and curBeat < 448 then
        setProperty('health', getProperty('health') + 0.1)
    end
    if curBeat == 448 then
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 1, 60 / bpm)
        end
        noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
    end
    if curBeat == 512 then
        for i = 4, 7 do
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
        noteTweenX('noteX0', 0, 412, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 524, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 636, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 748, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 412, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 524, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 636, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 748, 240 / bpm, 'cubeOut')
    end
    if curBeat == 508 then
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 512 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('circleBlackScreen.alpha', 0.5)
        doTweenZoom('camGame', 'camGame', 1, 7680 / bpm)
        for i = 4, 7 do
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
        noteTweenX('noteX0', 0, 412, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 524, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 636, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 748, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 412, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 524, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 636, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 748, 240 / bpm, 'cubeOut')
    end
    if curBeat == 572 then
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
        for i = 4, 7 do
            noteTweenAlpha('note'..i, i, 1, 60 / bpm)
        end
    end
    if curBeat == 636 then
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 1, 60 / bpm)
        end
        noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
    end
    if curBeat == 640 then
        doTweenAlpha('circleBlackScreen', 'circleBlackScreen', 0, 60 / bpm)
        setProperty('defaultCamZoom', 0.75)
    end
    if curBeat == 768 then
        doTweenAngle('camHUD', 'camHUD', 0, 120 / bpm, 'cubeOut')
        for i = 4, 7 do
            noteTweenY('note'..i, i, screenHeight, 120 / bpm, 'cubeIn')
        end
    end
    if curBeat == 828 then
        for i = 0, 3 do
            noteTweenY('note'..i, i, screenHeight, 120 / bpm, 'cubeIn')
        end
        for i = 4, 7 do
            noteTweenY('note'..i, i, 50, 120 / bpm, 'cubeOut')
        end
    end
    if curBeat == 896 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        for i = 0, 3 do
            noteTweenY('noteX'..i, i, 50, 120 / bpm, 'cubeIn')
        end
    end
    if curBeat == 960 then
        noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
    end
    if curBeat == 1024 then
        noteTweenX('noteX0', 0, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 1068, 240 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 428, 240 / bpm, 'cubeOut')
    end
    if curBeat == 1280 then
        noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
    end
    if curBeat == 1340 then
        noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
    end
    if curBeat == 1344 then
        noteTweenX('noteX0', 0, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 1068, 240 / bpm, 'cubeOut')
    end
    if curBeat == 1408 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
        end
        setProperty('circleBlackScreen.alpha', 0.25)
        setProperty('timer.alpha', 0)
    end
    if curBeat == 1536 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('camGame.alpha', 0)
        setProperty('camHUD.alpha', 0)
    end
end
function opponentNoteHit()
    if curBeat >= 896 and curBeat < 960 then
        for i = 0, 7 do
            noteTweenX('note'..i, i, getRandomInt(0, 1180), 30 / bpm, 'cubeOut')
        end
    end
end