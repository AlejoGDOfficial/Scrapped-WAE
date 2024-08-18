function onCreate()
    initLuaShader("TVStatic");
    makeLuaSprite("TVStaticGraphic");
    makeGraphic("TVStaticGraphic", screenWidth, screenHeight);
    setSpriteShader("TVStaticGraphic", "TVStatic");
    addHaxeLibrary("ShaderFilter", "openfl.filters");
    makeLuaSprite('TVStaticOffset', nil, 5, 0)
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("TVStaticGraphic").shader)]);
    ]]);
end
local t = 0
function onUpdate(e)
    t = t + e
	setShaderFloat("TVStaticGraphic", "time", t);
	setShaderFloat("TVStaticGraphic", "strength", getProperty('TVStaticOffset.x'));
	setShaderFloat("TVStaticGraphic", "speed", 1);
end
function onBeatHit()
    if curBeat == 64 then
        doTweenX('TVStaticOffset', 'TVStaticOffset', 0, 7680 / bpm)
    end
    if curBeat >= 192 then
        setProperty('TVStaticOffset.x', 0)
    end
end