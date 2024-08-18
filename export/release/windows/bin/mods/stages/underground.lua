function onCreate()
	makeLuaSprite('ground', 'backgrounds/underground/ground', -600, -300)
	setLuaSpriteScrollFactor('ground', 1, 1)
	makeLuaSprite('decorations', 'backgrounds/underground/decorations', -600, -300)
	setLuaSpriteScrollFactor('decorations', 1.5, 0.5)
	addLuaSprite('ground', false)
	addLuaSprite('decorations', true)
end
function onCreatePost()
	setProperty('gf.alpha', 0)
end