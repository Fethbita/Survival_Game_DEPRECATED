inventory_container = display.newContainer(_SCREEN.width, _SCREEN.height);

local example_text = display.newText("Inventory", 0,0, "Bellota-Regular", 24);
inventory_container:insert(example_text, true);

return inventory_container;
