function onUpdate()
    if getPropertyFromClass('backend.CoolVars', '_developerMode') then
        if getProperty('debugTxt.visible') then
            if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') then
                playSound('scrollMenu', 1, 'pausescroll')
                if botPlay then
                    setProperty('cpuControlled', false)
                    setProperty('botplayTxt.visible', false)
                else
                    setProperty('cpuControlled', true)
                    setProperty('botplayTxt.visible', true)
                end
            end
            if keyboardPressed("Q") then
                setProperty('camGame.zoom', getProperty('camGame.zoom') - 0.01)
            end
            if keyboardPressed("E") then
                setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.01)
            end
        end
        setTextString('debugTxt', 'Current Dad Postion: '..math.floor(getProperty('dad.x'))..', '..math.floor(getProperty('dad.y'))..'\n\nCurrent GF Postion: '..math.floor(getProperty('gf.x'))..', '..math.floor(getProperty('gf.y'))..'\n\nCurrent BF Postion: '..math.floor(getProperty('boyfriend.x'))..', '..math.floor(getProperty('boyfriend.y'))..'\n\nCurrent Zoom: '..callMethodFromClass('backend.CoolUtil', 'floorDecimal', {getProperty('camGame.zoom'), 2})..', '..callMethodFromClass('backend.CoolUtil', 'floorDecimal', {getProperty('camHUD.zoom'), 2})..'\n\nSong Position: '..curSection..', '..curBeat..', '..curStep..'\n\nCurrent BPM: '..curBpm..'\n\nCurrent Window X: '..getPropertyFromClass('openfl.Lib', 'application.window.x')..'\n\nCurrent Window Y: '..getPropertyFromClass('openfl.Lib', 'application.window.y')..'\n\nCurrent Window Width: '..getPropertyFromClass('openfl.Lib', 'application.window.width')..'\n\nCurrent Window Height: '..getPropertyFromClass('openfl.Lib', 'application.window.height'))
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F3') then
        if not getProperty('debugTxt.visible') then
            setProperty('debugTxt.visible', true)
        else
            setProperty('debugTxt.visible', false)
        end
    end
end
function onCreatePost()
    makeLuaText('debugTxt', '',5000, 120, 100);
	setTextAlignment('debugTxt', 'left')
    setTextSize('debugTxt', 20)
    addLuaText('debugTxt', false)
	setObjectCamera('debugTxt', 'camOther')
    setProperty('debugTxt.visible', false)
end