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

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - _SCREEN.width * G_empty_space_from_sides, TOP_CONTAINER.height, 15);
test_box:setFillColor(200/255, 0/255, 0/255, 0.5);
TOP_CONTAINER:insert(test_box);

HEALTHBAR = display.newRoundedRect(0, 0, 0, 0, 6);
HEALTHBAR.width = _SCREEN.width - _SCREEN.width * G_empty_space_from_sides;
HEALTHBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
HEALTHBAR.x = 0;
HEALTHBAR.y = HEALTHBAR.height / 2 - (TOP_CONTAINER.height / 2);
HEALTHBAR:setFillColor(255/255, 255/255, 255/255);
TOP_CONTAINER:insert(HEALTHBAR);

ENERGYBAR = display.newRoundedRect(0, 0, 0, 0, 6);
ENERGYBAR.width = _SCREEN.width - _SCREEN.width * G_empty_space_from_sides;
ENERGYBAR.height = _SCREEN.height * G_health_energy_bar_percentage;
ENERGYBAR.x = 0;
ENERGYBAR.y = (HEALTHBAR.y + HEALTHBAR.height / 2) + ENERGYBAR.height / 2;
ENERGYBAR:setFillColor(105/255, 105/255, 105/255);
TOP_CONTAINER:insert(ENERGYBAR);

DAYICON = display.newImageRect("images/daytime.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
DAYICON.x = -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other;
DAYICON.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + DAYICON.height / 2;
TOP_CONTAINER:insert(DAYICON);

NIGHTICON = display.newImageRect("images/nighttime.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
NIGHTICON.x = -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other;
NIGHTICON.y = DAYICON.y;
NIGHTICON.isVisible = false;
TOP_CONTAINER:insert(NIGHTICON);

TIMETEXT = display.newText("Daytime", DAYICON.x + DAYICON.width / 2 + _SCREEN.width * G_text_space_from_object,
                           (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + DAYICON.height / 2,
                           "Bellota-Regular", _SCREEN.height * G_font_size);
TIMETEXT.anchorX = 0;
TOP_CONTAINER:insert(TIMETEXT);

local calendar_group = display.newGroup();
calendar_group.anchorChildren = true;
calendar_group.anchorX = 1;
calendar_group.x = -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other * 6 + _SCREEN.height * G_icon_size / 2;
calendar_group.y = (ENERGYBAR.y + ENERGYBAR.height / 2) + (_SCREEN.height * G_first_empty_space) + NIGHTICON.height / 2;
TOP_CONTAINER:insert(calendar_group);

local calendar_icon = display.newImageRect("images/calendar.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
calendar_group:insert(calendar_icon);

DAYTEXT = display.newText("Day 1", calendar_icon.x + calendar_icon.width / 2 + _SCREEN.width * G_text_space_from_object, 0,
                          "Bellota-Regular", _SCREEN.height * G_font_size);
DAYTEXT.anchorX = 0;
calendar_group:insert(DAYTEXT);

local function create_icon(icon_path, icon_width, icon_height, icon_x, icon_y, icon_text_font_size)
  local icon = display.newImageRect(icon_path, icon_width, icon_height);
  icon.x = icon_x;
  icon.y = icon_y;
  TOP_CONTAINER:insert(icon);

  local icon_text = display.newText("9999", icon_x, (icon.y + icon.height / 2) + icon.height / 2, "Bellota-Regular", icon_text_font_size);
  TOP_CONTAINER:insert(icon_text);
end

create_icon("images/branch.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other * 1, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/leaf.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other * 2, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/stone.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other * 3, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/beeswax.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other * 4, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/hemp.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other * 5, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);
create_icon("images/food.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size,
            -_SCREEN.width / 2 + _SCREEN.width * G_icon_space_from_each_other * 6, (DAYICON.y + DAYICON.height / 2) + (G_second_empty_space * _SCREEN.height) + _SCREEN.height * G_icon_size / 2, _SCREEN.height * G_font_size);

buttons = require("buttons");
local buttons_group = buttons.add_buttons_to_container();

main_group:insert(buttons_group);
