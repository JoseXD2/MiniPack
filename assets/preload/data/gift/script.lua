function onCreate()
    runTimer('invisTime', 118.91, 1)
	makeLuaSprite('thedeathofmarkheathcliff', 'thedeathofmarkheathcliff', -550, 50);
	addLuaSprite('thedeathofmarkheathcliff', true);
	scaleObject('thedeathofmarkheathcliff', 999, 999);
	doTweenAlpha('thedeathofmarkheathcliff', 'thedeathofmarkheathcliff', 0, 0.00001, 'linear')

  if getPropertyFromClass('ClientPrefs', 'downScroll', true) then
	makeLuaText('dead', '3:33', '300', 590, 675)
    else
	makeLuaText('dead', '3:33', '300', 590, 19)
    end
    setTextAlignment('dead', 'left')
    setTextSize('dead', '34')
    setObjectCamera('dead', 'camHud')
	addLuaText('dead', true)
	doTweenAlpha('dead', 'dead', 0, 0.00001, 'linear')

  if getPropertyFromClass('ClientPrefs', 'downScroll', true) then
	makeLuaText('error', 'ERRORCODE: 333 | Combo Breaks: 333 | Accuracy: 3.33%', '700', 300, 115)
    else
	makeLuaText('error', 'ERRORCODE: 333 | Combo Breaks: 333 | Accuracy: 3.33%', '700', 300, 675)
    end
    setTextAlignment('error', 'left')
    setTextSize('error', '20')
    setObjectCamera('error', 'camHud')
	addLuaText('error', true)
	doTweenAlpha('error', 'error', 0, 0.00001, 'linear')

	--setProperty('healthBar.flipX', true)
	--setProperty('healthBarBG.flipX', true)
	--setProperty('iconP1.flipX', true)
	--setProperty('iconP2.flipX', true)
end

function onCreatePost()
	runTimer('invisTime', 118.91, 1)
	setProperty('gf.visible', false)
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'invisTime' then
		setProperty('timeTxt.visible', false)
		setProperty('scoreTxt.visible', false)
	end
end

function onUpdate()
    --Player Notes

    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 650, 0.025)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 650, 0.025)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 650, 0.025)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 650, 0.025)

    --Opponent Notes

    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 650, 0.025)
    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 650, 0.025)
    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 650, 0.025)
    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 650, 0.025)
end

function onStepHit()
	if curStep == 1280 then
	doTweenAlpha('thedeathofmarkheathcliff', 'thedeathofmarkheathcliff', 1, 0.00001, 'linear')
	doTweenAlpha('dead', 'dead', 1, 0.00001, 'linear')
	doTweenAlpha('error', 'error', 1, 0.00001, 'linear')
	end
end




function onCreate()
makeLuaText('watermark', songName .. " | Masti Minipack (Collab Com FNF BR)", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 20);
    addLuaText('watermark');
end


