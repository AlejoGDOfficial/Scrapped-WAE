function boundTo(value, min, max)
	return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i) return from+(to-from)*i end

function setChrome(chromeOffset)
	setShaderFloat("temporaryShader", "rOffset", chromeOffset);
	setShaderFloat("temporaryShader", "gOffset", 0.0);
	setShaderFloat("temporaryShader", "bOffset", chromeOffset * -1);
end

function onCreatePost()
	--luaDebugMode = true;
	if (shadersEnabled) then
		initLuaShader("chromaticAberration");
		
		makeLuaSprite("temporaryShader");
		makeGraphic("temporaryShader", screenWidth, screenHeight);
		
		setSpriteShader("temporaryShader", "chromaticAberration");
		
		addHaxeLibrary("ShaderFilter", "openfl.filters");
		runHaxeCode([[
			trace(ShaderFilter);
			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
			game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
		]]);
	end

end

function onEvent(n,v1,v2)


	if n == 'chromaticAberration' then

		local Chromacrap = 0;


		Chromacrap = Chromacrap + v1; -- edit this


		function onUpdate(elapsed)
			if (shadersEnabled) then
				Chromacrap = math.lerp(Chromacrap, 0, boundTo(elapsed * v2, 0, 1));
				setChrome(Chromacrap);
			end
		end
	end



end