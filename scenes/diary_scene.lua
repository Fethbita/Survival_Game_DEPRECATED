diary_container = display.newContainer(_SCREEN.width, _SCREEN.height);

-- local background = display.newImageRect("images/fbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- diary_container:insert(background);

local diary_box = display.newRoundedRect( 0, -42, 780, 780, 15 )
diary_box:setFillColor(105/255, 105/255, 105/255, 0.5);
diary_container:insert(diary_box);

local diary_icon = display.newImageRect( "images/diary.png", 32, 32 )
diary_icon.x = - 150;
diary_icon.y = - 390;
diary_container:insert(diary_icon);

local diary_text = display.newText("Diary", 0,0, "Bellota-Regular", 32);
diary_text.x = 0;
diary_text.y = - 390;
diary_container:insert(diary_text);

return diary_container;
