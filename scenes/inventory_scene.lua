local inventory_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - 20, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(0/255, 255/255, 0/255, 0.5);
inventory_container:insert(test_box);

-- local background = display.newImageRect("images/lbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- inventory_container:insert(background);

local aspect_ratio = display.pixelHeight / display.pixelWidth;

local inventory_icon = display.newImageRect("images/inventory.png", 40, 40);
inventory_icon.x = -130;
inventory_icon.y = -390;
inventory_container:insert(inventory_icon);

local options =
{
	text = "Inventory",
	x = 0,
	y = -390,
	font = "Bellota-Regular",
	fontSize = 40
};

local inventory_text = display.newText(options);
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
