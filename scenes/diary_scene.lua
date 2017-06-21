local diary_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - 20, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(0/255, 255/255, 0/255, 0.5);
diary_container:insert(test_box);

-- local background = display.newImageRect("images/fbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- diary_container:insert(background);

local aspect_ratio = display.pixelHeight / display.pixelWidth;

local diary_icon = display.newImageRect("images/diary.png", 40, 40);
diary_icon.x = -100;
diary_icon.y = -390;
diary_container:insert(diary_icon);

local options =
{
	text = "Diary",
	x = 0,
	y = -390,
	font = "Bellota-Regular",
	fontSize = 40
};

local diary_text = display.newText(options);
diary_container:insert(diary_text);

return diary_container;
