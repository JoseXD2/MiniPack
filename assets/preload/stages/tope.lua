local bruh = true
local alpha = true

function onCreate()
    makeLuaSprite('gray', 'gray', -300, -300)
    addLuaSprite('gray')
    setProperty('gray.alpha', 0.4)
    scaleObject('gray', 4, 4)

    makeLuaSprite('bg', 'bgcolor', -540, -725)
    addLuaSprite('bg', false)
    scaleObject('bg', 2, 2)

    makeLuaSprite('layer', 'Alterlayer2', -540, -725)
    addLuaSprite('layer', true)
    scaleObject('layer', 4, 4)

    addVCREffect('camGame',0.06,true,true,true)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

