display.setStatusBar(display.HiddenStatusBar);

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
};

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
};

local slideshow = require("slideshow");
local mechanics = require("mechanics");

local slideshowObjects = {};
slideshowObjects[1] = require("scenes.diary_scene");
slideshowObjects[2] = require("scenes.home_scene");
slideshowObjects[3] = require("scenes.inventory_scene");

local slideshowParams = {
    startIndex = 2,
    transitionEffect = easing.outCubic,
    transitionEffectTimeMs = 250,
    swipeSensitivityPixels = 100,
    --onChange = updateThumbnails,
}
slideshow.init(slideshowObjects, slideshowParams);

local my_group = display.newGroup();

HEALTHBAR = display.newRoundedRect(160, 3, 320, 6, 3);
HEALTHBAR:setFillColor(104/255, 159/255, 56/255);
my_group:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(160, 9, 320, 6, 3);
ENERGYBAR:setFillColor(2/255, 136/255, 209/255);
my_group:insert(ENERGYBAR);

TIMETEXT = display.newText(mechanics.time_text[mechanics.time], 0, 0, "Bellota-Regular", 24);
TIMETEXT.x = _SCREEN.CENTER.x - 90;
TIMETEXT.y = _SCREEN.CENTER.y - 200;
my_group:insert(TIMETEXT);

DAY = display.newText("Day " .. mechanics.day, 0, 0, "Bellota-Regular", 24);
DAY.x = _SCREEN.CENTER.x + 90;
DAY.y = _SCREEN.CENTER.y - 200;
my_group:insert(DAY);

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = _SCREEN.CENTER.x;
logs_text.y = _SCREEN.CENTER.y - 150;
my_group:insert(logs_text);

local buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

my_group:insert(buttons_group);
