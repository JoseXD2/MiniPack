function onStepHit()

	if curStep == 60 then
		doTweenAlpha('circInOut', 'camGame', 0, 0.1, 'linear')
        doTweenAlpha('fadeInn', 'camHUD', 0, 0.1, 'linear')
	end
    if curStep == 64 then
		doTweenAlpha('circInOut', 'camGame', 1, 0.000001, 'linear')
        doTweenAlpha('fadeInn', 'camHUD', 1, 0.000001, 'linear')
	end
end



function onCreate()
makeLuaText('watermark', songName .. " | Masti Minipack (Collab Com FNF BR)", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 20);
    addLuaText('watermark');
end