home_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - 20, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(0/255, 255/255, 0/255, 0.5);
home_container:insert(test_box);

-- local background = display.newImageRect("images/background.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- home_container:insert(background);

local heading_group = display.newGroup();
heading_group.anchorChildren = true;
heading_group.x = 0;
heading_group.y = -(_SCREEN.height * G_main_container_size / 2) + _SCREEN.height * G_icon_size / 2;
home_container:insert(heading_group);

local thoughts_icon = display.newImageRect("images/thoughts.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
heading_group:insert(thoughts_icon);

local options =
{
	text = "Thoughts",
	x = _SCREEN.height * G_icon_size / 2 + 10,
	y = 0,
	font = "Bellota-Regular",
	fontSize = 40
};

local logs_text = display.newText(options);
logs_text.anchorX = 0;
heading_group:insert(logs_text);

local logs_context = display.newText("I need to make a fire." , 0, 0, "Bellota-Regular", 32);
logs_context.x = -190;
logs_context.y = -300;
home_container:insert(logs_context);

local logs_context2 = display.newText("I better find things to eat." , 0, 0, "Bellota-Regular", 32);
logs_context2.x = -160;
logs_context2.y = -220;
home_container:insert(logs_context2);

return home_container;
