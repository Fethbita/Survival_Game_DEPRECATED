local diary_container = display.newContainer(_SCREEN.width, _SCREEN.height);

-- local background = display.newImageRect("images/fbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- diary_container:insert(background);

local aspect_ratio = display.pixelHeight / display.pixelWidth;

local diary_box = display.newRoundedRect( 0, 0, 0, 0, 15 )
diary_box.x = _SCREEN.width - _SCREEN.width;
diary_box.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) + 42);
diary_box.width = _SCREEN.width - 20;
if (aspect_ratio > 1.5) then
	diary_box.height = _SCREEN.height - (_SCREEN.height - (_SCREEN.height / 2 + 69));
else
	diary_box.height = _SCREEN.height - (_SCREEN.height - (_SCREEN.height / 2 - 32));
end
diary_box:setFillColor(23/255, 23/255, 23/255, 0.5);
diary_container:insert(diary_box);

local diary_icon = display.newImageRect( "images/diary.png", 40, 40 )
diary_icon.x = - 100;
diary_icon.y = - 390;
diary_container:insert(diary_icon);

local diary_text = display.newText("Diary", 0,0, "Bellota-Regular", 40);
diary_text.x = 0;
diary_text.y = - 390;
diary_container:insert(diary_text);

return diary_container;
