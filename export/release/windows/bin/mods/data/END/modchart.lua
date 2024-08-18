local function ALEDefault()
    setPropertyFromGroup('strumLineNotes', 0, 'x', 92)
    setPropertyFromGroup('strumLineNotes', 1, 'x', 204)
    setPropertyFromGroup('strumLineNotes', 2, 'x', 316)
    setPropertyFromGroup('strumLineNotes', 3, 'x', 428)
    setPropertyFromGroup('strumLineNotes', 4, 'x', 732)
    setPropertyFromGroup('strumLineNotes', 5, 'x', 844)
    setPropertyFromGroup('strumLineNotes', 6, 'x', 956)
    setPropertyFromGroup('strumLineNotes', 7, 'x', 1068)
    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'y', 50)
        setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.7)
        setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.7)
        setPropertyFromGroup('strumLineNotes', i, 'direction', 90)
        setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
    end
    setProperty('camHUD.alpha', 1)
    setProperty('camGame.alpha', 1)
    setProperty('camHUD.angle', 0)
    setProperty('camGame.angle', 0)
    setProperty('camHUD.x', 0)
    setProperty('camGame.x', 0)
    setProperty('camHUD.y', 0)
    setProperty('camGame.y', 0)
    setProperty('defaultCamZoom', 0.7)
end
function onCreate()
    initLuaShader("wavyBackground")
    makeLuaSprite('blackScreen', nil, 0, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'other')
    setProperty('blackScreen.alpha', 0.25)
    addLuaSprite('blackScreen')
    makeLuaText('subtitles', '', screenWidth, 0, 0)
    setObjectCamera('subtitles', 'other')
    setTextSize('subtitles', 64)
    setTextFont('subtitles', '')
    addLuaText('subtitles')
    setProperty('gf.alpha', 0)
    makeLuaText('nerf', 'Press Z to get this song nerfed', 10000, 10, 300)
    setObjectCamera('nerf', 'camHUD')
    setTextAlignment('nerf', 'LEFT')
    setTextSize('nerf', 20)
    addLuaText('nerf')
    makeLuaText('songInfo', 'Alejo GD Official - END', 10000, 10, 690)
    setObjectCamera('songInfo', 'camHUD')
    setTextAlignment('songInfo', 'LEFT')
    setProperty('songInfo.alpha', 0.75)
    setTextSize('songInfo', 20)
    addLuaText('songInfo')
    addCharacterToList('bf', 'bf')
    addCharacterToList('alejo3D', 'dad')
    addCharacterToList('aleja', 'dad')
    addCharacterToList('playeralejo3D', 'bf')
    addCharacterToList('noiseBF', 'bf')
    addCharacterToList('screwed3DAlejo', 'dad')
    addCharacterToList('playerAlejoOG', 'bf')
end
function onCreatePost()
	makeLuaSprite('screwedAlejoWorldGround', 'backgrounds/screwedAlejoWorld/ground', -800, -300)
	setScrollFactor('screwedAlejoWorldGround', 1, 1)
	addLuaSprite('screwedAlejoWorldGround', false)
	setProperty('screwedAlejoWorldGround.scale.x', 2)
	setProperty('screwedAlejoWorldGround.scale.y', 2)
	setProperty('screwedAlejoWorldGround.alpha', 0)
    setSpriteShader("screwedAlejoWorldGround", "wavyBackground")
