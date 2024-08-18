local tagIntX = -1
local tagIntScaleX = -1
local tagIntY = -1
local tagIntScaleY = -1
local tagIntCenterX = -1
local tagIntCenterY = -1
local centeredX = false
local centeredY = false
local scalingX = false
local scalingY = false
local windowModchart = true
local adjustScale = false
local t = 0
function windowTweenX(x, duration, ease, willBeScale)
    if willBeScale == nil or willBeScale == false and centeredX == false then
        tagIntX = tagIntX + 1
        doTweenX('x'..tagIntX, 'windowPropertys', x, duration, ease)
    elseif willBeScale == true then
        scalingX = true
        tagIntScaleX = tagIntScaleX + 1
        doTweenX('scaleX'..tagIntScaleX, 'windowPropertys.scale', x, duration, ease)
    end
end
function windowTweenY(y, duration, ease, willBeScale)
    if willBeScale == nil or willBeScale == false and centeredY == false then
        tagIntY = tagIntY + 1
        doTweenY('y'..tagIntY, 'windowPropertys', y, duration, ease)
    end
    if willBeScale == true then
        scalingY = true
        tagIntScaleY = tagIntScaleY + 1
        doTweenY('scaleY'..tagIntScaleY, 'windowPropertys.scale', y, duration, ease)
    end
end
function centerWindowX(duration, ease)
    tagIntCenterX = tagIntCenterX + 1
    doTweenX('x'..tagIntCenterX, 'windowPropertys', 1920 / 2 - getProperty('windowPropertys.scale.x') / 2, duration, ease)
    centeredX = true
end
function centerWindowY(duration, ease)
    tagIntCenterY = tagIntCenterY + 1
    doTweenY('y'..tagIntCenterY, 'windowPropertys', 1080 / 2 - getProperty('windowPropertys.scale.y') / 2, duration, ease)
    centeredY = true
end

local widthMultiplier = 1
local heightMultiplier = 1

function onCreate()
    widthMultiplier = 1920 / desktopWidth
    heightMultiplier = 1080 / desktopHeight

    debugPrint('x: '..widthMultiplier..'\ny:'..heightMultiplier)
    
    if windowModchart then
        setPropertyFromClass('lime.app.Application', 'current.window.fullscreen', false)
        setPropertyFromClass('openfl.Lib', 'application.window.width', 1280 / widthMultiplier)
        setPropertyFromClass('openfl.Lib', 'application.window.height', 720 / heightMultiplier)
        setPropertyFromClass('openfl.Lib', 'application.window.x', 320 / widthMultiplier)
        setPropertyFromClass('openfl.Lib', 'application.window.y', 180 / heightMultiplier)
    end
    makeLuaSprite('shakeOffset', nil, 0, 0)
    setProperty('shakeOffset.alpha', 0)
    addLuaSprite('shakeOffset')
    makeLuaSprite('windowPropertys', nil, 0, 0)
    setProperty('windowPropertys.x', 320)
    setProperty('windowPropertys.y', 180)
    setProperty('windowPropertys.scale.x', 1290)
    setProperty('windowPropertys.scale.y', 720)
    setProperty('windowPropertys.alpha', 0)
    addLuaSprite('windowPropertys')
    makeLuaSprite('modchartOffset', nil, 480, 0)
    setProperty('modchartOffset.alpha', 0)
    addLuaSprite('modchartOffset')
    
end
function onTweenCompleted(tag)
    if tag == 'scaleX'..tagIntScaleX then
        scalingX = false
    end
    if tag == 'scaleY'..tagIntScaleY then
        scalingY = false
    end
    if tag == 'x'..tagIntCenterX then
        centeredX = false
    end
    if tag == 'y'..tagIntCenterY then
        centeredY = false
    end
end
function onEndSong()
    addHaxeLibrary("Application", "lime.app")
    runHaxeCode([[
        Application.current.window.alert("The game was the one who suffered the BRAIN FAILURE.", "Error!");
    ]])
    os.exit()
