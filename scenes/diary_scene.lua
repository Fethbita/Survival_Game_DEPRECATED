--sceneGroup = display.newGroup();
sceneGroup = display.newContainer(320, 480);


local example_text = display.newText("Diary", 0,0, "Bellota-Regular", 24);
example_text.x = _SCREEN.CENTER.x;
example_text.y = _SCREEN.CENTER.y;
sceneGroup:insert(example_text, true);

return sceneGroup;
