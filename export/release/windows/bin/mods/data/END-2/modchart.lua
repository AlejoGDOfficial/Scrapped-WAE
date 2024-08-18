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
    setProperty('healthBar.alpha', 1)
    setProperty('healthBarFront.alpha', 1)
    setProperty('iconP1.y', 565.8)
    setProperty('iconP2.y', 565.8)
    setProperty('iconP1.angle', 0)
    setProperty('iconP2.angle', 0)
    setProperty('scoreTxt.angle', 0)
    setProperty('camHUD.angle', 0)
    setProperty('camGame.angle', 0)
    setProperty('camHUD.x', 0)
    setProperty('camGame.x', 0)
    setProperty('camHUD.y', 0)
    setProperty('camGame.y', 0)
end
local function middleScroll(time, sine)
    noteTweenX('note0', 0, 82, time / bpm, sine)
    noteTweenX('note1', 1, 194, time / bpm, sine)
    noteTweenX('note2', 2, 971, time / bpm, sine)
    noteTweenX('note3', 3, 1083, time / bpm, sine)
    noteTweenX('note4', 4, 412, time / bpm, sine)
    noteTweenX('note5', 5, 524, time / bpm, sine)
    noteTweenX('note6', 6, 636, time / bpm, sine)
    noteTweenX('note7', 7, 748, time / bpm, sine)
	for i = 0, 3 do
		noteTweenAlpha('note0'..i, i, 0.5, time / bpm, sine)
	end
end
function wavyBackground(background)
    setShaderFloat(background, "uTime", getSongPosition()/1000)
    setShaderFloat(background, "uWaveAmplitude", 0.15)
    setShaderFloat(background, "uSpeed", bpm / 100)
    setShaderFloat(background, "uFrequency", 5)
end
local t = 0
local P2Angle = 0
local shakeX = 0
local shakeY = 0
local shake = false
local shakeForce = 2.5
local nerfed = false
function onCreate()
    makeLuaText('nerf', 'Press Z to get this song nerfed', 10000, 10, 300)
    setObjectCamera('nerf', 'camHUD')
    setTextAlignment('nerf', 'LEFT')
    setTextSize('nerf', 20)
    addLuaText('nerf')
    makeLuaSprite('blackScreen', nil, 0, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'other')
    setProperty('blackScreen.alpha', 0)
    addLuaSprite('blackScreen')
	makeLuaSprite('noiseScreen', 'other/shaders/noiseScreen', 0, 0)
	setLuaSpriteScrollFactor('noiseScreen', 0, 0)
	setProperty('noiseScreen.alpha', 0)
	addLuaSprite('noiseScreen')
	setObjectCamera('noiseScreen', 'other')
	debugPrint('SCREW YOU')
	setProperty('gf.alpha', 0)
	makeLuaText('songInfo', "Good luck, "..os.getenv('USERNAME')..", YOU'LL NEED IT.", 10000, 10, 690)
	setObjectCamera('songInfo', 'camHUD')
	setTextAlignment('songInfo', 'LEFT')
	setProperty('songInfo.alpha', 0.75)
	setTextSize('songInfo', 20)
	addLuaText('songInfo')
    makeLuaSprite('shake', nil, 0, 0)
    makeGraphic('shake', 1, 1, 'FFFFFF')
    setProperty('shake.alpha', 0)
    addLuaSprite('shake', true)
    initLuaShader("Wavy BG")
	precacheImage('other/noteLeft')
	precacheImage('other/noteDown')
	precacheImage('other/noteUp')
	precacheImage('other/noteRight')
	makeLuaSprite('screenNote', nil, 0, 0)
	setObjectCamera('screenNote', 'other')
	setProperty('screenNote.alpha', 0)
	addLuaSprite('screenNote')
	addCharacterToList('alejo3D', 'dad')
	addCharacterToList('screwed3DAlejo', 'dad')
	addCharacterToList('endAlejo', 'dad')
	addCharacterToList('sadAlejo', 'dad')
	addCharacterToList('alejoOG', 'dad')
	setProperty('ground.scale.x', 1.25)
	setProperty('ground.scale.y', 1.25)
