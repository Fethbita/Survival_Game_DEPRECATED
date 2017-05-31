inventory_container = display.newContainer(320, 480);


local example_text = display.newText("Inventory", 0,0, "Bellota-Regular", 24);
inventory_container:insert(example_text, true);

return inventory_container;
