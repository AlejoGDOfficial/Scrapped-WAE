function onStepHit()
    if curStep % 16 == 0 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 4 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 6 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 7 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 9 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 10 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 11 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 12 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
    if curStep % 16 == 14 then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenAlpha('note'..i, i, 0, 60 / bpm)
        end
    end
end