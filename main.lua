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

HEALTHBAR = display.newRoundedRect(400, 6, 800, 12, 6);
HEALTHBAR:setFillColor(104/255, 159/255, 56/255);
main_group:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(400, 18, 800, 12, 6);
ENERGYBAR:setFillColor(2/255, 136/255, 209/255);
main_group:insert(ENERGYBAR);

TIMETEXT = display.newText(mechanics.time_text[mechanics.time], 0, 0, "Bellota-Regular", 32);
TIMETEXT.x = _SCREEN.CENTER.x - 250;
TIMETEXT.y = _SCREEN.CENTER.y - 645;
main_group:insert(TIMETEXT);

local calendar_icon = display.newImageRect( "images/calendar.png", 64, 64 )
calendar_icon.x = _SCREEN.CENTER.x + 250;
calendar_icon.y = _SCREEN.CENTER.y - 650;
main_group:insert(calendar_icon);

DAYTEXT = display.newText(mechanics.day, 0, 0, "Bellota-Regular", 32);
-- DAYTEXT = display.newText("Day " .. mechanics.day, 0, 0, "Bellota-Regular", 32);
DAYTEXT.x = _SCREEN.CENTER.x + 250;
DAYTEXT.y = _SCREEN.CENTER.y - 645;
main_group:insert(DAYTEXT);

local materials_box = display.newRoundedRect( 0, 0, 780, 150, 15 )
materials_box.x = _SCREEN.CENTER.x;
materials_box.y = _SCREEN.CENTER.y - 520;
materials_box:setFillColor(105/255, 105/255, 105/255, 0.5);
main_group:insert(materials_box);

local branch_icon = display.newImageRect( "images/branch.png", 32, 32 )
branch_icon.x = _SCREEN.CENTER.x - 320;
branch_icon.y = _SCREEN.CENTER.y - 550;
main_group:insert(branch_icon);

local branch_count = display.newText("152", 0,0, "Bellota-Regular", 32);
branch_count.x = _SCREEN.CENTER.x - 320;
branch_count.y = _SCREEN.CENTER.y - 500;
main_group:insert(branch_count);

local leaf_icon = display.newImageRect( "images/leaf.png", 32, 32 )
leaf_icon.x = _SCREEN.CENTER.x - 200;
leaf_icon.y = _SCREEN.CENTER.y - 550;
main_group:insert(leaf_icon);

local leaf_count = display.newText("2839", 0,0, "Bellota-Regular", 32);
leaf_count.x = _SCREEN.CENTER.x - 200;
leaf_count.y = _SCREEN.CENTER.y - 500;
main_group:insert(leaf_count);

local stone_icon = display.newImageRect( "images/stone.png", 32, 32 )
stone_icon.x = _SCREEN.CENTER.x - 80;
stone_icon.y = _SCREEN.CENTER.y - 550;
main_group:insert(stone_icon);

local stone_count = display.newText("8227", 0,0, "Bellota-Regular", 32);
stone_count.x = _SCREEN.CENTER.x - 80;
stone_count.y = _SCREEN.CENTER.y - 500;
main_group:insert(stone_count);

local beeswax_icon = display.newImageRect( "images/beeswax.png", 32, 32 )
beeswax_icon.x = _SCREEN.CENTER.x + 40;
beeswax_icon.y = _SCREEN.CENTER.y - 550;
main_group:insert(beeswax_icon);

local beeswax_count = display.newText("432", 0,0, "Bellota-Regular", 32);
beeswax_count.x = _SCREEN.CENTER.x + 40;
beeswax_count.y = _SCREEN.CENTER.y - 500;
main_group:insert(beeswax_count);

local hemp_icon = display.newImageRect( "images/hemp.png", 32, 32 )
hemp_icon.x = _SCREEN.CENTER.x + 160;
hemp_icon.y = _SCREEN.CENTER.y - 550;
main_group:insert(hemp_icon);

local hemp_count = display.newText("529", 0,0, "Bellota-Regular", 32);
hemp_count.x = _SCREEN.CENTER.x + 160;
hemp_count.y = _SCREEN.CENTER.y - 500;
main_group:insert(hemp_count);

local food_icon = display.newImageRect( "images/food.png", 32, 32 )
food_icon.x = _SCREEN.CENTER.x + 280;
food_icon.y = _SCREEN.CENTER.y - 550;
main_group:insert(food_icon);

local food_count = display.newText("972", 0,0, "Bellota-Regular", 32);
food_count.x = _SCREEN.CENTER.x + 280;
food_count.y = _SCREEN.CENTER.y - 500;
main_group:insert(food_count);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
