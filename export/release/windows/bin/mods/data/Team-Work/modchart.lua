function onCreate()
    setProperty('camHUD.y', -720)
    setObjectOrder('sky', 0)
    setObjectOrder('background', 1)
    setObjectOrder('gfGroup', 2)
    setObjectOrder('ground', 3)
    setObjectOrder('dadGroup', 4)
    setObjectOrder('boyfriendGroup', 5)
    setProperty('gf.y', 750)
    setProperty('background.scale.x', 2)
    setProperty('background.scale.y', 2)
    setProperty('sky.scale.x', 2)
    setProperty('sky.scale.y', 2)
    setProperty('ground.scale.x', 2)
    setProperty('ground.scale.y', 2)
    addLuaScript('events/chromaticAberration')
end
local t = 0
function onUpdate(e)
    t = t + e
    setProperty('background.y', -150 + math.sin(t * 2) * 50)
    setProperty('background.angle', math.sin(t) * 5)
    if curBeat >= 192 then
        setProperty('dad.x', -600 + math.sin(t * 4) * 100)
        setProperty('dad.y', -150 + math.cos(t * 4) * 100)
    end
    if curBeat >= 384 and curBeat < 448 then
        setProperty('health', 2)
    end
    if curBeat >= 576 and curBeat < 640 then
        setProperty('health', 2)
    end
end
function onBeatHit()
    if curBeat % 4 == 0 then
        setTextString('songInfo', 'Song by AlejoGDOfficial')
    end
    if curBeat % 4 == 1 then
        setTextString('songInfo', 'Matias by ELmatiasYT')
    end
    if curBeat % 4 == 2 then
        setTextString('songInfo', 'Johana by JohanaUwU')
    end
    if curBeat % 4 == 3 then
        setTextString('songInfo', 'SCREW YOU')
    end
    if curBeat == 32 then
        doTweenY('camHUD', 'camHUD', 0, 1920 / bpm, 'cubeOut')
        for i = 0, 3 do
            noteTweenX('note'..i, i, -120, 240 / bpm, 'cubeIn')
        end
        for i = 4, 7 do
            noteTweenX('note'..i, i, 1400, 240 / bpm, 'cubeIn')
        end
    end
    if curBeat == 60 then
        noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
    end
    if curBeat >= 64 and curBeat < 176 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.1, 0.1)
        end
        if curBeat % 4 == 0 then
            setProperty('camHUD.angle', 2)
            doTweenAngle('camHUD', 'camHUD', 2.8125, 60 / bpm, 'cubeOut')
        end
        if curBeat % 4 == 2 then
            setProperty('camHUD.angle', -2)
            doTweenAngle('camHUD', 'camHUD', -2.8125, 60 / bpm, 'cubeOut')
        end
    end
    if curBeat == 92 then
        for i = 0, 3 do
            noteTweenX('noteX'..i, i, -120, 240 / bpm, 'cubeIn')
        end
        noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
    end
    if curBeat == 124 then
        noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
    end
    if curBeat == 128 then
        for i = 4, 7 do
            noteTweenX('note'..i, i, 1400, 240 / bpm, 'cubeIn')
        end
    end
    if curBeat == 156 then
        noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
    end
    if curBeat == 160 then
        for i = 0, 3 do
            noteTweenX('noteX'..i, i, -120, 240 / bpm, 'cubeIn')
        end
    end
    if curBeat == 176 then
        doTweenAngle('camHUD', 'camHUD', 0, 60 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 412, 240 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 524, 240 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 636, 240 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 748, 240 / bpm, 'cubeOut')
    end
    if curBeat == 176 then
        doTweenY('gf0', 'gf', -250, 120 / bpm, 'cubeOut')
        doTweenX('gf1', 'gf', -250, 120 / bpm, 'cubeOut')
    end
    if curBeat == 192 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        triggerEvent('Change Character', 'dad' ,'alejo3D')
        triggerEvent('Change Character', 'gf' ,'Johana')
        setProperty('boyfriendGroup.x', 900)
        setProperty('boyfriendGroup.y', 50)
        setProperty('gf.x', 300)
        setProperty('gf.y', -50)
        setProperty('gf.scale.x', -0.7)
        setProperty('dad.scale.x', 1.5)
        setProperty('dad.scale.y', 1.5)
        setObjectOrder('ground', 2)
        setObjectOrder('gfGroup', 3)
        setProperty('defaultCamZoom', 0.4)
    end
    if curBeat >= 384 and curBeat < 448 then
        if curBeat % 16 == 0 then
            triggerEvent('chromaticAberration', 0.01, 2)
        end
    end
    if curBeat == 576 then
        noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
    end
    if curBeat >= 576 and curBeat < 640 then
        if curBeat % 16 == 0 then
            triggerEvent('chromaticAberration', 0.01, 2)
        end
    end
    if curBeat == 768 then
        doTweenY('camHUD', 'camHUD', 720, 480 / bpm, 'cubeIn')
    end
end
function onSectionHit()
    if curSection >= 48 and curSection < 144 then
        if mustHitSection then
            for i = 0, 3 do
                noteTweenX('noteX'..i, i, -120, 240 / bpm, 'cubeIn')
            end
            noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
            noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
            noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
            noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
        end
        if not mustHitSection then
            for i = 4, 7 do
                noteTweenX('note'..i, i, 1400, 240 / bpm, 'cubeIn')
            end
            noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
            noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
            noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
            noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
        end
    end
    if curSection >= 160 and curSection < 191 then
        if mustHitSection then
            for i = 0, 3 do
                noteTweenX('noteX'..i, i, -120, 240 / bpm, 'cubeIn')
            end
            noteTweenX('noteX4', 4, 732, 240 / bpm, 'cubeOut')
            noteTweenX('noteX5', 5, 844, 240 / bpm, 'cubeOut')
            noteTweenX('noteX6', 6, 956, 240 / bpm, 'cubeOut')
            noteTweenX('noteX7', 7, 1068, 240 / bpm, 'cubeOut')
        end
        if not mustHitSection then
            for i = 4, 7 do
                noteTweenX('note'..i, i, 1400, 240 / bpm, 'cubeIn')
            end
            noteTweenX('noteX0', 0, 92, 240 / bpm, 'cubeOut')
            noteTweenX('noteX1', 1, 204, 240 / bpm, 'cubeOut')
            noteTweenX('noteX2', 2, 316, 240 / bpm, 'cubeOut')
            noteTweenX('noteX3', 3, 428, 240 / bpm, 'cubeOut')
        end
    end
end