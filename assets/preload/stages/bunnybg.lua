local xx = 300
local yy = 350
local xx2 = 400
local yy2 = 350
local ofs = 30
local followchars = true


function onCreate()

	precacheImage('bg/minion');
	precacheImage('bg/smoke');

	makeLuaSprite('back', 'bg/bg', -600, -300);
	setScrollFactor('back', 0.9, 0.9);
	scaleObject('back', 0.66, 0.66);
	makeLuaSprite('floor', 'bg/floor', -600, -300);
	scaleObject('floor', 1.32, 1.32);
	makeLuaSprite('fg', 'bg/foreground', -600, -300);
	setScrollFactor('fg', 0.9, 0.9);
	scaleObject('fg', 1.32, 1.32);
	makeLuaSprite('spotlight', 'bg/spotlight', -600, -300);
	setBlendMode('spotlight', 'add');
	scaleObject('spotlight', 0.66, 0.66);
	
	makeAnimatedLuaSprite('dust','bg/dust', -10, 250);
	addAnimationByPrefix('dust','bop','dust', 12, false);
	scaleObject('dust', 0.8, 0.8);
	
	makeAnimatedLuaSprite('goober1','bg/minion', -800, 50);
    addAnimationByPrefix('goober1','appear','minion entrance', 12, false);
	addAnimationByPrefix('goober1','bop','minion0', 12, true);
	addAnimationByPrefix('goober1','death','minion death', 12, false);
	setProperty('goober1.flipX', true);
	
	makeAnimatedLuaSprite('goober2','bg/minion', 750, 50);
    addAnimationByPrefix('goober2','appear','minion entrance', 12, false);
	addAnimationByPrefix('goober2','bop','minion0', 12, true);
	addAnimationByPrefix('goober2','death','minion death', 12, false);
	
	makeAnimatedLuaSprite('smoke','bg/smoke', -500, 40);
	addAnimationByPrefix('smoke','bop','smoke idle', 1, true);
	addAnimationByPrefix('smoke','shootR','smoke shoot0', 12, false);
	addAnimationByPrefix('smoke','shootL','smoke shoot 2', 12, false);
	setProperty('smoke.alpha', 0);
	
	makeAnimatedLuaSprite('smokeappear','bg/smoke', -500, -60);
    addAnimationByPrefix('smokeappear','appear','smoke entrance', 12, false);
	setProperty('smokeappear.alpha', 0);
	
	addLuaSprite('back', false);
	addLuaSprite('smokeappear', false);
	addLuaSprite('floor', false);
	
	--layering
	setObjectOrder('gfGroup', '3');
	addLuaSprite('dust', false);
	setObjectOrder('dust', '4');
	setObjectOrder('boyfriendGroup', '5');
	setObjectOrder('dadGroup', '6');
	
	addLuaSprite('fg', true);
	addLuaSprite('spotlight', true);
	addLuaSprite('smoke', false);
	addLuaSprite('goober1', true);
	addLuaSprite('goober2', true);
	
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bundeath');
	
end

function onCreatePost()
	objectPlayAnimation('goober1','bop',false);
	objectPlayAnimation('goober2','bop',false);
	objectPlayAnimation('smoke','bop',false);
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('dust', 'bop');
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
		objectPlayAnimation('dust', 'bop');
	end
end

function onEvent(name, value1, value2)
	if name == "missme" then
		setProperty('smokeappear.alpha', 1);
		objectPlayAnimation('smokeappear','appear',false);
		runTimer('smokeappearance', 0.45, 1);
	end
	if name == "headshot" then --cant spam these because goofy aah
		jeepers = tonumber(value1)
		cameraShake('camGame', 0.05, 0.1);
		playSound('gun', 0.5);
		if jeepers == 0 then
			objectPlayAnimation('goober1','death',true);
			objectPlayAnimation('smoke','shootL',false);
			setProperty('smoke.x', -610);
			setProperty('smoke.y', -40);
			funny = math.random(1.25,1.55);
			runTimer('revive1', funny, 1);
			runTimer('smokereset', 0.3, 1);
		elseif jeepers == 1 then
			objectPlayAnimation('goober2','death',true);
			setProperty('smoke.x', -520);
			setProperty('smoke.y', -120);
			objectPlayAnimation('smoke','shootR',false);
			funny2 = math.random(1.25,1.55);
			runTimer('revive2', funny2, 1);
			runTimer('smokereset', 0.3, 1);
		elseif jeepers == 2 then
			lolmao = math.random(0,1);
			triggerEvent('headshot',lolmao);
		end
	end
end

function onUpdate(elapsed)
	
	if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
      end	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'smokeappearance' then
		setProperty('smoke.alpha', 1);
		setProperty('smokeappear.alpha', 0);
	end
    if tag == 'revive1' then
		setProperty('goober1.x', -950);
		setProperty('goober1.y', 100);
		objectPlayAnimation('goober1','appear',false);
		runTimer('bopreset1', 0.5, 1);
	end
    if tag == 'revive2' then
		setProperty('goober2.x', 690);
		setProperty('goober2.y', 100);
		objectPlayAnimation('goober2','appear',false);
		runTimer('bopreset2', 0.5, 1);
	end
	if tag == 'bopreset1' then
		setProperty('goober1.x', -800);
		setProperty('goober1.y', 50);
		objectPlayAnimation('goober1','bop',false);
	end
	if tag == 'bopreset2' then
		setProperty('goober2.x', 750);
		setProperty('goober2.y', 50);
		objectPlayAnimation('goober2','bop',false);
	end
	if tag == 'smokereset' then
		objectPlayAnimation('smoke','bop',false);
		setProperty('smoke.x', -500);
		setProperty('smoke.y', 40);
	end
end