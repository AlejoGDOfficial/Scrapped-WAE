local storedFrameRate = getPropertyFromClass('backend.ClientPrefs', 'data.framerate')

function changeFrameRate(value)
    if value == nil then
        setPropertyFromClass('flixel.FlxG', 'updateFramerate', getPropertyFromClass('backend.ClientPrefs', 'data.framerate'))
        setPropertyFromClass('flixel.FlxG', 'drawFramerate', getPropertyFromClass('backend.ClientPrefs', 'data.framerate'))
    else
        storedFrameRate = value
        setPropertyFromClass('flixel.FlxG', 'updateFramerate', value)
        setPropertyFromClass('flixel.FlxG', 'drawFramerate', value)
    end
end

function onPause()
    changeFrameRate()
end

function onResume()
    changeFrameRate(storedFrameRate)
end

function onDestroy()
    changeFrameRate()
end

local currentGuy = 'dad'

function changeSectionGuys()
    if mustHitSection then
        currentGuy = 'bf'
        setProperty('boyfriend.alpha', 1)
        setProperty('gf.alpha', 1)
        setProperty('dad.alpha', 0)
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    else
        currentGuy = 'dad'
        setProperty('dad.alpha', 1)
        setProperty('gf.alpha', 0)
        setProperty('boyfriend.alpha', 0)
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
        end
    end
end

function changeSectionBackgrounds(currentBg)
    if mustHitSection then
        if currentBg == 'gay' then
            setProperty('gayBg.alpha', 0.5)
        end
        if currentBg == 'field' then
            setProperty('duckHuntFieldSky.alpha', 0.5)
            setProperty('duckHuntFieldBigTree.alpha', 0.75)
            setProperty('duckHuntFieldSmallTree.alpha', 0.75)
        end
    else
        if currentBg == 'gay' then
            setProperty('gayBg.alpha', 0.5)
        end
        if currentBg == 'field' then
            setProperty('duckHuntFieldSky.alpha', 0.75)
            setProperty('duckHuntFieldBigTree.alpha', 1)
            setProperty('duckHuntFieldSmallTree.alpha', 1)
        end
    end
end

function changeSectionOthers()
    if mustHitSection then
        if currentGuy == 'dad' then
            cameraFlash('camGame', '000000', 60 / curBpm)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    else
        if currentGuy == 'bf' then
            cameraFlash('camGame', '000000', 60 / curBpm)
        end
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
        end
    end
end

local tweenTime = nil

local tweenEase = nil

function changeBarsOffset(value, time, ease)
    if time == nil then
        tweenTime = 20 / curBpm
    else
        tweenTime = time
    end

    if ease == nil then
        tweenEase = 'cubeOut'
    else
        tweenEase = ease
    end

    if time == 0 then
        setProperty('blackBarLeft.x', 0 - getProperty('blackBarLeft.width') + value)
        setProperty('blackBarRight.x', screenWidth - value)
    else
        doTweenX('blackBarLeft', 'blackBarLeft', 0 - getProperty('blackBarLeft.width') + value, tweenTime, tweenEase)
        doTweenX('blackBarRight', 'blackBarRight', screenWidth - value, tweenTime, tweenEase)
    end
end

function duckHuntShootNote(value)
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    setProperty('whiteSquare'..value..'.alpha', 1)
    runTimer('shootNote'..value, 5 / curBpm)
end

local hurtDog = true

local storedDogX = 0

local setDogY = false

function duckHuntDogMechanic(value)
    if value == 0 then
        setDogY = false
        storedDogX = getRandomInt(0, 500)
        triggerEvent('Change Character', 'dad', 'duckHuntDogMechanic')
        setProperty('dad.y', 500)
        doTweenY('dadY', 'dad', -115, 20 / curBpm, 'cubeOut')
    end
    if value == 1 then
        setDogY = true
        if hurtDog == false then
            triggerEvent('Change Character', 'dad', 'duckHuntDogMechanicShoot')
            setProperty('health', health - 0.2)
            runTimer('returnScoreColor', 60 / curBpm)
            cameraFlash('')
        else
            triggerEvent('Change Character', 'dad', 'duckHuntDogMechanicHurt')
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'shootNote4' then
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
        setProperty('whiteSquare4.alpha', 0)
    end
    if tag == 'shootNote5' then
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
        setProperty('whiteSquare5.alpha', 0)
    end
    if tag == 'shootNote6' then
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
        setProperty('whiteSquare6.alpha', 0)
    end
    if tag == 'shootNote7' then
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
        setProperty('whiteSquare7.alpha', 0)
    end
