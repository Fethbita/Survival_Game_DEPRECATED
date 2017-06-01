local buttons = {};
local mechanics = require("mechanics");

-- -----------------------------------------------------------------------------------

local function create_button_group(button_text, button_group_center_plus_x, button_group_center_plus_y)
  local button_group = display.newGroup();

  local button = display.newImageRect("images/button.png", 140, 52);
  local button_pressed = display.newImageRect("images/button_over.png", 140, 52);
  button_pressed.isVisible = false;
  button_pressed.alpha = 0;
  local button_text = display.newText(button_text, 0, 0, "Bellota-Regular", 24);

  button_group:insert(button);
  button_group:insert(button_pressed);
  button_group:insert(button_text);
  button_group.x = button_group_center_plus_x;
  button_group.y = button_group_center_plus_y;
  return button_group;
end

local explore_group = create_button_group("Explore", -80, -50);
explore_group.is_pressed = false;
local rest_group = create_button_group("Rest", -80, 0);
rest_group.is_pressed = false;
local build_group = create_button_group("Build", -80, 50);
build_group.is_pressed = false;
local mine_group = create_button_group("Mine", 80, -50);
mine_group.is_pressed = false;
local pickup_group = create_button_group("Pick Up", 80, 0);
pickup_group.is_pressed = false;

local buttons_can_be_pressed = true;
local selected_buttons = 0;

local function pass_time_closure()
  mechanics.pass_time(explore_group, rest_group, build_group, mine_group, pickup_group);
  buttons_can_be_pressed = true;
end

-- -----------------------------------------------------------------------------------
-- Button event functions
-- -----------------------------------------------------------------------------------
local function handleExploreEvent(event)
--if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (event.target.is_pressed) then
        event.target.is_pressed = false;
        mechanics.first_button_off(event.target[2], event.target[1]);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return true;
        else
          event.target.is_pressed = true;
          mechanics.first_button_off(event.target[1], event.target[2]);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
--end
  return true;
end

local function handleRestEvent(event)
--if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (event.target.is_pressed) then
        event.target.is_pressed = false;
        mechanics.first_button_off(event.target[2], event.target[1]);
        selected_buttons = selected_buttons - 1;
      else
        event.target.is_pressed = true;
        mechanics.first_button_off(event.target[1], event.target[2]);
        selected_buttons = selected_buttons + 1;

        if (selected_buttons == 2 or mechanics.energy < 100) then
          buttons_can_be_pressed = false;
          timer.performWithDelay(550, pass_time_closure);
          selected_buttons = 0;
        end
      end
    end
--end
  return true;
end

local function handleBuildEvent(event)
--if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (event.target.is_pressed) then
        event.target.is_pressed = false;
        mechanics.first_button_off(event.target[2], event.target[1]);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return true;
        else
          event.target.is_pressed = true;
          mechanics.first_button_off(event.target[1], event.target[2]);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
--end
  return true;
end

local function handleMineEvent(event)
--if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (event.target.is_pressed) then
        event.target.is_pressed = false;
        mechanics.first_button_off(event.target[2], event.target[1]);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return true;
        else
          event.target.is_pressed = true;
          mechanics.first_button_off(event.target[1], event.target[2]);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
--end
  return true;
end

local function handlePickupEvent(event)
--if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (event.target.is_pressed) then
        event.target.is_pressed = false;
        mechanics.first_button_off(event.target[2], event.target[1]);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return true;
        else
          event.target.is_pressed = true;
          mechanics.first_button_off(event.target[1], event.target[2]);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
--end
  return true;
end

local function buttons_group_ignore(event)
  return true;
end

function buttons.add_buttons_to_container()
  local buttons_group = display.newContainer(_SCREEN.width, 150);
  buttons_group.anchorX = 0.5;
  buttons_group.x = _SCREEN.CENTER.x;
  buttons_group.anchorY = 1;
  buttons_group.y = _SCREEN.height;

  buttons_group:addEventListener("touch", buttons_group_ignore);

  local test_box = display.newRect(0, 0, _SCREEN.width, 150);
  --test_box.isHitTestable = true;
  test_box:setFillColor(1, 0, 0, 0.8);
  buttons_group:insert(test_box);

  buttons_group:insert(explore_group);
  buttons_group:insert(rest_group);
  buttons_group:insert(build_group);
  buttons_group:insert(mine_group);
  buttons_group:insert(pickup_group);

  return buttons_group;
end
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Button event function listeners
-- -----------------------------------------------------------------------------------
explore_group:addEventListener("tap", handleExploreEvent);
rest_group:addEventListener("tap", handleRestEvent);
build_group:addEventListener("tap", handleBuildEvent);
pickup_group:addEventListener("tap", handlePickupEvent);
mine_group:addEventListener("tap", handleMineEvent);
-- -----------------------------------------------------------------------------------

return buttons;
