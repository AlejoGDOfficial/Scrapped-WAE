function opponentNoteHit(id, noteData, noteType, isSustainNote)
    health = getProperty('health')
    if noteType ~= 'No Animation' and songName ~= 'END' and songName ~= 'END 2' and songName ~= 'Dehydrated' then
        if health > 0.2 then
            setProperty('health', health - 0.01125)
        end
    end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType ~= 'No Animation' then
        if isSustainNote then
            setProperty('health', getProperty('health') + 0.01)
        end
    end
end