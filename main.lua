display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")
local mechanics = require("mechanics")

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
}

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
}

local image = display.newImageRect("images/background.png", 1920, 1080)
image.x = _SCREEN.CENTER.x - 15
image.y = _SCREEN.CENTER.y + 50

local time_text = display.newText( "Daytime", 0, 0, "Bellota-Regular", 24 )
time_text.x = _SCREEN.CENTER.x - 90
time_text.y = _SCREEN.CENTER.y - 200

local logs_text = display.newText( "Logs", 0,0, "Bellota-Regular", 24 )
logs_text.x = _SCREEN.CENTER.x
logs_text.y = _SCREEN.CENTER.y - 100

local explore_button = widget.newButton{
  left = 20,
  top = 400,
  width = 127,
  height = 40,
  defaultFile = "images/explore_button.png",
  overFile = "images/explore_button_over.png",
  onEvent = handleButtonEvent
}

local function handleButtonEvent(event)
  if (event.phase == "ended") then
    if (mechanics.time == 1) then
      mechanics.pickup(1, 5);
    else
      mechanics.pickup(0, 3, 3);
    end
  end
end

local pickup_button = widget.newButton{
  left = 180,
  top = 400,
  width = 127,
  height = 40,
  defaultFile = "images/pickup_button.png",
  overFile = "images/pickup_button_over.png",
  onEvent = handleButtonEvent
}
