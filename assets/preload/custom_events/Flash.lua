function onCreate()
	makeLuaSprite('flash2', 'flash2', 0, 0);
	setLuaSpriteScrollFactor('flash2', 0, 0);
	setProperty('flash2.alpha', 0.0001);
	addLuaSprite('flash2', true);
	setObjectCamera('flash2', 'hud');	
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Flash2" then
		setProperty('flash2.alpha', 1);
		doTweenAlpha('tweenCutOffAlpha', 'flash2', 0, 0.5, 'linear');
			setObjectCamera('flash2', 'hud');
	end
end