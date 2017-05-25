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

local explore_button_new = display.newImageRect("images/button.png", 140, 52);
explore_button_new.x = 100;
explore_button_new.y = 100;
explore_button_new:addEventListener("tap", handleExploreEvent);

local explore_button = widget.newButton{
  left = 10,
  top = 400,
  width = 140,
  height = 52,
  defaultFile = "images/button.png",
  overFile = "images/button_over.png",
  label = "Explore",
  font = "Bellota-Regular",
  fontSize = 24,
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  onEvent = handleExploreEvent,
  pressed = true
}

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

local pickup_button = widget.newButton{
  left = 170,
  top = 400,
  width = 140,
  height = 52,
  defaultFile = "images/button.png",
  overFile = "images/button_over.png",
  label = "Pick Up",
  font = "Bellota-Regular",
  fontSize = 24,
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  onEvent = handlePickupEvent,
  pressed = true
}

local function handleRestEvent(event)
  if (event.phase == "ended") then
  end
end


local rest_button = widget.newButton{
  left = 10,
  top = 350,
  width = 140,
  height = 52,
  defaultFile = "images/button.png",
  overFile = "images/button_over.png",
  label = "Rest",
  font = "Bellota-Regular",
  fontSize = 24,
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  onEvent = handleRestEvent,
  pressed = true
}

local function handleBuildEvent(event)
  if (event.phase == "ended") then
  end
end

local build_button = widget.newButton{
  left = 10,
  top = 450,
  width = 140,
  height = 52,
  defaultFile = "images/button.png",
  overFile = "images/button_over.png",
  label = "Build",
  font = "Bellota-Regular",
  fontSize = 24,
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  onEvent = handleBuildEvent,
  pressed = true
}

local function handleMineEvent(event)
  if (event.phase == "ended") then
  end
end

local mine_button = widget.newButton{
  left = 170,
  top = 450,
  width = 140,
  height = 52,
  defaultFile = "images/button.png",
  overFile = "images/button_over.png",
  label = "Mine",
  font = "Bellota-Regular",
  fontSize = 24,
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  onEvent = handleMineEvent,
  pressed = true
}
