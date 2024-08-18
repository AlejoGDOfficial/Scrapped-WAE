function milliToHuman(milliseconds)
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end
local author = 'Alejo GD Official'
function onCreate()
    if songName == 'Cheating' then
        author = 'Moldy GH'
    end
    if songName == '8-28-63' then
        author = 'Tsuraran'
    end
    if songName == 'Duro 2 Horas' then
        author = 'Faraon Love Shady'
    end
    if songName == 'Spyware' then
        author = 'Naireshi'
    end
    if songName ~= 'Inculeable' then
        makeLuaText('songInfo', author..' - '..songName, 10000, 10, 690)
        setObjectCamera('songInfo', 'camHUD')
        setTextAlignment('songInfo', 'LEFT')
        setProperty('songInfo.alpha', 0.75)
        setTextSize('songInfo', 20)
        addLuaText('songInfo')
    end
    makeLuaText('timer', '', nil, 0, 25)
    setObjectCamera('timer', 'camHUD')
    setProperty('timer.alpha', 0)
    setTextSize('timer', 32)
    addLuaText('timer')
end
function onCountdownTick(counter)
    if songName ~= 'Inculeable' then
        setProperty('iconP1.scale.x', 1 + (0.25 * getProperty('health')))
        setProperty('iconP1.scale.y', 1 - (0.25 * getProperty('health')))
        setProperty('iconP2.scale.x', 1 + (0.25 * (2 - getProperty('health'))))
        setProperty('iconP2.scale.y', 1 - (0.25 * (2 - getProperty('health'))))
        doTweenX('iconP10', 'iconP1.scale', 1, 45 / curBpm, 'cubeOut')
        doTweenY('iconP11', 'iconP1.scale', 1, 45 / curBpm, 'cubeOut')
        doTweenX('iconP20', 'iconP2.scale', 1, 45 / curBpm, 'cubeOut')
        doTweenY('iconP21', 'iconP2.scale', 1, 45 / curBpm, 'cubeOut')
        if counter == 0 then
            doTweenZoom('camGame', 'camGame', getProperty('defaultCamZoom') + 0.1, 60 / curBpm, 'cubeOut')
            doTweenZoom('camHUD', 'camHUD', 1.1, 60 / curBpm, 'cubeOut')
        end
        if counter == 1 then
            setObjectCamera('countdownReady', 'other')
            setProperty('countdownReady.scale.x', 1.5)
            setProperty('countdownReady.scale.y', 1.5)
            doTweenX('countdownReady0', 'countdownReady.scale', 1, 60 / curBpm, 'cubeOut')
            doTweenY('countdownReady1', 'countdownReady.scale', 1, 60 / curBpm, 'cubeOut')
            doTweenZoom('camGame', 'camGame', getProperty('defaultCamZoom') + 0.2, 60 / curBpm, 'cubeOut')
            doTweenZoom('camHUD', 'camHUD', 1.2, 60 / curBpm, 'cubeOut')
        end
        if counter == 2 then
            setObjectCamera('countdownSet', 'other')
            setProperty('countdownSet.scale.x', 1.5)
            setProperty('countdownSet.scale.y', 1.5)
            doTweenX('countdownSet0', 'countdownSet.scale', 1, 60 / curBpm, 'cubeOut')
            doTweenY('countdownSet1', 'countdownSet.scale', 1, 60 / curBpm, 'cubeOut')
            doTweenZoom('camGame', 'camGame', getProperty('defaultCamZoom') + 0.3, 60 / curBpm, 'cubeOut')
            doTweenZoom('camHUD', 'camHUD', 1.3, 60 / curBpm, 'cubeOut')
        end
        if counter == 3 then
            setObjectCamera('countdownGo', 'other')
            setProperty('countdownGo.scale.x', 1.5)
            setProperty('countdownGo.scale.y', 1.5)
            doTweenX('countdownGo0', 'countdownGo.scale', 1, 60 / curBpm, 'cubeOut')
            doTweenY('countdownGo1', 'countdownGo.scale', 1, 60 / curBpm, 'cubeOut')
            doTweenZoom('camGame', 'camGame', getProperty('defaultCamZoom'), 60 / curBpm, 'cubeOut')
            doTweenZoom('camHUD', 'camHUD', 1, 60 / curBpm, 'cubeOut')
        end
    end
end
function onSongStart()
    doTweenAlpha('timer', 'timer', 1, 60 / curBpm)
end
function onUpdate()
    setTextString('timer', milliToHuman(math.floor(getPropertyFromClass('backend.Conductor', 'songPosition') - noteOffset)).. ' / ' .. milliToHuman(math.floor(songLength)))
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('timer.x', (screenWidth / 2) - (getProperty('timer.width') / 2))
end
function onUpdatePost()
    health = getProperty('health')
    if songName ~= 'Inculeable' then
        setTextString('scoreTxt', 'Score: '..score..' | Misses: '..misses..' | Combo: '..combo..' | Health: '..math.floor(50 * getProperty('health'))..'% | Rating: '..getProperty('ratingName')..' ('..string.format("%.2f%%", rating * 100)..') '..getProperty('ratingFC'))
    end
end
function onBeatHit()
    if songName ~= 'Inculeable' then
        setProperty('iconP1.scale.x', 1 + (0.25 * getProperty('health')))
        setProperty('iconP1.scale.y', 1 - (0.25 * getProperty('health')))
        setProperty('iconP2.scale.x', 1 + (0.25 * (2 - getProperty('health'))))
        setProperty('iconP2.scale.y', 1 - (0.25 * (2 - getProperty('health'))))
        doTweenX('iconP10', 'iconP1.scale', 1, 45 / curBpm, 'cubeOut')
        doTweenY('iconP11', 'iconP1.scale', 1, 45 / curBpm, 'cubeOut')
        doTweenX('iconP20', 'iconP2.scale', 1, 45 / curBpm, 'cubeOut')
        doTweenY('iconP21', 'iconP2.scale', 1, 45 / curBpm, 'cubeOut')
    end
end