end
function onCreatePost()
	makeLuaSprite('screwedAlejoWorldGround', 'backgrounds/screwedAlejoWorld/ground', -600, -300)
	setLuaSpriteScrollFactor('screwedAlejoWorldGround', 1, 1)
	addLuaSprite('screwedAlejoWorldGround', false)
	setProperty('screwedAlejoWorldGround.scale.x', 2)
	setProperty('screwedAlejoWorldGround.scale.y', 2)
	setProperty('screwedAlejoWorldGround.alpha', 0)
	setSpriteShader('screwedAlejoWorldGround', 'wavyBackground')
	makeLuaSprite('sufferingAlejoWorldGround', 'backgrounds/sufferingAlejoWorld/ground', -600, -300)
	setLuaSpriteScrollFactor('sufferingAlejoWorldGround', 1, 1)
	addLuaSprite('sufferingAlejoWorldGround', false)
	setProperty('sufferingAlejoWorldGround.scale.x', 2)
	setProperty('sufferingAlejoWorldGround.scale.y', 2)
	setProperty('sufferingAlejoWorldGround.alpha', 0)
	setSpriteShader('sufferingAlejoWorldGround', 'wavyBackground')
	makeLuaSprite('traumaAlejoWorldGround', 'backgrounds/traumaAlejoWorld/ground', -600, -300)
	setLuaSpriteScrollFactor('traumaAlejoWorldGround', 1, 1)
	addLuaSprite('traumaAlejoWorldGround', false)
	setProperty('traumaAlejoWorldGround.scale.x', 2)
	setProperty('traumaAlejoWorldGround.scale.y', 2)
	setProperty('traumaAlejoWorldGround.alpha', 0)
	setSpriteShader('traumaAlejoWorldGround', 'wavyBackground')
	makeLuaSprite('traumaAlejoWorldInvertedGround', 'backgrounds/traumaAlejoWorld/invertedGround', -600, -300)
	setLuaSpriteScrollFactor('traumaAlejoWorldInvertedGround', 1, 1)
	addLuaSprite('traumaAlejoWorldInvertedGround', false)
	setProperty('traumaAlejoWorldInvertedGround.scale.x', 2)
	setProperty('traumaAlejoWorldInvertedGround.scale.y', 2)
	setProperty('traumaAlejoWorldInvertedGround.alpha', 0)
	setSpriteShader('traumaAlejoWorldInvertedGround', 'wavyBackground')
	makeLuaSprite('sufferingDesktopGround', 'backgrounds/sufferingDesktop/ground', 0, 0)
	setLuaSpriteScrollFactor('sufferingDesktopGround', 1, 1)
	addLuaSprite('sufferingDesktopGround', false)
	setProperty('sufferingDesktopGround.scale.x', 1)
	setProperty('sufferingDesktopGround.scale.y', 1)
	setProperty('sufferingDesktopGround.alpha', 0)
	setObjectOrder('screwedAlejoWorldGround', getObjectOrder('mountains') - 1)
