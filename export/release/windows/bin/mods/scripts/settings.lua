function onCreate()
    setProperty('skipArrowStartTween', true)
    
    setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset[0]', -400)
    setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset[1]', -250)
    setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset[2]', -200)
    setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset[3]', -200)
    setPropertyFromClass('backend.ClientPrefs', 'data.downScroll', false)
    setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
    setPropertyFromClass('backend.ClientPrefs', 'data.noReset', true)
end