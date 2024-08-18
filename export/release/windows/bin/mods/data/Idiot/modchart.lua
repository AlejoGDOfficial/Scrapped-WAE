function wavyBackground(background)
    setShaderFloat(background, "uTime", getSongPosition()/1000)
    setShaderFloat(background, "uWaveAmplitude", 0.15)
    setShaderFloat(background, "uSpeed", bpm / 100)
    setShaderFloat(background, "uFrequency", 5)
end
function onCreate()
    makeLuaSprite('blackScreen', nil, 0, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setProperty('blackScreen.alpha', 0.125)
    makeLuaSprite('whiteScreen', nil, 0, 0, 0)
    makeGraphic('whiteScreen', screenWidth, screenHeight, 'FFFFFF')
    setProperty('whiteScreen.alpha', 0)
    makeLuaSprite('upScreen', nil, 0, 0)
    makeGraphic('upScreen', screenWidth, 100, '000000')
    makeLuaSprite('downScreen', nil, 0, 620)
    makeGraphic('downScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'other')
    setObjectCamera('whiteScreen', 'camHUD')
    setObjectCamera('downScreen', 'camHUD')
    setObjectCamera('upScreen', 'camHUD')
    addLuaSprite('blackScreen')
    addLuaSprite('whiteScreen')
    addLuaSprite('downScreen')
    addLuaSprite('upScreen')
    setProperty('gf.alpha')
    addCharacterToList('screwedAlejo', 'dad')
    addCharacterToList('bf-holding-gf', 'bf')
    addCharacterToList('alejo3D', 'dad')
    addCharacterToList('moldy', 'bf')
    initLuaShader("wavyBackground")
end
function onCreatePost()
    makeLuaSprite('secondSpaceSky', 'backgrounds/secondSpace/sky', -600, -300)
    setLuaSpriteScrollFactor('secondSpaceSky', 0.125, 0.125)
    setProperty('secondSpaceSky.scale.x', 5)
    setProperty('secondSpaceSky.scale.y', 5)
    addLuaSprite('secondSpaceSky', false)
    setSpriteShader("secondSpaceSky", "wavyBackground")
    setProperty('secondSpaceSky.alpha', 0)
    makeLuaSprite('neonStageBackground', 'backgrounds/neonStage/background', -900, -800)
    setLuaSpriteScrollFactor('neonStageBackground', 0.9, 0.9)
    scaleObject('neonStageBackground', 1, 1)
    addLuaSprite('neonStageBackground', false)
    setProperty('neonStageBackground.alpha', 0)
    makeLuaSprite('neonStageGround', 'backgrounds/neonStage/ground', -1300, 500)
    setLuaSpriteScrollFactor('neonStageGround', 0.9, 0.9)
    scaleObject('neonStageGround', 1.6, 1.6)
    addLuaSprite('neonStageGround', false)
    setProperty('neonStageGround.alpha', 0)
    makeLuaSprite('neonStageCourtains', 'backgrounds/neonStage/courtains', -1400, -900)
    setLuaSpriteScrollFactor('neonStageCourtains', 1.3, 1.3)
    scaleObject('neonStageCourtains', 1.7, 1.7)
    addLuaSprite('neonStageCourtains', true)
    setProperty('neonStageCourtains.alpha', 0)
    makeLuaSprite('alejoWorldSky', 'backgrounds/alejoWorld/sky', 0, 0)
    setLuaSpriteScrollFactor('alejoWorldSky', 1, 1)
    addLuaSprite('alejoWorldSky', false)
    setProperty('alejoWorldSky.scale.x', 2)
    setProperty('alejoWorldSky.scale.y', 2)
    setSpriteShader("alejoWorldSky", "wavyBackground")
    setProperty('alejoWorldSky.alpha', 0)
    makeLuaSprite('streetSky', 'backgrounds/street/sky', -600, -300)
    setLuaSpriteScrollFactor('streetSky', 0.25, 0.25)
    addLuaSprite('streetSky', false)
    setProperty('streetSky.alpha', 0)
    makeLuaSprite('streetBackground', 'backgrounds/street/background', -600, -300)
    setLuaSpriteScrollFactor('streetBackground', 0.75, 0.75)
    addLuaSprite('streetBackground', false)
    setProperty('streetBackground.alpha', 0)
    makeLuaSprite('streetGround', 'backgrounds/street/ground', -600, -300)
    setLuaSpriteScrollFactor('streetGround', 1, 1)
    addLuaSprite('streetGround', false)
    setProperty('streetGround.alpha', 0)
end
local t = 0
function onUpdate(e)
	t = t + e
    if curBeat < 432 then
        setProperty('dad.y', -100 + math.sin(t / 2) * 100)
        setProperty('boyfriend.y', -100 + math.sin(t / -2) * 100)
    end
    if curBeat >= 1984 then
        setProperty('dad.y', -100 + math.sin(t / 2) * 100)
        setProperty('gf.y', -100 + math.sin(t / 2) * 100)
        setProperty('boyfriend.y', -100 + math.sin(t / -2) * 100)
    end
end
function onUpdatePost()
    wavyBackground('secondSpaceSky')
    wavyBackground('alejoWorldSky')
end
function onStepHit()
    if curStep % 4 == 0 then
        doTweenY('iconJump1', 'iconP1', 550, 30 / bpm, 'backOut')
        doTweenY('iconJump2', 'iconP2', 550, 30 / bpm, 'backOut')
    end
    if curStep % 4 == 2 then
        doTweenY('iconJump1', 'iconP1', 570, 30 / bpm)
        doTweenY('iconJump2', 'iconP2', 570, 30 / bpm)
    end
end
local boomSpeed = 2
local boomZoom = 0
function onBeatHit()
    if curBeat % boomSpeed == 0 then
        triggerEvent("Add Camera Zoom", boomZoom / 100, boomZoom / 100)
    end
	if curBeat < 64 then
		if curBeat % 4 == 0 then
			setProperty('blackScreen.alpha', 0.25)
		end
		if curBeat % 4 == 2 then
			setProperty('blackScreen.alpha', 1)
		end
	end
	if curBeat == 64 then
		cameraFlash('other', 'FFFFFF', 240 / bpm)
		setObjectCamera('blackScreen', 'camHUD')
		setProperty('blackScreen.alpha', 0)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
        end
	end
    if curBeat == 268 then
        triggerEvent("Add Camera Zoom", 0.1, 0.1)
    end
    if curBeat == 269 then
        triggerEvent("Add Camera Zoom", 0.1, 0.1)
    end
    if curBeat == 270 then
        triggerEvent("Add Camera Zoom", 0.1, 0.1)
    end
    if curBeat == 271 then
        triggerEvent("Add Camera Zoom", 0.1, 0.1)
    end
	if curBeat == 272 then
        setProperty('sky.alpha', 0)
        setProperty('secondSpaceSky.alpha', 1)
        triggerEvent('Change Character', 'dad', 'alejo3D')
        triggerEvent("Add Camera Zoom", 0.1, 0.1)
		cameraFlash('other', 'FFFFFF', 240 / bpm)
	end
    if curBeat == 416 then
        doTweenAlpha('blackScreen', 'blackScreen', 1, 240 / bpm)
    end
    if curBeat == 432 then
        removeLuaSprite('secondSpaceSky')
        setProperty('neonStageBackground.alpha', 1)
        setProperty('neonStageGround.alpha', 1)
        setProperty('neonStageCourtains.alpha', 1)
        noteTweenX('noteX0', 0, 92, 60 / bpm, 'cubeOut')
        noteTweenX('noteY', 1, 204, 60 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 60 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 60 / bpm, 'cubeOut')
        for i = 0, 3 do
            noteTweenY('noteTweenY'..i, i, 50, 60 / bpm, 'cubeOut')
        end
        triggerEvent('Change Character', 'dad', 'screwedAlejo')
        triggerEvent('Change Character', 'bf', 'bf-holding-gf')
        doTweenAlpha('blackScreen', 'blackScreen', 0, 4800 / bpm)
        setProperty('boyfriend.x', 870)
        setProperty('boyfriend.y', 200)
        setProperty('dad.x', 50)
        setProperty('dad.y', 30)
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 768 then
        doTweenAlpha('blackScreen', 'blackScreen', 1, 4320 / bpm)
    end
    if curBeat == 840 then
        removeLuaSprite('neonStageBackground')
        removeLuaSprite('neonStageGround')
        removeLuaSprite('neonStageCourtains')
        setProperty('alejoWorldSky.alpha', 1)
        doTweenAlpha('blackScreen', 'blackScreen', 0, 1440 / bpm)
        triggerEvent('Change Character', 'dad', 'alejo3D')
        triggerEvent('Change Character', 'bf', 'moldy')
        setProperty('dad.x', -500)
        setProperty('dad.y', -100)
        setProperty('defaultCamZoom', 0.7)
    end
    if curBeat == 1120 then
        removeLuaSprite('alejoWorldSky')
        setProperty('streetSky.alpha', 1)
        setProperty('streetBackground.alpha', 1)
        setProperty('streetGround.alpha', 1)
        triggerEvent('Change Character', 'dad', 'alejo')
        triggerEvent('Change Character', 'bf', 'lizy')
        setProperty('gf.alpha', 1)
        setProperty('blackScreen.alpha', 1)
		cameraFlash('other', 'FFFFFF', 240 / bpm)
        doTweenAlpha('blackScreen', 'blackScreen', 0, 480 / bpm)
        setProperty('dad.x', 200)
        setProperty('dad.y', 300)
        setProperty('boyfriend.x', 900)
        setProperty('boyfriend.y', 200)
        setProperty('gf.x', 700)
        setProperty('gf.y', 0)
    end
    if curBeat == 1536 then
        doTweenAlpha('blackScreen', 'blackScreen', 1, 480 / bpm)
    end
    if curBeat == 1544 then
        removeLuaSprite('streetSky')
        removeLuaSprite('streetBackground')
        removeLuaSprite('streetGround')
        setProperty('sky.alpha', 1)
        doTweenAlpha('blackScreen', 'blackScreen', 0, 3360 / bpm)
    end
    if curBeat == 1664 then
        boomZoom = 1
    end
    if curBeat == 1920 then
        boomZoom = 1
        boomSpeed = 1
    end
    if curBeat == 1976 then
        doTweenAlpha('whiteScreen', 'whiteScreen', 1, 240 / bpm)
        doTweenY('upScreen', 'upScreen', -100, 120 / bpm, 'cubeIn')
        doTweenY('downScreen', 'downScreen', screenHeight, 120 / bpm, 'cubeIn')
    end
    if curBeat >= 1984 and curBeat < 2240 then
        setPropertyFromGroup('strumLineNotes', 0, 'x', 62)
        setPropertyFromGroup('strumLineNotes', 1, 'x', 181)
        setPropertyFromGroup('strumLineNotes', 2, 'x', 331)
        setPropertyFromGroup('strumLineNotes', 3, 'x', 458)
        setPropertyFromGroup('strumLineNotes', 4, 'x', 702)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 829)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 971)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 1098)
        noteTweenX('noteX0', 0, 92, 30 / bpm, 'cubeOut')
        noteTweenX('noteX1', 1, 204, 30 / bpm, 'cubeOut')
        noteTweenX('noteX2', 2, 316, 30 / bpm, 'cubeOut')
        noteTweenX('noteX3', 3, 428, 30 / bpm, 'cubeOut')
        noteTweenX('noteX4', 4, 732, 30 / bpm, 'cubeOut')
        noteTweenX('noteX5', 5, 844, 30 / bpm, 'cubeOut')
        noteTweenX('noteX6', 6, 956, 30 / bpm, 'cubeOut')
        noteTweenX('noteX7', 7, 1068, 30 / bpm, 'cubeOut')
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.9)
            doTweenX('noteScaleX'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 30 / bpm)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.5)
            doTweenY('noteScaleY'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 30 / bpm)
        end
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', 2)
            doTweenAngle('camHUD', 'camHUD', 2.8125, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            setProperty('camHUD.angle', -2)
            doTweenAngle('camHUD', 'camHUD', -2.8125, 60 / bpm, 'cubeOut')
        end
    end
    if curBeat == 1984 then
        boomZoom = 1.5
        setProperty('whiteScreen.alpha', 0)
		cameraFlash('other', 'FFFFFF', 480 / bpm)
        setProperty('defaultCamZoom', 0.4)
    end
    if curBeat == 2240 then
        boomZoom = 0
        doTweenAngle('camHUD', 'camHUD', 0, 60 / bpm, 'cubeOut')
    end
    if curBeat == 2304 then
        doTweenAlpha('blackScreen', 'blackScreen', 1, 480 / bpm)
    end
end
function goodNoteHit()
    if curBeat < 416 then
        for i = 0, 3 do
            noteTweenX('noteX'..i, i, getRandomInt(0, screenWidth - 112), 60 / bpm, 'cubeInOut')
            noteTweenY('noteY'..i, i, getRandomInt(0, screenHeight - 112), 60 / bpm, 'cubeInOut')
        end
    end
end
function opponentNoteHit()
    if curBeat < 416 then
        noteTweenX('noteX0', 0, 92, 60 / bpm, 'cubeInOut')
        noteTweenX('noteY', 1, 204, 60 / bpm, 'cubeInOut')
        noteTweenX('noteX2', 2, 316, 60 / bpm, 'cubeInOut')
        noteTweenX('noteX3', 3, 428, 60 / bpm, 'cubeInOut')
        for i = 0, 3 do
            noteTweenY('noteY'..i, i, 50, 60 / bpm, 'cubeInOut')
        end
    end
end