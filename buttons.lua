local mechanics = require("mechanics");

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

local function button_visible_on(button)
    button.isVisible = true;
end

local function button_visible_off(button)
    button.isVisible = false;
end

local function handleExploreEvent(event)
  if (event.phase == "ended") then
    if (explore_button_isPressed) then
      explore_button_isPressed = not explore_button_isPressed;
      transition.cancel(explore);
      transition.cancel(explore_pressed);
      transition.to(explore_pressed, {time=250, alpha=0, onComplete=button_visible_off});
      transition.to(explore, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
      selected_buttons = selected_buttons - 1;
    else
      if (mechanics.energy < 100) then
        return;
      else
        explore_button_isPressed = not explore_button_isPressed;
        transition.cancel(explore);
        transition.cancel(explore_pressed);
        transition.to(explore, {time=250, alpha=0, onComplete=button_visible_off});
        transition.to(explore_pressed, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
        selected_buttons = selected_buttons + 1;

        if (selected_buttons == 2) then
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

          selected_buttons = 0;
        end
      end
    end
  end
end

local function handlePickupEvent(event)
  if (event.phase == "ended") then
    if (pickup_button_isPressed) then
      pickup_button_isPressed = not pickup_button_isPressed;
      transition.cancel(pickup);
      transition.cancel(pickup_pressed);
      transition.to(pickup_pressed, {time=250, alpha=0, onComplete=button_visible_off});
      transition.to(pickup, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
      selected_buttons = selected_buttons - 1;
    else
      if (mechanics.energy < 100) then
        return;
      else
        pickup_button_isPressed = not pickup_button_isPressed;
        transition.cancel(pickup);
        transition.cancel(pickup_pressed);
        transition.to(pickup, {time=250, alpha=0, onComplete=button_visible_off});
        transition.to(pickup_pressed, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
        selected_buttons = selected_buttons + 1;

        if (selected_buttons == 2) then
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

          selected_buttons = 0;
        end
      end
    end
  end
end

local function handleRestEvent(event)
  if (event.phase == "ended") then
    if (rest_button_isPressed) then
      rest_button_isPressed = not rest_button_isPressed;
      transition.cancel(rest);
      transition.cancel(rest_pressed);
      transition.to(rest_pressed, {time=250, alpha=0, onComplete=button_visible_off});
      transition.to(rest, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
      selected_buttons = selected_buttons - 1;
    else
      if (mechanics.energy >= 1000) then
        return;
      else
        rest_button_isPressed = not rest_button_isPressed;
        transition.cancel(rest);
        transition.cancel(rest_pressed);
        transition.to(rest, {time=250, alpha=0, onComplete=button_visible_off});
        transition.to(rest_pressed, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
        selected_buttons = selected_buttons + 1;

        if (selected_buttons == 2) then
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

          selected_buttons = 0;
        end
      end
    end
  end
end

local function handleBuildEvent(event)
  if (event.phase == "ended") then
    if (build_button_isPressed) then
      build_button_isPressed = not build_button_isPressed;
      transition.cancel(build);
      transition.cancel(build_pressed);
      transition.to(build_pressed, {time=250, alpha=0, onComplete=button_visible_off});
      transition.to(build, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
      selected_buttons = selected_buttons - 1;
    else
      if (mechanics.energy < 100) then
        return;
      else
        build_button_isPressed = not build_button_isPressed;
        transition.cancel(build);
        transition.cancel(build_pressed);
        transition.to(build, {time=250, alpha=0, onComplete=button_visible_off});
        transition.to(build_pressed, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
        selected_buttons = selected_buttons + 1;

        if (selected_buttons == 2) then
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

          selected_buttons = 0;
        end
      end
    end
  end
end

local function handleMineEvent(event)
  if (event.phase == "ended") then
    if (mine_button_isPressed) then
      mine_button_isPressed = not mine_button_isPressed;
      transition.cancel(mine);
      transition.cancel(mine_pressed);
      transition.to(mine_pressed, {time=250, alpha=0, onComplete=button_visible_off});
      transition.to(mine, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
      selected_buttons = selected_buttons - 1;
    else
      if (mechanics.energy < 100) then
        return;
      else
        mine_button_isPressed = not mine_button_isPressed;
        transition.cancel(mine);
        transition.cancel(mine_pressed);
        transition.to(mine, {time=250, alpha=0, onComplete=button_visible_off});
        transition.to(mine_pressed, {time=250, delay=250, alpha=1.0, onStart=button_visible_on});
        selected_buttons = selected_buttons + 1;

        if (selected_buttons == 2) then
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

          selected_buttons = 0;
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
explore_group.y = _SCREEN.CENTER.y + 140;

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
rest_group.y = _SCREEN.CENTER.y + 190;

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
build_group.y = _SCREEN.CENTER.y + 240;

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
