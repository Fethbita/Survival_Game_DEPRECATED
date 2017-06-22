local buttons = {};

--[[
Returns
--FUNC--
add_buttons_to_container
--]]

-- -----------------------------------------------------------------------------------

local function create_button_group(button_text, button_group_center_plus_x, button_group_center_plus_y, button_width, button_height)
  local button_group = display.newGroup();

  local button = display.newImageRect("images/button.png", button_width, button_height);
  local button_pressed = display.newImageRect("images/button_over.png", button_width, button_height);
  button_pressed.isVisible = false;
  button_pressed.alpha = 0;
  local options =
  {
    text = button_text,
    x = 0,
    y = 0,
    font = "Bellota-Regular",
    fontSize = 40
  };
  local button_text = display.newText(options);

  button_group:insert(button);
  button_group:insert(button_pressed);
  button_group:insert(button_text);
  button_group.x = button_group_center_plus_x;
  button_group.y = button_group_center_plus_y;
  return button_group;
end


local explore_group = create_button_group("Explore", -185, -(G_button_container_size * _SCREEN.height) / (3 + G_button_space), 340, (G_button_container_size * _SCREEN.height) / (3 + G_button_space));
explore_group.is_pressed = false;
local pickup_group = create_button_group("Search", 180, -(G_button_container_size * _SCREEN.height) / (3 + G_button_space), 340, (G_button_container_size * _SCREEN.height) / (3 + G_button_space));
pickup_group.is_pressed = false;
local rest_group = create_button_group("Cook & Eat", -185, 0, 340, (G_button_container_size * _SCREEN.height) / (3 + G_button_space));
rest_group.is_pressed = false;
local mine_group = create_button_group("Get Food", 180, 0, 340, (G_button_container_size * _SCREEN.height) / (3 + G_button_space));
mine_group.is_pressed = false;
local build_group = create_button_group("Build", -185, (G_button_container_size * _SCREEN.height) / (3 + G_button_space), 340, (G_button_container_size * _SCREEN.height) / (3 + G_button_space));
build_group.is_pressed = false;
local run_group = create_button_group("I'm Ready!", 180, (G_button_container_size * _SCREEN.height) / (3 + G_button_space), 340, (G_button_container_size * _SCREEN.height) / (3 + G_button_space));
run_group.is_pressed = false;
run_group.can_be_pressed = false;

local buttons_can_be_pressed = true;
local selected_buttons = 0;

-- -----------------------------------------------------------------------------------
-- Button event functions
-- -----------------------------------------------------------------------------------
local function handle_button_event(event)
  if (buttons_can_be_pressed) then
    if (event.target.is_pressed) then
      event.target.is_pressed = false;
      mechanics.first_button_off(event.target[2], event.target[1]);
      selected_buttons = selected_buttons - 1;
      run_group.can_be_pressed = false;
    elseif (selected_buttons == 2 or mechanics.energy < 100) then
      return true;
    else
      event.target.is_pressed = true;
      mechanics.first_button_off(event.target[1], event.target[2]);
      selected_buttons = selected_buttons + 1;

      if (selected_buttons == 2) then
        run_group.can_be_pressed = true;
      end

    end
  end
  return true;
end

local function run_it(event)
  if (buttons_can_be_pressed and run_group.can_be_pressed) then
    buttons_can_be_pressed = false;
    mechanics.pass_time(explore_group, rest_group, build_group, mine_group, pickup_group);
    selected_buttons = 0;
    run_group.can_be_pressed = false;
    buttons_can_be_pressed = true;
  end
  return true;
end

local function buttons_group_ignore(event)
  return true;
end

function buttons.add_buttons_to_container()
  local buttons_group = display.newContainer(0, 0);
  buttons_group.anchorX = 0.5;
  buttons_group.x = _SCREEN.CENTER.x;
  buttons_group.anchorY = 1;
  buttons_group.y = _SCREEN.height;
  buttons_group.width = _SCREEN.width;
  buttons_group.height = G_button_container_size * _SCREEN.height;

  buttons_group:addEventListener("touch", buttons_group_ignore);

  local test_box = display.newRoundedRect(0, 0, buttons_group.width - 20, buttons_group.height, 15);
  test_box.width = _SCREEN.width - 20;
  test_box:setFillColor(200/255, 0/255, 0/255, 0.5);
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
