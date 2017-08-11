local inventory_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - _SCREEN.width * G_empty_space_from_sides, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(87/255, 87/255, 87/255, 0.5);
inventory_container:insert(test_box);

-- local background = display.newImageRect("images/lbg.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- inventory_container:insert(background);

local heading_group = display.newGroup();
heading_group.anchorChildren = true;
heading_group.x = 0;
heading_group.y = -(_SCREEN.height * G_main_container_size / 2) + _SCREEN.height * G_icon_size / 2;
inventory_container:insert(heading_group);

local inventory_icon = display.newImageRect("images/inventory.png", 40, 40);
heading_group:insert(inventory_icon);

local inventory_text = display.newText("Inventory", inventory_icon.x + inventory_icon.width / 2 + _SCREEN.width * G_text_space_from_object, 0,
                                       "Bellota-Regular", _SCREEN.height * G_font_size);
inventory_text.anchorX = 0;
heading_group:insert(inventory_text);

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
