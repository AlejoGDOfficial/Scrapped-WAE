function onCreate()
    triggerEvent('Alt Idle Animation', 'gf', '2')
    triggerEvent('Alt Idle Animation', 'dad', '0')
    setProperty('camHUD.y', screenHeight)
    setProperty('camHUD.angle', 180)
    addCharacterToList('queenVoidAndTrueAlejo', 'dad')
    addCharacterToList('boxGFAlejo', 'gf')
    addCharacterToList('chaosBoxGFAlejo', 'gf')
    addCharacterToList('gfAlejo', 'gf')
    addCharacterToList('chaosBF', 'boyfriend')
    precacheSound('royalDeath')
    makeLuaSprite('fadingScreen', 'other/gradients/fadingScreen', 0, -720)
    addLuaSprite('fadingScreen')
    setObjectCamera('fadingScreen', 'other')
    makeLuaSprite('upScreen', nil, 0, 0)
    makeGraphic('upScreen', screenWidth, 100, '000000')
    addLuaSprite('upScreen')
    setObjectCamera('upScreen', 'other')
    makeLuaSprite('downScreen', nil, 0, 620)
    makeGraphic('downScreen', screenWidth, screenHeight, '000000')
    addLuaSprite('downScreen')
    setObjectCamera('downScreen', 'other')
end
function onCreatePost()
    makeLuaSprite('lightBlueScreen', nil, 0, 0, 0)
    makeGraphic('lightBlueScreen', screenWidth, screenHeight, 'C8C8FF')
    setObjectCamera('lightBlueScreen', 'other')
    setProperty('lightBlueScreen.alpha', 0)
    addLuaSprite('lightBlueScreen')
	makeLuaSprite('houseBackyardMorningSky', 'backgrounds/houseBackyardMorning/sky', -600, -300)
	setLuaSpriteScrollFactor('houseBackyardMorningSky', 0.25, 0.25)
	addLuaSprite('houseBackyardMorningSky', false)
    setProperty('houseBackyardMorningSky.alpha', 0)
	makeLuaSprite('houseBackyardMorningMountains', 'backgrounds/houseBackyardMorning/mountains', -600, -300)
	setLuaSpriteScrollFactor('houseBackyardMorningMountains', 0.5, 0.5)
	addLuaSprite('houseBackyardMorningMountains', false)
    setProperty('houseBackyardMorningMountains.alpha', 0)
	makeLuaSprite('houseBackyardMorningBackground', 'backgrounds/houseBackyardMorning/background', -600, -300)
	setLuaSpriteScrollFactor('houseBackyardMorningBackground', 0.75, 0.75)
	addLuaSprite('houseBackyardMorningBackground', false)
    setProperty('houseBackyardMorningBackground.alpha', 0)
	makeLuaSprite('houseBackyardMorningGround', 'backgrounds/houseBackyardMorning/ground', -600, -300)
	setLuaSpriteScrollFactor('houseBackyardMorningGround', 1, 1)
	addLuaSprite('houseBackyardMorningGround', false)
    setProperty('houseBackyardMorningGround.alpha', 0)
	makeLuaSprite('houseBackyardChaosSky', 'backgrounds/houseBackyardChaos/sky', -600, -300)
	setLuaSpriteScrollFactor('houseBackyardChaosSky', 0.25, 0.25)
	addLuaSprite('houseBackyardChaosSky', false)
    setProperty('houseBackyardChaosSky.scale.x', 1.5)
    setProperty('houseBackyardChaosSky.scale.y', 1.5)
    setProperty('houseBackyardChaosSky.alpha', 0)
	makeLuaSprite('houseBackyardChaosBackground', 'backgrounds/houseBackyardChaos/background', -600, -300)
	setLuaSpriteScrollFactor('houseBackyardChaosBackground', 0.75, 0.75)
	addLuaSprite('houseBackyardChaosBackground', false)
    setProperty('houseBackyardChaosBackground.scale.x', 1.5)
    setProperty('houseBackyardChaosBackground.scale.y', 1.5)
    setProperty('houseBackyardChaosBackground.alpha', 0)
	makeLuaSprite('houseBackyardChaosGround', 'backgrounds/houseBackyardChaos/ground', -600, -300)
	setLuaSpriteScrollFactor('houseBackyardChaosGround', 1, 1)
	addLuaSprite('houseBackyardChaosGround', false)
    setProperty('houseBackyardChaosGround.scale.x', 1.5)
    setProperty('houseBackyardChaosGround.scale.y', 1.5)
    setProperty('houseBackyardChaosGround.alpha', 0)
