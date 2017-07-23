local play_button = display.newImageRect("images/button_over.png", 340, 100);
play_button.x = _SCREEN.CENTER.x;
play_button.y = _SCREEN.CENTER.y;

local function play_button_event(event)
  event.target.isVisible = false;
  require("game");
  return true;
end

play_button:addEventListener("tap", play_button_event);
