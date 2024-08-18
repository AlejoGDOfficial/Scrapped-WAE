function wavyBackground(background)
    setShaderFloat(background, "uTime", getSongPosition()/1000)
    setShaderFloat(background, "uWaveAmplitude", 0.15)
    setShaderFloat(background, "uSpeed", bpm / 100)
    setShaderFloat(background, "uFrequency", 5)
end
function onCreate()
    makeLuaSprite('blackScreen', nil, 0, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'camHUD')
    addLuaSprite('blackScreen')
    addCharacterToList('exbungo', 'dad')
    addCharacterToList('jana', 'dad')
    addCharacterToList('bSideExpunged', 'dad')
    makeLuaSprite('thearchyModchart', nil, -50, 0)
    makeGraphic('thearchyModchart', 0, 0, 'FFFFFF')
    addLuaSprite('thearchyModchart')
    setProperty('thearchyModchart.alpha', 0)
end
function onCreatePost()
    makeLuaSprite('thearchyGround', 'backgrounds/thearchy/ground', -800, -300)
    setScrollFactor('thearchyGround', 1, 1)
    addLuaSprite('thearchyGround', false)
    setProperty('thearchyGround.scale.x', 3)
    setProperty('thearchyGround.scale.y', 3)
    setProperty('thearchyGround.alpha', 0)
    setSpriteShader("thearchyGround", "wavyBackground")
    makeLuaSprite('exbongoSky', 'backgrounds/exbongo/sky', -800, 300)
    setScrollFactor('exbongoSky', 1, 1)
    addLuaSprite('exbongoSky', false)
    setProperty('exbongoSky.scale.x', 3)
    setProperty('exbongoSky.scale.y', 3)
    setSpriteShader("exbongoSky", "wavyBackground")
    makeLuaSprite('exbongoGround', 'backgrounds/exbongo/ground', 1200, 600)
    setScrollFactor('exbongoGround', 1, 1)
    addLuaSprite('exbongoGround', false)
    makeLuaSprite('exbongoCircle', 'backgrounds/exbongo/circle', 800, 800)
    setScrollFactor('exbongoCircle', 1, 1)
    addLuaSprite('exbongoCircle', false)
    setProperty('exbongoGround.alpha', 0)
    setProperty('exbongoCircle.alpha', 0)
    setProperty('exbongoSky.alpha', 0)
    makeLuaSprite('paperWorldGround', 'backgrounds/paperWorld/ground', -800, -300)
    setScrollFactor('paperWorldGround', 1, 1)
    addLuaSprite('paperWorldGround', false)
    setProperty('paperWorldGround.scale.x', 3)
    setProperty('paperWorldGround.scale.y', 3)
    setProperty('paperWorldGround.alpha', 0)
    setSpriteShader("paperWorldGround", "wavyBackground")
	makeLuaSprite('whiteScreen', 'whiteScreen', -1750, -1000)
    makeGraphic('whiteScreen', 6000, 3000, 'FFFFFF')
	setLuaSpriteScrollFactor('whiteScreen', 1)
    setObjectCamera('whiteScreen', 'camGame')
    addLuaSprite('whiteScreen')
    setProperty('whiteScreen.scale.x', 3)
    setProperty('whiteScreen.scale.y', 3)
    setProperty('whiteScreen.alpha', 0)
