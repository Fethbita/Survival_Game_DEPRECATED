display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget");
local mechanics = require("mechanics");

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
}

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
}

local image = display.newImageRect("images/background.png", 1920, 1080);
image.x = _SCREEN.CENTER.x - 15;
image.y = _SCREEN.CENTER.y + 50;

local healthBar = display.newRoundedRect(160, 3, 320, 6, 3);
healthBar:setFillColor(104/255, 159/255, 56/255);

local energyBar = display.newRoundedRect(160, 9, 320, 6, 3);
energyBar:setFillColor(2/255, 136/255, 209/255);

local time_text = display.newText(mechanics.time_text[mechanics.time + 1], 0, 0, "Bellota-Regular", 24);
time_text.x = _SCREEN.CENTER.x - 90;
time_text.y = _SCREEN.CENTER.y - 200;

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = _SCREEN.CENTER.x;
logs_text.y = _SCREEN.CENTER.y - 100;

local explore_button, explore_button_pressed, pickup_button, pickup_button_pressed
local build_button, build_button_pressed, mine_button, mine_button_pressed, rest_button, rest_button_pressed

function handleExploreEvent(event)
  if (event.phase == "ended") then
    if (mechanics.explore_button_isPressed) then
      mechanics.explore_button_isPressed = false;
      explore_button.isVisible = true;
      explore_button_pressed.isVisible = false;
      mechanics.selected_buttons = mechanics.selected_buttons - 1;
    else
      mechanics.explore_button_isPressed = true;
      explore_button.isVisible = false;
      explore_button_pressed.isVisible = true;
      mechanics.selected_buttons = mechanics.selected_buttons + 1;

      if (mechanics.energy < 100) then
        mechanics.explore_button_isPressed = false;
        explore_button.isVisible = true;
        explore_button_pressed.isVisible = false;
        mechanics.selected_buttons = mechanics.selected_buttons - 1;
        return;
      end

      if (mechanics.selected_buttons == 2) then
        mechanics.pass_time(healthBar, energyBar, time_text, explore_button, explore_button_pressed, pickup_button, pickup_button_pressed, build_button, build_button_pressed, mine_button, mine_button_pressed, rest_button, rest_button_pressed);
      end
    end
  end
end

function handlePickupEvent(event)
  if (event.phase == "ended") then
    if (mechanics.pickup_button_isPressed) then
      mechanics.pickup_button_isPressed = false;
      pickup_button.isVisible = true;
      pickup_button_pressed.isVisible = false;
      mechanics.selected_buttons = mechanics.selected_buttons - 1;
    else
      mechanics.pickup_button_isPressed = true;
      pickup_button.isVisible = false;
      pickup_button_pressed.isVisible = true;
      mechanics.selected_buttons = mechanics.selected_buttons + 1;

      if (mechanics.energy < 100) then
        mechanics.pickup_button_isPressed = false;
        pickup_button.isVisible = true;
        pickup_button_pressed.isVisible = false;
        mechanics.selected_buttons = mechanics.selected_buttons - 1;
        return;
      end

      if (mechanics.selected_buttons == 2) then
        mechanics.pass_time(healthBar, energyBar, time_text, explore_button, explore_button_pressed, pickup_button, pickup_button_pressed, build_button, build_button_pressed, mine_button, mine_button_pressed, rest_button, rest_button_pressed);
      end

    end
  end
end

function handleRestEvent(event)
  if (event.phase == "ended") then
    if (mechanics.rest_button_isPressed) then
      mechanics.rest_button_isPressed = false;
      rest_button.isVisible = true;
      rest_button_pressed.isVisible = false;
      mechanics.selected_buttons = mechanics.selected_buttons - 1;
    else
      mechanics.rest_button_isPressed = true;
      rest_button.isVisible = false;
      rest_button_pressed.isVisible = true;
      mechanics.selected_buttons = mechanics.selected_buttons + 1;

      if (mechanics.selected_buttons == 2) then
        mechanics.pass_time(healthBar, energyBar, time_text, explore_button, explore_button_pressed, pickup_button, pickup_button_pressed, build_button, build_button_pressed, mine_button, mine_button_pressed, rest_button, rest_button_pressed);
      end

    end
  end
end

function handleBuildEvent(event)
  if (event.phase == "ended") then
    if (mechanics.build_button_isPressed) then
      mechanics.build_button_isPressed = false;
      build_button.isVisible = true;
      build_button_pressed.isVisible = false;
      mechanics.selected_buttons = mechanics.selected_buttons - 1;
    else
      mechanics.build_button_isPressed = true;
      build_button.isVisible = false;
      build_button_pressed.isVisible = true;
      mechanics.selected_buttons = mechanics.selected_buttons + 1;

      if (mechanics.energy < 100) then
        mechanics.build_button_isPressed = false;
        build_button.isVisible = true;
        build_button_pressed.isVisible = false;
        mechanics.selected_buttons = mechanics.selected_buttons - 1;
        return;
      end

      if (mechanics.selected_buttons == 2) then
        mechanics.pass_time(healthBar, energyBar, time_text, explore_button, explore_button_pressed, pickup_button, pickup_button_pressed, build_button, build_button_pressed, mine_button, mine_button_pressed, rest_button, rest_button_pressed);
      end

    end
  end
