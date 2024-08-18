function epicBars(offset)
    doTweenY('upScreen', 'upScreen', -720 + offset, 240 / bpm, 'cubeOut')
    doTweenY('downScreen', 'downScreen', 720 - offset, 240 / bpm, 'cubeOut')
end
function onCreate()
    setProperty('healthBar.alpha', 0)
    setProperty('scoreTxt.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    makeLuaSprite('whiteScreen', nil, 0, 0)
    makeGraphic('whiteScreen', screenWidth, screenHeight, 'FFFFFF')
    addLuaSprite('whiteScreen')
    setObjectCamera('whiteScreen', 'camHUD')
    setProperty('whiteScreen.alpha', 0)
    makeLuaSprite('blackScreen', nil, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    addLuaSprite('blackScreen')
    setObjectCamera('blackScreen', 'other')
    setProperty('blackScreen.alpha', 0)
    makeLuaSprite('upScreen', nil, 0, -720)
    makeGraphic('upScreen', screenWidth, screenHeight, '000000')
    addLuaSprite('upScreen')
    setObjectCamera('upScreen', 'camHUD')
    makeLuaSprite('downScreen', nil, 0, 720)
    makeGraphic('downScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('downScreen', 'camHUD')
    addLuaSprite('downScreen')
    makeLuaSprite('ready', 'ready', 0, 0)
    addLuaSprite('ready')
    setProperty('ready.x', screenWidth / 2 - getProperty('ready.width') / 2)
    setProperty('ready.y', screenHeight / 2 - getProperty('ready.height') / 2)
    setProperty('ready.alpha', 0)
    setObjectCamera('ready', 'other')
    setProperty('ready.scale.x', 1.5)
    setProperty('ready.scale.y', 1.5)
    makeLuaSprite('set', 'set', 0, 0)
    addLuaSprite('set')
    setProperty('set.x', screenWidth / 2 - getProperty('set.width') / 2)
    setProperty('set.y', screenHeight / 2 - getProperty('set.height') / 2)
    setProperty('set.alpha', 0)
    setObjectCamera('set', 'other')
    setProperty('set.scale.x', 1.5)
    setProperty('set.scale.y', 1.5)
    makeLuaSprite('go', 'go', 0, 0)
    addLuaSprite('go')
    setProperty('go.x', screenWidth / 2 - getProperty('go.width') / 2)
    setProperty('go.y', screenHeight / 2 - getProperty('go.height') / 2)
    setProperty('go.alpha', 0)
    setObjectCamera('go', 'other')
    setProperty('go.scale.x', 1.5)
    setProperty('go.scale.y', 1.5)
	addCharacterToList('beatboxBF', 'bf')
	addCharacterToList('playerStandingGf', 'bf')
	addCharacterToList('bf-holding-gf', 'bf')
	addCharacterToList('alejoSerious', 'dad')
	addCharacterToList('beatboxAlejo', 'dad')
	addCharacterToList('cuteScrewYouAlejo', 'dad')
	addCharacterToList('frontAlejo3D', 'dad')
	addCharacterToList('alexa', 'dad')
	addCharacterToList('alejoAndAlexa', 'dad')
end
function onBeatHit()
    if curBeat == 192 then
        triggerEvent('Add Camera Zoom', 0.25, 0.25)
		for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', getRandomInt(0, screenWidth))
            setPropertyFromGroup('strumLineNotes', i, 'y', getRandomInt(0, screenHeight))
			noteTweenY('noteY'..i, i, 50, 480 / bpm, 'cubeOut')
		end
		noteTweenX('noteX0', 0, 92, 480 / bpm, 'cubeOut')
		noteTweenX('noteX1', 1, 204, 480 / bpm, 'cubeOut')
		noteTweenX('noteX2', 2, 316, 480 / bpm, 'cubeOut')
		noteTweenX('noteX3', 3, 428, 480 / bpm, 'cubeOut')
		noteTweenX('noteX4', 4, 732, 480 / bpm, 'cubeOut')
		noteTweenX('noteX5', 5, 844, 480 / bpm, 'cubeOut')
		noteTweenX('noteX6', 6, 956, 480 / bpm, 'cubeOut')
		noteTweenX('noteX7', 7, 1068, 480 / bpm, 'cubeOut')
    end
    if curBeat >= 192 and curBeat < 256 then
        if curBeat % 16 == 2 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curBeat % 16 == 6 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curBeat % 16 == 10 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curBeat % 16 == 14 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curBeat % 16 == 15 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 312 then
        setProperty('defaultCamZoom', 1.2)
        doTweenAlpha('whiteScreen', 'whiteScreen', 1, 450 / bpm, 'cubeIn')
    end
    if curBeat == 320 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('whiteScreen.alpha', 0)
        setProperty('blackScreen.alpha', 1)
        epicBars(150)
        setProperty('gf.alpha', 0.5)
        setProperty('sky.alpha', 0.5)
        setProperty('flatgrass.alpha', 0)
        setProperty('hills.alpha', 0)
        setProperty('farmHouse.alpha', 0)
        setProperty('ground.alpha', 0)
        setProperty('cornFence0.alpha', 0)
        setProperty('cornFence1.alpha', 0)
        setProperty('cornBag.alpha', 0)
        setProperty('sign.alpha', 0)
    end
    if curBeat == 324 then
        doTweenAlpha('blackScreen', 'blackScreen', 0, 200 / bpm)
        setProperty('camGame.angle', -0.25)
        setProperty('boyfriend.alpha', 0.5)
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end
    if curBeat == 336 then
        doTweenAlpha('blackScreen', 'blackScreen', 1, 200 / bpm)
    end
    if curBeat == 340 then
        doTweenAlpha('blackScreen', 'blackScreen', 0, 200 / bpm)
        setProperty('camGame.angle', 0.25)
        setProperty('boyfriend.alpha', 1)
        setProperty('dad.alpha', 0.5)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    end
    if curBeat == 352 then
        doTweenAlpha('blackScreen', 'blackScreen', 1, 200 / bpm)
    end
    if curBeat == 356 then
        doTweenAlpha('blackScreen', 'blackScreen', 0, 200 / bpm)
        setProperty('camGame.angle', -0.25)
        setProperty('boyfriend.alpha', 0.5)
        setProperty('dad.alpha', 1)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end
    if curBeat == 368 then
        doTweenAlpha('blackScreen', 'blackScreen', 1, 200 / bpm)
    end
    if curBeat == 372 then
        doTweenAlpha('blackScreen', 'blackScreen', 0, 200 / bpm)
        setProperty('camGame.angle', 0.25)
        setProperty('boyfriend.alpha', 1)
        setProperty('dad.alpha', 0.5)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    end
    if curBeat == 384 then
        epicBars(0)
        setProperty('gf.alpha', 1)
        setProperty('dad.alpha', 1)
        setProperty('sky.alpha', 1)
        setProperty('flatgrass.alpha', 1)
        setProperty('hills.alpha', 1)
        setProperty('farmHouse.alpha', 1)
        setProperty('ground.alpha', 1)
        setProperty('cornFence0.alpha', 1)
        setProperty('cornFence1.alpha', 1)
        setProperty('cornBag.alpha', 1)
        setProperty('sign.alpha', 1)
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
        setProperty('defaultCamZoom', 0.8)
        setProperty('camGame.angle', 0)
    end
    if curBeat >= 384 and curBeat < 512 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat >= 576 and curBeat < 696 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 696 then
        doTweenZoom('camGame', 'camGame', 1.2, 960 / bpm)
        doTweenAlpha('dad', 'dad', 0, 960 / bpm)
        doTweenAlpha('gf', 'gf', 0.5, 960 / bpm)
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 0, 960 / bpm)
        end
    end
    if curBeat == 712 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curBeat == 730 then
        setProperty('ready.alpha', 1)
        doTweenAlpha('readyAlpha', 'ready', 0, 120 / bpm)
        doTweenX('readyX', 'ready.scale', 1, 120 / bpm, 'cubeOut')
        doTweenY('readyY', 'ready.scale', 1, 120 / bpm, 'cubeOut')
    end
    if curBeat == 732 then
        setProperty('set.alpha', 1)
        doTweenAlpha('setAlpha', 'set', 0, 120 / bpm)
        doTweenX('setX', 'set.scale', 1, 120 / bpm, 'cubeOut')
        doTweenY('setY', 'set.scale', 1, 120 / bpm, 'cubeOut')
    end
    if curBeat == 734 then
        setProperty('go.alpha', 1)
        doTweenAlpha('goAlpha', 'go', 0, 120 / bpm)
        doTweenX('goX', 'go.scale', 1, 120 / bpm, 'cubeOut')
        doTweenY('goY', 'go.scale', 1, 120 / bpm, 'cubeOut')
    end
    if curBeat == 736 then
        setProperty('defaultCamZoom', 1)
    end
    if curBeat == 768 then
        setProperty('defaultCamZoom', 0.8)
        triggerEvent('Change Character', 'dad', 'alejoSerious')
        doTweenAlpha('gf', 'gf', 1, 120 / bpm)
        doTweenAlpha('dad', 'dad', 1, 120 / bpm)
        for i = 0, 3 do
            noteTweenAlpha('note'..i, i, 1, 120 / bpm)
        end
    end
    if curBeat == 864 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        triggerEvent('Change Character', 'dad', 'beatboxAlejo')
        triggerEvent('Change Character', 'bf', 'beatboxBF')
        epicBars(150)
    end
    if curBeat >= 864 and curBeat < 928 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 928 then
        triggerEvent('Change Character', 'dad', 'alejoSerious')
        triggerEvent('Change Character', 'bf', 'bf')
        epicBars(0)
    end
    if curBeat == 1148 then
        triggerEvent('Change Character', 'dad', 'cuteScrewYouAlejo')
    end
    if curBeat == 1150 then
        for i = 0, 7 do
            noteTweenAlpha('note'..i, i, 0, 120 / bpm, 'cubeIn')
        end
        doTweenAlpha('boyfriend', 'boyfriend', 0, 120 / bpm, 'cubeIn')
        doTweenAlpha('gf', 'gf', 0, 120 / bpm, 'cubeIn')
        doTweenAlpha('dad0', 'dad', 0, 120 / bpm, 'cubeIn')
        doTweenY('dad1', 'dad', 400, 120 / bpm, 'cubeIn')
    end
    if curBeat == 1152 then
        triggerEvent('Change Character', 'dad', 'frontAlejo3D')
        setObjectCamera('dad', 'camHUD')
        doTweenAlpha('dad0', 'dad', 1, 120 / bpm, 'cubeIn')
        setProperty('dad.x', 0)
        doTweenY('dad1', 'dad', 0, 120 / bpm, 'cubeIn')
    end
    if curBeat >= 1056 and curBeat < 1152 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 1214 then
        for i = 0, 7 do
            noteTweenAlpha('note'..i, i, 1, 120 / bpm, 'cubeIn')
        end
        doTweenAlpha('dad', 'dad', 0, 120 / bpm, 'cubeIn')
    end
    if curBeat == 1216 then
        doTweenAlpha('gf', 'gf', 1, 120 / bpm, 'cubeOut')
        setProperty('dad.x', 200)
        setProperty('dad.y', 520)
        triggerEvent('Change Character', 'dad', 'alejoSerious')
        doTweenAlpha('dad', 'dad', 1, 120 / bpm, 'cubeOut')
        doTweenAlpha('boyfriend', 'boyfriend', 1, 120 / bpm, 'cubeOut')
        setObjectCamera('dad', 'camGame')
    end
    if curBeat == 1280 then
        setProperty('defaultCamZoom', 1.2)
        doTweenAlpha('gf', 'gf', 0, 240 / bpm)
        doTweenAlpha('dad', 'dad', 0, 240 / bpm)
    end
    if curBeat == 1296 then
        triggerEvent('Change Character', 'dad', 'alexa')
        doTweenAlpha('dad', 'dad', 1, 240 / bpm)
        doTweenAlpha('gf', 'gf', 0, 240 / bpm)
        doTweenAlpha('boyfriend', 'boyfriend', 0, 240 / bpm)
    end
    if curBeat == 1312 then
        setProperty('defaultCamZoom', 1)
        triggerEvent('Change Character', 'bf', 'playerStandingGf')
        doTweenAlpha('boyfriend', 'boyfriend', 1, 240 / bpm)
    end
    if curBeat == 1440 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
    if curBeat >= 1504 and curBeat < 1568 then
        if curBeat % 4 == 2 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 1660 then
        setProperty('downScreen.alpha', 0)
        setProperty('upScreen.alpha', 0)
        doTweenZoom('camGame', 'camGame', 0.5, 240 / bpm, 'cubeIn')
        doTweenZoom('camHUD', 'camHUD', 0.5, 240 / bpm, 'cubeIn')
    end
    if curBeat == 1664 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
    if curBeat >= 1664 and curBeat < 1696 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 1696 then
        setProperty('downScreen.alpha', 1)
        setProperty('upScreen.alpha', 1)
    end
    if curBeat >= 1760 and curBeat < 1888 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 1952 then
        doTweenAlpha('camGame', 'camGame', 0, 240 / bpm)
        doTweenAlpha('camHUD', 'camHUD', 0, 240 / bpm)
    end
    if curBeat == 1980 then
        doTweenAlpha('camHUD', 'camHUD', 1, 240 / bpm)
        setProperty('defaultCamZoom', 0.8)
        triggerEvent('Change Character', 'dad', 'alejoAndAlexa')
        triggerEvent('Change Character', 'bf', 'bf-holding-gf')
    end
    if curBeat == 1984 then
        doTweenAlpha('camGame', 'camGame', 1, 240 / bpm)
    end
    if curBeat == 2112 then
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
    if curBeat >= 2112 and curBeat < 2176 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curBeat == 2176 then
        epicBars(150)
    end
    if curBeat >= 2176 and curBeat < 2240 then
        if curBeat % 16 == 0 then
            setProperty('defaultCamZoom', 0.8)
        end
        if curBeat % 16 == 8 then
            setProperty('defaultCamZoom', 1)
        end
    end
    if curBeat >= 2224 and curBeat < 2240 then
        triggerEvent('Add Camera Zoom', 0.05, 0.05)
    end
    if curBeat == 2232 then
        doTweenAlpha('whiteScreen', 'whiteScreen', 1, 450 / bpm, 'cubeIn')
    end
    if curBeat == 2240 then
        epicBars(0)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        triggerEvent('Change Character', 'dad', 'bambi')
        triggerEvent('Change Character', 'gf', 'gf')
        triggerEvent('Change Character', 'bf', 'bf')
        setProperty('gf.alpha', 1)
        setProperty('whiteScreen.alpha', 0)
        cameraFlash('other', 'FFFFFF', 240 / bpm)
    end
    if curBeat == 2304 then
        doTweenAlpha('camHUD', 'camHUD', 0, 480 / bpm)
    end
end
function onStepHit()
    if curStep >= 1024 and curStep < 1248 then
        if curStep % 32 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 6 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 12 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 18 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 24 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 28 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curStep >= 2048 and curStep < 2304 then
        if curStep % 64 == 0 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1)
            epicBars(150)
        end
        if curStep % 64 == 8 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1.2)
        end
        if curStep % 64 == 16 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1.1)
        end
        if curStep % 64 == 22 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1)
        end
        if curStep % 64 == 28 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 0.9)
        end
        if curStep % 64 == 32 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 0.8)
            epicBars(0)
        end
        if curStep % 64 == 40 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
        end
        if curStep % 64 == 48 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
        end
        if curStep % 64 == 56 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
        end
    end
    if curStep >= 4608 and curStep < 5120 then
        if curStep % 32 == 0 then
            triggerEvent('Add Camera Zoom', 0, 0.025)
        end
        if curStep % 32 == 6 then
            triggerEvent('Add Camera Zoom', 0, 0.025)
        end
        if curStep % 32 == 12 then
            triggerEvent('Add Camera Zoom', 0, 0.025)
        end
        if curStep % 32 == 18 then
            triggerEvent('Add Camera Zoom', 0, 0.025)
        end
        if curStep % 32 == 24 then
            triggerEvent('Add Camera Zoom', 0, 0.025)
        end
        if curStep % 32 == 28 then
            triggerEvent('Add Camera Zoom', 0, 0.025)
        end
    end
    if curStep >= 6784 and curStep < 7040 then
        if curStep % 64 == 0 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1)
            epicBars(150)
        end
        if curStep % 64 == 8 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1.2)
        end
        if curStep % 64 == 16 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1.1)
        end
        if curStep % 64 == 22 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 1)
        end
        if curStep % 64 == 28 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 0.9)
        end
        if curStep % 64 == 32 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
            setProperty('defaultCamZoom', 0.8)
            epicBars(0)
        end
        if curStep % 64 == 40 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
        end
        if curStep % 64 == 48 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
        end
        if curStep % 64 == 56 then
            triggerEvent('Add Camera Zoom', 0.075, 0.075)
        end
    end
    if curStep >= 8192 and curStep < 8416 then
        if curStep % 32 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 6 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 12 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 18 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 24 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 28 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curStep >= 8704 and curStep < 8832 then
        if curStep % 32 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 8 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 16 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 22 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 32 == 28 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
    if curStep >= 8832 and curStep < 8896 then
        if curStep % 16 == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 16 == 6 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
        if curStep % 16 == 12 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
        end
    end
end
function opponentNoteHit()
    health = getProperty('health')
    if curBeat >= 1312 and curBeat < 1660 then
        doTweenZoom('camGame1', 'camGame', getProperty('camGame.zoom') + 0.025, 0.1)
        doTweenZoom('camHUD1', 'camHUD', getProperty('camHUD.zoom') + 0.0125, 0.1)
    end
    if curBeat >= 1664 and curBeat < 1980 then
        doTweenZoom('camGame1', 'camGame', getProperty('camGame.zoom') + 0.025, 0.1)
        doTweenZoom('camHUD1', 'camHUD', getProperty('camHUD.zoom') + 0.0125, 0.1)
    end
    if curBeat >= 1980 then
        if health > 0.2 then
            setProperty('health', health - 0.01125)
        end
    end
end