end
function onPause()
    windowModchart = false
    setPropertyFromClass('openfl.Lib', 'application.window.width', 1280 / widthMultiplier)
    setPropertyFromClass('openfl.Lib', 'application.window.height', 720 / heightMultiplier)
    setPropertyFromClass('openfl.Lib', 'application.window.x', 320 / widthMultiplier)
    setPropertyFromClass('openfl.Lib', 'application.window.y', 180 / heightMultiplier)
end
function onResume()
    windowModchart = true
    adjustScale = true
end
function onDestroy()
    windowModchart = false
    setPropertyFromClass('openfl.Lib', 'application.window.width', 1280 / widthMultiplier)
    setPropertyFromClass('openfl.Lib', 'application.window.height', 720 / heightMultiplier)
    setPropertyFromClass('openfl.Lib', 'application.window.x', 320 / widthMultiplier)
    setPropertyFromClass('openfl.Lib', 'application.window.y', 180 / heightMultiplier)
end

function onUpdate()
    if windowModchart then
    setPropertyFromClass('openfl.Lib', 'application.window.x', (getProperty('windowPropertys.x') + math.random(-1 * getProperty('shakeOffset.x'), getProperty('shakeOffset.x'))) / widthMultiplier)
        setPropertyFromClass('openfl.Lib', 'application.window.y', (getProperty('windowPropertys.y') + math.random(-1 * getProperty('shakeOffset.x'), getProperty('shakeOffset.x'))) / heightMultiplier)
        if adjustScale then
            adjustScale = false
            setPropertyFromClass('openfl.Lib', 'application.window.width', getProperty('windowPropertys.scale.x') / widthMultiplier)
            setPropertyFromClass('openfl.Lib', 'application.window.height', getProperty('windowPropertys.scale.y') / heightMultiplier)
        end
        if scalingX then
            setPropertyFromClass('openfl.Lib', 'application.window.width', getProperty('windowPropertys.scale.x') / widthMultiplier)
        end
        if scalingY then
            setPropertyFromClass('openfl.Lib', 'application.window.height', getProperty('windowPropertys.scale.y') / heightMultiplier)
        end
    end
end
function onCountdownTick(counter)
    if counter == 0 then
        windowTweenY(405, 60 / bpm, 'cubeOut')
        doTweenX('shakeOffset', 'shakeOffset', 2.5, 60 / bpm, 'cubeOut')
    end
    if counter == 1 then
        windowTweenY(630, 60 / bpm, 'cubeOut')
        doTweenX('shakeOffset', 'shakeOffset', 5, 60 / bpm, 'cubeOut')
    end
    if counter == 2 then
        windowTweenY(855, 60 / bpm, 'cubeOut')
        doTweenX('shakeOffset', 'shakeOffset', 7.5, 60 / bpm, 'cubeOut')
    end
    if counter == 3 then
        windowTweenY(1080, 60 / bpm, 'cubeOut')
        doTweenX('shakeOffset', 'shakeOffset', 10, 60 / bpm, 'cubeOut')
    end
end
function onSongStart()
    centerWindowY(11520 / bpm, 'cubeOut')
end
function onUpdatePost(e)
    t = t + e
    if curBeat >= 384 and curBeat < 512 then
        setProperty('windowPropertys.x', (960 - getProperty('windowPropertys.scale.x') / 2) + math.sin(t * 2) * 300)
    end
    if curBeat >= 512 and curBeat < 576 then
        if curBeat % 16 >= 8 then
            setProperty('windowPropertys.x', (960 - getProperty('windowPropertys.scale.x') / 2) + math.sin(t * 2) * 300)
        end
    end
    if curBeat >= 864 and curBeat < 928 then
        setProperty('windowPropertys.x', (960 - getProperty('windowPropertys.scale.x') / 2) + math.sin(t) * 300)
        setProperty('windowPropertys.y', (540 - getProperty('windowPropertys.scale.y') / 2) + math.cos(t * 4) * 100)
    end
    if curBeat >= 1312 and curBeat < 1952 then
        setProperty('windowPropertys.x', 320 * getProperty('camGame.zoom'))
    end
    if curBeat >= 2112 and curBeat < 2236 then
        setProperty('windowPropertys.x', (getProperty('modchartOffset.x') - getProperty('windowPropertys.scale.x') / 2) + math.sin(t * 2) * 75)
        setProperty('windowPropertys.y', (540 - getProperty('windowPropertys.scale.y') / 2) + math.cos(t * 8) * 200)
    end
