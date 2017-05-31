local composer = require("composer");

local scene = composer.newScene();

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local mechanics = require("mechanics");

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
  local sceneGroup = self.view;
  -- Code here runs when the scene is first created but has not yet appeared on screen

  local background = display.newImageRect("images/background.png", 1920, 1080);
  background.x = _SCREEN.CENTER.x - 15;
  background.y = _SCREEN.CENTER.y + 50;
  sceneGroup:insert(background);

  TIMETEXT = display.newText(mechanics.time_text[mechanics.time + 1], 0, 0, "Bellota-Regular", 24);
  TIMETEXT.x = _SCREEN.CENTER.x - 90;
  TIMETEXT.y = _SCREEN.CENTER.y - 200;
  sceneGroup:insert(TIMETEXT);

  DAY = display.newText("Day " .. mechanics.day, 0, 0, "Bellota-Regular", 24);
  DAY.x = _SCREEN.CENTER.x + 90;
  DAY.y = _SCREEN.CENTER.y - 200;
  sceneGroup:insert(DAY);

  local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
  logs_text.x = _SCREEN.CENTER.x;
  logs_text.y = _SCREEN.CENTER.y - 150;
  sceneGroup:insert(logs_text);

  local buttons = require("buttons");
  buttons.add_buttons_to_scene(sceneGroup);
end

-- Code here runs when the scene is still off screen (but is about to come on screen)
function scene:willShow(event)
  local sceneGroup = self.view;
end

-- Code here runs when the scene is entirely on screen
function scene:didShow(event)
  local sceneGroup = self.view;
end

-- Code here runs when the scene is on screen (but is about to go off screen)
function scene:willHide(event)
  local sceneGroup = self.view;
end

-- Code here runs immediately after the scene goes entirely off screen
function scene:didHide(event)
  local sceneGroup = self.view;
end

-- destroy()
function scene:destroy(event)
  local sceneGroup = self.view;
  -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------

-- This code splits the "show" event into two separate events: willShow and didShow
-- for ease of coding above.
function scene:show(event)
  local sceneGroup  = self.view;
  if (event.phase == "will") then
    self:willShow(event);
  elseif (event.phase == "did") then
    self:didShow(event);
  end
end

-- This code splits the "hide" event into two separate events: willHide and didHide
-- for ease of coding above.
function scene:hide(event)
  local sceneGroup  = self.view;
  if (event.phase == "will") then
    self:willHide(event);
  elseif (event.phase == "did") then
    self:didHide(event);
  end
end

scene:addEventListener("create", scene);
scene:addEventListener("show", scene);
scene:addEventListener("hide", scene);
scene:addEventListener("destroy", scene);
-- -----------------------------------------------------------------------------------

return scene;
