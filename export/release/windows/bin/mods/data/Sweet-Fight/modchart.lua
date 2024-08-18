local t = 0
function onUpdate(e)
    t = t + e
    setProperty('camHUD.angle', math.sin(t) * 5)
    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1 + math.sin(t + i) * 0.25)
        setPropertyFromGroup('strumLineNotes', i, 'angle', math.sin(t + i) * -5)
        setPropertyFromGroup('strumLineNotes', i, 'direction', 90 + math.sin(t + i) * -5)
        setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.7 + math.sin(t + i) * -0.125)
        setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.7 + math.sin(t + i) * -0.125)
        setPropertyFromGroup('notes', i, 'scale.x', getPropertyFromGroup('strumLineNotes', i, 'scale.x'))
        setPropertyFromGroup('notes', i, 'scale.y', getPropertyFromGroup('strumLineNotes', i, 'scale.y'))
    end
end