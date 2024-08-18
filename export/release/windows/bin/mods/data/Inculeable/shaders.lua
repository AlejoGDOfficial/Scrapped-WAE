function onCreate()
    initLuaShader("chromaticAberration")
    makeLuaSprite("chromaticAberrationTexture");
    makeGraphic("chromaticAberrationTexture", screenWidth, screenHeight);
    setSpriteShader("chromaticAberrationTexture", "chromaticAberration");
    
    addHaxeLibrary("ShaderFilter", "openfl.filters");
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("chromaticAberrationTexture").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("chromaticAberrationTexture").shader)]);
    ]]);
end

local t = 0

function onUpdate(e)
    t = t + e

	setShaderFloat("chromaticAberrationTexture", "rOffset", 0.002 + math.sin(t) * 0.0005);
	setShaderFloat("chromaticAberrationTexture", "gOffset", 0)
	setShaderFloat("chromaticAberrationTexture", "bOffset", -0.002 + math.cos(t) * -0.0005);
end