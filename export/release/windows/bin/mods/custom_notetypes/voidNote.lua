function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'voidNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'customNoteTypes/voidNote');
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', 'false');
		end
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'voidNote' then
        setProperty('healthBar.alpha', getProperty('healthBar.alpha') - 0.1)
        setProperty('iconP1.alpha', getProperty('iconP1.alpha') - 0.1)
        setProperty('iconP2.alpha', getProperty('iconP2.alpha') - 0.1)
        setProperty('timer.alpha', getProperty('iconP2.alpha') - 0.1)
        setProperty('scoreTxt.alpha', getProperty('iconP2.alpha') - 0.1)
        setProperty('health', getProperty('health') - 0.1)
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', getRandomFloat(0.5, 1))
        end
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    health = getProperty('health')
    if noteType == 'voidNote' then
        if health > 0.5 then
            setProperty('health', health - 0.1)
        end
    end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    health = getProperty('health')
    if noteType == 'voidNote' then
        if health < 1.5 then
            setProperty('health', health + 0.075)
        end
    end
end