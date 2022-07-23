function onCreate()
makeLuaText('watermark', songName .. " | Masti Minipack (Collab Com FNF BR)", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 20);
    addLuaText('watermark');
end



local width = 0 
local spriteName = "h24/images/skatepark/cutscene/background" -- replace limoSunset with the name of your sprite 

function onCreate() 	
makeLuaSprite("bg1", spriteName, -180, 50);	
width = getProperty("bg1.width") 	
makeLuaSprite("bg2", spriteName, width-20, 50) 	 
addLuaSprite("bg1", false) 	addLuaSprite("bg2", false) 	 	
doTweenX("bg1Tween", "bg1", -width, 4, "linear") 	
doTweenX("bg2Tween", "bg2", -20, 4, "linear") 
setObjectCamera('bg1','hud')
setObjectCamera('bg2','hud')
scaleObject('bg1', 3, 3);  
scaleObject('bg2', 3, 3);  
makeLuaSprite('nikkup', 'h24/images/skatepark/cutscene/nikkup', 600, 300);
setObjectCamera('nikkup','hud')
scaleObject('nikkup', 3, 3);  
addLuaSprite('nikkup', false); 

makeLuaSprite('exe', 'h24/images/skatepark/cutscene/exe', 20, 350);
setObjectCamera('exe','hud')
scaleObject('exe', 3.2, 3.2);  
addLuaSprite('exe', false); 

setProperty('nikkup.antialiasing', false);  
setProperty('exe.antialiasing', false);  
setProperty('bg2.antialiasing', false);  
setProperty('bg1.antialiasing', false);  

setProperty('nikkup.alpha', 0);  
setProperty('exe.alpha', 0);  
setProperty('bg2.alpha', 0);  
setProperty('bg1.alpha', 0); 

makeLuaSprite('Flash2', 'Flash2', 0, 0);
    setLuaSpriteScrollFactor('Flash2', 0, 0);
    setProperty('Flash2.alpha', 0.0001);
    addLuaSprite('Flash2', true);
    scaleObject('Flash2', 5, 5); 
    setObjectCamera('Flash2', 'other');    
end 

function onTweenCompleted(tag) 	
if tag == "bg1Tween" then
setProperty("bg1.x", 0)
setProperty("bg2.x", width-20) 		
doTweenX("bg1Tween", "bg1", -width, 4, "linear") 		
doTweenX("bg2Tween", "bg2", -20, 4, "linear") 	
end 
if tag == "exe" then
setProperty('Flash2.alpha', 1);
doTweenAlpha('tweenCutOffAlpha', 'Flash2', 0, 0.5, 'linear');
setObjectCamera('Flash2', 'other');   
removeLuaSprite('bg2', true);
removeLuaSprite('nikkup', true);
removeLuaSprite('exe', true);
removeLuaSprite('bg1', true);
end
end

function onEvent(name, value1, value2)
if name == "Sonic.EXE Cutscene" then
doTweenX("exe", "exe", 520, 6.5, "linear") 		
setProperty('nikkup.alpha', 1);  
setProperty('exe.alpha', 1);  
setProperty('bg2.alpha', 1);  
setProperty('bg1.alpha', 1); 
end
end



local width = 0 

