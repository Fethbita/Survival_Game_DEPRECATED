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


local function create_icon(icon_path, icon_width, icon_height, icon_x, icon_y, icon_text_font_size)
  local icon = display.newImageRect(icon_path, icon_width, icon_height);
  icon.x = icon_x;
  icon.y = icon_y;
  top_container:insert(icon);

  local options =
  {
  	text = "9999",
  	x = icon_x,
  	y = (icon.y + icon.height / 2) + icon.height / 2,
  	font = "Bellota-Regular",
  	fontSize = icon_text_font_size
  };

  local icon_text = display.newText(options);
  top_container:insert(icon_text);
end

create_icon("images/branch.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -320, (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/leaf.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -200, (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/stone.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -80, (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/beeswax.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            40, (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/hemp.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            160, (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/food.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            280, (TIMEICON.y + TIMEICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