end
function onBeatHit()
    if curBeat == 64 then
        doTweenX('shakeOffset', 'shakeOffset', 0, 7680 / bpm, 'cubeOut')
    end
    if curBeat == 320 then
        windowTweenX(1400, 120 / bpm, 'cubeInOut', true)
        windowTweenY(1400 * 0.5625, 120 / bpm, 'cubeInOut', true)
    end
    if curBeat == 324 then
        centerWindowX(120 / bpm, 'cubeInOut')
        centerWindowY(120 / bpm, 'cubeInOut')
    end
    if curBeat == 372 then
        windowTweenX(1280, 240 / bpm, 'cubeInOut', true)
        windowTweenY(720, 240 / bpm, 'cubeInOut', true)
    end
    if curBeat == 376 then
        centerWindowX(240 / bpm, 'cubeInOut')
        centerWindowY(240 / bpm, 'cubeInOut')
    end
    if curBeat >= 384 and curBeat < 512 then
        if curBeat % 2 == 0 then
            windowTweenY(180, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            windowTweenY(240, 60 / bpm, 'cubeIn')
        end
    end
    if curBeat >= 512 and curBeat < 576 then
        if curBeat % 16 >= 8 then
            if curBeat % 2 == 0 then
                windowTweenY(180, 60 / bpm, 'cubeOut')
            end
            if curBeat % 2 == 1 then
                windowTweenY(240, 60 / bpm, 'cubeIn')
            end
        end
    end
    if curBeat == 576 then
        windowTweenY(180, 60 / bpm, 'cubeOut')
    end
    if curBeat >= 576 and curBeat < 696 then
        if mustHitSection then
            if curBeat % 2 == 0 then
                windowTweenX(1920 - getProperty('windowPropertys.scale.x') - 60, 60 / bpm, 'cubeOut')
            end
            if curBeat % 2 == 1 then
                windowTweenX(1920 - getProperty('windowPropertys.scale.x'), 60 / bpm, 'cubeIn')
            end
        else
            if curBeat % 2 == 0 then
                windowTweenX(60, 60 / bpm, 'cubeOut')
            end
            if curBeat % 2 == 1 then
                windowTweenX(0, 60 / bpm, 'cubeIn')
            end
        end
    end
    if curBeat == 696 then
        windowTweenX(0, 720 / bpm, 'cubeOut')
        windowTweenY(0, 720 / bpm, 'cubeOut')
    end
    if curBeat == 708 then
        windowTweenX(1920, 240 / bpm, 'cubeOut', true)
        windowTweenY(1080, 240 / bpm, 'cubeOut', true)
    end
    if curBeat == 768 then
        windowTweenX(1280, 240 / bpm, 'cubeOut', true)
        windowTweenY(720, 240 / bpm, 'cubeOut', true)
    end
    if curBeat == 800 then
        windowTweenX(320, 240 / bpm, 'cubeOut')
        windowTweenY(180, 240 / bpm, 'cubeOut')
    end
    if curBeat == 928 then
        windowTweenX(320, 240 / bpm, 'cubeOut')
        windowTweenY(180, 240 / bpm, 'cubeOut')
    end
    if curBeat >= 1056 and curBeat < 1150 then
        if curBeat % 2 == 0 then
            windowTweenY(180, 60 / bpm, 'cubeOut')
        end
        if curBeat % 2 == 1 then
            windowTweenY(240, 60 / bpm, 'cubeIn')
        end
        if curBeat % 4 == 0 then
            windowTweenX(920 - getProperty('windowPropertys.scale.x') / 2 - 100, 120 / bpm, 'cubeOut')
        end
        if curBeat % 4 == 2 then
            windowTweenX(920 - getProperty('windowPropertys.scale.x') / 2 + 100, 120 / bpm, 'cubeOut')
        end
    end
    if curBeat == 1150 then
        windowTweenX(0, 240 / bpm, 'cubeOut')
        windowTweenY(0, 240 / bpm, 'cubeOut')
    end
    if curBeat == 1152 then
        windowTweenX(1920, 60 / bpm, 'cubeOut', true)
        windowTweenY(1080, 60 / bpm, 'cubeOut', true)
    end
    if curBeat == 1280 then
        windowTweenX(1280, 120 / bpm, 'cubeOut', true)
        windowTweenY(720, 120 / bpm, 'cubeOut', true)
    end
    if curBeat == 1284 then
        windowTweenX(320, 120 / bpm, 'cubeOut')
        windowTweenY(180, 120 / bpm, 'cubeOut')
    end
    if curBeat >= 1504 and curBeat < 1568 then
        if curBeat % 4 == 2 then
            setProperty('windowPropertys.y', 240)
            windowTweenY(180, 100 / bpm, 'cubeOut')
        end
    end
    if curBeat >= 1664 and curBeat < 1696 then
        if curBeat % 2 == 0 then
            setProperty('windowPropertys.y', 240)
            windowTweenY(180, 100 / bpm, 'cubeOut')
        end
    end
    if curBeat >= 1696 and curBeat < 1760 then
        if curBeat % 16 >= 8 then
            if curBeat % 2 == 0 then
                setProperty('windowPropertys.y', 240)
                windowTweenY(180, 100 / bpm, 'cubeOut')
            end
        end
    end
    if curBeat >= 1760 and curBeat < 1888 then
        if curBeat % 2 == 0 then
            setProperty('windowPropertys.y', 240)
            windowTweenY(180, 100 / bpm, 'cubeOut')
        end
    end
    if curBeat == 1952 then
        windowTweenX(750, 240 / bpm, 'cubeOut', true)
        windowTweenY(750 * 0.5625, 240 / bpm, 'cubeOut', true)
    end
    if curBeat == 1960 then
        centerWindowX(240 / bpm, 'cubeOut')
        centerWindowY(240 / bpm, 'cubeOut')
    end
    if curBeat == 2112 then
        windowTweenX(800, 240 / bpm, 'cubeOut', true)
        windowTweenY(800 * 0.5625, 240 / bpm, 'cubeOut', true)
    end
    if curBeat == 2144 then
        doTweenX('modchartOffset', 'modchartOffset', 1440, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2176 then
        doTweenX('modchartOffset', 'modchartOffset', 480, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2184 then
        doTweenX('modchartOffset', 'modchartOffset', 1440, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2192 then
        doTweenX('modchartOffset', 'modchartOffset', 480, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2200 then
        doTweenX('modchartOffset', 'modchartOffset', 1440, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2208 then
        doTweenX('modchartOffset', 'modchartOffset', 480, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2216 then
        doTweenX('modchartOffset', 'modchartOffset', 1440, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2224 then
        doTweenX('modchartOffset', 'modchartOffset', 480, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2232 then
        doTweenX('modchartOffset', 'modchartOffset', 1440, 120 / bpm, 'cubeOut')
    end
    if curBeat == 2236 then
        windowTweenX(320, 240 / bpm, 'cubeOut')
        windowTweenY(180, 240 / bpm, 'cubeOut')
    end
    if curBeat == 2240 then
        windowTweenX(1280, 240 / bpm, 'cubeOut', true)
        windowTweenY(720, 240 / bpm, 'cubeOut', true)
    end
end
function onStepHit()
    if curStep >= 2048 and curStep < 2304 then
        if curStep % 64 == 0 then
            windowTweenX(getRandomInt(0, 1920 - getProperty('windowPropertys.scale.x')), 60 / bpm, 'cubeOut')
            windowTweenY(getRandomInt(0, 1080 - getProperty('windowPropertys.scale.y')), 60 / bpm, 'cubeOut')
        end
        if curStep % 64 == 8 then
            windowTweenX(getRandomInt(0, 1920 - getProperty('windowPropertys.scale.x')), 60 / bpm, 'cubeOut')
            windowTweenY(getRandomInt(0, 1080 - getProperty('windowPropertys.scale.y')), 60 / bpm, 'cubeOut')
        end
        if curStep % 64 == 16 then
            windowTweenX(getRandomInt(0, 1920 - getProperty('windowPropertys.scale.x')), 60 / bpm, 'cubeOut')
            windowTweenY(getRandomInt(0, 1080 - getProperty('windowPropertys.scale.y')), 60 / bpm, 'cubeOut')
        end
        if curStep % 64 == 22 then
            windowTweenX(getRandomInt(0, 1920 - getProperty('windowPropertys.scale.x')), 60 / bpm, 'cubeOut')
            windowTweenY(getRandomInt(0, 1080 - getProperty('windowPropertys.scale.y')), 60 / bpm, 'cubeOut')
        end
        if curStep % 64 == 28 then
            windowTweenX(getRandomInt(0, 1920 - getProperty('windowPropertys.scale.x')), 60 / bpm, 'cubeOut')
            windowTweenY(getRandomInt(0, 1080 - getProperty('windowPropertys.scale.y')), 60 / bpm, 'cubeOut')
        end
    end
    if curStep >= 8192 and curStep < 8416 then
        if curStep % 32 == 0 then
            setProperty('windowPropertys.x', getProperty('windowPropertys.x') + getRandomInt(100, -100))
            setProperty('windowPropertys.y', getProperty('windowPropertys.y') + getRandomInt(100, -100))
            centerWindowX(80 / bpm, 'cubeOut')
            centerWindowY(80 / bpm, 'cubeOut')
        end
        if curStep % 32 == 6 then
            setProperty('windowPropertys.x', getProperty('windowPropertys.x') + getRandomInt(100, -100))
            setProperty('windowPropertys.y', getProperty('windowPropertys.y') + getRandomInt(100, -100))
            centerWindowX(80 / bpm, 'cubeOut')
            centerWindowY(80 / bpm, 'cubeOut')
        end
        if curStep % 32 == 12 then
            setProperty('windowPropertys.x', getProperty('windowPropertys.x') + getRandomInt(100, -100))
            setProperty('windowPropertys.y', getProperty('windowPropertys.y') + getRandomInt(100, -100))
            centerWindowX(80 / bpm, 'cubeOut')
            centerWindowY(80 / bpm, 'cubeOut')
        end
        if curStep % 32 == 18 then
            setProperty('windowPropertys.x', getProperty('windowPropertys.x') + getRandomInt(100, -100))
            setProperty('windowPropertys.y', getProperty('windowPropertys.y') + getRandomInt(100, -100))
            centerWindowX(80 / bpm, 'cubeOut')
            centerWindowY(80 / bpm, 'cubeOut')
        end
        if curStep % 32 == 24 then
            setProperty('windowPropertys.x', getProperty('windowPropertys.x') + getRandomInt(100, -100))
            setProperty('windowPropertys.y', getProperty('windowPropertys.y') + getRandomInt(100, -100))
            centerWindowX(50 / bpm, 'cubeOut')
            centerWindowY(50 / bpm, 'cubeOut')
        end
        if curStep % 32 == 28 then
            setProperty('windowPropertys.x', getProperty('windowPropertys.x') + getRandomInt(100, -100))
            setProperty('windowPropertys.y', getProperty('windowPropertys.y') + getRandomInt(100, -100))
            centerWindowX(50 / bpm, 'cubeOut')
            centerWindowY(50 / bpm, 'cubeOut')
        end
    end
end