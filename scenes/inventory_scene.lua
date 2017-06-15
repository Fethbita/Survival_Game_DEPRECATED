inventory_container = display.newContainer(_SCREEN.width, _SCREEN.height);

-- local background = display.newImageRect("images/lbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- inventory_container:insert(background);

local inventory_box = display.newRoundedRect( 0, -42, 780, 780, 15 )
inventory_box:setFillColor(105/255, 105/255, 105/255, 0.5);
inventory_container:insert(inventory_box);

local inventory_icon = display.newImageRect( "images/inventory.png", 32, 32 )
inventory_icon.x = - 150;
inventory_icon.y = - 390;
inventory_container:insert(inventory_icon);

local inventory_text = display.newText("Inventory", 0,0, "Bellota-Regular", 32);
inventory_text.x = 0;
inventory_text.y = - 390;
inventory_container:insert(inventory_text);

return inventory_container;
