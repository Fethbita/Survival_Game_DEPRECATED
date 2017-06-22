slideshow = require("slideshow");
mechanics = require("mechanics");

local slideshowObjects = {};
slideshowObjects[1] = require("scenes.diary_scene");
slideshowObjects[2] = require("scenes.home_scene");
slideshowObjects[3] = require("scenes.inventory_scene");

--[[
Create and return a display group containing a thumbnail for each of the slideshow objects
--]]
function createThumbnails()
    local group = display.newGroup();
    local thumbSize = 15;
    local thumbMargin = 10;

    for i = 1, 3 do
        local thumb = display.newCircle((i - 1) * (thumbSize + thumbMargin), 0, thumbSize / 2, thumbSize / 2);
        thumb:setFillColor(0/255, 0/255, 255/255, 0.5);
        thumb:setStrokeColor(1, 1, 1, 1.0);
        thumb.strokeWidth = 0;
        thumb.anchorX = 0;

        -- Setup a tap handler for each thumb that will quick jump to selected object index
        thumb:addEventListener("tap", function()
            local disableTransition = false;
            slideshow.showObjectAtIndex(i, disableTransition);
        end)

        group:insert(thumb);
    end

    group.x = _SCREEN.CENTER.x - (3 / 2 * (thumbSize + thumbMargin));
    group.y = _SCREEN.height - (_SCREEN.height * G_button_container_size) - (_SCREEN.height * G_fourth_empty_space) -
              (_SCREEN.height * G_thumbnail_space_from_main_bottom);

    return group;
end

local thumbnailsGroup = createThumbnails();

local function updateThumbnails(selectedObjectIndex)
    -- Highlight the stroke of the selected object's corresponding thumbnail
    for i = 1, thumbnailsGroup.numChildren do
        local thumb = thumbnailsGroup[i];
        if (i == selectedObjectIndex) then
            thumb.strokeWidth = 3;
        else
            thumb.strokeWidth = 0;
        end
    end
end

local slideshowParams = {
    startIndex = 2,
    swipeSensitivityPixels = 75,
    y = (G_top_container_size * _SCREEN.height) + (_SCREEN.height * G_main_container_size) / 2 + (G_third_empty_space * _SCREEN.height),
    onChange = updateThumbnails,
}
slideshow.init(slideshowObjects, slideshowParams);

local main_group = display.newGroup();

TOP_CONTAINER = display.newContainer(main_group, _SCREEN.width, G_top_container_size * _SCREEN.height);
TOP_CONTAINER.x = _SCREEN.CENTER.x;
TOP_CONTAINER.y = G_top_container_size * _SCREEN.height / 2;

local test_box = display.newRoundedRect(0, 0, TOP_CONTAINER.width - 20, TOP_CONTAINER.height, 15);
test_box.width = _SCREEN.width - 20;
test_box:setFillColor(200/255, 0/255, 0/255, 0.5);
TOP_CONTAINER:insert(test_box);

HEALTHBAR = display.newRoundedRect(0, 0, 0, 0, 6);
-- We want it in the middle, so considering anchor point is in the middle, we divide screen witdh to 2.
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

local options =
{
	text = mechanics.time_text[mechanics.time],
	x = -290,
	y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + DAYICON.height / 2,
	font = "Bellota-Regular",
	fontSize = _SCREEN.height * G_font_size
};

TIMETEXT = display.newText(options);
TIMETEXT.anchorX = 0;
TOP_CONTAINER:insert(TIMETEXT);

local calendar_icon = display.newImageRect("images/calendar.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
calendar_icon.x = 150;
calendar_icon.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + calendar_icon.height / 2;
TOP_CONTAINER:insert(calendar_icon);

options =
{
	text = "Day " .. mechanics.day,
	x = 250,
	y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + calendar_icon.height / 2,
	font = "Bellota-Regular",
	fontSize = 40
};

DAYTEXT = display.newText(options);
TOP_CONTAINER:insert(DAYTEXT);


local function create_icon(icon_path, icon_width, icon_height, icon_x, icon_y, icon_text_font_size)
  local icon = display.newImageRect(icon_path, icon_width, icon_height);
  icon.x = icon_x;
  icon.y = icon_y;
  TOP_CONTAINER:insert(icon);

  local options =
  {
  	text = "0",
  	x = icon_x,
  	y = (icon.y + icon.height / 2) + icon.height / 2,
  	font = "Bellota-Regular",
  	fontSize = icon_text_font_size
  };

  local icon_text = display.newText(options);
  TOP_CONTAINER:insert(icon_text);
end

create_icon("images/branch.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -320, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/leaf.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -200, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/stone.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -80, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/beeswax.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            40, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/hemp.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            160, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);
create_icon("images/food.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            280, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, 40);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
