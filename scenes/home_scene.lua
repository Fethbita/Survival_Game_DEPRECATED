home_container = display.newContainer(320, 568);

print(display.contentWidth);
print(display.contentHeight);


local mechanics = require("mechanics");


local background = display.newImageRect("images/background.png", 1920, 1080);

home_container:insert(background, true);

HEALTHBAR = display.newRoundedRect(160, 3, 320, 6, 3);
HEALTHBAR:setFillColor(104/255, 159/255, 56/255);
home_container:insert(HEALTHBAR, true);

ENERGYBAR = display.newRoundedRect(160, 9, 320, 6, 3);
ENERGYBAR:setFillColor(2/255, 136/255, 209/255);
home_container:insert(ENERGYBAR, true);

TIMETEXT = display.newText(mechanics.time_text[mechanics.time], 0, 0, "Bellota-Regular", 24);
TIMETEXT.x = _SCREEN.CENTER.x - 90;
TIMETEXT.y = _SCREEN.CENTER.y - 200;
home_container:insert(TIMETEXT, true);

DAY = display.newText("Day " .. mechanics.day, 0, 0, "Bellota-Regular", 24);
DAY.x = _SCREEN.CENTER.x + 90;
DAY.y = _SCREEN.CENTER.y - 200;
home_container:insert(DAY, true);

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = _SCREEN.CENTER.x;
logs_text.y = _SCREEN.CENTER.y - 150;
home_container:insert(logs_text, true);

local buttons = require("buttons");
buttons.add_buttons_to_scene(home_container);

return home_container;
