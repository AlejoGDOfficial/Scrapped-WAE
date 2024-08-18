function epicBars(offset)
    doTweenY('upScreen', 'upScreen', -720 + offset, 240 / bpm, 'cubeOut')
    doTweenY('downScreen', 'downScreen', 720 - offset, 240 / bpm, 'cubeOut')
end
function changeLocation(text)
    setTextString('location', text)
    setProperty('location.x', 0 - getProperty('location.width'))
    doTweenX('location0', 'location', 20, 480 / bpm, 'cubeOut')
    doTweenX('locationBackground0', 'locationBackground.scale', 20 + getProperty('location.width') * 2, 480 / bpm, 'cubeOut')
end
function onTweenCompleted(tag)
    if tag == 'location0' then
        doTweenX('location1', 'location', 0 - getProperty('location.width'), 480 / bpm, 'cubeIn')
        doTweenX('locationBackground1', 'locationBackground.scale', 0, 480 / bpm, 'cubeIn')
    end
end
function onCreate()
    makeLuaSprite('whiteSceen', nil, 0, 0, 0)
    makeGraphic('whiteSceen', screenWidth, screenHeight, 'FFFFFF')
    setObjectCamera('whiteSceen', 'other')
    setProperty('whiteSceen.alpha', 0)
    addLuaSprite('whiteSceen')
    makeLuaSprite('upScreen', nil, 0, -720)
    makeGraphic('upScreen', screenWidth, screenHeight, '000000')
    addLuaSprite('upScreen')
    setObjectCamera('upScreen', 'camHUD')
    makeLuaSprite('downScreen', nil, 0, 720)
    makeGraphic('downScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('downScreen', 'camHUD')
    addLuaSprite('downScreen')
    makeLuaSprite('locationBackground', nil, 0, 176)
    makeGraphic('locationBackground', 1, 96, '000000')
    addLuaSprite('locationBackground')
    setObjectCamera('locationBackground', 'other')
    setProperty('locationBackground.alpha', 0.75)
    makeLuaText('location', '', nil, 0, 200)
    setObjectCamera('location', 'other')
    setTextSize('location', 64)
    addLuaText('location')
    setProperty('gf.alpha', 0)
    precacheImage('other/car/car')
    addCharacterToList('guarnes', 'dad')
    addCharacterToList('alejo', 'dad')
    addCharacterToList('nataly', 'dad')
    addCharacterToList('screwedJana', 'dad')
    addCharacterToList('playerJana', 'bf')
    addCharacterToList('playerScaredNataly', 'bf')
    addCharacterToList('playerParra', 'bf')
    setObjectOrder('gfGroup', 9)
    setObjectOrder('dadGroup', 10)
    setObjectOrder('boyfriendGroup', 11)
end
function onCreatePost()
	makeLuaSprite('paperWorldGround', 'backgrounds/paperWorld/ground', -600, -300)
	setLuaSpriteScrollFactor('paperWorldGround', 1, 1)
	addLuaSprite('paperWorldGround', true)
	setProperty('paperWorldGround.scale.x', 2)
	setProperty('paperWorldGround.scale.y', 2)
	setProperty('paperWorldGround.alpha', 0)
    setSpriteShader("paperWorldGround", "wavyBackground")
	makeLuaSprite('ibagueGround', 'backgrounds/ibague/ground', -600, -300)
	setLuaSpriteScrollFactor('ibagueGround', 1, 1)
	addLuaSprite('ibagueGround', true)
	setProperty('ibagueGround.scale.x', 2)
	setProperty('ibagueGround.scale.y', 2)
	setProperty('ibagueGround.alpha', 0)
    setSpriteShader("ibagueGround", "wavyBackground")
	makeLuaSprite('ibagueLight', 'backgrounds/ibague/light', -600, -300)
	setLuaSpriteScrollFactor('ibagueLight', 1, 1)
	addLuaSprite('ibagueLight', true)
	setProperty('ibagueLight.scale.x', 2)
	setProperty('ibagueLight.scale.y', 2)
	setProperty('ibagueLight.alpha', 0)
	makeLuaSprite('nevadoDelRuizSky', 'backgrounds/nevadoDelRuiz/sky', -600, -300)
	setLuaSpriteScrollFactor('nevadoDelRuizSky', 0.25, 0.25)
    addLuaSprite('nevadoDelRuizSky')
    setProperty('nevadoDelRuizSky.alpha', 0)
	makeLuaSprite('nevadoDelRuizMountains', 'backgrounds/nevadoDelRuiz/mountains', -600, -300)
	setLuaSpriteScrollFactor('nevadoDelRuizMountains', 0.5, 0.5)
    addLuaSprite('nevadoDelRuizMountains')
    setProperty('nevadoDelRuizMountains.alpha', 0)
	makeLuaSprite('nevadoDelRuizGround', 'backgrounds/nevadoDelRuiz/ground', -600, -300)
	setLuaSpriteScrollFactor('nevadoDelRuizGround', 1, 1)
    addLuaSprite('nevadoDelRuizGround')
    setProperty('nevadoDelRuizGround.alpha', 0)
	makeLuaSprite('guarnesCar', 'other/car/guarnesCar', -2000, 100)
	setLuaSpriteScrollFactor('guarnesCar', 1, 1)
	addLuaSprite('guarnesCar', false)
	setProperty('guarnesCar.alpha', 0)
    setObjectOrder('sky', 0)
    setObjectOrder('background', 1)
    setObjectOrder('ground', 2)
    setObjectOrder('paperWorldGround', 3)
    setObjectOrder('ibagueGround', 4)
    setObjectOrder('nevadoDelRuizSky', 5)
    setObjectOrder('nevadoDelRuizMountains', 6)
    setObjectOrder('nevadoDelRuizGround', 7)
    setObjectOrder('guarnesCar', 8)
end
local t = 0
local nevadoDelRuizGroundX = -600
function onUpdatePost()
    setShaderFloat('paperWorldGround', "uTime", getSongPosition()/1000)
    setShaderFloat('paperWorldGround', "uWaveAmplitude", 0.15)
    setShaderFloat('paperWorldGround', "uSpeed", bpm / 100)
    setShaderFloat('paperWorldGround', "uFrequency", 2.5)
    setShaderFloat('ibagueGround', "uTime", getSongPosition()/1000)
    setShaderFloat('ibagueGround', "uWaveAmplitude", 0.1)
    setShaderFloat('ibagueGround', "uSpeed", bpm / 100)
    setShaderFloat('ibagueGround', "uFrequency", 5)
    nevadoDelRuizGroundX = nevadoDelRuizGroundX - 30
    if nevadoDelRuizGroundX <= -3160 then
        nevadoDelRuizGroundX = -600
    end
    setProperty('nevadoDelRuizGround.x', nevadoDelRuizGroundX)
    if curBeat >= 1664 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.sin(t * 4 + i) * 25)
            setPropertyFromGroup('strumLineNotes', i, 'angle', t * 50)
        end
        setProperty('boyfriend.y', -100 + math.sin(t * 2) * 100)
        setProperty('boyfriend.angle', math.sin(t) * 12.25)
        setProperty('guarnesCar.x', -900 + math.sin(t * 2) * 100)
        setProperty('dad.x', 90 + math.sin(t * 2) * 100)
    end