end
local t = 0
function onUpdatePost(e)
    t = t + e * 2
    if curBeat >= 576 and curBeat < 1024 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t + i) * (-1 * getProperty('thearchyModchart.x')))
            setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t + i) * getProperty('thearchyModchart.x'))
            setObjectCamera('strumLineNotes.members['..i..']', 'camGame')
            setObjectCamera('notes.members['..i..']', 'camGame')
            setScrollFactor('strumLineNotes.members['..i..']', 1, 1)
            setScrollFactor('notes.members['..i..']', 1, 1)
        end
    end
    if curBeat >= 1024 and curBeat < 1280 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t + i) * 50)
            setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t + i) * -50)
            setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t + i) * -50)
            setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t + i) * -50)
            setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t + i) * -50)
            setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t + i) * -50)
            setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t + i) * -50)
            setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t + i) * -50)
            setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t + i) * -50)
            setObjectCamera('strumLineNotes.members['..i..']', 'camHUD')
            setObjectCamera('notes.members['..i..']', 'camHUD')
            setProperty('camGame.angle', t)
        end
    end
    if curBeat >= 1280 and curBeat < 1472 then
        for i = 0, 7 do
            setObjectCamera('strumLineNotes.members['..i..']', 'camGame')
            setObjectCamera('notes.members['..i..']', 'camGame')
            setScrollFactor('strumLineNotes.members['..i..']', 1, 1)
            setScrollFactor('notes.members['..i..']', 1, 1)
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.sin(t + i) * 50)
        end
        setProperty('camGame.angle', math.sin(t) * 5)
    end
    if curBeat >= 1472 then
        for i = 0, 7 do
            setObjectCamera('strumLineNotes.members['..i..']', 'camHUD')
            setObjectCamera('notes.members['..i..']', 'camHUD')
            setPropertyFromGroup('strumLineNotes', i, 'angle', t * 25)
        end
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'y', (screenHeight / 2) + math.cos(t + (i)) * 125)
            setPropertyFromGroup('strumLineNotes', i, 'x', (screenWidth / 2) + math.sin(t * 5 + (i)) * 250)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.sin(t * 2 + i) * 50)
        end
    end
end
function onUpdate()	
    wavyBackground('thearchyGround')
    wavyBackground('exbongoSky')
    wavyBackground('paperWorldGround')
end
function onSongStart()
    doTweenAlpha('intro', 'blackScreen', 0, 7680 / bpm)
