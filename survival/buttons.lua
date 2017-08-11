local buttons = {};

--[[
Returns
--VAR--
buttons_can_be_pressed
--FUNC--
add_buttons_to_container
--]]

-- -----------------------------------------------------------------------------------

-- Button function
local function create_button_group(button_text, button_group_center_plus_x, button_group_center_plus_y, button_width, button_height)
  local button_group = display.newGroup();
  local button, button_pressed;
  if (button_group_center_plus_x < 0) then
    button = display.newImageRect("images/button_left.png", button_width, button_height);
    button_pressed = display.newImageRect("images/button_over_left.png", button_width, button_height);
  else
    button = display.newImageRect("images/button_right.png", button_width, button_height);
    button_pressed = display.newImageRect("images/button_over_right.png", button_width, button_height);
  end
  button_pressed.isVisible = false;
  button_pressed.alpha = 0;
  local button_text = display.newText(button_text, 0, 0, "Bellota-Regular", _SCREEN.height * G_font_size);

  button_group:insert(button);
  button_group:insert(button_pressed);
  button_group:insert(button_text);
  button_group.x = button_group_center_plus_x;
  button_group.y = button_group_center_plus_y;
  button_group.anchorChildren = true;
  return button_group;
end

-- Creating buttons
local explore_group = create_button_group("Explore", -_SCREEN.width / 2 + G_empty_space_from_sides * _SCREEN.width / 2, -(G_button_container_size * _SCREEN.height) / 3,
                                          _SCREEN.width * G_button_width, (G_button_container_size * _SCREEN.height) / 3 - (G_button_space * _SCREEN.height));
explore_group.anchorX = 0;
explore_group.is_pressed = false;

local pickup_group = create_button_group("Search", _SCREEN.width / 2 - G_empty_space_from_sides * _SCREEN.width / 2, -(G_button_container_size * _SCREEN.height) / 3,
                                         _SCREEN.width * G_button_width, (G_button_container_size * _SCREEN.height) / 3 - (G_button_space * _SCREEN.height));
pickup_group.anchorX = 1;
pickup_group.is_pressed = false;

local rest_group = create_button_group("Cook & Eat", -_SCREEN.width / 2 + G_empty_space_from_sides * _SCREEN.width / 2, 0, _SCREEN.width * G_button_width,
                                       (G_button_container_size * _SCREEN.height) / 3 - (G_button_space * _SCREEN.height));
rest_group.anchorX = 0;
rest_group.is_pressed = false;

local mine_group = create_button_group("Get Food", _SCREEN.width / 2 - G_empty_space_from_sides * _SCREEN.width / 2, 0, _SCREEN.width * G_button_width,
                                       (G_button_container_size * _SCREEN.height) / 3 - (G_button_space * _SCREEN.height));
mine_group.anchorX = 1;
mine_group.is_pressed = false;

local build_group = create_button_group("Build", -_SCREEN.width / 2 + G_empty_space_from_sides * _SCREEN.width / 2, (G_button_container_size * _SCREEN.height) / 3,
                                        _SCREEN.width * G_button_width, (G_button_container_size * _SCREEN.height) / 3 - (G_button_space * _SCREEN.height));
build_group.anchorX = 0;
build_group.is_pressed = false;

local run_group = create_button_group("I'm Ready!", _SCREEN.width / 2 - G_empty_space_from_sides * _SCREEN.width / 2, (G_button_container_size * _SCREEN.height) / 3,
                                      _SCREEN.width * G_button_width, (G_button_container_size * _SCREEN.height) / 3 - (G_button_space * _SCREEN.height));
run_group.anchorX = 1;
run_group.is_pressed = false;
run_group.can_be_pressed = false;

buttons.buttons_can_be_pressed = true;
local selected_buttons = 0;

-- -----------------------------------------------------------------------------------
-- Button event functions
-- -----------------------------------------------------------------------------------
local function handle_button_event(event)
  if (buttons.buttons_can_be_pressed) then
    -- If button is pressed, make it not pressed
    if (event.target.is_pressed) then
      event.target.is_pressed = false;
      buttons.buttons_can_be_pressed = false;
      mechanics.first_button_off(event.target[2], event.target[1]);
      selected_buttons = selected_buttons - 1;
      run_group.can_be_pressed = false;
    -- If energy is less than 100 or two buttons are not selected, do nothing
    elseif (selected_buttons == 2 or mechanics.energy < 100) then
      return true;
    -- If button is not pressed, make it pressed
    else
      event.target.is_pressed = true;
      buttons.buttons_can_be_pressed = false;
      mechanics.first_button_off(event.target[1], event.target[2]);
      selected_buttons = selected_buttons + 1;
      -- If two buttons are selected, make I am Ready button pressable
      if (selected_buttons == 2) then
        run_group.can_be_pressed = true;
      end

    end
  end
  return true;
end

local function run_it(event)
  if (buttons.buttons_can_be_pressed and run_group.can_be_pressed) then
    buttons.buttons_can_be_pressed = false;
    mechanics.pass_time(explore_group, rest_group, build_group, mine_group, pickup_group);
    selected_buttons = 0;
    run_group.can_be_pressed = false;
    buttons.buttons_can_be_pressed = true;
  end
  return true;
end

-- Make it not swipable
local function buttons_group_ignore(event)
  return true;
end

function buttons.add_buttons_to_container()
  local buttons_group = display.newContainer(_SCREEN.width, G_button_container_size * _SCREEN.height);
  buttons_group.anchorX = 0.5;
  buttons_group.x = _SCREEN.CENTER.x;
  buttons_group.anchorY = 1;
  buttons_group.y = _SCREEN.height;

  buttons_group:addEventListener("touch", buttons_group_ignore);

  local test_box = display.newRoundedRect(0, 0, _SCREEN.width - _SCREEN.width * G_empty_space_from_sides, buttons_group.height, 0);
  test_box:setFillColor(87/255, 87/255, 87/255, 0.5);
  test_box.isHitTestable = true;
  buttons_group:insert(test_box);

  buttons_group:insert(explore_group);
  buttons_group:insert(rest_group);
  buttons_group:insert(build_group);
  buttons_group:insert(mine_group);
  buttons_group:insert(pickup_group);
  buttons_group:insert(run_group);

  return buttons_group;
end

-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Button event function listeners
-- -----------------------------------------------------------------------------------
explore_group:addEventListener("tap", handle_button_event);
rest_group:addEventListener("tap", handle_button_event);
build_group:addEventListener("tap", handle_button_event);
pickup_group:addEventListener("tap", handle_button_event);
mine_group:addEventListener("tap", handle_button_event);
run_group:addEventListener("tap", run_it);
-- -----------------------------------------------------------------------------------

return buttons;
