function onBeatHit()
 --GAME EVENTS

    -- Pibby Idle
    if curBeat % 2 == 0 then
		objectPlayAnimation('pibby', 'idle');
	end
        

    -- Remove Pibby and Bring forward Pinkie & Pibby
    if curBeat == 108 then
    setObjectOrder('gfGroup', 7);
    
    setObjectOrder('pibby', 0);
    end
    
    if not lowQuality then
        -- Spotlight over Pinkie and BF
        if curBeat == 312 then
            -- move spotlight
            doTweenX('spotlightx', 'spotlight1', -2810, 0.0001, 'linear');
            doTweenY('spotlighty', 'spotlight1', -2020, 0.0001, 'linear');
        
            -- Flip spotlight
            scaleObject('spotlight1', 3.6, 4);
            
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 0.7, 1, 'linear');
        end

        --Remove Bf and Pinkie Spotlight
        if curBeat == 344 then
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 0, 1, 'linear');
        end

        -- End Laser Animation
        if curBeat == 248 then
            -- hide animation
            --setObjectOrder('twilightSpeaks', 0);
            --show gameplay sprite
            --setObjectOrder('dadGroup', 15);

            end

end
        -- Make Screen cut to Black
        if curBeat == 468 then
            if not lowQuality then
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 1, 0.01, 'linear');
            doTweenX('spotlightx', 'spotlight1', -1000, 0.0001, 'linear');
            cameraFade('game', '000000', 0.005, true);
            doTweenAlpha('turnOff', 'glitch', 1, 0.2, 'linear');
            else
            cameraFade('game', '000000', 0.005, true);
            end
        end
    --end


    
end





function onStepHit()
	
    -- Twilight Spotlight Start
    if curStep == 130 then
        if not lowQuality then
        doTweenAlpha('spotlightAlphaTween', 'spotlight1', 1, 0.00001, 'linear');
        end
        doTweenColor('twiBlack', "dad", 'FFFFFF', 0.01, 'linear');
    end

if not lowQuality then
        -- Twilight Spotlight End
        if curStep == 170 then
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 0, 1, 'linear');
        end

        -- Friendship Problem ZOOM
        if curStep == 971 then

            doTweenZoom('screenZoom', 'camGame', 1, 1.8, 'quintOut');
        end

    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	--Damage increase when miss
	if getProperty('dad.animation.curAnim.name') == 'shoot' then
		if difficulty == 2 then
            setProperty('health',getProperty('health')-0.08);
        elseif difficulty == 1 then
            setProperty('health',getProperty('health')-0.05);
        elseif difficulty == 0 then
            setProperty('health',getProperty('health')-0.03);
        end
        --doTweenColor('healthTween', 'boyfriend', '800080', 0.2, 'quintInOut');
        --noteTweenY('fallTween' .. direction, direction + 4, getProperty('note' .. '.y')+ 10, 0.5, 'bounceOut');
    --end
	end

    -- Miss Effects
        if direction == 0 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch0', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch
            else
                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke0', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
                playSound('missleft', 1);-- Plays miss sound
            
                
        elseif direction == 1 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    -- if twilight is shooting
                
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch1', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch

            else                                                            -- if a regular miss

                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke1', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
            playSound('missdown', 1);
            
        elseif direction == 2 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch2', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch
            else
                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke2', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
            playSound('missup', 1);
            
        elseif direction == 3 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch3', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch
            else
                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke3', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
            playSound('missright', 1);
            
        end
end

function onTweenCompleted(tag) 
    if tag == 'missTween' then
        doTweenColor('normalbf', 'boyfriend', 'FFFFFF', 1, 'quintOut');
    end

    if (tag == 'broke0') or (tag == 'glitch0') then
        noteTweenAngle('fix0', 4, 0, 1, 'quadInOut');
    end
    if (tag == 'broke1') or (tag == 'glitch1')then
        noteTweenAngle('fix1', 5, 0, 1, 'quadInOut');
    end
    if (tag == 'broke2') or (tag == 'glitch2') then
        noteTweenAngle('fix2', 6, 0, 1, 'quadInOut');
    end
    if (tag == 'broke3') or (tag == 'glitch3') then
        noteTweenAngle('fix3', 7, 0, 1, 'quadInOut');
    end

    


end






function onCreate()
makeLuaText('watermark', songName .. " | Masti Minipack (Collab Com FNF BR)", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 20);
    addLuaText('watermark');
