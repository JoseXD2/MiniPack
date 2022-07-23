function onCreate()
makeLuaText('watermark', songName .. " | Masti Minipack (Collab Com FNF BR)", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 20);
    addLuaText('watermark');
end



function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'x', -900);
	end
setProperty('iconP2.visible', false)
setPropertyFromGroup('playerStrums', 0, 'x', 115);
setPropertyFromGroup('playerStrums', 1, 'x', 265);
setPropertyFromGroup('playerStrums', 2, 'x', 905);
setPropertyFromGroup('playerStrums', 3, 'x', 1055);
end


