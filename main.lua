local composer = require("composer");

display.setStatusBar(display.HiddenStatusBar);

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
};

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
};

HEALTHBAR = display.newRoundedRect(160, 3, 320, 6, 3);
HEALTHBAR:setFillColor(104/255, 159/255, 56/255);

ENERGYBAR = display.newRoundedRect(160, 9, 320, 6, 3);
ENERGYBAR:setFillColor(2/255, 136/255, 209/255);

composer.gotoScene("main_scene");
