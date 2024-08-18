function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'screwedVoidNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'customNoteTypes/screwedVoidNote');
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', 'false');
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'screwedVoidNote' then
        setProperty('health', getProperty('health') - 0.01125)
        cameraShake('camHUD', 0.01, 30 / bpm)
        cameraShake('camGame', 0.01, 30 / bpm)
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
    end
end