end
function onUpdate(e)
	t = t + e
	if curBeat < 64 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
		nerfed = true
		doTweenAlpha('nerf', 'nerf', 0, 240 / bpm)
	end
	setProperty('noiseScreen.angle', 0 + getProperty('noiseScreen.angle') + 180)
	P2Angle = getRandomFloat(-11.25, 11.25)
	shakeX = getRandomFloat(-5, 5)
	shakeY = getRandomFloat(-5, 5)
	setTextString('scoreTxt', 'Misses: '..getMisses())
	setTextString('botplayTxt', 'SKILL ISSUE')
	setProperty('timer.alpha', 0)
	setProperty('songInfo.x', 10 + shakeX)
	setProperty('songInfo.y', 690 + shakeY)
	setProperty('iconP2.angle', P2Angle)
	if curBeat >= 192 and curBeat < 384 then
		setProperty('scoreTxt.angle', math.sin(t * 4) * 5.625)
		setProperty('iconP1.angle', math.sin(t * 2) * 11.25)
		setProperty('iconP2.y', 500 + math.cos(t * 2) * 50)
		setProperty('iconP1.y', 500 - math.cos(t * 2) * 50)
		setProperty('camHUD.angle', math.sin(t * 4) * 5.625)
		setProperty('camGame.angle', math.sin(t * 4) * 11.25)
		cameraShake('camHUD', 0.01, 1 / 60)
		cameraShake('camGame', 0.005, 1 / 60)
	end
	if curBeat >= 512 and curBeat < 1024 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.sin(t + i) * 25)
		end
	end
	if curBeat >= 640 and curBeat < 1024 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'angle', t * 100)
		end
	end
	if curBeat >= 896 and curBeat < 1024 then
		setProperty('camHUD.angle', 0 + getProperty('camHUD.angle') + 180)
	end
	if curBeat >= 1024 and curBeat < 1904 then
		setProperty('dad.x', -500 + math.sin(t * 2) * 200)
		setProperty('dad.y', math.cos(t * 2) * 300)
		setProperty('boyfriend.y', math.cos(t) * 100)
		setProperty('boyfriend.angle', math.sin(t * 2) * 45)
		setProperty('iconP2.y', 565.8 + math.sin(t * 2) * 12.5)
		setProperty('iconP1.angle', math.sin(t * 2) * 22.5)
	end 
	if curBeat >= 1024 and curBeat < 1152 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 4 + i) * 25)
			setPropertyFromGroup('strumLineNotes', i, 'angle', t * 200)
		end
		setProperty('camGame.angle', math.sin(t * 2) * 5.625)
		setProperty('camHUD.angle', math.sin(t) * 5.625)
	end
	if curBeat >= 1152 and curBeat < 1344 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'x', 180 + i * 110 + math.sin(t * 8) * 100)
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 8) * 50)
			setPropertyFromGroup('strumLineNotes', i, 'angle', t * 50)
		end
		setProperty('camGame.angle', math.sin(t * 2) * 11.25)
		setProperty('camHUD.angle', math.sin(t) * 11.25)
	end
	if curBeat >= 1344 and curBeat < 1600 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 4 + i) * 25)
			setPropertyFromGroup('strumLineNotes', i, 'angle', t * 200)
		end
		setProperty('camGame.angle', math.sin(t * 2) * 5.625)
		setProperty('camHUD.angle', math.sin(t) * 5.625)
	end
	if curBeat >= 1472 and curBeat < 1600 then
		setProperty('camGame.x', math.sin(t * 4) * 12.5)
		setProperty('camGame.y', math.cos(t * 4) * 12.5)
		setProperty('camHUD.x', math.sin(t * 2) * 12.5)
		setProperty('camHUD.y', math.cos(t * 2) * 12.5)
	end
	setProperty('screenNote.x', (screenWidth / 2 - getProperty('screenNote.width') / 2) + math.sin(t * 4) * 300)
	setProperty('screenNote.y', (screenHeight / 2 - getProperty('screenNote.height') / 2) + math.cos(t * 4) * 100)
	setProperty('screenNote.angle', t * 100)
	if curBeat >= 1600 and curBeat < 1728 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'x', 180 + i * 110 + math.sin(t * 8 + i) * 100)
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 8 + i) * 50)
		end
		setProperty('camGame.angle', math.sin(t * 4) * 11.25)
		setProperty('camHUD.angle', math.sin(t * 2) * 11.25)
		setProperty('camGame.x', math.sin(t * 8) * 50)
		setProperty('camGame.y', math.cos(t * 8) * 50)
		setProperty('camHUD.x', math.sin(t * 4) * 50)
		setProperty('camHUD.y', math.cos(t * 4) * 50)
	end
	if curBeat >= 1856 and curBeat < 1866 then
		setProperty('health', 1)
	end
	if curBeat >= 1904 and curBeat < 2704 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.5)
			setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.5)
			setPropertyFromGroup('notes', i, 'scale.x', 0.5)
			setPropertyFromGroup('notes', i, 'scale.y', 0.5)
		end
		setProperty('dad.x', 550 + math.sin(t * 2) * 300)
		setProperty('dad.y', 250 + math.cos(t * 2) * 200)
	end
	if curBeat >= 2048 and curBeat < 2176 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * 25 + getRandomInt(-2.5, 2.5))
		end
		setPropertyFromGroup('strumLineNotes', 0, 'x', 82 + math.sin(t * 2 + 0) * 25 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 1, 'x', 194 + math.sin(t * 2 + 1) * 25 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 2, 'x', 971 + math.sin(t * 2 + 2) * 25 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 3, 'x', 1083 + math.sin(t * 2 + 3) * 25 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 2 + 4) * 25 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 2 + 5) * 25 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 2 + 6) * 25 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 2 + 7) * 25 + getRandomInt(-2.5, 2.5))
	end
	if curBeat >= 2176 and curBeat < 2304 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * 50 + getRandomInt(-2.5, 2.5))
		end
		setPropertyFromGroup('strumLineNotes', 0, 'x', 82 + math.sin(t * 2 + 0) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 1, 'x', 194 + math.sin(t * 2 + 1) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 2, 'x', 971 + math.sin(t * 2 + 2) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 3, 'x', 1083 + math.sin(t * 2 + 3) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 2 + 4) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 2 + 5) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 2 + 6) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 2 + 7) * 50 + getRandomInt(-2.5, 2.5))
	end
	if curBeat >= 2304 and curBeat < 2432 then
		for i = 0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'x', screenWidth / 2 + math.sin(t / 2 + i) * math.sin(t * 2) * 500 + getRandomInt(5, 5))
			setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight / 2 + math.cos(t + i) * 250 + getRandomInt(-5, 5))
		end
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * 50 + getRandomInt(-2.5, 2.5))
		end
		setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 2 + 4) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 2 + 5) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 2 + 6) * 50 + getRandomInt(-2.5, 2.5))
		setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 2 + 7) * 50 + getRandomInt(-2.5, 2.5))
	end
	if curBeat >= 2432 and curBeat < 2560 then
		for i = 0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'x', screenWidth / 2 + math.sin(t * 4 + i) * math.sin(t * 4) * 500 + getRandomInt(-10, -10))
			setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight / 2 + math.cos(t + i) * 250 + getRandomInt(-10, -10))
		end
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 125 + math.cos(t * 2 + i) * 100 + getRandomInt(-5, 5))
		end
		setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 4 + 4) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 4 + 5) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 4 + 6) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 4 + 7) * 75 + getRandomInt(-5, 5))
	end
	if curBeat >= 2560 and curBeat < 2752 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 2 + i) * 50 + getRandomInt(-2.5, 2.5))
		end
		setPropertyFromGroup('strumLineNotes', 0, 'x', 412 + math.sin(t * 4 + 0) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 1, 'x', 524 + math.sin(t * 4 + 1) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 2, 'x', 636 + math.sin(t * 4 + 2) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 3, 'x', 748 + math.sin(t * 4 + 3) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 4 + 4) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 4 + 5) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 4 + 6) * 75 + getRandomInt(-5, 5))
		setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 4 + 7) * 75 + getRandomInt(-5, 5))
	end
	if curBeat >= 3696 then
		setProperty('vocals.volume', 0)
	end
