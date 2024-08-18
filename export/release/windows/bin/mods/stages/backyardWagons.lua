function onCreate()
    makeLuaSprite('blueScreen', nil, 0, 0, 0)
    makeGraphic('blueScreen', screenWidth, screenHeight, '000064')
    setObjectCamera('blueScreen', 'other')
    setProperty('blueScreen.alpha', 0.125)
    addLuaSprite('blueScreen')
	makeLuaSprite('sky', 'backgrounds/backyardWagons/sky', -600, -300)
	setLuaSpriteScrollFactor('sky', 1, 1)
	makeLuaSprite('mountains', 'backgrounds/backyardWagons/mountains', -600, -300)
	setLuaSpriteScrollFactor('mountains', 1, 1)
	makeLuaSprite('ground', 'backgrounds/backyardWagons/ground', -600, -300)
	setLuaSpriteScrollFactor('ground', 1, 1)
	makeLuaSprite('wagons', 'backgrounds/backyardWagons/wagons', -600, -300)
	setLuaSpriteScrollFactor('wagons', 1, 1)
	addLuaSprite('sky', false)
	addLuaSprite('mountains', false)
	addLuaSprite('ground', false)
	addLuaSprite('wagons', true)
	setProperty('sky.scale.x', 2)
	setProperty('sky.scale.y', 2)
end
local mountainsX = -600
local groundX = -600
function onUpdate()
	mountainsX = mountainsX - 10
	groundX = groundX - 50
	setProperty('mountains.x', mountainsX)
	setProperty('ground.x', groundX)
	if mountainsX < -5720 then
		mountainsX = -600
	end
	if groundX < -3160 then
		groundX = -600
	end
end