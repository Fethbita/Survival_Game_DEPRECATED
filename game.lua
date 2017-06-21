slideshow = require("slideshow");
mechanics = require("mechanics");

local slideshowObjects = {};
slideshowObjects[1] = require("scenes.diary_scene");
slideshowObjects[2] = require("scenes.home_scene");
slideshowObjects[3] = require("scenes.inventory_scene");

local slideshowParams = {
    startIndex = 2,
    swipeSensitivityPixels = 75,
    y = (G_top_container_size * _SCREEN.height) + (_SCREEN.height * G_main_container_size) / 2 + (G_third_empty_space * _SCREEN.height);
    --onChange = updateThumbnails,
}
slideshow.init(slideshowObjects, slideshowParams);

local main_group = display.newGroup();

local top_container = display.newContainer(main_group, _SCREEN.width, G_top_container_size * _SCREEN.height);
top_container.x = _SCREEN.CENTER.x;
top_container.y = G_top_container_size * _SCREEN.height / 2;
local test_box = display.newRoundedRect(0, 0, top_container.width - 20, top_container.height, 15);
test_box.width = _SCREEN.width - 20;
test_box:setFillColor(200/255, 0/255, 0/255, 0.5);
top_container:insert(test_box);

HEALTHBAR = display.newRoundedRect(0, 0, 0, 0, 6);
-- We want it in the middle, so considering anchor point is in the middle, we divide screen witdh to 2.
HEALTHBAR.width = _SCREEN.width - 20;
HEALTHBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
HEALTHBAR.x = 0;
HEALTHBAR.y = HEALTHBAR.height / 2 - (top_container.height / 2);
HEALTHBAR:setFillColor(255/255, 255/255, 255/255);
top_container:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(0, 0, 0, 0, 6);
ENERGYBAR.width = _SCREEN.width - 20;
ENERGYBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
ENERGYBAR.x = 0;
ENERGYBAR.y = (HEALTHBAR.y + HEALTHBAR.height / 2) + ENERGYBAR.height / 2;
ENERGYBAR:setFillColor(105/255, 105/255, 105/255);
top_container:insert(ENERGYBAR);

TIMEICON = display.newImageRect("images/daytime.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
TIMEICON.x = -330;
TIMEICON.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + TIMEICON.height / 2;
top_container:insert(TIMEICON);

local options =
{
	text = mechanics.time_text[mechanics.time],
	x = -290,
	y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + TIMEICON.height / 2,
	font = "Bellota-Regular",
	fontSize = _SCREEN.height * G_font_size
};

TIMETEXT = display.newText(options);
TIMETEXT.anchorX = 0;
top_container:insert(TIMETEXT);

local calendar_icon = display.newImageRect("images/calendar.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
calendar_icon.x = 150;
calendar_icon.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + calendar_icon.height / 2;
top_container:insert(calendar_icon);

options =
{
	text = "Day " .. mechanics.day,
	x = 250,
	y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + calendar_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

DAYTEXT = display.newText(options);
top_container:insert(DAYTEXT);

--[[local materials_box = display.newRoundedRect(0, 0, 0, 0, 15);
materials_box.width = _SCREEN.width - 20;
materials_box.height = 130;
materials_box.x = (_SCREEN.width / 2);
materials_box.y = 190;
materials_box:setFillColor(150/255, 150/255, 150/255, 0.5);
top_container:insert(materials_box);--]]

local branch_icon = display.newImageRect("images/branch.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
branch_icon.x = -320;
branch_icon.y = (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + branch_icon.height / 2;
top_container:insert(branch_icon);

options =
{
	text = "152",
	x = -320,
	y = (branch_icon.y + branch_icon.height / 2) + branch_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

local branch_count = display.newText(options);
top_container:insert(branch_count);

local leaf_icon = display.newImageRect("images/leaf.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
leaf_icon.x = -200;
leaf_icon.y = (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + leaf_icon.height / 2;
top_container:insert(leaf_icon);

options =
{
	text = "2839",
	x = -200,
	y = (leaf_icon.y + leaf_icon.height / 2) + leaf_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

local leaf_count = display.newText(options);
top_container:insert(leaf_count);

local stone_icon = display.newImageRect("images/stone.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
stone_icon.x = -80;
stone_icon.y = (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + stone_icon.height / 2;
top_container:insert(stone_icon);

options =
{
	text = "8227",
	x = -80,
	y = (stone_icon.y + stone_icon.height / 2) + stone_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

local stone_count = display.newText(options);
top_container:insert(stone_count);

local beeswax_icon = display.newImageRect("images/beeswax.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
beeswax_icon.x = 40;
beeswax_icon.y = (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + beeswax_icon.height / 2;
top_container:insert(beeswax_icon);

options =
{
	text = "8227",
	x = 40,
	y = (beeswax_icon.y + beeswax_icon.height / 2) + beeswax_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

local beeswax_count = display.newText(options);
top_container:insert(beeswax_count);

local hemp_icon = display.newImageRect("images/hemp.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
hemp_icon.x = 160;
hemp_icon.y = (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + hemp_icon.height / 2;
top_container:insert(hemp_icon);

options =
{
	text = "529",
	x = 160,
	y = (hemp_icon.y + hemp_icon.height / 2) + hemp_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

local hemp_count = display.newText(options);
top_container:insert(hemp_count);

local food_icon = display.newImageRect("images/food.png", 40, 40);
food_icon.x = 280;
food_icon.y = (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + food_icon.height / 2;
top_container:insert(food_icon);

options =
{
	text = "972",
	x = 280,
	y = (food_icon.y + food_icon.height / 2) + food_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

local food_count = display.newText(options);
top_container:insert(food_count);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