end

function onCreate()
    setProperty('skipCountdown', true)

    setProperty('dad.alpha', 0)
    setProperty('boyfriend.x', screenWidth / 2 - getProperty('boyfriend.width') / 2)
    setProperty('boyfriend.alpha', 0)
    setProperty('gf.x', screenWidth / 3 * 2 - getProperty('gf.width') / 2)
    setProperty('gf.alpha', 0)
    setObjectOrder('gf', getObjectOrder('boyfriendGroup') - 1)

    setProperty('camHUD.alpha', 0)

    makeLuaSprite('fadingScreen', 'other/gradients/fadingScreen', 0, 0)
    setObjectCamera('fadingScreen', 'other')
    addLuaSprite('fadingScreen')
    setProperty('fadingScreen.y', screenHeight - getProperty('fadingScreen.height') / 2)
    doTweenY('fadingScreen', 'fadingScreen', screenHeight, 1920 / bpm, 'cubeOut')

    makeLuaSprite('circleBlackScreen', 'other/gradients/circleBlackScreen', 0, 0)
    setObjectCamera('circleBlackScreen', 'other')
    addLuaSprite('circleBlackScreen')
    setProperty('circleBlackScreen.alpha', 0.5)

    makeLuaSprite('blackBarLeft', nil, 0, 0)
    makeGraphic('blackBarLeft', screenWidth, screenHeight, '000000')
    setObjectCamera('blackBarLeft', 'other')
    addLuaSprite('blackBarLeft')
    setProperty('blackBarLeft.x', 0 - getProperty('blackBarLeft.width'))

    makeLuaSprite('blackBarRight', nil, screenWidth, 0)
    makeGraphic('blackBarRight', screenWidth, screenHeight, '000000')
    setObjectCamera('blackBarRight', 'other')
    addLuaSprite('blackBarRight')

    setTextFont('scoreTxt', 'nokiafc22.ttf')
    setTextFont('botplayTxt', 'nokiafc22.ttf')
    setProperty('healthBar.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    
    triggerEvent('Camera Follow Pos', screenWidth / 2, screenHeight / 2)
    setProperty('camFollow.x', screenWidth / 2)
    setProperty('camFollow.y', screenHeight / 2)
    setProperty('camGame.scroll.x', 0)
    setProperty('camGame.scroll.y', 0)

    addCharacterToList('duckHuntDog', 'dad')
    addCharacterToList('duckHuntDogMechanic', 'dad')
    addCharacterToList('duckHuntDogMechanicShoot', 'dad')
    addCharacterToList('duckHuntDogMechanicHurt', 'dad')

    makeLuaSprite('healthOffset', nil, 0.05)

    changeFrameRate()
end

function onCreatePost()
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end
    setPropertyFromGroup('strumLineNotes', 4, 'x', 412)
    setPropertyFromGroup('strumLineNotes', 5, 'x', 524)
    setPropertyFromGroup('strumLineNotes', 6, 'x', 636)
    setPropertyFromGroup('strumLineNotes', 7, 'x', 748)

    makeLuaSprite('whiteSquare4', nil, 412, 50)
    makeGraphic('whiteSquare4', 110, 110, 'FFFFFF')
    setObjectCamera('whiteSquare4', 'other')
    addLuaSprite('whiteSquare4')
    setProperty('whiteSquare4.alpha', 0)

    makeLuaSprite('whiteSquare5', nil, 524, 50)
    makeGraphic('whiteSquare5', 110, 110, 'FFFFFF')
    setObjectCamera('whiteSquare5', 'other')
    addLuaSprite('whiteSquare5')
    setProperty('whiteSquare5.alpha', 0)

    makeLuaSprite('whiteSquare6', nil, 636, 50)
    makeGraphic('whiteSquare6', 110, 110, 'FFFFFF')
    setObjectCamera('whiteSquare6', 'other')
    addLuaSprite('whiteSquare6')
    setProperty('whiteSquare6.alpha', 0)

    makeLuaSprite('whiteSquare7', nil, 748, 50)
    makeGraphic('whiteSquare7', 110, 110, 'FFFFFF')
    setObjectCamera('whiteSquare7', 'other')
    addLuaSprite('whiteSquare7')
    setProperty('whiteSquare7.alpha', 0)

    makeLuaSprite('gayBg', 'backgrounds/gay/bg')
    addLuaSprite('gayBg')
    setProperty('gayBg.alpha', 0.5)

    makeLuaSprite('duckHuntFieldSky', 'backgrounds/duckHuntField/sky')
    addLuaSprite('duckHuntFieldSky')
    setProperty('duckHuntFieldSky.alpha', 0)

    makeLuaSprite('duckHuntFieldBigTree', 'backgrounds/duckHuntField/bigTree')
    addLuaSprite('duckHuntFieldBigTree')
    setProperty('duckHuntFieldBigTree.x', 0 - getProperty('duckHuntFieldBigTree.width'))

    makeLuaSprite('duckHuntFieldSmallTree', 'backgrounds/duckHuntField/smallTree', screenWidth)
    addLuaSprite('duckHuntFieldSmallTree')

    makeLuaSprite('duckHuntFieldGrass', 'backgrounds/duckHuntField/grass', 0, screenHeight)
    addLuaSprite('duckHuntFieldGrass')
end

local t = 0

function onUpdate(e)
    t = t + e

    if not parraIsGay then
        setProperty('camHUD.alpha', 1)
    end

    setProperty('timer.alpha', 0)

    setTextString('scoreTxt', 'Health: '..math.floor(50 * getProperty('health'))..'%    Misses: '..misses)

    if curBeat >= 32 and curBeat < 64 then
        setProperty('camGame.x', math.sin(t) * 20)
    end
    if curBeat >= 64 and curBeat < 128 then
        setProperty('camGame.x', math.sin(t) * 20)
        setProperty('camHUD.x', math.sin(t * 2) * 20)
        setProperty('camHUD.angle', math.sin(t) * 2.5)
    end
    if curBeat >= 128 and curBeat < 144 then
        setProperty('camGame.x', math.sin(t) * 50)
        setProperty('camGame.angle', math.sin(t) * 2.5)
        setProperty('camHUD.x', math.sin(t * 2) * 50)
        setProperty('camHUD.angle', math.sin(t) * 2.5)
    end
    if curBeat >= 144 and curBeat < 272 then
        setProperty('camGame.x', math.sin(t) * 20)
        setProperty('camHUD.x', math.sin(t * 2) * 20)
        setProperty('camHUD.angle', math.sin(t) * 2.5)
    end
    if curBeat >= 392 and curBeat < 424 then
        setProperty('health', getProperty('healthOffset.x'))
    end
    if curBeat >= 432 and curBeat < 436 then
        setProperty('health', getProperty('healthOffset.x'))
    end
    if curBeat >= 724 then
        setProperty('dad.x', storedDogX)
        setProperty('dad.scale.x', 0.75)
        setProperty('dad.scale.y', 0.75)
        if getProperty('dad.animation.curAnim.name') ~= 'noHey' and (dadName == 'duckHuntDogMechanicShoot' or dadName == 'duckHuntDogMechanicHurt')then
            if setDogY then
                setProperty('dad.y', -115)
            end
            triggerEvent('Play Animation', 'noHey', 'Dad')
        end
    end
    if curBeat >= 432 then
        
    end
end

function onBeatHit()
    if curBeat == 28 then
        doTweenAlpha('camHUDAlpha', 'camHUD', 1, 240 / curBpm, 'cubeIn')
    end
    if curBeat == 32 then
        changeBarsOffset(280, 0)
        changeFrameRate(45)
    end
    if curBeat >= 32 and curBeat < 64 then
        setProperty('gayBg.scale.x', 0.75)
        doTweenX('gayBgScaleX', 'gayBg.scale', 0.7, 45 / curBpm, 'cubeOut')
    end
    if curBeat == 64 then
        doTweenX('gayBgScaleX', 'gayBg.scale', 1, 45 / curBpm, 'cubeOut')
        doTweenY('gayBgScaleY', 'gayBg.scale', 1.8, 45 / curBpm, 'cubeOut')
    end
    if curBeat >= 64 and curBeat < 128 then
        doTweenAngle('gayBgAngle', 'gayBg', getProperty('gayBg.angle') + getRandomInt(-10, 10), 45 / curBpm, 'cubeOut')
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
    end
    if curBeat == 128 then
        doTweenX('gayBgX', 'gayBg', 0, 20 / curBpm, 'cubeOut')
        doTweenY('gayBgY', 'gayBg', 0, 20 / curBpm, 'cubeOut')
        doTweenX('gayBgScaleX', 'gayBg.scale', 1, 20 / curBpm, 'cubeOut')
        doTweenY('gayBgScaleY', 'gayBg.scale', 1, 20 / curBpm, 'cubeOut')
        doTweenAngle('gayBgAngle', 'gayBg', 0, 20 / curBpm, 'cubeOut')
        changeBarsOffset(0)
        changeFrameRate()
    end
    if curBeat == 144 then
        setProperty('camGame.angle', 0)
        doTweenX('gayBgScaleX', 'gayBg.scale', 1, 20 / curBpm, 'cubeOut')
        doTweenY('gayBgScaleY', 'gayBg.scale', 1.8, 20 / curBpm, 'cubeOut')
        changeFrameRate(45)
        changeBarsOffset(300)
    end
    if curBeat >= 144 and curBeat < 208 then
        doTweenAngle('gayBgAngle', 'gayBg', getProperty('gayBg.angle') + getRandomInt(-10, 10), 45 / curBpm, 'cubeOut')
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
    end
    if curBeat == 207 then
        doTweenX('gayBgX', 'gayBg', 0, 20 / curBpm, 'cubeOut')
        doTweenY('gayBgY', 'gayBg', 0, 20 / curBpm, 'cubeOut')
        doTweenX('gayBgScaleX', 'gayBg.scale', 1, 20 / curBpm, 'cubeOut')
        doTweenY('gayBgScaleY', 'gayBg.scale', 1, 20 / curBpm, 'cubeOut')
        doTweenAngle('gayBgAngle', 'gayBg', 0, 20 / curBpm, 'cubeOut')
        changeBarsOffset(300)
    end
    if curBeat == 208 then
        setProperty('camHUD.x', 0)
        setProperty('camHUD.angle', 0)
        changeBarsOffset(0)
        changeFrameRate()
    end
    if curBeat >= 208 and curBeat < 272 then
        if curBeat % 16 < 8 then
            if curBeat % 4 == 2 then
                triggerEvent('Add Camera Zoom', 0.3, 0.3)
                setProperty('gayBg.scale.x', 1.5)
                doTweenX('gayBgScaleX', 'gayBg.scale', 1, 120 / curBpm, 'cubeOut')
            end
        else
            triggerEvent('Add Camera Zoom', 0.1, 0.1)
            setProperty('gayBg.scale.x', 1.15)
            doTweenX('gayBgScaleX', 'gayBg.scale', 1, 45 / curBpm, 'cubeOut')
        end
    end
    if curBeat == 272 then
        doTweenX('camGameX', 'camGame', 0, 20 / curBpm, 'cubeOut')
        changeBarsOffset(20)
    end
    if curBeat == 276 then
        changeBarsOffset(40)
    end
    if curBeat == 280 then
        changeBarsOffset(60)
    end
    if curBeat == 284 then
        changeBarsOffset(80)
    end
    if curBeat == 288 then
        changeBarsOffset(100)
    end
    if curBeat == 292 then
        changeBarsOffset(120)
    end
    if curBeat == 296 then
        changeBarsOffset(140)
    end
    if curBeat == 300 then
        changeBarsOffset(160)
    end
    if curBeat == 304 then
        changeBarsOffset(180)
    end
    if curBeat == 308 then
        changeBarsOffset(200)
    end
    if curBeat == 312 then
        changeBarsOffset(220)
    end
    if curBeat == 316 then
        changeBarsOffset(240)
    end
    if curBeat == 320 then
        changeBarsOffset(260)
    end
    if curBeat == 324 then
        changeBarsOffset(280)
    end
    if curBeat == 328 then
        changeBarsOffset(300)
    end
    if curBeat == 332 then
        changeBarsOffset(320)
    end
    if curBeat == 336 then
        changeBarsOffset(0, 240 / curBpm, 'cubeIn')
    end
    if curBeat == 340 then
        doTweenAlpha('iconP1Alpha', 'iconP1', 1, 240 / curBpm)
        doTweenAlpha('iconP2Alpha', 'iconP2', 1, 240 / curBpm)
        doTweenAlpha('healthBarAlpha', 'healthBar', 1, 240 / curBpm)
        setProperty('defaultCamZoom', 1)
    end
    if curBeat >= 344 and curBeat < 392 then
        if getHealth() > 0.075 then
            setProperty('health', getHealth() - 0.05)
        end
        setProperty('iconP1.scale.x', 0.75)
        doTweenX('iconP1ScaleX', 'iconP1.scale', 1, 45 / curBpm, 'cubeOut')
        setProperty('iconP1.scale.y', 0.75)
        doTweenY('iconP1ScaleY', 'iconP1.scale', 1, 45 / curBpm, 'cubeOut')
        setProperty('iconP2.scale.x', 1.5)
        doTweenX('iconP2ScaleX', 'iconP2.scale', 1, 45 / curBpm, 'cubeOut')
        setProperty('iconP2.scale.y', 1.5)
        doTweenY('iconP2ScaleY', 'iconP2.scale', 1, 45 / curBpm, 'cubeOut')
        triggerEvent('Add Camera Zoom', 0.3, 0.15)
        if curBeat % 2 == 0 then
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            doTweenAngle('camGameAngle', 'camGame', 2, 30 / curBpm, 'cubeOut')
            doTweenAngle('camGameAngle', 'camGame', 2, 30 / curBpm, 'cubeOut')
        end
    end
    if curBeat >= 376 and curBeat < 392 then
        if curBeat % 8 < 4 then
            if curBeat % 2 == 0 then
                doTweenX('camGameX', 'camGame', -20, 20 / curBpm, 'cubeOut')
                doTweenX('camGameX', 'camGame', -20, 20 / curBpm, 'cubeOut')
            end
            if curBeat % 2 == 1 then
                doTweenX('camGameX', 'camGame', 20, 20 / curBpm, 'cubeOut')
                doTweenX('camGameX', 'camGame', 20, 20 / curBpm, 'cubeOut')
            end
        end
        if curBeat % 8 == 4 then
            doTweenX('camGameX', 'camGame', 0, 20 / curBpm, 'cubeOut')
            doTweenX('camGameX', 'camGame', 0, 20 / curBpm, 'cubeOut')
        end
    end
    if curBeat >= 392 and curBeat < 424 then
        if curBeat % 8 >= 4 then
            triggerEvent('Add Camera Zoom', 0.3, 0.15)
            if curBeat % 2 == 0 then
                doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
                doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            end
            if curBeat % 2 == 1 then
                doTweenAngle('camGameAngle', 'camGame', 2, 30 / curBpm, 'cubeOut')
                doTweenAngle('camGameAngle', 'camGame', 2, 30 / curBpm, 'cubeOut')
            end
        end
    end
    if curBeat == 424 then
        setProperty('camGame.angle', 0)
        setProperty('camHUD.angle', 0)
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 240 / curBpm)
    end
    if curBeat == 428 then
        setProperty('healthOffset.x', getHealth())
    end
    if curBeat == 432 then
        doTweenX('healthOffset', 'healthOffset', 1, 120 / curBpm, 'cubeOut')
        doTweenAlpha('iconP1Alpha', 'iconP1', 0, 120 / curBpm)
        doTweenAlpha('iconP2Alpha', 'iconP2', 0, 120 / curBpm)
        doTweenAlpha('healthBarAlpha', 'healthBar', 0, 120 / curBpm)
    end
    if curBeat == 432 then
        triggerEvent('Change Character', 'dad', 'duckHuntDog')
        setProperty('dad.x', screenWidth / 2 - getProperty('dad.width') / 2)
        setProperty('dad.y', screenHeight)
        doTweenY('dadY', 'dad', 0, 120 / curBpm, 'cubeOut')
        doTweenAlpha('gayBgAlpha', 'gayBg', 0, 120 / curBpm)
        doTweenAlpha('duckHuntFieldSkyAlpha', 'duckHuntFieldSky', 0.75, 120 / curBpm)
        doTweenX('duckHuntFieldBigTreeX', 'duckHuntFieldBigTree', 0, 120 / curBpm, 'cubeOut')
        doTweenX('duckHuntFieldSmallTreeX', 'duckHuntFieldSmallTree', 0, 120 / curBpm, 'cubeOut')
        doTweenY('duckHuntFieldGrassY', 'duckHuntFieldGrass', 0, 120 / curBpm, 'cubeOut')
    end
    if curBeat == 440 then
        changeBarsOffset(280)
        changeFrameRate(45)
        doTweenZoom('camGameZoom', 'camGame', 1.2, 20 / curBpm, 'cubeOut')
        setProperty('defaultCamZoom', 1.2)
        setProperty('camHUD.alpha', 1)
        setProperty('camHUD.y', -15)
        doTweenY('camHUDY', 'camHUD', 0, 30 / curBpm, 'cubeOut')
    end
    if curBeat == 455 then
        changeBarsOffset(0)
        changeFrameRate()
        doTweenZoom('camGameZoom', 'camGame', 1, 20 / curBpm, 'cubeOut')
        setProperty('defaultCamZoom', 1)
    end
    if curBeat > 456 and curBeat ~= 487 and curBeat < 520 then
        if curBeat % 8 == 1 then
            duckHuntShootNote(4)
        end
        if curBeat % 8 == 3 then
            duckHuntShootNote(5)
        end
        if curBeat % 8 == 5 then
            duckHuntShootNote(6)
        end
        if curBeat % 8 == 7 then
            duckHuntShootNote(7)
        end
    end
    if curBeat >= 520 and curBeat < 584 then
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
        setProperty('duckHuntFieldBigTree.x', -20)
        doTweenX('duckHuntFieldBigTreeX', 'duckHuntFieldBigTree', 0, 45 / curBpm, 'cubeOut')
        setProperty('duckHuntFieldSmallTree.x', 20)
        doTweenX('duckHuntFieldSmallTreeX', 'duckHuntFieldSmallTree', 0, 45 / curBpm, 'cubeOut')
        setProperty('duckHuntFieldGrass.y', 20)
        doTweenY('duckHuntFieldGrassY', 'duckHuntFieldGrass', 0, 45 / curBpm, 'cubeOut')
        setProperty('duckHuntFieldSky.scale.x', 1.25)
        doTweenX('duckHuntFieldSkyScaleX', 'duckHuntFieldSky.scale', 1, 45 / curBpm, 'cubeOut')
    end
    if curBeat >= 592 and curBeat < 656 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', 0.1, 0.1)
            setProperty('duckHuntFieldBigTree.x', -20)
            doTweenX('duckHuntFieldBigTreeX', 'duckHuntFieldBigTree', 0, 45 / curBpm, 'cubeOut')
            setProperty('duckHuntFieldSmallTree.x', 20)
            doTweenX('duckHuntFieldSmallTreeX', 'duckHuntFieldSmallTree', 0, 45 / curBpm, 'cubeOut')
            setProperty('duckHuntFieldGrass.y', 20)
            doTweenY('duckHuntFieldGrassY', 'duckHuntFieldGrass', 0, 45 / curBpm, 'cubeOut')
            setProperty('duckHuntFieldSky.scale.x', 1.25)
            doTweenX('duckHuntFieldSkyScaleX', 'duckHuntFieldSky.scale', 1, 45 / curBpm, 'cubeOut')
        end
        if curBeat % 8 == 1 then
            duckHuntShootNote(4)
        end
        if curBeat % 8 == 3 then
            duckHuntShootNote(5)
        end
        if curBeat % 8 == 5 then
            duckHuntShootNote(6)
        end
        if curBeat % 8 == 7 then
            duckHuntShootNote(7)
        end
    end
    if curBeat == 724 then
        setObjectOrder('dadGroup', getObjectOrder('duckHuntFieldGrass') - 1)
        setObjectOrder('duckHuntFieldSmallTree', getObjectOrder('dadGroup') - 1)
        setObjectOrder('duckHuntFieldBigTree', getObjectOrder('duckHuntFieldSmallTree') - 1)
        doTweenY('duckHuntFieldGrassY', 'duckHuntFieldGrass', 10, 45 / curBpm, 'cubeOut')
    end
    if curBeat >= 724 then
        if curBeat % 2 == 0 then
            duckHuntDogMechanic(0)
        end
        if curBeat % 2 == 1 then
            duckHuntDogMechanic(1)
        end
    end
