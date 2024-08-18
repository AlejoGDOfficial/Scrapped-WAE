function epicBars(bool)
    if bool == true then
        doTweenY('upScreen', 'upScreen', -620, 240 / bpm, 'cubeOut')
        doTweenY('downScreen', 'downScreen', 620, 240 / bpm, 'cubeOut')
    end
    if bool == false then
        doTweenY('upScreen', 'upScreen', -720, 240 / bpm, 'cubeOut')
        doTweenY('downScreen', 'downScreen', 720, 240 / bpm, 'cubeOut')
    end
end
function badApple(bool)
    if bool == true then
	setProperty('whitebg.alpha', 1)
        setProperty('boyfriend.color', '000000')
        setProperty('dad.color', '000000')
        setProperty('gf.color', '000000')
    end
    if bool == false then
	setProperty('whitebg.alpha', 0)
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
    end
end
function onCreate()
    makeLuaSprite('blackScreen', nil, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setProperty('blackScreen.alpha', 0)
    addLuaSprite('blackScreen')
    setObjectCamera('blackScreen', 'other')
    makeLuaSprite('whiteScreen', nil, 0, 0, 0)
    makeGraphic('whiteScreen', screenWidth, screenHeight, 'FFFFFF')
    setProperty('whiteScreen.alpha', 0)
    addLuaSprite('whiteScreen')
    setObjectCamera('whiteScreen', 'other')
    makeLuaSprite('upScreen', nil, 0, -720)
    makeGraphic('upScreen', screenWidth, screenHeight, '000000')
    addLuaSprite('upScreen')
    setObjectCamera('upScreen', 'camHUD')
    makeLuaSprite('downScreen', nil, 0, 720)
    makeGraphic('downScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('downScreen', 'camHUD')
    addLuaSprite('downScreen')
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('healthBar.alpha', 0)
    setProperty('scoreTxt.alpha', 0)
    setProperty('timer.alpha', 0)
    setProperty('song.alpha', 0)
end
function onCreatePost()
        makeLuaSprite('whitebg', '', -500, -300)
        makeGraphic('whitebg', 5000, 5000,'ffffff')
        addLuaSprite('whitebg', false)
        setProperty('whitebg.scale.x', 3)
        setProperty('whitebg.scale.y', 3)
	setProperty('whitebg.alpha', 0)
end
function onUpdate()
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
    end
end
function onSongStart()
    epicBars(true)
    badApple(true)
    setProperty('defaultCamZoom', 0.5)
end
local zooming = false
function onBeatHit()
    if curBeat % 2 == 0 then
        if zooming then
            triggerEvent('Add Camera Zoom', 0.125, 0.025)
        end
    end
    if curBeat == 6 then
        badApple(false)
        setProperty('defaultCamZoom', 0.9)
        zooming = true
    end
    if curBeat == 12 then
        epicBars(false)
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 14 then
        epicBars(true)
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 44 then
        epicBars(false)
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 46 then
        epicBars(true)
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 66 then
        zooming = false
        setProperty('defaultCamZoom', 1.1)
    end
    if curBeat == 70 then
        zooming = true
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat == 100 then
        zooming = false
        setProperty('defaultCamZoom', 1.1)
        badApple(true)
    end
    if curBeat == 102 then
        zooming = true
        setProperty('defaultCamZoom', 0.8)
        badApple(false)
    end
    if curBeat == 108 then
        setProperty('defaultCamZoom', 1.1)
    end
    if curBeat == 110 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat == 130 then
        zooming = false
        setProperty('defaultCamZoom', 0.4)
        badApple(true)
    end
    if curBeat == 134 then
        zooming = true
        setProperty('defaultCamZoom', 0.8)
        badApple(false)
    end
    if curBeat == 150 then
        zooming = false
        epicBars(false)
    end
    if curBeat == 158 then
        zooming = true
    end
    if curBeat == 166 then
        epicBars(true)
    end
    if curBeat == 172 then
        epicBars(false)
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 174 then
        epicBars(true)
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 204 then
        epicBars(false)
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 206 then
        epicBars(true)
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 230 then
        zooming = false
        epicBars(false)
    end
    if curBeat == 262 then
        zooming = true
        epicBars(true)
    end
    if curBeat == 290 then
        zooming = false
        setProperty('defaultCamZoom', 1.1)
    end
    if curBeat == 294 then
        zooming = true
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat == 318 then
        setProperty('defaultCamZoom', 0.4)
        badApple(true)
    end
    if curBeat == 326 then
        setProperty('defaultCamZoom', 0.8)
        badApple(false)
    end
    if curBeat == 332 then
        epicBars(false)
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 334 then
        epicBars(true)
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 364 then
        epicBars(false)
        setProperty('defaultCamZoom', 0.5)
    end
    if curBeat == 366 then
        epicBars(true)
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 422 then
        doTweenAlpha('camHUD', 'camHUD', 0, 240 / bpm)
        doTweenAlpha('camGame', 'camGame', 0, 240 / bpm)
    end
end