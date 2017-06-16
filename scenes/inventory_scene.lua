inventory_container = display.newContainer(_SCREEN.width, _SCREEN.height);

-- local background = display.newImageRect("images/lbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- inventory_container:insert(background);

local aspect_ratio = display.pixelHeight / display.pixelWidth;

local inventory_box = display.newRoundedRect( 0, 0, 0, 0, 15 )
inventory_box.x = _SCREEN.width - _SCREEN.width;
inventory_box.y = (_SCREEN.height / 2) - ((_SCREEN.height/2) + 42);
inventory_box.width = _SCREEN.width - 20;
if (aspect_ratio > 1.5) then
	inventory_box.height = _SCREEN.height - (_SCREEN.height - (_SCREEN.height / 2 + 69));
else
	inventory_box.height = _SCREEN.height - (_SCREEN.height - (_SCREEN.height / 2 - 32));
end
inventory_box:setFillColor(105/255, 105/255, 105/255, 0.5);
inventory_container:insert(inventory_box);

local inventory_icon = display.newImageRect( "images/inventory.png", 40, 40 )
inventory_icon.x = - 130;
inventory_icon.y = - 390;
inventory_container:insert(inventory_icon);

local inventory_text = display.newText("Inventory", 0,0, "Bellota-Regular", 40);
inventory_text.x = 0;
inventory_text.y = - 390;
inventory_container:insert(inventory_text);

local inventory_item = display.newText("Axe x2", 0,0, "Bellota-Regular", 32);
inventory_item.x = - 340;
inventory_item.y = - 290;
inventory_item.anchorX = 0;
inventory_container:insert(inventory_item);

local inventory_item2 = display.newText("Fishing Rod", 0,0, "Bellota-Regular", 32);
inventory_item2.x = - 340;
inventory_item2.y = - 240;
inventory_item2.anchorX = 0;
inventory_container:insert(inventory_item2);

local inventory_item3 = display.newText("Shaped Stone x 2", 0,0, "Bellota-Regular", 32);
inventory_item3.x = - 340;
inventory_item3.y = - 190;
inventory_item3.anchorX = 0;
inventory_container:insert(inventory_item3);

local inventory_item4 = display.newText("Spear", 0,0, "Bellota-Regular", 32);
inventory_item4.x = - 340;
inventory_item4.y = - 140;
inventory_item4.anchorX = 0;
inventory_container:insert(inventory_item4);

return inventory_container;