end
local t = 0
function onUpdate(e)
	t = t + e
    if getMisses() >= 1 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * (getMisses() / 25) + i) * 50)
        end
    end
    if curBeat >= 64 and curBeat < 320 then
        setProperty('houseBackyardChaosGround.y', -300 + math.sin(t) * 100)
        setProperty('boyfriend.y', 250 + math.sin(t) * 100)
        setProperty('dad.y', 50 + math.sin(t * 2) * -200)
        setProperty('gf.angle', math.sin(t / 4) * 22.5)
        setProperty('gf.y', 250 + math.sin(t / 2) * -50)
    end
    if curBeat >= 640 and curBeat < 1216 then
        setProperty('houseBackyardChaosGround.y', -300 + math.sin(t) * 100)
        setProperty('boyfriend.y', 250 + math.sin(t) * 100)
        setProperty('dad.y', 50 + math.sin(t * 2) * -200)
    end
end
function onSongStart()
    doTweenY('fadingScreen', 'fadingScreen', 720, 3840 / bpm)
end
function onBeatHit()
    if curBeat == 32 then
        triggerEvent('Alt Idle Animation', 'gf', '3')
    end
    if curBeat >= 32 and curBeat < 64 then
        if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.025, 0.025)
        end
    end
    if curBeat == 62 then
        triggerEvent('Alt Idle Animation', 'gf', '')
        doTweenAngle('intro0', 'camHUD', 0, 120 / bpm, 'circOut')
        doTweenY('intro', 'camHUD', 0, 120 / bpm, 'circOut')
        triggerEvent('Change Character', 'gf', 'boxGFAlejo')
    end
    if curBeat == 64 then
        setProperty('sky.alpha', 0)
        setProperty('mountains.alpha', 0)
        setProperty('background.alpha', 0)
        setProperty('ground.alpha', 0)
        setProperty('blueScreen.alpha', 0)
        setProperty('houseBackyardChaosSky.alpha', 1)
        setProperty('houseBackyardChaosBackground.alpha', 1)
        setProperty('houseBackyardChaosGround.alpha', 1)
        triggerEvent('Alt Idle Animation', 'dad', '')
        setPropertyFromGroup('strumLineNotes', 0, 'x', 82)
        setPropertyFromGroup('strumLineNotes', 1, 'x', 194)
        setPropertyFromGroup('strumLineNotes', 2, 'x', 971)
        setPropertyFromGroup('strumLineNotes', 3, 'x', 1083)
        setPropertyFromGroup('strumLineNotes', 4, 'x', 412)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 524)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 636)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 748)
        setObjectCamera('upScreen', 'camHUD')
        setObjectCamera('downScreen', 'camHUD')
        triggerEvent('Change Character', 'gf', 'chaosBoxGFAlejo')
        triggerEvent('Change Character', 'bf', 'chaosBF')
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('boyfriend.x', 1500)
        setProperty('dad.x', -500)
    end
    if curBeat >= 64 and curBeat < 320 then
        triggerEvent("Add Camera Zoom", 0.05, 0.05)
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', -5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            setProperty('camHUD.angle', 5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', 5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
    end
    if curBeat == 64 then
        triggerEvent("Add Camera Zoom", 0.25, 0.25)
    end
    if curBeat == 320 then
        setProperty('houseBackyardChaosSky.alpha', 0)
        setProperty('houseBackyardChaosBackground.alpha', 0)
        setProperty('houseBackyardChaosGround.alpha', 0)
        setProperty('sky.alpha', 1)
        setProperty('mountains.alpha', 1)
        setProperty('background.alpha', 1)
        setProperty('ground.alpha', 1)
        setProperty('blueScreen.alpha', 0.125)
        setPropertyFromGroup('strumLineNotes', 0, 'x', 92)
        setPropertyFromGroup('strumLineNotes', 1, 'x', 204)
        setPropertyFromGroup('strumLineNotes', 2, 'x', 316)
        setPropertyFromGroup('strumLineNotes', 3, 'x', 428)
        setPropertyFromGroup('strumLineNotes', 4, 'x', 732)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 844)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 956)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 1068)
        triggerEvent('Change Character', 'gf', 'boxGFAlejo')
        triggerEvent('Change Character', 'bf', 'bf')
        cameraFlash('other', '000000', 240 / bpm)
        setProperty('boyfriend.x', 770)
        setProperty('boyfriend.y', 400)
        setProperty('dad.x', -400)
        setProperty('dad.y', -200)
        setProperty('gf.y', 250)
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat >= 352 and curBeat < 512 then
        if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.05, 0.05)
        end
    end
    if curBeat >= 512 and curBeat < 636 then
        if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.125, 0.125)
            cameraShake('camGame', 0.01, 30 / bpm)
            cameraShake('camHUD', 0.01, 30 / bpm)
            setProperty('camGame.angle', getProperty('camGame.angle') + 2.5)
        end
    end
    if curBeat >= 636 and curBeat < 640 then
        setProperty('camGame.angle', getProperty('camGame.angle') + 2.5)
        cameraShake('camGame', 0.01, 30 / bpm)
        cameraShake('camHUD', 0.01, 30 / bpm)
        triggerEvent("Add Camera Zoom", 0.05, 0.05)
    end
    if curBeat == 640 then
        removeLuaSprite('sky')
        removeLuaSprite('mountains')
        removeLuaSprite('background')
        removeLuaSprite('ground')
        setProperty('blueScreen.alpha', 0)
        setProperty('houseBackyardChaosSky.alpha', 1)
        setProperty('houseBackyardChaosBackground.alpha', 1)
        setProperty('houseBackyardChaosGround.alpha', 1)
        setPropertyFromGroup('strumLineNotes', 0, 'x', 82)
        setPropertyFromGroup('strumLineNotes', 1, 'x', 194)
        setPropertyFromGroup('strumLineNotes', 2, 'x', 971)
        setPropertyFromGroup('strumLineNotes', 3, 'x', 1083)
        setPropertyFromGroup('strumLineNotes', 4, 'x', 412)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 524)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 636)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 748)
        setProperty('gf.alpha', 0)
        triggerEvent('Change Character', 'bf', 'chaosBF')
        triggerEvent('Change Character', 'dad', 'queenVoidAndTrueAlejo')
        setProperty('boyfriend.x', 1500)
        setProperty('dad.x', -500)
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', -5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            setProperty('camHUD.angle', 5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', 5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
    end
    if curBeat >= 640 and curBeat < 896 then
        triggerEvent("Add Camera Zoom", 0.05, 0.05)
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', -5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            setProperty('camHUD.angle', 5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', 5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
    end
    if curBeat == 896 then
        cameraFlash('other', '000000', 240 / bpm)
    end
    if curBeat >= 960 and curBeat < 1020 then
        if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.125, 0.125)
            cameraShake('camGame', 0.01, 30 / bpm)
            cameraShake('camHUD', 0.01, 30 / bpm)
        end
    end
    if curBeat >= 1020 and curBeat < 1024 then
        triggerEvent("Add Camera Zoom", 0.125, 0.125)
        cameraShake('camGame', 0.01, 30 / bpm)
        cameraShake('camHUD', 0.01, 30 / bpm)
    end
    if curBeat >= 1024 and curBeat < 1152 then
        triggerEvent("Add Camera Zoom", 0.05, 0.05)
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', -5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            setProperty('camHUD.angle', 5)
            doTweenAngle('hud', 'camHUD', 0, 60 / bpm, 'cubeOut')
            setProperty('camGame.angle', 5)
            doTweenAngle('game', 'camGame', 0, 60 / bpm, 'cubeOut')
        end
    end
    if curBeat == 1216 then
        removeLuaSprite('houseBackyardChaosSky')
        removeLuaSprite('houseBackyardChaosBackground')
        removeLuaSprite('houseBackyardChaosGround')
        setProperty('houseBackyardMorningSky.alpha', 1)
        setProperty('houseBackyardMorningMountains.alpha', 1)
        setProperty('houseBackyardMorningBackground.alpha', 1)
        setProperty('houseBackyardMorningGround.alpha', 1)
        setProperty('lightBlueScreen.alpha', 0.125)
        setPropertyFromGroup('strumLineNotes', 0, 'x', 92)
        setPropertyFromGroup('strumLineNotes', 1, 'x', 204)
        setPropertyFromGroup('strumLineNotes', 2, 'x', 316)
        setPropertyFromGroup('strumLineNotes', 3, 'x', 428)
        setPropertyFromGroup('strumLineNotes', 4, 'x', 732)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 844)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 956)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 1068)
        triggerEvent('Change Character', 'bf', 'bf')
        triggerEvent('Change Character', 'gf', 'gfAlejo')
        triggerEvent('Change Character', 'dad', 'queenVoid')
        cameraFlash('other', '000000', 240 / bpm)
        setProperty('boyfriend.x', 770)
        setProperty('boyfriend.y', 400)
        setProperty('dad.x', -500)
        setProperty('dad.y', -200)
        setProperty('gf.y', 100)
        setProperty('gf.alpha', 1)
        setProperty('upScreen.alpha', 0)
        setProperty('downScreen.alpha', 0)
        setProperty('defaultCamZoom', 0.8)
        cameraFlash('other', '000000', 240 / bpm)
        triggerEvent('Alt Idle Animation', 'gf', '0')
        doTweenY('camHUD', 'camHUD', screenHeight, 480 / bpm, 'cubeIn')
        doTweenAlpha('camHUD0', 'camHUD', 0, 480 / bpm, 'cubeIn')
    end
