local boomSpeed = 4
local boomZoom = 0
local widthMultiplier = 1
local heightMultiplier = 1
function onCreate()
    widthMultiplier = 1920 / desktopWidth
    heightMultiplier = 1080 / desktopHeight
    setPropertyFromClass('lime.app.Application', 'current.window.fullscreen', false)
    setProperty('gf.alpha', 0)
    makeLuaSprite('windowReference', nil, 90, 100)
    makeGraphic('windowReference', 1, 1, 'FFFFFF')
    setProperty('windowReference.alpha', 0)
    setProperty('windowReference.x', 480)
    setProperty('windowReference.y', 270)
    addLuaSprite('windowReference', true)
	setPropertyFromClass('openfl.Lib','application.window.width', 960 / widthMultiplier) 
	setPropertyFromClass('openfl.Lib','application.window.height', 540 / heightMultiplier) 
    setObjectCamera('songInfo', 'camHUD')
    setTextAlignment('songInfo', 'LEFT')
    setProperty('songInfo.alpha', 0.75)
    setTextSize('songInfo', 20)
    setTextFont('songInfo', 'vcr0')
    setTextFont('timer', 'vcr0')
    setTextFont('Credits', 'vcr0')
    setTextFont('scoreTxt', 'vcr0')
    setTextFont('botplayTxt', 'vcr0')
    setTextColor('botplayTxt', 'FF0000')
    addLuaText('songInfo')
    setProperty('dad.x', 50)
    setProperty('dad.alpha', 0)
    setProperty('iconP2.alpha', 0)
end
local t = 0
function onUpdate(e)
    t = t + e
    setProperty('dad.x', -300 + math.sin(t * 2) * 100)
    setProperty('dad.y', -200 + math.cos(t * 2) * 100)
    if curBeat >= 96 and curBeat < 224 then
        setProperty('windowReference.x', 480 + math.sin(t * -2) * 200)
        setProperty('windowReference.y', 270 + math.cos(t * -2) * 200)
    end
    if curBeat >= 480 and curBeat < 544 then
        setProperty('windowReference.x', 480 + math.sin(t * 4) * 100)
        setProperty('windowReference.y', 270 + math.cos(t) * 200)
    end
    if curBeat >= 640 and curBeat and curBeat < 768 then
        setProperty('windowReference.x', 480 + math.sin(t * 4) * 300)
        setProperty('windowReference.y', 270 + math.cos(t * 4) * 200)
    end
    if curBeat >= 768 and curBeat < 848 then
        setProperty('windowReference.x', 480 + math.sin(t) * 300)
        setProperty('windowReference.y', 270 + math.cos(t * 4) * 200)
    end
	setPropertyFromClass('openfl.Lib', 'application.window.x', getProperty('windowReference.x') / widthMultiplier)
	setPropertyFromClass('openfl.Lib', 'application.window.y', getProperty('windowReference.y') / heightMultiplier)
