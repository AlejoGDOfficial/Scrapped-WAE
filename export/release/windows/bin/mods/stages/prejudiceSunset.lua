function onCreate()
	makeLuaSprite('sky', 'backgrounds/prejudiceSunset/sky', -300, 0)
	setLuaSpriteScrollFactor('sky', 0.25, 0.25)
	addLuaSprite('sky', false)
	setProperty('sky.scale.x', 2)
	setProperty('sky.scale.y', 2)
	makeLuaSprite('shittyJeep0', 'backgrounds/prejudiceSunset/shittyJeep0', -350, 700)
	setLuaSpriteScrollFactor('shittyJeep0', 1, 1)
	addLuaSprite('shittyJeep0', false)
	makeLuaSprite('shittyJeep1', 'backgrounds/prejudiceSunset/shittyJeep1', 300, 750)
	setLuaSpriteScrollFactor('shittyJeep1', 1, 1)
	addLuaSprite('shittyJeep1', false)
	setObjectOrder('sky', 1)
	setObjectOrder('shittyJeep0', 2)
	setObjectOrder('dad', 3)
	setObjectOrder('shittyJeep1', 4)
	setObjectOrder('boyfriend', 5)
end
function onCreatePost()
	setProperty('gf.alpha', 0)
end
local t = 0
function onUpdate(e)
    t = t + e
    setProperty('shittyJeep0.x', -350 + math.sin(t) * 200)
    setProperty('shittyJeep1.x', 300 - math.sin(t) * 200)
    setProperty('dad.x', 180 + math.sin(t) * 200)
    setProperty('boyfriend.x', 670 - math.sin(t) * 200)
    setProperty('shittyJeep0.y', 700 + math.cos(t * 4) * 25)
    setProperty('shittyJeep1.y', 750 - math.cos(t * 4) * 25)
    setProperty('dad.y', 170 + math.cos(t * 4) * 25)
    setProperty('boyfriend.y', -20 - math.cos(t * 4) * 25)
end