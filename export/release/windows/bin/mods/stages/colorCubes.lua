function onCreate()
	makeLuaSprite('ground', 'backgrounds/colorCubes/ground', -600, -300)
	setLuaSpriteScrollFactor('ground', 1, 1)
	addLuaSprite('ground', false)
    setSpriteShader("ground", "wavyBackground")
	setProperty('ground.scale.x', 3)
	setProperty('ground.scale.y', 3)
end
function onUpdate()
    setShaderFloat('ground', "uTime", getSongPosition()/1000)
    setShaderFloat('ground', "uWaveAmplitude", 0.15)
    setShaderFloat('ground', "uSpeed", bpm / 100)
    setShaderFloat('ground', "uFrequency", 5)
end