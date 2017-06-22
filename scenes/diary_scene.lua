local diary_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - 20, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(0/255, 255/255, 0/255, 0.5);
diary_container:insert(test_box);

-- local background = display.newImageRect("images/fbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- diary_container:insert(background);

local heading_group = display.newGroup();
heading_group.anchorChildren = true;
heading_group.x = 0;
heading_group.y = -(_SCREEN.height * G_main_container_size / 2) + _SCREEN.height * G_icon_size / 2;
diary_container:insert(heading_group);

local diary_icon = display.newImageRect("images/diary.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
heading_group:insert(diary_icon);

local diary_text = display.newText("Diary", _SCREEN.height * G_icon_size / 2 + 10, 0, "Bellota-Regular", _SCREEN.height * G_font_size);
diary_text.anchorX = 0;
heading_group:insert(diary_text);

return diary_container;
