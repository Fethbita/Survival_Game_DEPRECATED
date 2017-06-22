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

TOP_CONTAINER = display.newContainer(_SCREEN.width, G_top_container_size * _SCREEN.height);
TOP_CONTAINER.x = _SCREEN.CENTER.x;
TOP_CONTAINER.y = G_top_container_size * _SCREEN.height / 2;
local test_box = display.newRoundedRect(0, 0, TOP_CONTAINER.width - 20, TOP_CONTAINER.height, 15);
test_box.width = _SCREEN.width - 20;
test_box:setFillColor(200/255, 0/255, 0/255, 0.5);
TOP_CONTAINER:insert(test_box);

HEALTHBAR = display.newRoundedRect(0, 0, 0, 0, 6);
HEALTHBAR.width = _SCREEN.width - 20;
HEALTHBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
HEALTHBAR.x = 0;
HEALTHBAR.y = HEALTHBAR.height / 2 - (TOP_CONTAINER.height / 2);
HEALTHBAR:setFillColor(255/255, 255/255, 255/255);
TOP_CONTAINER:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(0, 0, 0, 0, 6);
ENERGYBAR.width = _SCREEN.width - 20;
ENERGYBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
ENERGYBAR.x = 0;
ENERGYBAR.y = (HEALTHBAR.y + HEALTHBAR.height / 2) + ENERGYBAR.height / 2;
ENERGYBAR:setFillColor(105/255, 105/255, 105/255);
TOP_CONTAINER:insert(ENERGYBAR);

DAYICON = display.newImageRect("images/daytime.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
DAYICON.x = -330;
DAYICON.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + DAYICON.height / 2;
TOP_CONTAINER:insert(DAYICON);

NIGHTICON = display.newImageRect("images/nighttime.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
NIGHTICON.x = -330;
NIGHTICON.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + NIGHTICON.height / 2;
NIGHTICON.isVisible = false;
TOP_CONTAINER:insert(NIGHTICON);

TIMETEXT = display.newText("Daytime", -290,(ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + DAYICON.height / 2,
                           "Bellota-Regular", _SCREEN.height * G_font_size);
TIMETEXT.anchorX = 0;
TOP_CONTAINER:insert(TIMETEXT);

local calendar_icon = display.newImageRect("images/calendar.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
calendar_icon.x = 150;
calendar_icon.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + calendar_icon.height / 2;
TOP_CONTAINER:insert(calendar_icon);

DAYTEXT = display.newText("Day 1", 250, (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + calendar_icon.height / 2,
                          "Bellota-Regular", _SCREEN.height * G_font_size);
TOP_CONTAINER:insert(DAYTEXT);

local function create_icon(icon_path, icon_width, icon_height, icon_x, icon_y, icon_text_font_size)
  local icon = display.newImageRect(icon_path, icon_width, icon_height);
  icon.x = icon_x;
  icon.y = icon_y;
  TOP_CONTAINER:insert(icon);
  
  local icon_text = display.newText("0", icon_x, (icon.y + icon.height / 2) + icon.height / 2,
                                    "Bellota-Regular", icon_text_font_size);
  TOP_CONTAINER:insert(icon_text);
end

create_icon("images/branch.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -320, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/leaf.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -200, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/stone.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -80, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/beeswax.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            40, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/hemp.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            160, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/food.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            280, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);

buttons = require("buttons");
buttons.add_buttons_to_container();