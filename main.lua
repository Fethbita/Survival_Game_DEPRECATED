display.setStatusBar(display.HiddenStatusBar);

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
};

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
};

slideshow = require("slideshow");
mechanics = require("mechanics");

local slideshowObjects = {};
slideshowObjects[1] = require("scenes.diary_scene");
slideshowObjects[2] = require("scenes.home_scene");
slideshowObjects[3] = require("scenes.inventory_scene");

local slideshowParams = {
    startIndex = 2,
    swipeSensitivityPixels = 75,
    --onChange = updateThumbnails,
}
slideshow.init(slideshowObjects, slideshowParams);

local main_group = display.newGroup();

HEALTHBAR = display.newRoundedRect(160, 3, 320, 6, 3);
HEALTHBAR:setFillColor(104/255, 159/255, 56/255);
main_group:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(160, 9, 320, 6, 3);
ENERGYBAR:setFillColor(2/255, 136/255, 209/255);
main_group:insert(ENERGYBAR);

TIMETEXT = display.newText(mechanics.time_text[mechanics.time], 0, 0, "Bellota-Regular", 24);
TIMETEXT.x = _SCREEN.CENTER.x - 90;
TIMETEXT.y = _SCREEN.CENTER.y - 200;
main_group:insert(TIMETEXT);

DAYTEXT = display.newText("Day " .. mechanics.day, 0, 0, "Bellota-Regular", 24);
DAYTEXT.x = _SCREEN.CENTER.x + 90;
DAYTEXT.y = _SCREEN.CENTER.y - 200;
main_group:insert(DAYTEXT);

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = _SCREEN.CENTER.x;
logs_text.y = _SCREEN.CENTER.y - 150;
main_group:insert(logs_text);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
