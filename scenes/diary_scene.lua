diary_container = display.newContainer(_SCREEN.width, _SCREEN.height);

local example_text = display.newText("Diary", 0,0, "Bellota-Regular", 24);
diary_container:insert(example_text, true);

return diary_container;
