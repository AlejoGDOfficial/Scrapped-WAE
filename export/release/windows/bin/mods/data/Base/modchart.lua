function onUpdate()
    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000) * (curBpm/50)
    if curBeat >= 128 and curBeat < 160 then
        setProperty('camHUD.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camHUD.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.angle', 0 - 5 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.y', 10 - 40 * math.cos((currentBeat2 * 0.1) * math.pi))
        setProperty('camGame.x', 5 - 20 * math.sin((currentBeat2 * 0.1) * math.pi))
    end
end
function onBeatHit()
    if curBeat == 32 then
        triggerEvent("Add Camera Zoom", 1, 1)
    end
    if curBeat == 128 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
    if curBeat == 160 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('camHUD.angle', 0)
        setProperty('camHUD.x', 0)
        setProperty('camHUD.y', 0)
        setProperty('camGame.angle', 0)
        setProperty('camGame.x', 0)
        setProperty('camGame.y', 0)
    end
end