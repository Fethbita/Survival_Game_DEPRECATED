local mechanics = require("mechanics");

local buttons_can_be_pressed = true;

local explore;
local explore_pressed;
local explore_button_isPressed = false;
local pickup;
local pickup_pressed;
local pickup_button_isPressed = false;
local rest;
local rest_pressed;
local rest_button_isPressed = false;
local build;
local build_pressed;
local build_button_isPressed = false;
local mine;
local mine_pressed;
local mine_button_isPressed = false;

local selected_buttons = 0;

local function pass_time_closure()
  local buttonStates = mechanics.pass_time(explore, explore_pressed,
  pickup, pickup_pressed,
  build, build_pressed,
  mine, mine_pressed,
  rest, rest_pressed,
  explore_button_isPressed, pickup_button_isPressed, rest_button_isPressed, build_button_isPressed, mine_button_isPressed);
  explore_button_isPressed = buttonStates.explore_button_isPressed;
  pickup_button_isPressed = buttonStates.pickup_button_isPressed;
  rest_button_isPressed = buttonStates.rest_button_isPressed;
  build_button_isPressed = buttonStates.build_button_isPressed;
  mine_button_isPressed = buttonStates.mine_button_isPressed;
  buttons_can_be_pressed = true;
end

local function handleExploreEvent(event)
  if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (explore_button_isPressed) then
        explore_button_isPressed = not explore_button_isPressed;
        mechanics.first_button_off(explore_pressed, explore);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return;
        else
          explore_button_isPressed = not explore_button_isPressed;
          mechanics.first_button_off(explore, explore_pressed);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
  end
end

local function handlePickupEvent(event)
  if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (pickup_button_isPressed) then
        pickup_button_isPressed = not pickup_button_isPressed;
        mechanics.first_button_off(pickup_pressed, pickup);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return;
        else
          pickup_button_isPressed = not pickup_button_isPressed;
          mechanics.first_button_off(pickup, pickup_pressed);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
  end
end

local function handleRestEvent(event)
  if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (rest_button_isPressed) then
        rest_button_isPressed = not rest_button_isPressed;
        mechanics.first_button_off(rest_pressed, rest);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy >= 1000) then
          return;
        else
          rest_button_isPressed = not rest_button_isPressed;
          mechanics.first_button_off(rest, rest_pressed);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
  end
end

local function handleBuildEvent(event)
  if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (build_button_isPressed) then
        build_button_isPressed = not build_button_isPressed;
        mechanics.first_button_off(build_pressed, build);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return;
        else
          build_button_isPressed = not build_button_isPressed;
          mechanics.first_button_off(build, build_pressed);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
  end
end

local function handleMineEvent(event)
  if (event.phase == "ended") then
    if (buttons_can_be_pressed) then
      if (mine_button_isPressed) then
        mine_button_isPressed = not mine_button_isPressed;
        mechanics.first_button_off(mine_pressed, mine);
        selected_buttons = selected_buttons - 1;
      else
        if (mechanics.energy < 100) then
          return;
        else
          mine_button_isPressed = not mine_button_isPressed;
          mechanics.first_button_off(mine, mine_pressed);
          selected_buttons = selected_buttons + 1;

          if (selected_buttons == 2) then
            buttons_can_be_pressed = false;
            timer.performWithDelay(550, pass_time_closure);
            selected_buttons = 0;
          end
        end
      end
    end
  end
end

-- Creating explore button
explore = display.newImageRect("images/button.png", 140, 52);
explore:addEventListener("touch", handleExploreEvent);

explore_pressed = display.newImageRect("images/button_over.png", 140, 52);
explore_pressed:addEventListener("touch", handleExploreEvent);
explore_pressed.isVisible = false;
explore_pressed.alpha = 0;

local explore_text = display.newText("Explore", 0, 0, "Bellota-Regular", 24);

local explore_group = display.newGroup();
explore_group:insert(explore);
explore_group:insert(explore_pressed);
explore_group:insert(explore_text);
explore_group.x = _SCREEN.CENTER.x - 80;
explore_group.y = _SCREEN.CENTER.y + 90;

-- Creating rest button
rest = display.newImageRect("images/button.png", 140, 52);
rest:addEventListener("touch", handleRestEvent);

rest_pressed = display.newImageRect("images/button_over.png", 140, 52);
rest_pressed:addEventListener("touch", handleRestEvent);
rest_pressed.isVisible = false;
rest_pressed.alpha = 0;

local rest_text = display.newText("Rest", 0, 0, "Bellota-Regular", 24);

local rest_group = display.newGroup();
rest_group:insert(rest);
rest_group:insert(rest_pressed);
rest_group:insert(rest_text);
rest_group.x = _SCREEN.CENTER.x - 80;
rest_group.y = _SCREEN.CENTER.y + 140;

-- Creating build button
build = display.newImageRect("images/button.png", 140, 52);
build:addEventListener("touch", handleBuildEvent);

build_pressed = display.newImageRect("images/button_over.png", 140, 52);
build_pressed:addEventListener("touch", handleBuildEvent);
build_pressed.isVisible = false;
build_pressed.alpha = 0;

local build_text = display.newText("Build", 0, 0, "Bellota-Regular", 24);

local build_group = display.newGroup();
build_group:insert(build);
build_group:insert(build_pressed);
build_group:insert(build_text);
build_group.x = _SCREEN.CENTER.x - 80;
build_group.y = _SCREEN.CENTER.y + 190;

-- Creating pick up button
pickup = display.newImageRect("images/button.png", 140, 52);
pickup:addEventListener("touch", handlePickupEvent);

pickup_pressed = display.newImageRect("images/button_over.png", 140, 52);
pickup_pressed:addEventListener("touch", handlePickupEvent);
pickup_pressed.isVisible = false;
pickup_pressed.alpha = 0;

local pickup_text = display.newText("Pick Up", 0, 0, "Bellota-Regular", 24);

local pickup_group = display.newGroup();
pickup_group:insert(pickup);
pickup_group:insert(pickup_pressed);
pickup_group:insert(pickup_text);
pickup_group.x = _SCREEN.CENTER.x + 80;
pickup_group.y = _SCREEN.CENTER.y + 190;

-- Creating mine button
mine = display.newImageRect("images/button.png", 140, 52);
mine:addEventListener("touch", handleMineEvent);

mine_pressed = display.newImageRect("images/button_over.png", 140, 52);
mine_pressed:addEventListener("touch", handleMineEvent);
mine_pressed.isVisible = false;
mine_pressed.alpha = 0;

local mine_text = display.newText("Mine", 0, 0, "Bellota-Regular", 24);

local mine_group = display.newGroup();
mine_group:insert(mine);
mine_group:insert(mine_pressed);
mine_group:insert(mine_text);
mine_group.x = _SCREEN.CENTER.x + 80;
mine_group.y = _SCREEN.CENTER.y + 140;