end

function onStepHit()
    if curStep >= 384 and curStep < 496 then
        if curStep % 64 < 48 then
            if curStep % 16 == 0 then
                changeBarsOffset(140)
                doTweenZoom('camGame', 'camGame', 1.5, 20 / curBpm, 'cubeOut')
                setProperty('defaultCamZoom', 1.5)
            end
            if curStep % 16 == 2 then
                changeBarsOffset(280)
                doTweenZoom('camGame', 'camGame', 1, 20 / curBpm, 'cubeOut')
                setProperty('defaultCamZoom', 1)
            end
        end
    end
    if curStep >= 1088 and curStep < 1216 then
        if curStep % 16 == 0 then
            doTweenZoom('camGame', 'camGame', 1.5, 20 / curBpm, 'cubeOut')
            setProperty('defaultCamZoom', 1.5)
        end
        if curStep % 16 == 2 then
            doTweenZoom('camGame', 'camGame', 1, 20 / curBpm, 'cubeOut')
            setProperty('defaultCamZoom', 1)
        end
    end
    if curStep >= 1216 and curStep < 1344 then
        if curStep % 64 == 0 then
            doTweenAngle('camGameAngle', 'camGame', 0, 20 / curBpm, 'cubeOut')
        end
        if curStep % 64 == 24 then
            doTweenAngle('camGameAngle', 'camGame', -2, 20 / curBpm, 'cubeOut')
            doTweenZoom('camGameZoom', 'camGame', 1.2, 20 / curBpm, 'cubeOut')
            setProperty('defaultCamZoom', 1.2)
        end
        if curStep % 64 == 27 then
            doTweenAngle('camGameAngle', 'camGame', 2, 20 / curBpm, 'cubeOut')
            doTweenZoom('camGameZoom', 'camGame', 1.5, 20 / curBpm, 'cubeOut')
            setProperty('defaultCamZoom', 1.5)
        end
        if curStep % 64 == 30 then
            doTweenAngle('camGameAngle', 'camGame', 0, 20 / curBpm, 'cubeOut')
            doTweenZoom('camGameZoom', 'camGame', 1, 20 / curBpm, 'cubeOut')
            setProperty('defaultCamZoom', 1)
        end
        if curStep % 64 == 56 then
            doTweenAngle('camGameAngle', 'camGame', -2, 45 / curBpm, 'cubeOut')
            doTweenZoom('camGameZoom', 'camGame', 1.2, 45 / curBpm, 'cubeOut')
            setProperty('defaultCamZoom', 1.2)
        end
        if curStep % 64 == 60 then
            doTweenAngle('camGameAngle', 'camGame', 2, 45 / curBpm, 'cubeOut')
            doTweenZoom('camGameZoom', 'camGame', 1.4, 45 / curBpm, 'cubeOut')
            setProperty('defaultCamZoom', 1.4)
        end
        if curStep % 64 < 48 then
            if curStep % 16 == 0 then
                doTweenZoom('camGame', 'camGame', 1.5, 20 / curBpm, 'cubeOut')
                setProperty('defaultCamZoom', 1.5)
            end
            if curStep % 16 == 2 then
                doTweenZoom('camGame', 'camGame', 1, 20 / curBpm, 'cubeOut')
                setProperty('defaultCamZoom', 1)
            end
        end
    end
    if curStep >= 1568 and curStep < 1696 then
        if curStep % 32 == 0 then
            triggerEvent('Add Camera Zoom', 0.3, 0.15)
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            setProperty('healthOffset.x', 0.05)
            doTweenX('healthOffset', 'healthOffset', 0.6, 60 / curBpm, 'cubeOut')
        end
        if curStep % 32 == 6 then
            triggerEvent('Add Camera Zoom', 0.3, 0.15)
            doTweenAngle('camGameAngle', 'camGame', 2, 30 / curBpm, 'cubeOut')
            doTweenAngle('camGameAngle', 'camGame', 2, 30 / curBpm, 'cubeOut')
            doTweenX('healthOffset', 'healthOffset', 1.2, 60 / curBpm, 'cubeOut')
        end
        if curStep % 32 == 12 then
            triggerEvent('Add Camera Zoom', 0.3, 0.15)
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            doTweenX('healthOffset', 'healthOffset', 1.8, 60 / curBpm, 'cubeOut')
        end
        if curStep % 32 == 16 then
            triggerEvent('Add Camera Zoom', 0.3, 0.15)
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            doTweenAngle('camGameAngle', 'camGame', -2, 30 / curBpm, 'cubeOut')
            doTweenX('healthOffset', 'healthOffset', 0.05, 220 / curBpm)
        end
    end
end

function onSectionHit()
    if curSection >= 8 then
        changeSectionOthers()
    end
    if curSection >= 8 and curSection < 106 then
        changeSectionBackgrounds('gay')
        changeSectionGuys()
    end
    if curSection >= 108 then
        changeSectionBackgrounds('field')
        changeSectionGuys()
    end
end