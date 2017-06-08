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

local thoughts_icon = display.newImageRect( "images/thoughts.png", 24, 24 )
thoughts_icon.x = _SCREEN.CENTER.x - 50;
thoughts_icon.y = _SCREEN.CENTER.y - 150;

local branch_icon = display.newImageRect( "images/branch.png", 24, 24 )
branch_icon.x = _SCREEN.CENTER.x - 120;
branch_icon.y = _SCREEN.CENTER.y - 240;

local leaf_icon = display.newImageRect( "images/leaf.png", 24, 24 )
leaf_icon.x = _SCREEN.CENTER.x - 70;
leaf_icon.y = _SCREEN.CENTER.y - 240;

local stone_icon = display.newImageRect( "images/stone.png", 24, 24 )
stone_icon.x = _SCREEN.CENTER.x - 20;
stone_icon.y = _SCREEN.CENTER.y - 240;

local beeswax_icon = display.newImageRect( "images/beeswax.png", 24, 24 )
beeswax_icon.x = _SCREEN.CENTER.x + 30;
beeswax_icon.y = _SCREEN.CENTER.y - 240;

local food_icon = display.newImageRect( "images/food.png", 24, 24 )
food_icon.x = _SCREEN.CENTER.x + 80;
food_icon.y = _SCREEN.CENTER.y - 240;

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = _SCREEN.CENTER.x;
logs_text.y = _SCREEN.CENTER.y - 150;
main_group:insert(logs_text);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