end
function onBeatHit()
    if curBeat % boomSpeed == 0 then
        triggerEvent("Add Camera Zoom", boomZoom / 100, boomZoom / 100)
    end
    if curBeat == 6 then
        noteTweenAlpha('note0', 0, 0, 60 / bpm)
        noteTweenAlpha('note1', 1, 0, 60 / bpm)
    end
    if curBeat == 8 then
        noteTweenAlpha('note2', 2, 0, 60 / bpm)
    end
    if curBeat == 14 then
        noteTweenAlpha('note3', 3, 0, 60 / bpm)
    end
    if curBeat == 16 then
        noteTweenAlpha('note4', 4, 0, 60 / bpm)
    end
    if curBeat == 22 then
        noteTweenAlpha('note5', 5, 0, 60 / bpm)
    end
    if curBeat == 23 then
        noteTweenAlpha('note6', 6, 0, 60 / bpm)
    end
    if curBeat == 24 then
        noteTweenAlpha('note7', 7, 0, 60 / bpm)
        doTweenY('windowReference', 'windowReference', 1080, 480 / bpm, 'backIn')
    end
    if curBeat == 30 then
        doTweenX('dad0', 'dad', 100, 120 / bpm, 'cubeOut')
        doTweenAlpha('dad1', 'dad', 1, 120 / bpm)
        doTweenAlpha('iconP2', 'iconP2', 1, 120 / bpm)
    end
    if curBeat == 32 then
        setProperty('windowReference.y', -540)
        doTweenY('windowReference', 'windowReference', 270, 960 / bpm, 'backOut')
        boomZoom = 1
    end
    if curBeat >= 64 and curBeat < 96 then
        if curBeat % 8 == 0 then
            doTweenX('windowReference', 'windowReference', 380, 240 / bpm, 'cubeOut')
        end
        if curBeat % 8 == 4 then
            doTweenX('windowReference', 'windowReference', 580, 240 / bpm, 'cubeOut')
        end
    end
    if curBeat == 64 then
        for i = 0, 7 do
            noteTweenY('note1'..i, i, 50, 120 / bpm, 'cubeOut')
            setPropertyFromGroup('strumLineNotes', i, 'y', 0)
            noteTweenAlpha('note0'..i, i, 1, 120 / bpm)
        end
    end
    if curBeat == 224 then
        setProperty('windowReference.y', 270)
    end
    if curBeat >= 224 and curBeat < 352 then
        if curBeat % 32 == 0 then
            setProperty('windowReference.x', 1920)
            doTweenX('windowReference', 'windowReference', 960, 480 / bpm, 'cubeOut')
        end
        if curBeat % 32 == 8 then
            doTweenX('windowReference', 'windowReference', 1920, 480 / bpm, 'cubeIn')
        end
        if curBeat % 32 == 16 then
            setProperty('windowReference.x', -960)
            doTweenX('windowReference', 'windowReference', 0, 480 / bpm, 'cubeOut')
        end
        if curBeat % 32 == 24 then
            doTweenX('windowReference', 'windowReference', -960, 480 / bpm, 'cubeIn')
        end
    end
    if curBeat == 352 then
        setProperty('windowReference.y', 1080)
        setProperty('windowReference.x', 480)
    end
    if curBeat >= 352 and curBeat < 416 then
        if curBeat % 16 == 0 then
            setProperty('windowReference.y', 1080)
            doTweenY('windowReference', 'windowReference', 270, 480 / bpm, 'backOut')
        end
        if curBeat % 16 == 8 then
            doTweenY('windowReference', 'windowReference', -1080, 480 / bpm, 'backIn')
        end
    end
    if curBeat >= 416 and curBeat < 480 then
        if curBeat % 16 == 0 then
            setProperty('windowReference.x', -960)
            setProperty('windowReference.y', 270)
            doTweenX('windowReference', 'windowReference', 480, 120 / bpm, 'cubeIn')
        end
        if curBeat % 16 == 2 then
            doTweenX('windowReference', 'windowReference', -960, 120 / bpm, 'cubeOut')
        end
        if curBeat % 16 == 4 then
            setProperty('windowReference.x', 480)
            setProperty('windowReference.y', 1080)
            doTweenY('windowReference', 'windowReference', 270, 120 / bpm, 'cubeIn')
        end
        if curBeat % 16 == 6 then
            doTweenY('windowReference', 'windowReference', 1080, 120 / bpm, 'cubeOut')
        end
        if curBeat % 16 == 8 then
            setProperty('windowReference.y', -540)
            doTweenY('windowReference', 'windowReference', 270, 120 / bpm, 'cubeIn')
        end
        if curBeat % 16 == 10 then
            doTweenY('windowReference', 'windowReference', -540, 120 / bpm, 'cubeOut')
        end
        if curBeat % 16 == 12 then
            setProperty('windowReference.x', 1920)
            setProperty('windowReference.y', 270)
            doTweenX('windowReference', 'windowReference', 480, 120 / bpm, 'cubeIn')
        end
        if curBeat % 16 == 14 then
            doTweenX('windowReference', 'windowReference', 1920, 120 / bpm, 'cubeOut')
        end
    end
    if curBeat == 480 then
        doTweenX('windowReference', 'windowReference', 480, 240 / bpm, 'cubeOut')
    end
    if curBeat >= 848 and curBeat < 976 then
        if curBeat % 16 == 0 then
            setProperty('windowReference.x', 1920)
            setProperty('windowReference.y', 270)
            doTweenX('windowReference', 'windowReference', 480, 120 / bpm, 'cubeOut')
        end
        if curBeat % 16 == 2 then
            doTweenX('windowReference', 'windowReference', -960, 120 / bpm, 'cubeIn')
        end
        if curBeat % 16 == 4 then
            setProperty('windowReference.x', 480)
            setProperty('windowReference.y', 1080)
            doTweenY('windowReference', 'windowReference', 270, 120 / bpm, 'cubeOut')
        end
        if curBeat % 16 == 6 then
            doTweenY('windowReference', 'windowReference', -540, 120 / bpm, 'cubeIn')
        end
        if curBeat % 16 == 8 then
            setProperty('windowReference.x', -960)
            setProperty('windowReference.y', 270)
            doTweenX('windowReference', 'windowReference', 480, 120 / bpm, 'cubeOut')
        end
        if curBeat % 16 == 10 then
            doTweenX('windowReference', 'windowReference', 1920, 120 / bpm, 'cubeIn')
        end
        if curBeat % 16 == 12 then
            setProperty('windowReference.x', 480)
            setProperty('windowReference.y', -540)
            doTweenY('windowReference', 'windowReference', 270, 120 / bpm, 'cubeOut')
        end
        if curBeat % 16 == 14 then
            doTweenY('windowReference', 'windowReference', 1080, 120 / bpm, 'cubeIn')
        end
    end
    if curBeat == 976 then
        doTweenX('windowReference0', 'windowReference', 480, 120 / bpm, 'cubeOut')
        doTweenY('windowReference1', 'windowReference', 270, 120 / bpm, 'cubeOut')
    end
