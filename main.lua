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
slideshowObjects[2] = require("scenes.main_scene");
slideshowObjects[3] = require("scenes.inventory_scene");

local slideshowParams = {
    startIndex = 2,
    transitionEffect = easing.outCubic,
    transitionEffectTimeMs = 250,
    swipeSensitivityPixels = 50,
    --onChange = updateThumbnails,
}
slideshow.init(slideshowObjects, slideshowParams)
