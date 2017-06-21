home_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - 20, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(0/255, 255/255, 0/255, 0.5);
home_container:insert(test_box);

-- local background = display.newImageRect("images/background.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- home_container:insert(background);

local aspect_ratio = display.pixelHeight / display.pixelWidth;

local thoughts_icon = display.newImageRect("images/thoughts.png", 40, 40);
thoughts_icon.x = -130;
thoughts_icon.y = -390;
home_container:insert(thoughts_icon);

local options =
{
	text = "Thoughts",
	x = 0,
	y = -390,
	font = "Bellota-Regular",
	fontSize = 40
};

local logs_text = display.newText(options);
home_container:insert(logs_text);

local logs_context = display.newText("I need to make a fire." , 0, 0, "Bellota-Regular", 32);
logs_context.x = -190;
logs_context.y = -300;
home_container:insert(logs_context);

local logs_context2 = display.newText("I better find things to eat." , 0, 0, "Bellota-Regular", 32);
logs_context2.x = -160;
logs_context2.y = -220;
home_container:insert(logs_context2);

return home_container;
