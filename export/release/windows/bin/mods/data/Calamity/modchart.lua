function wavyBackground(background)
    setShaderFloat(background, "uTime", getSongPosition()/1000)
    setShaderFloat(background, "uWaveAmplitude", 0.15)
    setShaderFloat(background, "uSpeed", bpm / 100)
    setShaderFloat(background, "uFrequency", 5)
end
function onCreate()
    makeLuaSprite('blackScreen', nil, 0, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'other')
    addLuaSprite('blackScreen')
	setProperty('blackScreen.alpha', 0)
    initLuaShader("wavyBackground")
	addCharacterToList('bSideThearchyExpunged', 'dad')
	addCharacterToList('bandu', 'dad')
	addCharacterToList('madJokeBambi', 'dad')
	addCharacterToList('spaciAstray', 'gf')
    makeLuaSprite('thearchyModchart', nil, -25, -300)
    makeGraphic('thearchyModchart', 0, 0, 'FFFFFF')
    addLuaSprite('thearchyModchart')
    setProperty('thearchyModchart.alpha', 0)
	setProperty('camHUD.alpha', 0)
	setProperty('gf.scale.x', 0.3)
	setProperty('gf.scale.y', 0.3)
end
function onCreatePost()
    makeLuaSprite('thearchyGround', 'backgrounds/thearchy/ground', -800, -300)
    setScrollFactor('thearchyGround', 1, 1)
    addLuaSprite('thearchyGround', false)
    setProperty('thearchyGround.scale.x', 3)
    setProperty('thearchyGround.scale.y', 3)
    setProperty('thearchyGround.alpha', 0)
    setSpriteShader("thearchyGround", "wavyBackground")
    makeLuaSprite('applecoreGround', 'backgrounds/applecore/ground', -800, -300)
    setScrollFactor('applecoreGround', 1, 1)
    addLuaSprite('applecoreGround', false)
    setProperty('applecoreGround.scale.x', 3)
    setProperty('applecoreGround.scale.y', 3)
    setProperty('applecoreGround.alpha', 0)
    setSpriteShader("applecoreGround", "wavyBackground")
    makeLuaSprite('spaceSky', 'backgrounds/space/sky', -800, -300)
    setScrollFactor('spaceSky', 0.25, 0.25)
    addLuaSprite('spaceSky', false)
    setProperty('spaceSky.scale.x', 7)
    setProperty('spaceSky.scale.y', 7)
    setProperty('spaceSky.alpha', 0)
    makeLuaSprite('spaceGround', 'backgrounds/space/ground', 200, 730)
    setScrollFactor('spaceGround', 1, 1)
    addLuaSprite('spaceGround', false)
    setProperty('spaceGround.alpha', 0)
