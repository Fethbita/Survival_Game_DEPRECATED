local diary_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local widget = require("widget");

local lock_controlled = nil;
-- ScrollView listener
local function scrollListener(event)
  --print(lock_controlled);
  local phase = event.phase;
  if (phase == "began") then
    -- -----------------------------------------------------------------------------------
    lock_controlled = false;
    -- -----------------------------------------------------------------------------------
  elseif (phase == "moved") then
    -- -----------------------------------------------------------------------------------
    if (not lock_controlled) then
      local dx = math.abs((event.x - event.xStart));
      local dy = math.abs((event.y - event.yStart));
      if (dx + dy > 15) then
        if (dx > 10) then
          display.getCurrentStage():setFocus(diary_container);
        end
        lock_controlled = true;
      end
    end
    -- -----------------------------------------------------------------------------------
  elseif (phase == "ended") then
  -- -----------------------------------------------------------------------------------
  -- -----------------------------------------------------------------------------------
  end

  -- In the event a scroll limit is reached...
  if (event.limitReached) then
    if (event.direction == "up") then
    elseif (event.direction == "down") then
    elseif (event.direction == "left") then
    elseif (event.direction == "right") then
    end
  end

  return true;
end

-- Create the widget
local scrollView = widget.newScrollView(
  {
    horizontalScrollDisabled = true,
    isBounceEnabled = false,
    x = 0,
    y = 0,
    width = _SCREEN.width - _SCREEN.width * G_empty_space_from_sides,
    height = _SCREEN.height * G_main_container_size,
    scrollWidth = 0,
    scrollHeight = _SCREEN.height * 2,
    backgroundColor = { 0, 0, 0 },
    listener = scrollListener,
  }
);

diary_container:insert(scrollView);

local test_box = display.newRoundedRect((_SCREEN.width - _SCREEN.width * G_empty_space_from_sides) / 2, _SCREEN.height * G_main_container_size / 2,
                                        _SCREEN.width - _SCREEN.width * G_empty_space_from_sides, _SCREEN.height, 15);
test_box:setFillColor(0/255, 255/255, 0/255, 0.5);
scrollView:insert(test_box);

local heading_group = display.newGroup();
heading_group.anchorChildren = true;
heading_group.x = (_SCREEN.width - _SCREEN.width * G_empty_space_from_sides) / 2;
heading_group.y = _SCREEN.height * G_icon_size / 2;
scrollView:insert(heading_group);

local diary_icon = display.newImageRect("images/diary.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
heading_group:insert(diary_icon);

local diary_text = display.newText("Diary", _SCREEN.height * G_icon_size / 2 + 10, 0, "Bellota-Regular", _SCREEN.height * G_font_size);
diary_text.anchorX = 0;
heading_group:insert(diary_text);

------------------------------------
return diary_container;
