local bruh = true
local alpha = true

function onCreate()
    makeLuaSprite('gray', 'gray', -300, -300)
    addLuaSprite('gray')
    setProperty('gray.alpha', 0.4)
    scaleObject('gray', 4, 4)

    makeLuaSprite('bg', 'bg', -540, -725)
    addLuaSprite('bg', false)
    scaleObject('bg', 2, 2)

    makeLuaSprite('layer', 'layer', -540, -725)
    addLuaSprite('layer', true)
    scaleObject('layer', 2, 2)

end