end

function handleMineEvent(event)
  if (event.phase == "ended") then
    if (mechanics.mine_button_isPressed) then
      mechanics.mine_button_isPressed = false;
      mine_button.isVisible = true;
      mine_button_pressed.isVisible = false;
      mechanics.selected_buttons = mechanics.selected_buttons - 1;
    else
      mechanics.mine_button_isPressed = true;
      mine_button.isVisible = false;
      mine_button_pressed.isVisible = true;
      mechanics.selected_buttons = mechanics.selected_buttons + 1;

      if (mechanics.energy < 100) then
        mechanics.mine_button_isPressed = false;
        mine_button.isVisible = true;
        mine_button_pressed.isVisible = false;
        mechanics.selected_buttons = mechanics.selected_buttons - 1;
        return;
      end

      if (mechanics.selected_buttons == 2) then
        mechanics.pass_time(healthBar, energyBar, time_text, explore_button, explore_button_pressed, pickup_button, pickup_button_pressed, build_button, build_button_pressed, mine_button, mine_button_pressed, rest_button, rest_button_pressed);
      end

    end
  end
end

-- Creating explore button
explore_button = display.newImageRect("images/button.png", 140, 52);
explore_button:addEventListener("touch", handleExploreEvent);

explore_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
explore_button_pressed:addEventListener("touch", handleExploreEvent);
explore_button_pressed.isVisible = false;

local explore_button_text = display.newText( "Explore", 0, 0, "Bellota-Regular", 24 );

local explore_button_group = display.newGroup( )
explore_button_group:insert(explore_button)
explore_button_group:insert(explore_button_pressed)
explore_button_group:insert(explore_button_text)
explore_button_group.x = _SCREEN.CENTER.x - 80
explore_button_group.y = _SCREEN.CENTER.y + 90

-- Creating rest button
rest_button = display.newImageRect("images/button.png", 140, 52);
rest_button:addEventListener("touch", handleRestEvent);

rest_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
rest_button_pressed:addEventListener("touch", handleRestEvent);
rest_button_pressed.isVisible = false;

local rest_button_text = display.newText( "Rest", 0, 0, "Bellota-Regular", 24 );

local rest_button_group = display.newGroup( )
rest_button_group:insert(rest_button)
rest_button_group:insert(rest_button_pressed)
rest_button_group:insert(rest_button_text)
rest_button_group.x = _SCREEN.CENTER.x - 80
rest_button_group.y = _SCREEN.CENTER.y + 140

-- Creating build button
build_button = display.newImageRect("images/button.png", 140, 52);
build_button:addEventListener("touch", handleBuildEvent);

build_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
build_button_pressed:addEventListener("touch", handleBuildEvent);
build_button_pressed.isVisible = false;

local build_button_text = display.newText( "Build", 0, 0, "Bellota-Regular", 24 );

local build_button_group = display.newGroup( )
build_button_group:insert(build_button)
build_button_group:insert(build_button_pressed)
build_button_group:insert(build_button_text)
build_button_group.x = _SCREEN.CENTER.x - 80
build_button_group.y = _SCREEN.CENTER.y + 190

-- Creating pick up button
pickup_button = display.newImageRect("images/button.png", 140, 52);
pickup_button:addEventListener("touch", handlePickupEvent);

pickup_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
pickup_button_pressed:addEventListener("touch", handlePickupEvent);
pickup_button_pressed.isVisible = false;

local pickup_button_text = display.newText( "Pick Up", 0, 0, "Bellota-Regular", 24 );

local pickup_button_group = display.newGroup( )
pickup_button_group:insert(pickup_button)
pickup_button_group:insert(pickup_button_pressed)
pickup_button_group:insert(pickup_button_text)
pickup_button_group.x = _SCREEN.CENTER.x + 80
pickup_button_group.y = _SCREEN.CENTER.y + 190

-- Creating mine button
mine_button = display.newImageRect("images/button.png", 140, 52);
mine_button:addEventListener("touch", handleMineEvent);

mine_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
mine_button_pressed:addEventListener("touch", handleMineEvent);
mine_button_pressed.isVisible = false;

local mine_button_text = display.newText( "Mine", 0, 0, "Bellota-Regular", 24 );

local mine_button_group = display.newGroup( )
mine_button_group:insert(mine_button)
mine_button_group:insert(mine_button_pressed)
mine_button_group:insert(mine_button_text)
mine_button_group.x = _SCREEN.CENTER.x + 80
mine_button_group.y = _SCREEN.CENTER.y + 140