end
function onUpdatePost()
	wavyBackground('screwedAlejoWorldGround')
	wavyBackground('sufferingAlejoWorldGround')
	wavyBackground('traumaAlejoWorldGround')
	wavyBackground('traumaAlejoWorldInvertedGround')
end
function onStepHit()
	if curStep >= 3584 and curStep < 4096 then
		if curStep % 2 == 0 then
			setProperty('background.alpha', 0)
			setProperty('mountains.alpha', 0)
			setProperty('ground.alpha', 0)
		end
		if curStep % 2 == 1 then
			setProperty('background.alpha', 1)
			setProperty('mountains.alpha', 1)
			setProperty('ground.alpha', 1)
		end
	end
end
function onBeatHit()
	if curBeat >= 64 then
		doTweenAlpha('nerf', 'nerf', 0, 240 / bpm)
	end
	if curBeat < 184 then
		if curBeat % 2 == 0 then
			cameraShake('camGame', 0.01, 60 / bpm)
			cameraShake('camHUD', 0.005, 60 / bpm)
			setProperty('camHUD.x', 10)
			doTweenX('camHUD', 'camHUD', 0, 60 / bpm, 'sineOut')
			setProperty('camGame.x', -10)
			doTweenX('camGame', 'camGame', 0, 60 / bpm, 'sineOut')
		end
	end
	if curBeat == 184 then
		middleScroll(480, 'linear')
		cameraShake('camGame', 0.0025, 480 / bpm)
		cameraShake('camHUD', 0.005, 480 / bpm)
		setProperty('camHUD.x', 20)
		doTweenX('camHUD', 'camHUD', 0, 480 / bpm, '')
		setProperty('camGame.x', -20)
		doTweenX('camGame', 'camGame', 0, 480 / bpm, '')
	end
	if curBeat == 192 then
		cameraFlash('other', 'FFFFFF', 480 / bpm)
		doTweenAlpha('healthBar', 'healthBar', 0, 240 / bpm)
		doTweenAlpha('healthBarFront', 'healthBarFront', 0, 240 / bpm)
		setProperty('screwedAlejoWorldGround.alpha', 1)
		setProperty('sky.alpha', 0)
	end
	if curBeat >= 192 and curBeat < 384 then
		if curBeat % 8 == 0 then
			doTweenAlpha('noiseScreen', 'noiseScreen', 0.25, 240 / bpm, 'cubeInOut')
		end
		if curBeat % 8 == 4 then
			doTweenAlpha('noiseScreen', 'noiseScreen', 0, 240 / bpm, 'cubeInOut')
		end
	end
	if curBeat == 384 then
		ALEDefault()
		cameraFlash('other', '000000', 240 / bpm)
	end
	if curBeat == 448 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'alejo3D')
	end
	if curBeat == 768 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
	end
	if curBeat == 896 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'alejo3D')
	end
	if curBeat == 912 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
	end
	if curBeat == 960 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'alejo3D')
	end
	if curBeat == 976 then
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'screwed3DAlejo')
	end
	if curBeat == 1024 then
		shake = true
		triggerEvent("Add Camera Zoom", 2.5, 0.25)
		triggerEvent('Change Character', 'dad', 'endAlejo')
		cameraFlash('other', 'FFFFFF', 480 / bpm)
		setProperty('screwedAlejoWorldGround.alpha', 0)
		setProperty('background.alpha', 0)
		setProperty('mountains.alpha', 0)
		setProperty('ground.alpha', 0)
		setProperty('screwedAlejoWorldGround.alpha', 0)
		setProperty('sufferingAlejoWorldGround.alpha', 1)
		setProperty('noiseScreen.alpha', 0.25)
		subtitles('All the suffering that you caused us', '', 64, 1)
		setProperty('camHUD.angle', 0)
		middleScroll(1920, 'cubeOut')
	end
	if curBeat == 1152 then
		cameraFlash('other', 'FFFFFF', 240 / bpm)
	end
	if curBeat == 1344 then
		ALEDefault()
		cameraFlash('other', '000000', 480 / bpm)
		middleScroll(480, 'backInOut')
	end
	if curBeat == 1600 then
		cameraFlash('other', 'FFFFFF', 240 / bpm)
		setProperty('sufferingAlejoWorldGround.alpha', 0)
	end
	if curBeat >= 1600 and curBeat < 1728 then
		if curBeat % 2 == 0 then
			setProperty('noiseScreen.alpha', 0.5)
			doTweenAlpha('noiseScreen', 'noiseScreen', 0.25, 120 / bpm, 'cubeOut')
			for e = 0, 3 do
				for i = 0, 7 do
					setPropertyFromGroup('strumLineNotes', i, 'angle', 360)
					setPropertyFromGroup('strumLineNotes', e, 'alpha', 1)
					noteTweenAngle('noteAngle'..i, i, 0, 120 / bpm, 'cubeOut')
					noteTweenAlpha('noteAlpha'..e, e, 0.5, 120 / bpm, 'cubeOut')
				end
			end
			setProperty('traumaAlejoWorldInvertedGround.alpha', 0)
			setProperty('traumaAlejoWorldGround.alpha', 1)
		end
		if curBeat % 2 == 1 then
			setProperty('traumaAlejoWorldInvertedGround.alpha', 1)
			setProperty('traumaAlejoWorldGround.alpha', 0)
		end
	end
	if curBeat == 1728 then
		ALEDefault()
		cameraFlash('other', '000000', 240 / bpm)
		setProperty('sufferingAlejoWorldGround.alpha', 1)
		removeLuaSprite('traumaAlejoWorldInvertedGround')
		removeLuaSprite('traumaAlejoWorldGround')
	end
	if curBeat == 1856 then
		cameraFlash('other', 'FFFFFF', 480 / bpm)
	end
	if curBeat == 1864 then
		doTweenAlpha('blackScreen', 'blackScreen', 1, 1440 / bpm)
	end
	if curBeat == 1904 then
		shakeForce = 1.25
		removeLuaSprite('sufferingAlejoWorldGround')
		setProperty('sufferingDesktopGround.alpha', 1)
		setProperty('defaultCamZoom', 0.67)
		triggerEvent('Change Character', 'dad', 'sadAlejo')
		triggerEvent('Camera Follow Pos', getProperty('sufferingDesktopGround.x') + getProperty('sufferingDesktopGround.width') / 2, getProperty('sufferingDesktopGround.y') + getProperty('sufferingDesktopGround.height') / 2)
		doTweenAlpha('blackScreen', 'blackScreen', 0, 960 / bpm)
		doTweenAlpha('noiseScreen', 'noiseScreen', 0, 960 / bpm)
		middleScroll(960, 'cubeInOut')
		setProperty('iconP1.alpha', 0)
		setProperty('iconP2.alpha', 0)
		setProperty('healthBar.alpha', 0)
		setProperty('healthBarFront.alpha', 0)
		setProperty('scoreTxt.alpha', 0)
		setProperty('songInfo.alpha', 0)
		setProperty('boyfriend.x', 1300)
		setProperty('boyfriend.y', 200)
		setProperty('boyfriend.angle', 0)
		setProperty('iconP1.angle', 0)
		setProperty('iconP2.y', 565.8)
	end
	if curBeat == 2176 then
		cameraFlash('other', 'FFFFF', 240 / bpm)
	end
	if curBeat >= 2176 and curBeat < 2304 then
		if curBeat % 2 == 0 then
			triggerEvent("Add Camera Zoom", 0.01, 0.01)
		end
	end
	if curBeat >= 2304 and curBeat < 2432 then
		if curBeat % 4 == 0 then
			triggerEvent("Add Camera Zoom", 0.02, 0.02)
		end
	end
	if curBeat >= 2432 and curBeat < 2560 then
		if curBeat % 2 == 0 then
			triggerEvent("Add Camera Zoom", 0.02, 0.02)
		end
	end
	if curBeat == 2560 then
		for i = 0, 7 do
			noteTweenAlpha('note'..i, i, 1, 240 / bpm)
		end
	end
	if curBeat >= 2560 and curBeat < 2624 then
		if curBeat % 2 == 0 then
			triggerEvent("Add Camera Zoom", 0, -0.05)
		end
		if curBeat % 8 == 0 then
			doTweenZoom('camGame', 'camGame', 0.77, 120 / bpm, 'cubeOut')
		end
		if curBeat % 8 == 2 then
			doTweenZoom('camGame', 'camGame', 0.87, 120 / bpm, 'cubeOut')
		end
		if curBeat % 8 == 4 then
			doTweenZoom('camGame', 'camGame', 0.97, 120 / bpm, 'cubeOut')
		end
		if curBeat % 8 == 6 then
			doTweenZoom('camGame', 'camGame', 1.07, 120 / bpm, 'cubeOut')
		end
	end
	if curBeat == 2624 then
		cameraFlash('other', 'FFFFF', 240 / bpm)
	end
	if curBeat >= 2624 and curBeat < 2676 then
		if curBeat % 2 == 0 then
			triggerEvent("Add Camera Zoom", 0, 0.02)
		end
		if curBeat % 8 == 0 then
			doTweenZoom('camGame', 'camGame', 0.77, 120 / bpm, 'cubeOut')
		end
		if curBeat % 8 == 2 then
			doTweenZoom('camGame', 'camGame', 0.87, 120 / bpm, 'cubeOut')
		end
		if curBeat % 8 == 4 then
			doTweenZoom('camGame', 'camGame', 0.97, 120 / bpm, 'cubeOut')
		end
		if curBeat % 8 == 6 then
			doTweenZoom('camGame', 'camGame', 1.07, 120 / bpm, 'cubeOut')
		end
	end
	if curBeat == 2676 then
		subtitles('', '', 64, 1)
		doTweenZoom('camGame', 'camGame', 0.67, 240 / bpm, 'cubeOut')
	end
	if curBeat == 2684 then
		doTweenZoom('camGame', 'camGame', 0.77, 240 / bpm, 'cubeOut')
	end
	if curBeat == 2688 then
		triggerEvent("Add Camera Zoom", 0, 0.1)
		cameraShake('camGame', 0.01, 480 / bpm)
		cameraShake('camHUD', 0.01, 480 / bpm)
		doTweenZoom('camGame0', 'camGame', 0.67, 480 / bpm, 'cubeOut')
		doTweenY('camGame1', 'camGame', 1280, 480 / bpm, 'backIn')
		doTweenAngle('camGame2', 'camGame', 180, 480 / bpm, 'cubeOut')
		doTweenAngle('camHUD', 'camHUD', 22.5, 480 / bpm, 'bounceOut')
	end
	if curBeat == 2704 then
		shake = false
		setProperty('camGame.angle', 0)
		removeLuaSprite('sufferingDesktopGround')
		setProperty('sky.alpha', 1)
		setProperty('mountains.alpha', 1)
		setProperty('background.alpha', 1)
		setProperty('ground.alpha', 1)
		doTweenY('camHUD0', 'camHUD', 1280, 960 / bpm, 'cubeIn')
		doTweenAngle('camHUD1', 'camHUD', 0, 960 / bpm, 'cubeIn')
		setProperty('dad.x', 190)
		setProperty('dad.y', 220)
		setProperty('boyfriend.x', 670)
		setProperty('boyfriend.y', -20)
		triggerEvent('Change Character', 'dad', 'alejoOG')
		triggerEvent('Camera Follow Pos', '')
	end
	if curBeat == 2752 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.7)
			setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.7)
			setPropertyFromGroup('strumLineNotes', i, 'y', 50)
		end
		doTweenY('camGame', 'camGame', 0, 240 / bpm, 'cubeOut')
		doTweenY('camHUD', 'camHUD', 0, 240 / bpm, 'cubeOut')
		setProperty('iconP1.alpha', 1)
		setProperty('iconP2.alpha', 1)
		setProperty('healthBar.alpha', 1)
		setProperty('healthBarFront.alpha', 1)
		setProperty('scoreTxt.alpha', 1)
		setProperty('songInfo.alpha', 0.75)
		setPropertyFromGroup('strumLineNotes', 0, 'x', 92)
		setPropertyFromGroup('strumLineNotes', 1, 'x', 204)
		setPropertyFromGroup('strumLineNotes', 2, 'x', 316)
		setPropertyFromGroup('strumLineNotes', 3, 'x', 428)
		setPropertyFromGroup('strumLineNotes', 4, 'x', 732)
		setPropertyFromGroup('strumLineNotes', 5, 'x', 844)
		setPropertyFromGroup('strumLineNotes', 6, 'x', 956)
		setPropertyFromGroup('strumLineNotes', 7, 'x', 1068)
	end
	if curBeat == 3032 then
		triggerEvent('Change Character', 'dad', 'endAlejo')
		triggerEvent("Add Camera Zoom", 0.1, 0.1)
		doTweenAlpha('background', 'background', 0, 240 / bpm)
	end
	if curBeat == 3232 then
		triggerEvent('Change Character', 'dad', 'alejoOG')
		triggerEvent("Add Camera Zoom", 0.1, 0.1)
		doTweenAlpha('background', 'background', 1, 240 / bpm)
	end
	if curBeat == 3680 then
		doTweenAlpha('camHUD', 'camHUD', 0, 480 / bpm, 'cubeIn')
		doTweenAlpha('camGame', 'camGame', 0, 480 / bpm, 'cubeIn')
	end
