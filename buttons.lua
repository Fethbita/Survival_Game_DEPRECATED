local buttons = {};

--[[
Returns
--FUNC--
add_buttons_to_container
--]]

-- -----------------------------------------------------------------------------------

local function create_button_group(button_text, button_group_center_plus_x, button_group_center_plus_y)
  local button_group = display.newGroup();

  local button = display.newImageRect("images/button.png", 340, 100);
  local button_pressed = display.newImageRect("images/button_over.png", 340, 100);
  button_pressed.isVisible = false;
  button_pressed.alpha = 0;
  local button_text = display.newText(button_text, 0, 0, "Bellota-Regular", 40);

  button_group:insert(button);
  button_group:insert(button_pressed);
  button_group:insert(button_text);
  button_group.x = button_group_center_plus_x;
  button_group.y = button_group_center_plus_y;
  return button_group;
end

local explore_group = create_button_group("Explore", -185, -120);
explore_group.is_pressed = false;
local pickup_group = create_button_group("Search", 180, -120);
pickup_group.is_pressed = false;
local rest_group = create_button_group("Cook & Eat", -185, 0);
rest_group.is_pressed = false;
local mine_group = create_button_group("Get Food", 180, 0);
mine_group.is_pressed = false;
local build_group = create_button_group("Build", -185, 120);
build_group.is_pressed = false;
local run_group = create_button_group("I'm Ready!", 180, 120);
run_group.is_pressed = false;

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
  local buttons_group = display.newContainer(_SCREEN.width, 350);
  buttons_group.anchorX = 0.5;
  buttons_group.x = _SCREEN.CENTER.x;
  buttons_group.anchorY = 1;
  buttons_group.y = _SCREEN.height;

  buttons_group:addEventListener("touch", buttons_group_ignore);

  local test_box = display.newRoundedRect(0, 0, 780, 350, 15);
  test_box:setFillColor(105/255, 105/255, 105/255, 0.5);
  --test_box.isVisible = false;
  test_box.isHitTestable = true;
  buttons_group:insert(test_box);

  buttons_group:insert(explore_group);
  buttons_group:insert(rest_group);
  buttons_group:insert(build_group);
  buttons_group:insert(mine_group);
  buttons_group:insert(pickup_group);
  buttons_group:insert(run_group);

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