end






function onCreate()
    --PRECACHE
        --addCharacterToList('twilight-p', 'dad');
        addCharacterToList('twilight-pL', 'dad');
        addCharacterToList('twilight-pS', 'dad');
    
        --addCharacterToList('twilight-p', 'bf-p');
        addCharacterToList('bf-pD', 'boyfriend');
        addCharacterToList('bf-pS', 'boyfriend');
    
        precacheImage('BF_Death');
        precacheSound('Pibby Death');
        precacheSound('hugging_death_loop');
        precacheSound('hugging_death_end');
    
        precacheSound('missleft');
        precacheSound('missdown');
        precacheSound('missup');
        precacheSound('missright');
    
        -- Character Death Presets
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-death'); --Character json file for the death animation
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'PibbyDeath'); --put in mods/sounds/
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'hugging_death_loop2'); --put in mods/music/
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'hugging_death_end2'); --put in mods/music/
    
        -- LASER
            makeAnimatedLuaSprite('laser', 'Laser', getCharacterX('dad') + 100, getCharacterY('dad') + 300);
            addAnimationByPrefix('laser', 'shoot', 'Laser', 24, true);
            setProperty('laser.alpha', 0.9);
            setBlendMode('laser', 'hardlight');
        -- GLITCH FILTER
        if not lowQuality then
            makeAnimatedLuaSprite('glitch', 'glitchfield', 0, 0);
            addAnimationByPrefix('glitch', 'play', 'the filter', 10, true);
            addLuaSprite('glitch', true);
            objectPlayAnimation('glitch', 'play', false);
            setProperty('glitch.alpha', 0);
            setProperty('glitch.scale.x', 2.4);
            setProperty('glitch.scale.y', 2.2);
            setProperty('glitch.x', getProperty('glitch.x') - 290);
            setBlendMode('glitch', 'add');
        end
    
        
        --noteTweenAlpha('invisiable', 0, 0, 1, 'linear');
        --noteTweenAlpha('invisiable1', 1, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable2', 2, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable3', 3, 0, 0.01, 'linear');
       -- noteTweenAlpha('invisiable4', 4, 0, 0.01, 'linear');
       -- noteTweenAlpha('invisiable5', 5, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable6', 6, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable7', 7, 0, 0.01, 'linear');
        
        
    --setProperty('botplay', true);
    
        
    
    
    
    
    
        --Put Pinkie behind the BG
        setObjectOrder('gfGroup', 0);
    
    
        --setObjectOrder('gfGroup', 15);
        --setPropertyFromObject('girlfriend', 'alpha', '0');
        doTweenColor('twiBlack', "dad", '000000', 0.01, 'linear');
        
        
    
    -- Spotlight on BF
        --makeLuaSprite('spotlight1', 'spotlight', -3000, -2020);
        --setScrollFactor('spotlight1', 1, 1);
        --scaleObject('spotlight1', 0.9, 1);
    
        
        --doTweenAlpha('twiAlphaTween', 'twilightSpeaks', 0.0001, 0.00001, 'linear');
        setObjectOrder('twilightSpeaks', 0);
    
        --close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
    end





function onCreate()
xx = defaultOpponentX + 400;
yy = defaultOpponentY + 300;
xx2 = defaultBoyfriendX + 100;
yy2 = defaultBoyfriendY + 300;
xx3 = defaultGirlfriendX;
yy3 = defaultGirlfriendY + 300;
ofs = 60;
followchars = true;
del = 0;
del2 = 0;

end

function onUpdate()
    
    -- PINKIE ALTS
    --if curBeat >= 248 and curBeat <= 311 then
        
    --end



    --CAMERA FOLLOW Updates    
    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then

            --DAD
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
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            --BOYFRIEND
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


            --GIRLFRIEND
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end

        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

    
end




leftTilt = true;
tilting = false;
loopF = 0;

