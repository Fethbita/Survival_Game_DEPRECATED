display.setStatusBar(display.HiddenStatusBar);

local mechanics = require("mechanics");

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
};

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
};

local image = display.newImageRect("images/background.png", 1920, 1080);
image.x = _SCREEN.CENTER.x - 15;
image.y = _SCREEN.CENTER.y + 50;

require("buttons");

healthBar = display.newRoundedRect(160, 3, 320, 6, 3);
healthBar:setFillColor(104/255, 159/255, 56/255);

energyBar = display.newRoundedRect(160, 9, 320, 6, 3);
energyBar:setFillColor(2/255, 136/255, 209/255);

time_text = display.newText(mechanics.time_text[mechanics.time + 1], 0, 0, "Bellota-Regular", 24);
time_text.x = _SCREEN.CENTER.x - 90;
time_text.y = _SCREEN.CENTER.y - 200;

local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
logs_text.x = _SCREEN.CENTER.x;
logs_text.y = _SCREEN.CENTER.y - 150;
