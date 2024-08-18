function onCreate()
    initLuaShader("wavyBackground")
	makeLuaSprite('sky', '/backgrounds/astray/sky', -1450, -700);
	addLuaSprite('sky', false)
	scaleLuaSprite('sky', 2.7, 2.7)
	setScrollFactor('sky', 0, 0)
	scaleObject('sky', 4, 4)
    setSpriteShader("sky", "wavyBackground")
end
function onUpdate()
    setShaderFloat("sky", "uTime", getSongPosition()/1000)
    setShaderFloat("sky", "uWaveAmplitude", 0.15)
    setShaderFloat("sky", "uSpeed", bpm / 500)
    setShaderFloat("sky", "uFrequency", 1)
end