end
local t = 0
local subtitlesX = 0
local subtitlesY = 0
local nerf = false
function onUpdate(e)
	if curBeat < 64 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
		nerf = true
		doTweenAlpha('nerf', 'nerf', 0, 240 / bpm)
	end
	setProperty('subtitles.x', subtitlesX + getRandomFloat(-25, 25))
	setProperty('subtitles.y', subtitlesY + getRandomFloat(-25, 25))
	setProperty('subtitles.angle', getRandomFloat(-6.25, 6.25))
    t = t + e
    if curBeat >= 384 and curBeat < 640 then
        setProperty('camHUD.angle', math.sin(t) * 2)
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * 25)
        end
    end
    if curBeat >= 640 and curBeat < 1152 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * 5)
        end
    end
    if curBeat >= 1152 and curBeat < 1536 then
        setProperty('camHUD.angle', math.sin(t) * 4)
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 4 + i) * 25)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.7 + math.cos(t * 4) * 0.1)
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.7 + math.cos(t * 4) * -0.1)
        end
    end
	if curBeat >= 1920 and curBeat < 2688 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 8 + i) * 50)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.7 + math.cos(t * 8) * 0.1)
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.7 + math.cos(t * 8) * -0.1)
        end
	end
end
local shakeScreen = false
local shakeForce = 1
local boomSpeed = 0
local boomZoom = 0
function onUpdatePost()
    subtitlesX = screenWidth / 2 - getProperty('subtitles.width') / 2
    subtitlesY = screenHeight / 2 - getProperty('subtitles.height') / 2
    setShaderFloat("screwedAlejoWorldGround", "uTime", getSongPosition()/1000)
    setShaderFloat("screwedAlejoWorldGround", "uWaveAmplitude", 0.15)
    setShaderFloat("screwedAlejoWorldGround", "uSpeed", bpm / 100)
    setShaderFloat("screwedAlejoWorldGround", "uFrequency", 5)
