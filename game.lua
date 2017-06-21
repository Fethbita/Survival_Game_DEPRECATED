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
HEALTHBAR.width = _SCREEN.width - 20;
HEALTHBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
HEALTHBAR.x = _SCREEN.width / 2;
HEALTHBAR.y = _SCREEN.height * G_health_energy_bar_percentage / 2;
HEALTHBAR:setFillColor(255/255, 255/255, 255/255);
main_group:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(0, 0, 0, 0, 6);
ENERGYBAR.width = _SCREEN.width - 20;
ENERGYBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
ENERGYBAR.x = _SCREEN.width / 2;
ENERGYBAR.y = (HEALTHBAR.y + HEALTHBAR.height / 2) + _SCREEN.height * G_health_energy_bar_percentage / 2;
ENERGYBAR:setFillColor(105/255, 105/255, 105/255);
main_group:insert(ENERGYBAR);

TIMEICON = display.newImageRect("images/daytime.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
TIMEICON.x = (_SCREEN.width / 2) - 330;
TIMEICON.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) +  _SCREEN.height * G_icon_size / 2;
main_group:insert(TIMEICON);

local options =
{
	text = mechanics.time_text[mechanics.time],
	x = (_SCREEN.width / 2) - 290,
	y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) +  _SCREEN.height * G_icon_size / 2,
	font = "Bellota-Regular",
	fontSize = _SCREEN.height * G_font_size
};

TIMETEXT = display.newText(options);
TIMETEXT.anchorX = 0;
main_group:insert(TIMETEXT);

local calendar_icon = display.newImageRect("images/calendar.png", 40, 40);
calendar_icon.x = (_SCREEN.width / 2) + 150;
calendar_icon.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) +  _SCREEN.height * G_icon_size / 2;
main_group:insert(calendar_icon);

options =
{
	text = "Day " .. mechanics.day,
	x = (_SCREEN.width / 2) + 250,
	y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) +  _SCREEN.height * G_icon_size / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

DAYTEXT = display.newText(options);
main_group:insert(DAYTEXT);

local materials_box = display.newRoundedRect(0, 0, 0, 0, 15);
materials_box.width = _SCREEN.width - 20;
materials_box.height = 130;
materials_box.x = (_SCREEN.width / 2);
materials_box.y = 190;
materials_box:setFillColor(150/255, 150/255, 150/255, 0.5);
main_group:insert(materials_box);

local branch_icon = display.newImageRect("images/branch.png", 40, 40);
branch_icon.x = _SCREEN.CENTER.x - 320;
branch_icon.y = 161;
main_group:insert(branch_icon);

options =
{
	text = "152",
	x = _SCREEN.CENTER.x - 320,
	y = 211,
	font = "Bellota-Regular",
	fontSize = 40
};

local branch_count = display.newText(options);
main_group:insert(branch_count);

local leaf_icon = display.newImageRect("images/leaf.png", 40, 40);
leaf_icon.x = _SCREEN.CENTER.x - 200;
leaf_icon.y = 161;
main_group:insert(leaf_icon);

options =
{
	text = "2839",
	x = _SCREEN.CENTER.x - 200,
	y = 211,
	font = "Bellota-Regular",
	fontSize = 40
};

local leaf_count = display.newText(options);
main_group:insert(leaf_count);

local stone_icon = display.newImageRect("images/stone.png", 40, 40);
stone_icon.x = _SCREEN.CENTER.x - 80;
stone_icon.y = 161;
main_group:insert(stone_icon);

options =
{
	text = "8227",
	x = _SCREEN.CENTER.x - 80,
	y = 211,
	font = "Bellota-Regular",
	fontSize = 40
};

local stone_count = display.newText(options);
stone_count.x = _SCREEN.CENTER.x - 80;
stone_count.y = 211;
main_group:insert(stone_count);

local beeswax_icon = display.newImageRect("images/beeswax.png", 40, 40);
beeswax_icon.x = _SCREEN.CENTER.x + 40;
beeswax_icon.y = 161;
main_group:insert(beeswax_icon);

options =
{
	text = "8227",
	x = _SCREEN.CENTER.x + 40,
	y = 211,
	font = "Bellota-Regular",
	fontSize = 40
};

local beeswax_count = display.newText(options);
main_group:insert(beeswax_count);

local hemp_icon = display.newImageRect("images/hemp.png", 40, 40);
hemp_icon.x = _SCREEN.CENTER.x + 160;
hemp_icon.y = 161;
main_group:insert(hemp_icon);

options =
{
	text = "529",
	x = _SCREEN.CENTER.x + 160,
	y = 211,
	font = "Bellota-Regular",
	fontSize = 40
};

local hemp_count = display.newText(options);
main_group:insert(hemp_count);

local food_icon = display.newImageRect("images/food.png", 40, 40);
food_icon.x = _SCREEN.CENTER.x + 280;
food_icon.y = 161;
main_group:insert(food_icon);

options =
{
	text = "972",
	x = _SCREEN.CENTER.x + 280,
	y = 211,
	font = "Bellota-Regular",
	fontSize = 40
};

local food_count = display.newText(options);
main_group:insert(food_count);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
