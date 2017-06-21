display.setStatusBar(display.HiddenStatusBar);
native.setProperty("androidSystemUiVisibility", "immersiveSticky");

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

HEALTHBAR = display.newRoundedRect(0, 0, 0, 0, 6);
-- We want it in the middle, so considering anchor point is in the middle, we divide screen witdh to 2.
HEALTHBAR.x = _SCREEN.width / 2;
HEALTHBAR.y = 6;
HEALTHBAR.width = _SCREEN.width - 20;
HEALTHBAR.height = 12;
HEALTHBAR:setFillColor(255/255, 255/255, 255/255);
main_group:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(0, 0, 0, 0, 6);
ENERGYBAR.x = _SCREEN.width / 2;
ENERGYBAR.y = 18;
ENERGYBAR.width = _SCREEN.width - 20;
ENERGYBAR.height = 12;
ENERGYBAR:setFillColor(105/255, 105/255, 105/255);
main_group:insert(ENERGYBAR);

TIMEICON = display.newImageRect( "images/daytime.png", 40, 40 )
TIMEICON.x = (_SCREEN.width / 2) - 330;
TIMEICON.y = 66;
main_group:insert(TIMEICON);

local TIMETEXT_options =
{
	text = mechanics.time_text[mechanics.time],
	x = (_SCREEN.width / 2) - 290,
	y = 66,
	font = "Bellota-Regular",
	fontSize = 40
}

TIMETEXT = display.newText(TIMETEXT_options);
TIMETEXT.anchorX = 0;
main_group:insert(TIMETEXT);

local calendar_icon = display.newImageRect( "images/calendar.png", 40, 40 )
calendar_icon.x = (_SCREEN.width / 2) + 150;
calendar_icon.y = 66;
main_group:insert(calendar_icon);

local DAYTEXT_options =
{
	text = "Day " .. mechanics.day,
	x = (_SCREEN.width / 2) + 250,
	y = (_SCREEN.height / 2) - ((_SCREEN.height / 2) - 66),
	font = "Bellota-Regular",
	fontSize = 40
};

DAYTEXT = display.newText(DAYTEXT_options);
main_group:insert(DAYTEXT);

local materials_box = display.newRoundedRect( 0, 0, 0, 0, 15 )
materials_box.width = _SCREEN.width - 20;
materials_box.height = 150;
materials_box.x = (_SCREEN.width / 2);
materials_box.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 191);
materials_box:setFillColor(23/255, 23/255, 23/255, 0.5);
main_group:insert(materials_box);

local branch_icon = display.newImageRect( "images/branch.png", 40, 40 )
branch_icon.x = _SCREEN.CENTER.x - 320;
branch_icon.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 161);
main_group:insert(branch_icon);

local branch_count = display.newText("152", 0,0, "Bellota-Regular", 40);
branch_count.x = _SCREEN.CENTER.x - 320;
branch_count.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 211);
main_group:insert(branch_count);

local leaf_icon = display.newImageRect( "images/leaf.png", 40, 40 )
leaf_icon.x = _SCREEN.CENTER.x - 200;
leaf_icon.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 161);
main_group:insert(leaf_icon);

local leaf_count = display.newText("2839", 0,0, "Bellota-Regular", 40);
leaf_count.x = _SCREEN.CENTER.x - 200;
leaf_count.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 211);
main_group:insert(leaf_count);

local stone_icon = display.newImageRect( "images/stone.png", 40, 40 )
stone_icon.x = _SCREEN.CENTER.x - 80;
stone_icon.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 161);
main_group:insert(stone_icon);

local stone_count = display.newText("8227", 0,0, "Bellota-Regular", 40);
stone_count.x = _SCREEN.CENTER.x - 80;
stone_count.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 211);
main_group:insert(stone_count);

local beeswax_icon = display.newImageRect( "images/beeswax.png", 40, 40 )
beeswax_icon.x = _SCREEN.CENTER.x + 40;
beeswax_icon.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 161);
main_group:insert(beeswax_icon);

local beeswax_count = display.newText("432", 0,0, "Bellota-Regular", 40);
beeswax_count.x = _SCREEN.CENTER.x + 40;
beeswax_count.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 211);
main_group:insert(beeswax_count);

local hemp_icon = display.newImageRect( "images/hemp.png", 40, 40 )
hemp_icon.x = _SCREEN.CENTER.x + 160;
hemp_icon.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 161);
main_group:insert(hemp_icon);

local hemp_count = display.newText("529", 0,0, "Bellota-Regular", 40);
hemp_count.x = _SCREEN.CENTER.x + 160;
hemp_count.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 211);
main_group:insert(hemp_count);

local food_icon = display.newImageRect( "images/food.png", 40, 40 )
food_icon.x = _SCREEN.CENTER.x + 280;
food_icon.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 161);
main_group:insert(food_icon);

local food_count = display.newText("972", 0,0, "Bellota-Regular", 40);
food_count.x = _SCREEN.CENTER.x + 280;
food_count.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) - 211);
main_group:insert(food_count);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