end
local screwer = false
function onBeatHit()
    if curBeat % boomSpeed == 0 then
        triggerEvent("Add Camera Zoom", boomZoom / 100, boomZoom / 100)
    end
    if curBeat == 64 then
		doTweenAlpha('nerf', 'nerf', 0, 240 / bpm)
        boomSpeed = 2
        boomZoom = 1
    end
    if curBeat == 192 then
        boomSpeed = 1
        boomZoom = 2
    end
    if curBeat == 376 then
        boomZoom = 0
    end
    if curBeat == 384 then
        cameraFlash('other', 'FFFFFF', 480 / bpm)
        boomSpeed = 2
        boomZoom = 2
    end
    if curBeat == 640 then
        ALEDefault()
        boomZoom = 0
    end
    if curBeat == 896 then
        triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'bf', 'playerAlejo3D')
    end
    if curBeat == 1152 then
        boomZoom = 2
    end
	if curBeat == 1536 then
		boomZoom = 0
		ALEDefault()
	end
    if curBeat == 1600 then
        boomZoom = 2
        triggerEvent("Add Camera Zoom", 2.5, 2.5)
		triggerEvent('Change Character', 'dad', 'alejo3D')
		triggerEvent('Change Character', 'bf', 'bf')
    end
	if curBeat >= 1600 and curBeat < 1912 then
		if curBeat % 4 == 0 then
			setProperty('camHUD.angle', -2.5)
		end
		if curBeat % 4 == 2 then
			setProperty('camHUD.angle', 2.5)
		end
	end
	if curBeat == 1912 then
        boomZoom = 0
		setProperty('camHUD.angle', 0)
	end
	if curBeat == 1920 then
        	boomZoom = 2
			shakeScreen = true
    		setTextFont('songInfo', '')
    		setTextFont('scoreTxt', '')
    		setTextFont('botplayTxt', '')
	end
	if curBeat >= 1920 and curBeat <= 2368 then
		if curBeat % 32 == 0 then
		        triggerEvent("Add Camera Zoom", 2.5, 0.25)
		end
		if curBeat % 64 == 0 then
			triggerEvent('Change Character', 'dad', 'alejo3D')
			triggerEvent('Change Character', 'bf', 'bf')
			setProperty('screwedAlejoWorldGround.alpha', 0)
			shakeForce = 0.5
			screwer = false
		end
		if curBeat % 64 == 32 then
			triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
			triggerEvent('Change Character', 'bf', 'noiseBF')
			setProperty('screwedAlejoWorldGround.alpha', 1)
			shakeForce = 1
			screwer = true
		end
	end
	if curBeat == 2432 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
		triggerEvent('Change Character', 'bf', 'noiseBF')
		setProperty('screwedAlejoWorldGround.alpha', 1)
		screwer = true
	end
	if curBeat >= 2432 and curBeat < 2560 then
		if curBeat % 8 == 0 then
			setTextString('subtitles', 'S-')
		end
		if curBeat % 8 == 1 then
			setTextString('subtitles', 'STOP')
		end
		if curBeat % 8 == 2 then
			setTextString('subtitles', 'STOP FU-')
		end
		if curBeat % 8 == 3 then
			setTextString('subtitles', 'STOP FUCKING')
		end
		if curBeat % 8 == 4 then
			setTextString('subtitles', 'STOP FUCKING MY')
		end
		if curBeat % 8 == 5 then
			setTextString('subtitles', 'STOP FUCKING MY S-')
		end
		if curBeat % 8 == 6 then
			setTextString('subtitles', 'STOP FUCKING MY SCREWED')
		end
		if curBeat % 8 == 7 then
			setTextString('subtitles', 'STOP FUCKING MY SCREWED LIFE')
		end
	end
	if curBeat == 2560 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'alejo3D')
		triggerEvent('Change Character', 'bf', 'bf')
		setProperty('screwedAlejoWorldGround.alpha', 0)
		setTextString('subtitles', '')
		screwer = false
	end
	if curBeat == 2592 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
		triggerEvent('Change Character', 'bf', 'noiseBF')
		setProperty('screwedAlejoWorldGround.alpha', 1)
		screwer = true
	end
	if curBeat == 2624 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'alejo3D')
		triggerEvent('Change Character', 'bf', 'bf')
		setProperty('screwedAlejoWorldGround.alpha', 0)
		screwer = false
	end
	if curBeat == 2656 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
		triggerEvent('Change Character', 'bf', 'noiseBF')
		setProperty('screwedAlejoWorldGround.alpha', 1)
		screwer = true
	end
	if curBeat == 2688 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'alejo3D')
		triggerEvent('Change Character', 'bf', 'bf')
		setProperty('screwedAlejoWorldGround.alpha', 0)
		screwer = false
		boomZoom = 0
		ALEDefault()
	end
	if curBeat == 2752 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
		triggerEvent('Change Character', 'bf', 'noiseBF')
		setProperty('screwedAlejoWorldGround.alpha', 1)
		screwer = true
	end
	if curBeat == 2944 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'aleja')
		triggerEvent('Change Character', 'bf', 'playerAlejoOG')
		screwer = false
		shakeScreen = false
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	health = getProperty('health')
	if nerf == false then
		if health > 0.5 then
			setProperty('health', health - 0.015)
		end
	end
    if shakeScreen == true then
        cameraShake('camHUD', shakeForce / 100, 0.1)
        cameraShake('camGame', shakeForce / 100, 0.1)
    end
	if curBeat >= 1920 and curBeat < 2688 then
		if screwer == true then
			if noteData == 0 then
				setProperty('camHUD.angle', -2.5)
				doTweenAngle('camHUD0', 'camHUD', 0, 240 / bpm, 'cubeOut')
			end
			if noteData == 1 then
				setProperty('camHUD.y', -25)
				doTweenY('camHUD1', 'camHUD', 0, 240 / bpm, 'cubeOut')
			end
			if noteData == 2 then
				setProperty('camHUD.y', 25)
				doTweenY('camHUD2', 'camHUD', 0, 240 / bpm, 'cubeOut')
			end
			if noteData == 3 then
				setProperty('camHUD.angle', 2.5)
				doTweenAngle('camHUD3', 'camHUD', 0, 240 / bpm, 'cubeOut')
			end
		end
	end
end
function goodNoteHit()
	health = getProperty('health')
	if nerf == true then
		setProperty('health', health + 0.0075)
	end
end