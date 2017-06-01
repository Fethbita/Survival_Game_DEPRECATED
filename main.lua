display.setStatusBar(display.HiddenStatusBar);

_SCREEN = {
  width = display.contentWidth,
  height = display.contentHeight
};

_SCREEN.CENTER = {
  x = display.contentCenterX,
  y = display.contentCenterY
};

local slideshow = require("slideshow");

local slideshowObjects = {};
slideshowObjects[1] = require("scenes.diary_scene");
slideshowObjects[2] = require("scenes.home_scene");
slideshowObjects[3] = require("scenes.inventory_scene");

local slideshowParams = {
    startIndex = 2,
    transitionEffect = easing.outCubic,
    transitionEffectTimeMs = 250,
    swipeSensitivityPixels = 50,
    --onChange = updateThumbnails,
}
slideshow.init(slideshowObjects, slideshowParams)


HEALTHBAR = display.newRoundedRect(_SCREEN.width / 2, 3, 320, 6, 3);
HEALTHBAR:setFillColor(104/255, 159/255, 56/255);

ENERGYBAR = display.newRoundedRect(_SCREEN.width / 2, 9, 320, 6, 3);
ENERGYBAR:setFillColor(2/255, 136/255, 209/255);
