local function epicBars(bool)
    if bool == true then
        setProperty('songInfo.alpha', 0.25)
        setProperty('defaultCamZoom', 1)
        for i = 0, 7 do
            noteTweenAlpha('note'..i, i, 0, 120 / bpm, 'cubeOut')
        end
        doTweenY('upScreen', 'upScreen', 0, 120 / bpm, 'cubeOut')
        doTweenY('downScreen', 'downScreen', 620, 120 / bpm, 'cubeOut')
    end
    if bool == false then
        setProperty('songInfo.alpha', 0.5)
        for i = 0, 7 do
            noteTweenAlpha('note'..i, i, 1, 120 / bpm, 'cubeOut')
        end
        setProperty('defaultCamZoom', 0.6)
        doTweenY('upScreen', 'upScreen', -100, 120 / bpm, 'cubeIn')
        doTweenY('downScreen', 'downScreen', screenHeight, 120 / bpm, 'cubeIn')
    end
end
local function screwed(bool)
    if bool == true then
        setProperty('sky.alpha', 0)
        setProperty('screwedSky.alpha', 1)
        triggerEvent('Add Camera Zoom', '0.5', '')
        setProperty('songInfo.alpha', 0.75)
        cameraFlash('other', 'FF0000', 120 / bpm)
    end
    if bool == false then
        setProperty('sky.alpha', 1)
        setProperty('screwedSky.alpha', 0)
        setProperty('songInfo.alpha', 0.5)
        cameraFlash('other', '000000', 120 / bpm)
    end
end
local function subtitles(text)
	setTextString('subtitles', text)
end
function onCreate()
    makeLuaText('subtitles', '', screenWidth, 0, 0)
    setObjectCamera('subtitles', 'other')
    setTextSize('subtitles', 128)
    addLuaText('subtitles')
    precacheImage('8-28-63/screwedSunset')
    makeLuaSprite('upScreen', nil, 0, -100)
    makeGraphic('upScreen', screenWidth, 100, '000000')
    addLuaSprite('upScreen')
    setObjectCamera('upScreen', 'camHUD')
    makeLuaSprite('downScreen', nil, 0, screenHeight)
    makeGraphic('downScreen', screenWidth, screenHeight, '000000')
    addLuaSprite('downScreen')
    setObjectCamera('downScreen', 'camHUD')
    setProperty('songInfo.alpha', 0.5)
    setProperty('scoreTxt.alpha', 0)
end
function onCreatePost()
	makeLuaSprite('screwedSky', 'backgrounds/prejudiceSunset/screwedSky', -300, 0)
	setLuaSpriteScrollFactor('screwedSky', 0.25, 0.25)
	addLuaSprite('screwedSky', false)
	setProperty('screwedSky.scale.x', 2)
	setProperty('screwedSky.scale.y', 2)
    setProperty('screwedSky.alpha', 0)
	setObjectOrder('screwedSky', 0)
end
local t = 0
local subtitlesX = 0
local subtitlesY = 0
function onUpdate()
    subtitlesX = screenWidth / 2 - getProperty('subtitles.width') / 2
    subtitlesY = screenHeight / 2 - getProperty('subtitles.height') / 2
	setProperty('subtitles.x', subtitlesX + getRandomFloat(-5, 5))
	setProperty('subtitles.y', subtitlesY + getRandomFloat(-5, 5))
	setProperty('subtitles.angle', getRandomFloat(-3.125, 3.125))
    setProperty('timer.alpha', 0)
end
function onBeatHit()
    if getProperty('songInfo.alpha') == 0.75 then
        triggerEvent('Add Camera Zoom', '0.5', '')
    end
    if curBeat == 64 then
        screwed(true)
    end
    if curBeat == 96 then
        screwed(false)
    end
    if curBeat == 144 then
        epicBars(true)
    end
    if curBeat == 154 then
        subtitles('YOU FU-')
    end
    if curBeat == 156 then
        subtitles('YOU FUCKING LIAR')
    end
    if curBeat == 158 then
        subtitles('MOL-')
    end
    if curBeat == 159 then
        subtitles('MOLDY')
    end
    if curBeat == 160 then
        subtitles('')
        epicBars(false)
        screwed(true)
    end
    if curBeat == 288 then
        screwed(false)
    end
    if curBeat == 384 then
        screwed(true)
    end
    if curBeat == 416 then
        screwed(false)
    end
    if curBeat == 464 then
        epicBars(true)
        subtitles('YOU FU-')
    end
    if curBeat == 466 then
        subtitles('YOU FUCKING LIAR')
    end
    if curBeat == 468 then
        subtitles('MOL-')
    end
    if curBeat == 469 then
        subtitles('MOLDY')
    end
    if curBeat == 470 then
        subtitles('')
    end
    if curBeat == 472 then
        subtitles('FUCKING')
    end
    if curBeat == 473 then
        subtitles('FUCKING LIAR')
    end
    if curBeat == 474 then
        subtitles('')
    end
    if curBeat == 480 then
        epicBars(false)
        screwed(true)
    end
    if curBeat == 608 then
        screwed(false)
    end
    if curBeat == 612 then
        epicBars(true)
        subtitles('YOU FU-')
    end
    if curBeat == 614 then
        subtitles('YOU FUCKING LIAR')
    end
    if curBeat == 616 then
        subtitles('MOL-')
    end
    if curBeat == 617 then
        subtitles('MOLDY')
    end
    if curBeat == 618 then
        subtitles('')
        epicBars(false)
    end
end
function opponentNoteHit()
    if getProperty('songInfo.alpha') == 0.25 then
		cameraShake('camHUD', 0.0125, 30 / bpm)
		cameraShake('camGame', 0.025, 30 / bpm)
    end
end