end
local t = 0
local gfX = -2000
function onUpdate(e)
	t = t + e
	if curBeat < 304 then
		gfX = gfX + 10
		if gfX >= 3500 then
			gfX = -2000
		end
		setProperty('gf.y', 150 + math.sin(t * 2) * 200)
		setProperty('gf.x', gfX)
		setProperty('gf.angle', t * 10)
	end
	if curBeat >= 304 and curBeat < 848 then
		setProperty('dad.y', math.sin(t * 2) * 200)
	end
	if curBeat >= 304 and curBeat < 576 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t * 4 + i) * 50)
			setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t * 4 + i) * 50)
		end
	end
	if curBeat >= 576 and curBeat < 640 then
		setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t * 2 + 0) * 50)
		setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t * 2 + 1) * 50)
		setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t * 2 + 2) * 50)
		setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t * 2 + 3) * 50)
		setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t * 2 + 4) * 50)
		setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t * 2 + 5) * 50)
		setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t * 2 + 6) * 50)
		setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t * 2 + 7) * 50)
	end
	if curBeat >= 640 and curBeat < 768 then
		for i = 0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight / 2 - getPropertyFromGroup('strumLineNotes', i, 'height') / 2 + math.cos(t * 4 + i) * 250)
			setPropertyFromGroup('strumLineNotes', i, 'x', screenWidth / 2 - getPropertyFromGroup('strumLineNotes', i, 'width') / 2 + math.sin(t * 4 + i) * 400)
		end
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight / 2 - getPropertyFromGroup('strumLineNotes', i, 'height') / 2 + math.cos(t * 4 + i) * 25)
		end
		setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 4 + 4) * 25)
		setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 4 + 5) * 25)
		setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 4 + 6) * 25)
		setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 4 + 7) * 25)
		setProperty('health', getProperty('health') + 0.002)
	end
	if curBeat >= 848 and curBeat < 1168 then
		if getProperty('dad.x') <= -150 then
			setObjectOrder('dadGroup', 8)
		end
		if getProperty('dad.x') >= 1250 then
			setObjectOrder('dadGroup', 6)
		end
		setProperty('dad.x', 550 + math.sin(t * 2) * 750)
		setProperty('dad.scale.x', 1 + math.cos(t * 2) * 0.25)
		setProperty('dad.scale.y', 1 + math.cos(t * 2) * 0.25)
	end
	if curBeat >= 1488 then
		setProperty('dad.y', math.sin(t * 2) * 200)
		setProperty('gf.y', math.cos(t * 2) * 200)
	end
	if curBeat >= 1536 and curBeat < 1856 then
		setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t * 2 + 0) * 50)
		setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t * 2 + 1) * 50)
		setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t * 2 + 2) * 50)
		setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t * 2 + 3) * 50)
		setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t * 2 + 4) * 50)
		setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t * 2 + 5) * 50)
		setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t * 2 + 6) * 50)
		setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t * 2 + 7) * 50)
	end
	if curBeat >= 1856 and curBeat < 1920 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.cos(t * 4 + i) * 50)
		end
		setPropertyFromGroup('strumLineNotes', 0, 'x', 92 + math.sin(t * 4 + 0) * 50)
		setPropertyFromGroup('strumLineNotes', 1, 'x', 204 + math.sin(t * 4 + 1) * 50)
		setPropertyFromGroup('strumLineNotes', 2, 'x', 316 + math.sin(t * 4 + 2) * 50)
		setPropertyFromGroup('strumLineNotes', 3, 'x', 428 + math.sin(t * 4 + 3) * 50)
		setPropertyFromGroup('strumLineNotes', 4, 'x', 732 + math.sin(t * 4 + 4) * 50)
		setPropertyFromGroup('strumLineNotes', 5, 'x', 844 + math.sin(t * 4 + 5) * 50)
		setPropertyFromGroup('strumLineNotes', 6, 'x', 956 + math.sin(t * 4 + 6) * 50)
		setPropertyFromGroup('strumLineNotes', 7, 'x', 1068 + math.sin(t * 4 + 7) * 50)
	end
	if curBeat >= 1920 then
		for i = 0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight / 2 - getPropertyFromGroup('strumLineNotes', i, 'height') / 2 + math.cos(t * 4 + i) * (1 * getProperty('thearchyModchart.y')))
			setPropertyFromGroup('strumLineNotes', i, 'x', screenWidth / 2 - getPropertyFromGroup('strumLineNotes', i, 'width') / 2 + math.sin(t * 4 + i) * getProperty('thearchyModchart.y'))
		end
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight / 2 - getPropertyFromGroup('strumLineNotes', i, 'height') / 2 + math.cos(t * 4 + i) * (-1 * getProperty('thearchyModchart.x')))
		end
		setPropertyFromGroup('strumLineNotes', 4, 'x', 412 + math.sin(t * 4 + 4) * getProperty('thearchyModchart.x'))
		setPropertyFromGroup('strumLineNotes', 5, 'x', 524 + math.sin(t * 4 + 5) * getProperty('thearchyModchart.x'))
		setPropertyFromGroup('strumLineNotes', 6, 'x', 636 + math.sin(t * 4 + 6) * getProperty('thearchyModchart.x'))
		setPropertyFromGroup('strumLineNotes', 7, 'x', 748 + math.sin(t * 4 + 7) * getProperty('thearchyModchart.x'))
		setProperty('health', getProperty('health') + 0.002)
	end
