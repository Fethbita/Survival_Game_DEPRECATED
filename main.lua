native.setProperty("androidSystemUiVisibility", "immersiveSticky");
display.setStatusBar(display.HiddenStatusBar);

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
};

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
};

math.randomseed(os.time());

require("dimensions");

require("game");