function onBeatHit()
    --CAMERA STUFF

    if not lowQuality then
        -- tilt and zoom start 1
        if curBeat == 1 then
        doTweenAngle('screenTilt', 'camGame', 5, 8, 'quadInOut');
        doTweenZoom('screenZoom', 'camGame', 0.8, 8, 'quadInOut');
        end
        -- tilt and zoom end 1
        if curBeat == 16 then
            doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 0.7, 1, 'quadInOut');
        end

        
        -- tilt and zoom start 2
        if curBeat == 17 then
            doTweenAngle('screenTilt', 'camGame', -5, 8, 'quadInOut');
            doTweenZoom('screenZoom', 'camGame', 0.8, 8, 'quadInOut');
        end
        -- tilt and zoom end 2
        if curBeat == 32 then
            doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 0.7, 1, 'quadInOut');
        end

        -- Clock Is Ticking Zoom
        if curBeat == 33 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1, 4, 'quadIn');
        end

        -- Hit beat
        if curBeat == 100 or curBeat == 228 or curBeat == 452 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 0.9, 0.5, 'quintOut');
        end
        if curBeat == 102 or curBeat == 230 or curBeat == 454 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.1, 0.4, 'quintOut');
        end
        if curBeat == 104 or curBeat == 232 or curBeat == 456 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.3, 1, 'quintOut');
        end

        --HI GIRLS!!
        if curBeat == 168 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.1, 1.2, 'bounceOut');
        end

        -- Dark and Lonley
        if curBeat == 312 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1, 10, 'linear');
        end
    end
        --Turn on Laser death sound
        if curBeat == 248 then
            setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'MagicalDeath');
        end
        -- Turn off laser death sound
        if curBeat == 312 then
            setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'PibbyDeath');
        end

    if not lowQuality then
        -- Good Time
        if curBeat == 376 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.2, 5, 'linear');
        end


        -- F R I E N D (spin) mah scratch that it looks crazier with just the shake
        if curBeat == 394 then
            doTweenAlpha('filterOn', 'glitch', 1, 1, 'backOut');
            --doTweenZoom('screenZoom', 'camGame', 1.2, 5, 'linear');
        end

        if curBeat == 394 then
            doTweenAlpha('turnOn', 'glitch', 1, 1, 'linear');
            --doTweenZoom('screenZoom', 'camGame', 1.2, 5, 'linear');
        end

        -- AAAAAAAA
        if curBeat == 460 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1, 2.6, 'quintOut');
        end
    end

    if not lowQuality then
    -- TILT A WORL
        if (curBeat >= 172 and curBeat <= 236) or (curBeat >= 395 and curBeat <= 460) then

            -- add to loop timer
            loopF = loopF + 1;

                -- tilt to the right and stay tilting till tilting false again
            
            if leftTilt == true then
                if tilting == false then
                doTweenAngle('screenTilt', 'camGame', 5, 2.5, 'quadInOut');
                
                tilting = true;  
                end
                    if loopF >= 8 then
                        leftTilt = false;
                        loopF = 0;
                        tilting = false;
                    end
                
            end    
            
            -- tilt to the right and stay tilting till tilting false again
        
            if leftTilt == false then
                if tilting == false then
                doTweenAngle('screenTilt', 'camGame', -5, 2.5, 'quadInOut');
                tilting = true;  
                end
                    if loopF >= 8 then
                        leftTilt = true;
                        loopF = 0;
                        tilting = false;
                    end
                
            end


                    
        end

    -- END TILT A WORL
        if curBeat == 236 or curBeat == 460 then
            doTweenAngle('screenTilt', 'camGame', 0, 1, 'quadInOut');
        end
    end
    -- SCREAM DARKEN WORLD

    if not lowQuality then
        if curBeat == 395 then
            doTweenColor('wallColor', 'wall', 'FF0000', 1, 'quadIn');
            doTweenColor('floorColor', 'midground', 'FF0000', 1, 'quadIn');
            doTweenColor('inkfellColor', 'inkfall', 'FF0000', 1, 'quadIn');
            doTweenColor('pillarColor', 'pillar', 'FF0000', 1, 'quadIn');
            doTweenColor('turnRed', 'glitch', 'FF0000', 1, 'quadIn');
        end

        -- Brighten things back up
        if curBeat == 428 then
            --doTweenAlpha('turnOffalpha', 'glitch', 0, 5, 'quadIn');
            doTweenAlpha('turnOffalpha', 'glitch', 0.1, 7, 'quadIn');
            doTweenColor('wallColor', 'wall', 'FFFFFF', 7, 'quadIn');
            doTweenColor('floorColor', 'midground', 'FFFFFF', 7, 'quadIn');
            doTweenColor('inkfellColor', 'inkfall', 'FFFFFF', 7, 'quadIn');
            doTweenColor('pillarColor', 'pillar', 'FFFFFF', 7, 'quadIn');
            doTweenColor('turnNormal', 'glitch', 'FFFFFF', 7, 'quadIn');
            
            
        end
    end
end
