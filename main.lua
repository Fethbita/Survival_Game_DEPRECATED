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

local time_text = display.newText(mechanics.time_text[mechanics.time + 1], 0, 0, "Bellota-Regular", 24);
time_text.x = _SCREEN.CENTER.x - 90;
time_text.y = _SCREEN.CENTER.y - 200;

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = _SCREEN.CENTER.x;
logs_text.y = _SCREEN.CENTER.y - 100;

healthBar = display.newRoundedRect(160, 3, 320, 6, 3)
healthBar:setFillColor(104/255, 159/255, 56/255)

energyBar = display.newRoundedRect(160, 9, 320, 6, 3)
energyBar:setFillColor(2/255, 136/255, 209/255)

local function handleExploreEvent(event)
  --if (event.phase == "ended") then
    if (mechanics.energy >= 100) then
      mechanics.energy = mechanics.energy - 100;
      mechanics.updateBars(healthBar, energyBar);

      mechanics.selected_buttons = mechanics.selected_buttons + 1;
      if (mechanics.selected_buttons == 2) then
        mechanics.pass_time();
        time_text.text = mechanics.time_text[mechanics.time + 1];
      end
    end
  --end
end

local function handlePickupEvent(event)
  if (event.phase == "ended") then
    if (mechanics.energy >= 100) then
      mechanics.energy = mechanics.energy - 100;
      mechanics.updateBars(healthBar, energyBar);

      mechanics.selected_buttons = mechanics.selected_buttons + 1;
      if (mechanics.selected_buttons == 2) then
        mechanics.pass_time();
        time_text.text = mechanics.time_text[mechanics.time + 1];
      end
      if (mechanics.time == 1) then
        mechanics.pickup(1, 5);
      else
        mechanics.pickup(0, 3, 3);
      end
    end
  end
end


local function handleRestEvent(event)
  if (event.phase == "ended") then
  end
end

local function handleBuildEvent(event)
  if (event.phase == "ended") then
  end
end

local function handleMineEvent(event)
  if (event.phase == "ended") then
  end
end

-- Creating explore button
local explore_button = display.newImageRect("images/button.png", 140, 52);
explore_button:addEventListener("tap", handleExploreEvent);

local explore_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
explore_button_pressed:addEventListener("tap", handleExploreEvent);
explore_button_pressed.isVisible = false;

local explore_button_text = display.newText( "Explore", 0, 0, "Bellota-Regular", 24 );

local explore_button_group = display.newGroup( )
explore_button_group:insert(explore_button)
explore_button_group:insert(explore_button_pressed)
explore_button_group:insert(explore_button_text)
explore_button_group.x = _SCREEN.CENTER.x - 80
explore_button_group.y = _SCREEN.CENTER.y + 90

-- Creating rest button
local rest_button = display.newImageRect("images/button.png", 140, 52);
rest_button:addEventListener("touch", handleRestEvent);

local rest_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
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
local build_button = display.newImageRect("images/button.png", 140, 52);
build_button:addEventListener("touch", handleBuildEvent);

local build_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
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
local pickup_button = display.newImageRect("images/button.png", 140, 52);
pickup_button:addEventListener("touch", handlePickupEvent);

local pickup_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
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
local mine_button = display.newImageRect("images/button.png", 140, 52);
mine_button:addEventListener("touch", handleMineEvent);

local mine_button_pressed = display.newImageRect("images/button_over.png", 140, 52);
mine_button_pressed:addEventListener("touch", handleMineEvent);
mine_button_pressed.isVisible = false;

local mine_button_text = display.newText( "Mine", 0, 0, "Bellota-Regular", 24 );

local mine_button_group = display.newGroup( )
mine_button_group:insert(mine_button)
mine_button_group:insert(mine_button_pressed)
mine_button_group:insert(mine_button_text)
mine_button_group.x = _SCREEN.CENTER.x + 80
mine_button_group.y = _SCREEN.CENTER.y + 140
