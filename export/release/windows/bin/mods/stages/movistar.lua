function onCreate()
	makeLuaSprite('sky', 'backgrounds/movistar/sky', 0, 0);
	setLuaSpriteScrollFactor('sky', 0.75, 0.75)
	addLuaSprite('sky', false)
    setProperty("sky.scale.x", 1.5)
    setProperty("sky.scale.y", 1.5)
    initLuaShader("wavyBackground")
    setSpriteShader("sky", "wavyBackground")
end
function onUpdate()
    setShaderFloat("sky", "uTime", getSongPosition()/1000)
    setShaderFloat("sky", "uWaveAmplitude", 0.1)
    setShaderFloat("sky", "uSpeed", bpm / 100)
    setShaderFloat("sky", "uFrequency", 5)
end