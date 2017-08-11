home_container = display.newContainer(_SCREEN.width, _SCREEN.height * G_main_container_size);

local test_box = display.newRoundedRect(0, 0, _SCREEN.width - _SCREEN.width * G_empty_space_from_sides, _SCREEN.height * G_main_container_size, 15);
test_box:setFillColor(87/255, 87/255, 87/255, 0.5);
home_container:insert(test_box);

-- local background = display.newImageRect("images/background.png", 800, 1200);
-- -- background.x = -15;
-- -- background.y = 50;
-- home_container:insert(background);

local heading_group = display.newGroup();
heading_group.anchorChildren = true;
heading_group.x = 0;
heading_group.y = -(_SCREEN.height * G_main_container_size / 2) + _SCREEN.height * G_icon_size / 2;
home_container:insert(heading_group);

local thoughts_icon = display.newImageRect("images/thoughts.png", _SCREEN.height * G_icon_size, _SCREEN.height * G_icon_size);
heading_group:insert(thoughts_icon);

local logs_text = display.newText("Thoughts", thoughts_icon.x + thoughts_icon.width / 2 + _SCREEN.width * G_text_space_from_object, 0,
                                  "Bellota-Regular", _SCREEN.height * G_font_size);
logs_text.anchorX = 0;
heading_group:insert(logs_text);

home_container.texts = {};
for var = 0, 9, 1 do
  home_container.texts[var] = display.newText("" , 0, 0, "Bellota-Regular", _SCREEN.height * G_little_font_size);
  home_container.texts[var].anchorX = 0;
  home_container.texts[var].x = -(_SCREEN.width - _SCREEN.width * G_empty_space_from_sides) / 2 + G_indentation_for_little_font * _SCREEN.width;
  if (var == 0) then
    home_container.texts[var].y = heading_group.y + _SCREEN.height * G_icon_size / 2 + _SCREEN.height * G_little_font_size / 2 + G_little_text_gap_from_header * _SCREEN.height;
  else
    home_container.texts[var].y = home_container.texts[var - 1].y + G_little_text_gap * _SCREEN.height;
  end
  home_container:insert(home_container.texts[var]);
end

return home_container;