end
function onSectionHit()
	if curSection >= 256 and curSection < 476 then
		if not mustHitSection then
			setProperty('defaultCamZoom', 0.5)
		end
		if mustHitSection then
			setProperty('defaultCamZoom', 0.9)
		end
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if nerfed == false then
		if shake == true then
			cameraShake('camHUD', shakeForce / 200, 30 / bpm)
			cameraShake('camGame', shakeForce / 100, 30 / bpm)
		end
		health = getProperty('health')
		if health > 0.25 then
			setProperty('health', health - 0.02)
		end
		if curBeat >= 1600 and curBeat < 1728 then
			setProperty('screenNote.scale.x', 3)
			setProperty('screenNote.scale.y', 3)
			doTweenX('screenNoteScale0', 'screenNote.scale', 2, 120 / bpm)
			doTweenY('screenNoteScale1', 'screenNote.scale', 2, 120 / bpm)
			if noteData == 0 then
				setProperty('screenNote.alpha', 0.5)
				setProperty('screenNote.scale.x', 3)
				doTweenAlpha('screenNoteLeft', 'screenNote', 0, 120 / bpm)
				loadGraphic('screenNote', 'other/notes/left')
				cancelTween('screenNoteDown')
				cancelTween('screenNoteUp')
				cancelTween('screenNoteRight')
			end
			if noteData == 1 then
				setProperty('screenNote.alpha', 0.5)
				doTweenAlpha('screenNoteDown', 'screenNote', 0, 120 / bpm)
				loadGraphic('screenNote', 'other/notes/down')
				cancelTween('screenNoteLeft')
				cancelTween('screenNoteUp')
				cancelTween('screenNoteRight')
			end
			if noteData == 2 then
				setProperty('screenNote.alpha', 0.5)
				doTweenAlpha('screenNoteUp', 'screenNote', 0, 120 / bpm)
				loadGraphic('screenNote', 'other/notes/up')
				cancelTween('screenNoteLeft')
				cancelTween('screenNoteDown')
				cancelTween('screenNoteRight')
			end
			if noteData == 3 then
				setProperty('screenNote.alpha', 0.5)
				doTweenAlpha('screenNoteRight', 'screenNote', 0, 120 / bpm)
				loadGraphic('screenNote', 'other/notes/right')
				cancelTween('screenNoteLeft')
				cancelTween('screenNoteDown')
				cancelTween('screenNoteUp')
			end
		end
	end
end
function goodNoteHit()
	if nerfed == true then
		health = getProperty('health')
		if health > 0.25 then
			setProperty('health', health + 0.01)
		end
	end
end