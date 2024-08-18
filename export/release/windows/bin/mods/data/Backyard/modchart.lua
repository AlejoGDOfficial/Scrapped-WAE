local t = 0
function onCreate()
    triggerEvent('Set GF Speed', 2, nil)
end
function onCountdownTick(counter)
    if counter == 0 then
        doTweenAlpha('camHUD', 'camHUD', 0, 60 / bpm)
    end
end
local t = 0
function onUpdate(e)
    t = t + e
    if curBeat < 32 then
        triggerEvent('Camera Follow Pos', 750 + math.sin(t * 2) * 100, 450 + math.cos(t * 2) * 100)
    end
    if curBeat >= 416 then
        triggerEvent('Camera Follow Pos', 750 + math.sin(t * 2) * 100, 450 + math.cos(t * 2) * 100)
    end
end
function onSongStart()
    doTweenAlpha('camHUD', 'camHUD', 1, 1920 / bpm)
end
function onBeatHit()
    if curBeat == 32 then
        triggerEvent('Camera Follow Pos')
        triggerEvent('Add Camera Zoom', 0.5, 0.5)
        for i = 0, 7 do
            noteTweenAngle('note'..i, i, 360, 240 / bpm, 'cubeOut')
        end
    end
    if curBeat == 416 then
        for i = 0, 3 do
            noteTweenX('note'..i, i, -200, 240 / bpm, 'cubeIn')
        end
        for i = 4, 7 do
            noteTweenX('note'..i, i, 1300, 240 / bpm, 'cubeIn')
        end
    end
end