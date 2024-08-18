function onCreate()
    makeLuaSprite('purpleScreen', nil, 0, 0, 0)
    makeGraphic('purpleScreen', screenWidth, screenHeight, '5E00FF')
    setObjectCamera('purpleScreen', 'other')
    setProperty('purpleScreen.alpha', 0.075)
    addLuaSprite('purpleScreen')
    initLuaShader("wavyBackground")
	makeLuaSprite('ground', 'backgrounds/thearchy/ground', -800, -300);
	setScrollFactor('ground', 1, 1);
	addLuaSprite('ground', false)
	setProperty('ground.scale.x', 3)
	setProperty('ground.scale.y', 3)
    setSpriteShader("ground", "wavyBackground")
end
function onUpdate()
    setShaderFloat("ground", "uTime", getSongPosition()/1000)
    setShaderFloat("ground", "uWaveAmplitude", 0.15)
    setShaderFloat("ground", "uSpeed", bpm / 100)
    setShaderFloat("ground", "uFrequency", 5)
end