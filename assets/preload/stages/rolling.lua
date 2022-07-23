local seen = false
local allowCountdown = true

function onCreate()
	makeLuaSprite('greenBG', 'miku/green', -400, -200)
	scaleObject('greenBG', 5, 5)
	addLuaSprite('greenBG', false)

	makeLuaSprite('bg', 'miku/bg', -400, -200)
	scaleObject('bg', 5, 5)
	addLuaSprite('bg', false)

	precacheImage('BF REACH')
	precacheImage('hug')

	addCharacterToList('bf-rg-2', 'bf')
	addCharacterToList('bf-rg-color', 'bf')
	addCharacterToList('miku-rg-color', 'bf')

end

function onCreatePost()
	makeLuaSprite('green', 'miku/green', 0, 0)
	setObjectCamera('green', 'camHud')
	setProperty('green.alpha', 1)
	scaleObject('green', 1280/500, 720/500)

	makeLuaSprite('hug', 'miku/hug', 260, 70)
	setObjectCamera('hug', 'camHud')
	setProperty('hug.alpha', 0.8)
	scaleObject('hug', 1.2, 1.2)

	makeLuaSprite('vignette', 'miku/vignette', 0, 0)
	setObjectCamera('vignette', 'camHud')
	setProperty('vignette.alpha', 0.7)
	addLuaSprite('vignette', true)

	makeAnimatedLuaSprite('overlay', 'miku/overlay', -10, -40)
	addAnimationByPrefix('overlay', 'idle', 'idle', 24, true)
	scaleObject('overlay', 1280/1024, 1.02)
	setObjectCamera('overlay', 'camHud')
	setBlendMode('overlay', 'darken')
	addLuaSprite('overlay', true)
	objectPlayAnimation('overlay', 'idle', true)

end

function onSongStart()
	makeAnimatedLuaSprite('reach', 'miku/BF REACH', 330, 300)
	scaleObject('reach', 1.5, 1.5)
	addAnimationByPrefix('reach', 'reach', 'BF REACH SMOL', 20, false)
end

function onStepHit()
	if curStep == 1304 then
		triggerEvent('Change Character', 0, 'bf-rg-2')
		characterPlayAnim('bf', 'glance')
	end
	if curStep == 1474 then
		triggerEvent('Change Character', 0, 'bf-rg')
	end
	if curStep == 1787 then
		triggerEvent('Change Character', 0, 'bf-rg-2')
		characterPlayAnim('bf', 'glance')
	end
	if curStep == 1882 then
		doTweenAlpha('alphaDAD', 'dad', 0, 0.7, 'circInOut')
		doTweenAlpha('alphaBF', 'boyfriend', 0, 0.7, 'circInOut')
		--doTweenAlpha('alphaCH', 'camHUD', 0, 0.8, 'circInOut')
	end
	if curStep == 1888 then
		addLuaSprite('reach', true)
		objectPlayAnimation('reach', 'reach', true)
	end
	if curStep == 1903 then
		removeLuaSprite('reach')
		addLuaSprite('green', true)
		addLuaSprite('hug', true)

		triggerEvent('Change Character', 1, 'miku-rg-color')
		triggerEvent('Change Character', 0, 'bf-rg-color')
		setProperty('bg.alpha', 0)

		doTweenAlpha('green', 'green', 0, 1.7, 'circInOut')
		doTweenAlpha('hug', 'hug', 0, 2.1, 'circInOut')

		doTweenAlpha('alphaDAD', 'dad', 1, 0.7, 'circInOut')
		doTweenAlpha('alphaBF', 'boyfriend', 1, 0.7, 'circInOut')
	end
end

function onStartCountdown()
	setProperty('gf.alpha', 0)
	return Function_Continue
end