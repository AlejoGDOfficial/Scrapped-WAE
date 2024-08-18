local t = 0
function onUpdate(e)
    t = t + e
    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'y', 50 + math.sin(t * 2 + i) * 25)
        setPropertyFromGroup('strumLineNotes', i, 'angle', t * 20)
    end
end
function onCreate()
    setProperty('camHUD.alpha', 0)
end
function onSectionHit()
    setProperty('defaultCamZoom', getRandomFloat(0.7, 1))
    setProperty('camHUD.zoom', getRandomFloat(0.7, 1))
    if curSection == 16 then
        setProperty('camHUD.alpha', 1)
    end
    if curSection == 144 then
        doTweenAlpha('camHUD', 'camHUD', 0, 240 / bpm)
    end
end