function onCreate()

    makeLuaSprite('barO','',0, 150)
    makeGraphic('barO',1280, 500,'FF8F00')
    addLuaSprite('barO', false)
    setScrollFactor('barO',0,0)
    setObjectCamera('barO','hud')

    makeLuaSprite('barw','',0,70)
    makeGraphic('barw',1280,190,'FFFFFF')
    addLuaSprite('barw', false)
    setScrollFactor('barw',0,0)
    setObjectCamera('barw','hud')

    makeLuaSprite('barb','',0, 470)
    makeGraphic('barb',1280,190,'FFFFFF')
    addLuaSprite('barb', false)
    setScrollFactor('barb',0,0)
    setObjectCamera('barb','hud')

    makeAnimatedLuaSprite('nikku', 'h24/images/skatepark/octagon/nikku', -100, -80);
    addAnimationByPrefix('nikku', 'idle', 'Nikku Move 1', 24, true); 
    addAnimationByPrefix('nikku', 'last', 'Nikku Last Frame', 24, true); 
    scaleObject('nikku', 1.4, 1.4);
    luaSpritePlayAnimation('nikku', 'idle'); 
    setObjectCamera('nikku','hud')
    addLuaSprite('nikku', false);

    makeLuaSprite('textbox', 'h24/images/skatepark/octagon/textbox', 510, 160);
    setObjectCamera('textbox','hud')
    scaleObject('textbox', 1.1, 1.1);  
    addLuaSprite('textbox', false);    

    makeLuaSprite('octagon', 'h24/images/skatepark/octagon/octagon', 880, 390);
    setObjectCamera('octagon','hud')
    scaleObject('octagon', 0.7, 0.7);  
    addLuaSprite('octagon', false);   

    makeLuaSprite('hereletme', 'h24/images/skatepark/octagon/hereletme', 20, 280);
    setObjectCamera('hereletme','hud')
    scaleObject('hereletme', 0.7, 0.7);  
    addLuaSprite('hereletme', false); 

    makeLuaSprite('showyou', 'h24/images/skatepark/octagon/showyou', 950, 290);
    setObjectCamera('showyou','hud')
    scaleObject('showyou', 0.7, 0.7);  
    addLuaSprite('showyou', false); 

    makeLuaSprite('bartop','',0,-30)
    makeGraphic('bartop',1280,100,'000000')
    addLuaSprite('bartop',false)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,650)
    makeGraphic('barbot',1280,100,'000000')
    addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

    setProperty('barw.alpha', 0); 
    setProperty('barO.alpha', 0); 
    setProperty('barb.alpha', 0); 
    setProperty('nikku.alpha', 0); 
    setProperty('textbox.alpha', 0); 
    setProperty('text.alpha', 0); 
    setProperty('octagon.alpha', 0); 
    setProperty('hereletme.alpha', 0); 
    setProperty('showyou.alpha', 0); 
    precacheImage('h24/images/skatepark/octagon/text');
end    

function onEvent(name, value1, value2)
if name == "Sugarcrush Octagon Cutscene" then
makeAnimatedLuaSprite('text', 'h24/images/skatepark/octagon/text', 585, 220);
addAnimationByPrefix('text', 'text', 'text', 24, true); 
addAnimationByPrefix('text', 'text', 'texto', 24, false); 
scaleObject('text', 0.4, 0.4);
setObjectCamera('text','hud')
addLuaSprite('text', false);
luaSpritePlayAnimation('text', 'text');       
setProperty('barw.alpha', 1); 
setProperty('barO.alpha', 1); 
setProperty('barb.alpha', 1); 
setProperty('nikku.alpha', 1); 
setProperty('textbox.alpha', 1); 
setProperty('text.alpha', 1); 
setProperty('octagon.alpha', 1); 
runTimer('prefin', 11);
runTimer('fin', 13);    
end
end

function onTimerCompleted(tag, loops, loopsleft)
if tag == 'prefin' then
setProperty('hereletme.alpha', 1); 
setProperty('showyou.alpha', 1);    
setProperty('nikku.y', 200);     
luaSpritePlayAnimation('nikku', 'last');     
doTweenX('nikku', 'nikku', 450, 0.7, 'linear');     
doTweenX('text', 'text', 1500, 0.7, 'linear'); 
doTweenX('octagon', 'octagon', 1500, 0.7, 'linear'); 
doTweenX('textbox', 'textbox', 1500, 0.7, 'linear'); 
end
if tag == 'fin' then
setProperty('Flash2.alpha', 1);
doTweenAlpha('tweenCutOffAlpha', 'Flash2', 0, 0.5, 'linear');
setObjectCamera('Flash2', 'other');   
removeLuaSprite('barw', true);
removeLuaSprite('barO', true);
removeLuaSprite('barb', true);
removeLuaSprite('nikku', true);
removeLuaSprite('textbox', true);
removeLuaSprite('text', true);
removeLuaSprite('nikku', true);
removeLuaSprite('textbox', true);
removeLuaSprite('octagon', true);
removeLuaSprite('hereletme', true);
removeLuaSprite('showyou', true);
end
end
