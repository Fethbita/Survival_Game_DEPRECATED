home_container = display.newContainer(_SCREEN.width, _SCREEN.height);

local mechanics = require("mechanics");

local background = display.newImageRect("images/background.png", 1920, 1080);
background.x = -15;
background.y = 50;
home_container:insert(background);

HEALTHBAR = display.newRoundedRect(0, -_SCREEN.CENTER.y + 3, 320, 6, 3);
HEALTHBAR:setFillColor(104/255, 159/255, 56/255);
home_container:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(0, -_SCREEN.CENTER.y + 9, 320, 6, 3);
ENERGYBAR:setFillColor(2/255, 136/255, 209/255);
home_container:insert(ENERGYBAR);

TIMETEXT = display.newText(mechanics.time_text[mechanics.time], 0, 0, "Bellota-Regular", 24);
TIMETEXT.x = -90;
TIMETEXT.y = -200;
home_container:insert(TIMETEXT);

DAY = display.newText("Day " .. mechanics.day, 0, 0, "Bellota-Regular", 24);
DAY.x = 90;
DAY.y = -200;
home_container:insert(DAY);

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = 0;
logs_text.y = -150;
home_container:insert(logs_text);

local buttons = require("buttons");
buttons.add_buttons_to_scene(home_container);

return home_container;
