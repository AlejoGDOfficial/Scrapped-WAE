function onCreate()
    setProperty('camHUD.y', screenHeight)
end
local t = 0
function onUpdate(e)
    t = t + e * 2
    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000) * (curBpm/50)
    if curBeat >= 192 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t + i) * 25)
        end
    end
    if curBeat >= 32 and curBeat < 192 then
        setProperty('camHUD.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
    end
    if curBeat >= 320 and curBeat < 448 then
        setProperty('camHUD.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
    end
    if curBeat >= 512 then
        setProperty('camHUD.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
    end
end
function onBeatHit()
    if curBeat == 30 then
        doTweenY('hud', 'camHUD', 0, 120 / bpm, 'circOut')
    end
    if curBeat == 32 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
    if curBeat >= 128 and curBeat < 192 then
        if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.02, 0.02)
        end
    end
    if curBeat == 192 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('camHUD.angle', 0)
        setProperty('camHUD.x', 0)
        setProperty('camHUD.y', 0)
        setProperty('camGame.angle', 0)
        setProperty('camGame.x', 0)
        setProperty('camGame.y', 0)
    end
    if curBeat >= 192 and curBeat < 320 then
        triggerEvent("Add Camera Zoom", 0.02, 0.02)
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -2.5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', -2.5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            setProperty('camHUD.angle', 2.5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', 2.5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
    end
    if curBeat == 320 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
    if curBeat >= 320 and curBeat < 448 then
        triggerEvent("Add Camera Zoom", 0.02, 0.02)
    end
    if curBeat == 448 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('camHUD.angle', 0)
        setProperty('camHUD.x', 0)
        setProperty('camHUD.y', 0)
        setProperty('camGame.angle', 0)
        setProperty('camGame.x', 0)
        setProperty('camGame.y', 0)
    end
    if curBeat == 512 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
end