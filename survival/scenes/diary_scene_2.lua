local widget = require( "widget" )
local lock_controlled = nil;
-- ScrollView listener
local function scrollListener( event )
    --print(lock_controlled);
    local phase = event.phase
    print("a");
    if ( phase == "began" ) then
      --print( "Scroll view was touched" )
      lock_controlled = false;
    elseif ( phase == "moved" ) then
      --print( "Scroll view was moved" )
      if (not lock_controlled) then
        local dx = math.abs((event.x - event.xStart))
        local dy = math.abs((event.y - event.yStart))
        if (dx + dy > 15) then
          print(dx);
          if (dx > 10) then
            return false;
            --display.getCurrentStage():setFocus(diary_container)
          end
          lock_controlled = true;
        end
      end
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "down" ) then print( "Reached top limit" )
        elseif ( event.direction == "left" ) then print( "Reached right limit" )
        elseif ( event.direction == "right" ) then print( "Reached left limit" )
        end
    end

    return true
end

local diary_container = widget.newScrollView(
    {
        horizontalScrollDisabled = true,
        isBounceEnabled = false,
        top = 0,
        left = 0,
        width = _SCREEN.width,
        height = _SCREEN.height * G_main_container_size,
        scrollWidth = 0,
        scrollHeight = _SCREEN.height * 2,
        backgroundColor = { 0, 0, 0 },

        listener = slideshow.handleSwipe,
        listener = scrollListener,
    }
)


local test_box = display.newRoundedRect(_SCREEN.width / 2, _SCREEN.height * G_main_container_size / 2, _SCREEN.width - _SCREEN.width * G_empty_space_from_sides, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(0/255, 255/255, 0/255, 0.5);
diary_container:insert(test_box);

-- local background = display.newImageRect("images/fbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- diary_container:insert(background);

local heading_group = display.newGroup();
heading_group.anchorChildren = true;
heading_group.x = 0;
heading_group.y = -(_SCREEN.height * G_main_container_size / 2) + _SCREEN.height * G_icon_size / 2;
diary_container:insert(heading_group);

local diary_icon = display.newImageRect("images/diary.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
heading_group:insert(diary_icon);

local diary_text = display.newText("Diary", _SCREEN.height * G_icon_size / 2 + 10, 0, "Bellota-Regular", _SCREEN.height * G_font_size);
diary_text.anchorX = 0;
heading_group:insert(diary_text);
------------------------------------


------------------------------------
return diary_container;
