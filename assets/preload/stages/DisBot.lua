function onCreate()
	-- background shit

	
	makeLuaSprite('outsidesky', 'DisBot/outsidesky', -250, -20);
	setLuaSpriteScrollFactor('outsidesky', 0.6, 0.6);

	makeLuaSprite('bridge', 'DisBot/bridge', -90, -60);
	setLuaSpriteScrollFactor('bridge', 1, 1);

	addLuaSprite('outsidesky', false);
	addLuaSprite('bridge', false);

end