end
function onSectionHit()
    if curSection >= 16 and curSection < 80 then
        setProperty('defaultCamZoom', 0.4)
        doTweenY('upScreen', 'upScreen', -100, 120 / bpm, 'cubeIn')
        doTweenY('downScreen', 'downScreen', screenHeight, 120 / bpm, 'cubeIn')
        if mustHitSection then
            setProperty('defaultCamZoom', 0.8)
            doTweenY('upScreen', 'upScreen', 0, 120 / bpm, 'cubeOut')
            doTweenY('downScreen', 'downScreen', 620, 120 / bpm, 'cubeOut')
        end
        if gfSection then
            setProperty('defaultCamZoom', 0.6)
        end
    end
    if curSection >= 160 and curSection < 304 then
        setProperty('defaultCamZoom', 0.4)
        doTweenY('upScreen', 'upScreen', -100, 120 / bpm, 'cubeIn')
        doTweenY('downScreen', 'downScreen', screenHeight, 120 / bpm, 'cubeIn')
        if mustHitSection then
            setProperty('defaultCamZoom', 0.8)
            doTweenY('upScreen', 'upScreen', 0, 120 / bpm, 'cubeOut')
            doTweenY('downScreen', 'downScreen', 620, 120 / bpm, 'cubeOut')
        end
        if gfSection then
            setProperty('defaultCamZoom', 0.6)
        end
    end
end
function opponentNoteHit()
    if curBeat >= 640 and curBeat < 896 then
        cameraShake('camGame', 0.01, 15 / bpm)
        cameraShake('camHUD', 0.01, 15 / bpm)
    end
    if curBeat >= 1024 and curBeat < 1152 then
        cameraShake('camGame', 0.01, 15 / bpm)
        cameraShake('camHUD', 0.01, 15 / bpm)
    end
end
function onGameOverStart()
    playSound('royalDeath', 5, 'deathEffect')
    cameraShake('camGame', 0.05, 2.5)
    cameraShake('camHUD', 0.05, 2.5)
    cameraFlash('other', 'FF0000', 2.5)
end