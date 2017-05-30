local composer = require("composer");

local scene = composer.newScene();

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local mechanics = require("mechanics");

local function show_inventory()
  local options = {
    effect = "fade",
    time = 500
  };
  composer.gotoScene("inventory_scene", options);
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)

    local sceneGroup = self.view;
    -- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show(event)

    local sceneGroup = self.view;

    if (event.phase == "will") then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local background = display.newImageRect("images/background.png", 1920, 1080);
        background.x = _SCREEN.CENTER.x - 15;
        background.y = _SCREEN.CENTER.y + 50;
        sceneGroup:insert(background);

        HEALTHBAR = display.newRoundedRect(160, 3, 320, 6, 3);
        HEALTHBAR:setFillColor(104/255, 159/255, 56/255);
        sceneGroup:insert(HEALTHBAR);

        ENERGYBAR = display.newRoundedRect(160, 9, 320, 6, 3);
        ENERGYBAR:setFillColor(2/255, 136/255, 209/255);
        sceneGroup:insert(ENERGYBAR);

        TIMETEXT = display.newText(mechanics.time_text[mechanics.time + 1], 0, 0, "Bellota-Regular", 24);
        TIMETEXT.x = _SCREEN.CENTER.x - 90;
        TIMETEXT.y = _SCREEN.CENTER.y - 200;
        sceneGroup:insert(TIMETEXT);

        local logs_text = display.newText("Logs", 0,0, "Bellota-Regular", 24);
        logs_text.x = _SCREEN.CENTER.x;
        logs_text.y = _SCREEN.CENTER.y - 150;
        sceneGroup:insert(logs_text);

        require("buttons");
        --assert(loadfile("buttons.lua"))

    elseif (event.phase == "did") then
        -- Code here runs when the scene is entirely on screen
        timer.performWithDelay(5000, show_inventory);

    end
end


-- hide()
function scene:hide(event)

    local sceneGroup = self.view;

    if (event.phase == "will") then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif (event.phase == "did") then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy(event)

    local sceneGroup = self.view;
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene);
scene:addEventListener("show", scene);
scene:addEventListener("hide", scene);
scene:addEventListener("destroy", scene);
-- -----------------------------------------------------------------------------------

return scene;