end
local introShake = 0.01
function onBeatHit()
    if curBeat >= 120 and curBeat < 128 then
        introShake = introShake + 0.01
        cameraShake('camHUD', introShake, 60 / bpm)
        cameraShake('camGame', introShake, 60 / bpm)
    end
    if curBeat == 128 then
        triggerEvent("Add Camera Zoom", 1, 1)
    end
    if curBeat > 128 and curBeat < 576 then
        if curBeat % 4 == 0 then
            triggerEvent("Add Camera Zoom", 0.01, 0.01)
        end
        if curBeat % 4 == 1 then
            triggerEvent("Add Camera Zoom", 0.0075, 0.0075)
        end
        if curBeat % 4 == 2 then
            triggerEvent("Add Camera Zoom", 0.0075, 0.0075)
        end
        if curBeat % 4 == 3 then
            triggerEvent("Add Camera Zoom", 0.0075, 0.0075)
        end
    end
    if curBeat == 576 then
        removeLuaSprite('ground')
        removeLuaSprite('mountains')
        removeLuaSprite('sky')
        setProperty('blueScreen.alpha', 0)
        setProperty('thearchyGround.alpha', 1)
        triggerEvent('Change Character', 'dad', 'bSideExpunged')
        setProperty('blackScreen.alpha', 0.5)
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        setProperty('dad.alpha', 0)
        setProperty('iconP2.alpha', 0)
        setProperty('dad.x', -200)
        setProperty('dad.y', 100)
        setProperty('gf.x', 400)
        setProperty('gf.y', 100)
        setProperty('boyfriend.x', 880)
        setProperty('boyfriend.y', 500)
        setProperty('defaultCamZoom', 0.3)
    end
    if curBeat >= 576 then
        if curBeat % 8 == 0 then
            doTweenY('dad0', 'dad', -100, 240 / bpm, 'circInOut')
            doTweenX('gf', 'gf', 200, 240 / bpm, 'circInOut')
            doTweenAngle('gf0', 'gf', -5.625, 240 / bpm, 'circInOut')
        end
        if curBeat % 8 == 4 then
            doTweenY('dad0', 'dad', 300, 240 / bpm, 'circInOut')
            doTweenX('gf', 'gf', 600, 240 / bpm, 'circInOut')
            doTweenAngle('gf0', 'gf', 5.625, 240 / bpm, 'circInOut')
        end
    end
    if curBeat == 608 then
        doTweenAlpha('blackScreen', 'blackScreen', 0.25, 1920 / bpm)
        doTweenAlpha('dad', 'dad', 1, 1920 / bpm)
        doTweenAlpha('iconP2', 'iconP2', 1, 1920 / bpm)
    end
    if curBeat >= 640 and curBeat < 896 then
        if curBeat % 4 == 0 then
            triggerEvent("Add Camera Zoom", 0.1, 0.1)
        end
        if curBeat % 4 == 2 then
            for i = 0, 7 do
                setPropertyFromGroup('strumLineNotes', i, 'angle', 360)
                noteTweenAngle('note'..i, i, 0, 120 / bpm, 'cubeOut')
            end
            setProperty('thearchyModchart.x', -500)
            doTweenX('thearchyModchart', 'thearchyModchart', -50, 120 / bpm, 'cubeOut')
            triggerEvent("Add Camera Zoom", 0.1, 0.1)
        end
    end
    if curBeat == 896 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        setProperty('camHUD.alpha', 0)
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        setProperty('blackScreen.alpha', 0)
    end
    if curBeat == 1024 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
        setProperty('camHUD.alpha', 1)
        setProperty('thearchyGround.alpha', 0)
        setProperty('exbongoSky.alpha', 1)
        setProperty('exbongoGround.alpha', 1)
        setProperty('exbongoCircle.alpha', 1)
        setProperty('blackScreen.alpha', 0.25)
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        triggerEvent('Change Character', 'dad', 'exbungo')
        setProperty('defaultCamZoom', 0.4)
    end
    if curBeat >= 1024 then
        if curBeat % 4 == 0 then
            triggerEvent("Add Camera Zoom", 0.01, 0.01)
        end
        if curBeat % 4 == 1 then
            triggerEvent("Add Camera Zoom", 0.0075, 0.0075)
        end
        if curBeat % 4 == 2 then
            triggerEvent("Add Camera Zoom", 0.0075, 0.0075)
        end
        if curBeat % 4 == 3 then
            triggerEvent("Add Camera Zoom", 0.0075, 0.0075)
        end
    end
    if curBeat == 1280 then
        removeLuaSprite('exbongoSky')
        removeLuaSprite('exbongoCircle')
        removeLuaSprite('exbongoGround')
        setProperty('thearchyGround.alpha', 1)
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        triggerEvent('Change Character', 'dad', 'bSideExpunged')
        setProperty('defaultCamZoom', 0.3)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end
    if curBeat == 1408 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        triggerEvent('Change Character', 'dad', 'jana')
        setProperty('whiteScreen.alpha', 1)
        setProperty('boyfriend.color', '000000')
        setProperty('dad.color', '000000')
        setProperty('gf.color', '000000')
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
        setProperty('healthBar.alpha', 0)
        setProperty('scoreTxt.alpha', 0)
        setProperty('defaultCamZoom', 0.35)
    end
    if curBeat == 1472 then
        removeLuaSprite('thearchyGround')
        removeLuaSprite('whiteScreen')
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
        setProperty('iconP1.alpha', 1)
        setProperty('iconP2.alpha', 1)
        setProperty('healthBar.alpha', 1)
        setProperty('scoreTxt.alpha', 1)
        setProperty('paperWorldGround.alpha', 1)
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        setProperty('blackScreen.alpha', 0)
        setProperty('defaultCamZoom', 0.4)
        setProperty('camGame.angle', 0)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
        end
        setPropertyFromGroup('strumLineNotes', 4, 'x', 412)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 524)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 636)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 748)
    end
    if curBeat == 1664 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        doTweenAlpha('camHUD', 'camHUD', 0, 480 / bpm)
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if curBeat >= 640 and curBeat < 1024 then
        cameraShake('camHUD', 0.025, 0.1)
        cameraShake('camGame', 0.025, 0.1)
    end
    setPropertyFromGroup('strumLineNotes', noteData, 'scale.x', 0.9)
    setPropertyFromGroup('strumLineNotes', noteData, 'scale.y', 0.5)
    doTweenY('noteScaleY'..noteData, 'strumLineNotes.members['..noteData..'].scale', 0.7, 30 / bpm, 'cubeOut')
    doTweenX('noteScaleX'..noteData, 'strumLineNotes.members['..noteData..'].scale', 0.7, 30 / bpm, 'cubeOut')
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    setPropertyFromGroup('strumLineNotes', noteData + 4, 'scale.x', 0.9)
    setPropertyFromGroup('strumLineNotes', noteData + 4, 'scale.y', 0.5)
    doTweenX('noteScaleX'..(noteData + 4), 'strumLineNotes.members['..(noteData + 4)..'].scale', 0.7, 30 / bpm, 'cubeOut')
    doTweenY('noteScaleY'..(noteData + 4), 'strumLineNotes.members['..(noteData + 4)..'].scale', 0.7, 30 / bpm, 'cubeOut')
end