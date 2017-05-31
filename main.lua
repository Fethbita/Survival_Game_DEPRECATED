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

local scene_list = {"scenes.diary_scene", "scenes.main_scene", "scenes.inventory_scene"};
scene_list.count = 3;
local current_scene_no = 2;

-- touch()
local function swipe_scene(event)
  if event.phase == "ended" then
    if (event.xStart < event.x and (event.x - event.xStart) >= 50 and current_scene_no > 1) then
      local options = {
        effect = "slideRight",
        time = 500
      };
      current_scene_no = current_scene_no - 1;
      composer.gotoScene(scene_list[current_scene_no], options);
    elseif (event.xStart > event.x and (event.xStart - event.x) >= 50 and current_scene_no < scene_list.count) then
        local options = {
          effect = "slideLeft",
          time = 500
        };
        current_scene_no = current_scene_no + 1;
        composer.gotoScene(scene_list[current_scene_no], options);
    end
  end
  return true;
end

Runtime:addEventListener("touch", swipe_scene);

composer.gotoScene("scenes.main_scene");