end
function onSectionHit()
    if not mustHitSection then
        setTextColor('scoreTxt', 'F7D2FE')
    end
    if mustHitSection then
        setTextColor('scoreTxt', '31B0D1')
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote then
        setProperty('health', getRandomFloat(0.25, 1))
    end
    if curBeat >= 544 and curBeat < 640 then
        if noteData == 0 then
            doTweenX('windowReference0', 'windowReference', 0, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 270, 120 / bpm, 'cubeOut')
        end
        if noteData == 1 then
            doTweenX('windowReference0', 'windowReference', 480, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 540, 120 / bpm, 'cubeOut')
        end
        if noteData == 2 then
            doTweenX('windowReference0', 'windowReference', 480, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 0, 120 / bpm, 'cubeOut')
        end
        if noteData == 3 then
            doTweenX('windowReference0', 'windowReference', 960, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 270, 120 / bpm, 'cubeOut')
        end
    end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if curBeat >= 544 and curBeat < 640 then
        if noteData == 0 then
            doTweenX('windowReference0', 'windowReference', 0, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 270, 120 / bpm, 'cubeOut')
        end
        if noteData == 1 then
            doTweenX('windowReference0', 'windowReference', 480, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 540, 120 / bpm, 'cubeOut')
        end
        if noteData == 2 then
            doTweenX('windowReference0', 'windowReference', 480, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 0, 120 / bpm, 'cubeOut')
        end
        if noteData == 3 then
            doTweenX('windowReference0', 'windowReference', 960, 120 / bpm, 'cubeOut')
            doTweenY('windowReference1', 'windowReference', 270, 120 / bpm, 'cubeOut')
        end
    end
end
local message = nil
function onGameOverStart()
    message = math.floor(getRandomInt(0, 8))
    io.output('message.txt')
    if message == 1 then
        io.write('Idiot')
    end
    if message == 2 then
        io.write('MAMAHUEVO')
    end
    if message == 3 then
        io.write('PIECE OF SHIT')
    end
    if message == 4 then
        io.write('Cheater')
    end
    if message == 5 then
        io.write('U LIAR')
    end
    if message == 6 then
        io.write('SCREW YOU')
    end
    if message == 7 then
        io.write('Bonzi Engine')
    end
    if message == 8 then
        io.write('¿¡ä, ë, ï, ö, ü, á, é, í, ó, ú, ñ!?')
    end
    io.close()
    os.execute('message.txt')
end