end
function onUpdate(e)
    t = t + e
    if curBeat >= 1280 and curBeat < 1536 then
        setProperty('dad.x', 150 + math.sin(t * 2) * 750)
        setProperty('dad.y', 250 + math.cos(t * 2) * -50)
    end
end
function onSongStart()
    changeLocation('Somewhere in Caracas, Venezuela...')
    epicBars(200)
end
function onBeatHit()
    if curBeat == 64 then
        epicBars(0)
    end
    if curBeat == 256 then
        epicBars(100)
    end
    if curBeat == 416 then
        epicBars(0)
    end
    if curBeat == 448 then
        epicBars(50)
    end
    if curBeat == 504 then
	    doTweenX('guarnesCar0', 'guarnesCar', -500, 480 / bpm, 'cubeInOut')
	    doTweenAlpha('guarnesCar1', 'guarnesCar', 1, 60 / bpm, 'cubeInOut')
    end
    if curBeat == 512 then
        epicBars(0)
        cameraFlash('other', 'FFFFFF', 120 / bpm)
	    triggerEvent('Change Character', 'dad', 'guarnes')
	    loadGraphic('guarnesCar', 'other/car/car')
    end
    if curBeat == 640 then
        epicBars(100)
    end
    if curBeat == 768 then
        epicBars(0)
    end
    if curBeat == 960 then
        setProperty('yellowScreen.alpha', 0)
        changeLocation('Meanwhile in Manizales, Colombia...')
        setProperty('paperWorldGround.alpha', 1)
        setProperty('sky.alpha', 0)
        setProperty('background.alpha', 0)
        setProperty('ground.alpha', 0)
        setProperty('defaultCamZoom', 0.6)
	    triggerEvent('Change Character', 'dad', 'nataly')
	    triggerEvent('Change Character', 'bf', 'playerJana')
        setProperty('guarnesCar.alpha', 0)
        cameraFlash('camHUD', '000000', 120 / bpm)
    end
    if curBeat == 1152 then
        epicBars(100)
    end
    if curBeat >= 1216 and curBeat <= 1280 then
        triggerEvent('Add Camera Zoom', 0.05, 0.05)
    end
    if curBeat == 1280 then
        epicBars(50)
        changeLocation('Now in Ibagué, Colombia...')
        removeLuaSprite('paperWorldGround')
        setProperty('ibagueLight.alpha', 1)
        setProperty('ibagueGround.alpha', 1)
        setProperty('defaultCamZoom', 0.5)
	    triggerEvent('Change Character', 'dad', 'screwedJana')
	    triggerEvent('Change Character', 'bf', 'playerScaredNataly')
        setProperty('boyfriend.x', 350)
        setProperty('boyfriend.y', 400)
        cameraFlash('camHUD', '000000', 120 / bpm)
        setProperty('healthBar.alpha', 0)
        setProperty('healthBarFront.alpha', 0.5)
        setProperty('scoreTxt.alpha', 0)
        setProperty('songInfo.alpha', 0)
        setProperty('timer.alpha', 0)
        setProperty('location.alpha', 0.5)
        setProperty('iconP1.alpha', 0.5)
        setProperty('iconP2.alpha', 0.5)
        for i = 0, 3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
        end
    end
    if curBeat == 1536 then
        epicBars(150)
        changeLocation('Back to Caracas, Venezuela...')
        removeLuaSprite('ibagueGround')
        removeLuaSprite('ibagueLight')
        setProperty('sky.alpha', 1)
        setProperty('background.alpha', 1)
        setProperty('ground.alpha', 1)
        setProperty('yellowScreen.alpha', 0.075)
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
        cameraFlash('other', 'FFFFFF', 120 / bpm)
        removeLuaSprite('ibagueLight')
        removeLuaSprite('ibagueGround')
        setProperty('boyfriend.x', 790)
        setProperty('boyfriend.y', 220)
        setProperty('dad.x', 90)
        setProperty('dad.y', 220)
	    triggerEvent('Change Character', 'dad', 'alejo')
	    triggerEvent('Change Character', 'bf', 'playerParra')
        setProperty('healthBar.alpha', 1)
        setProperty('healthBarFront.alpha', 1)
        setProperty('scoreTxt.alpha', 1)
        setProperty('songInfo.alpha', 1)
        setProperty('timer.alpha', 1)
        setProperty('location.alpha', 1)
        setProperty('iconP1.alpha', 1)
        setProperty('iconP2.alpha', 1)
        setProperty('defaultCamZoom', 0.7)
        setObjectOrder('dadGroup', 9)
    end
    if curBeat == 1664 then
        epicBars(100)
        changeLocation('Now in Nevado Del Ruiz, Colombia...')
        removeLuaSprite('sky')
        removeLuaSprite('background')
        removeLuaSprite('ground')
        setProperty('yellowScreen.alpha', 0)
        setProperty('nevadoDelRuizSky.alpha', 1)
        setProperty('nevadoDelRuizMountains.alpha', 1)
        setProperty('nevadoDelRuizGround.alpha', 1)
        setProperty('whiteSceen.alpha', 0.075)
        cameraFlash('other', 'FFFFFF', 240 / bpm)
        setProperty('guarnesCar.alpha', 1)
	    loadGraphic('guarnesCar', 'other/car/guarnesCar')
        setProperty('dad.y', -75)
        setProperty('dad.angle', 6)
    end
end