end
function onUpdatePost()
    wavyBackground('thearchyGround')
    wavyBackground('applecoreGround')
end
function onBeatHit()
	if curBeat == 32 then
		triggerEvent('Add Camera Zoom', 0.5, 0.5)
		setProperty('camHUD.alpha', 1)
	end
	if curBeat == 288 then
		doTweenAlpha('blackScreen', 'blackScreen', 1, 240 / bpm)
	end
	if curBeat == 304 then
		removeLuaSprite('sky')
		setProperty('thearchyGround.alpha', 1)
		triggerEvent('Change Character', 'dad', 'bSideThearchyExpunged')
		setProperty('gf.x', 100)
		setProperty('gf.y', 130)
		setProperty('gf.scale.x', 1)
		setProperty('gf.scale.y', 1)
		setProperty('gf.angle', 0)
		setProperty('boyfriend.x', 770)
		setProperty('boyfriend.y', 450)
		setProperty('dad.x', -400)
		setProperty('boyfriend.y', 450)
	end
	if curBeat == 320 then
		doTweenAlpha('blackScreen', 'blackScreen', 0, 960 / bpm)
	end
	if curBeat >= 352 and curBeat < 576 then
		if curBeat % 4 == 2 then
			triggerEvent('Add Camera Zoom', 0.05, 0.05)
		end
	end
	if curBeat == 576 then
		for i = 0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', 50)
		end
	end
	if curBeat >= 640 and curBeat < 768 then
		if curBeat % 4 == 2 then
			triggerEvent('Add Camera Zoom', 0.05, 0.05)
		end
	end
	if curBeat == 640 then
		for i = 0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
		end
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'direction', -90)
		end
		triggerEvent('Add Camera Zoom', 0.5, 0.5)
	end
	if curBeat == 768 then
		for i = 0, 7 do
			noteTweenY('noteY'..i, i, 50, 120 / bpm, 'cubeOut')
		end
		for i = 0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
		end
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'direction', 90)
		end
		noteTweenX('noteX0', 0, 92, 120 / bpm, 'cubeOut')
		noteTweenX('noteX1', 1, 204, 120 / bpm, 'cubeOut')
		noteTweenX('noteX2', 2, 316, 120 / bpm, 'cubeOut')
		noteTweenX('noteX3', 3, 428, 120 / bpm, 'cubeOut')
		noteTweenX('noteX4', 4, 732, 120 / bpm, 'cubeOut')
		noteTweenX('noteX5', 5, 844, 120 / bpm, 'cubeOut')
		noteTweenX('noteX6', 6, 956, 120 / bpm, 'cubeOut')
		noteTweenX('noteX7', 7, 1068, 120 / bpm, 'cubeOut')
	end
	if curBeat == 832 then
		doTweenAlpha('blackScreen', 'blackScreen', 1, 240 / bpm)
	end
	if curBeat == 848 then
		setProperty('thearchyGround.alpha', 0)
		setProperty('applecoreGround.alpha', 1)
		triggerEvent('Change Character', 'dad', 'bandu')
		setProperty('dad.y', getProperty('boyfriend.y') - getProperty('dad.height') / 2)
		setObjectOrder('sky', 0)
		setObjectOrder('thearchyGround', 1)
		setObjectOrder('applecoreGround', 2)
		setObjectOrder('spaceSky', 3)
		setObjectOrder('spaceGround', 4)
		setObjectOrder('gfGroup', 5)
		setObjectOrder('dadGroup', 6)
		setObjectOrder('boyfriendGroup', 7)
	end
	if curBeat == 864 then
		doTweenAlpha('blackScreen', 'blackScreen', 0, 960 / bpm)
		setProperty('defaultCamZoom', 0.3)
	end
	if curBeat >= 896 and curBeat < 1024 then
		if curBeat % 2 == 0 then
			triggerEvent('Add Camera Zoom', 0.1, 0.1)
		end
	end
	if curBeat >= 1088 and curBeat < 1152 then
		if curBeat % 2 == 0 then
			triggerEvent('Add Camera Zoom', 0.1, 0.1)
		end
	end
	if curBeat == 1152 then
		doTweenAlpha('blackScreen', 'blackScreen', 1, 240 / bpm)
	end
	if curBeat == 1168 then
		removeLuaSprite('applecoreGround')
		setProperty('spaceSky.alpha', 1)
		setProperty('spaceGround.alpha', 1)
		triggerEvent('Change Character', 'dad', 'madJokeBambi')
		setProperty('dad.scale.x', 1)
		setProperty('dad.scale.y', 1)
		setProperty('dad.x', -130)
		setProperty('dad.y', 100)
		setProperty('gf.x', 300)
	end
	if curBeat == 1184 then
		doTweenAlpha('blackScreen', 'blackScreen', 0, 960 / bpm)
	end
	if curBeat == 1200 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1202 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1204 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1206 then
		triggerEvent('Add Camera Zoom', -0.05, -0.05)
	end
	if curBeat == 1207 then
		triggerEvent('Add Camera Zoom', -0.05, -0.05)
	end
	if curBeat == 1208 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1209 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1210 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1211 then
		triggerEvent('Add Camera Zoom', -0.05, -0.05)
	end
	if curBeat == 1212 then
		triggerEvent('Add Camera Zoom', -0.05, -0.05)
	end
	if curBeat == 1214 then
		triggerEvent('Add Camera Zoom', -0.05, -0.05)
	end
	if curBeat == 1215 then
		triggerEvent('Add Camera Zoom', -0.05, -0.05)
	end
	if curBeat >= 1216 and curBeat < 1280 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1280 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curBeat == 1312 then
		setProperty('defaultCamZoom', 0.3)
	end
	if curBeat >= 1312 and curBeat < 1440 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1440 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curBeat == 1472 then
		setProperty('defaultCamZoom', 0.3)
		doTweenAlpha('blackScreen', 'blackScreen', 1, 240 / bpm)
	end
	if curBeat == 1488 then
		removeLuaSprite('spaceSky')
		removeLuaSprite('spaceGround')
		setProperty('thearchyGround.alpha', 1)
		triggerEvent('Change Character', 'dad', 'bSideThearchyExpunged')
		triggerEvent('Change Character', 'gf', 'spaciAstray')
		setProperty('dad.x', -550)
		setProperty('gf.x', 95)
	end
	if curBeat == 1536 then
		doTweenAlpha('blackScreen', 'blackScreen', 0, 960 / bpm)
	end
	if curBeat >= 1856 and curBeat < 1920 then
		triggerEvent('Add Camera Zoom', 0.05, 0.05)
	end
	if curBeat == 1920 then
		for i = 0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
		end
		for i = 4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'direction', -90)
		end
	end
	if curBeat >= 1920 and curBeat < 2304 then
		if curBeat % 4 == 2 then
			triggerEvent('Add Camera Zoom', 0.05, 0.05)
			setProperty('thearchyModchart.x', -300)
			doTweenX('thearchyModchartX', 'thearchyModchart', -25, 120 / bpm, 'cubeOut')
			setProperty('thearchyModchart.y', -400)
			doTweenY('thearchyModchartY', 'thearchyModchart', -300, 120 / bpm, 'cubeOut')
		end
	end
	if curBeat == 2304 then
		doTweenAlpha('camHUD', 'camHUD', 0, 480 / bpm)
	end
end
function onSectionHit()
	if curSection >= 88 and curSection < 216 then
		if mustHitSection then
			setProperty('defaultCamZoom', 0.7)
		else
			setProperty('defaultCamZoom', 0.3)
		end
	end
	if curSection >= 384 then
		if mustHitSection then
			setProperty('defaultCamZoom', 0.7)
		else
			setProperty('defaultCamZoom', 0.3)
		end
	end
end
function opponentNoteHit()
	if curBeat >= 320 and curBeat < 848 then
		cameraShake('camHUD', 0.001, 30 / bpm)
		cameraShake('camGame', 0.001, 30 / bpm)
	end
	if curBeat >= 1600 then
		cameraShake('camHUD', 0.001, 30 / bpm)
		cameraShake('camGame', 0.001, 30 / bpm)
	end
end