home_container = display.newContainer(_SCREEN.width, _SCREEN.height);

local background = display.newImageRect("images/background.png", 1920, 1080);
background.x = -15;
background.y = 50;
home_container:insert(background);

return home_container;
