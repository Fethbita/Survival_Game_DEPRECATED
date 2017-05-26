local mechanics = {};

mechanics.health = 1000;
mechanics.energy = 1000;
mechanics.inventory = {
  Wood = 0;
  Stone = 0;
  Berry = 0;
  Branch = 0;
};
--[[
0 means nigttime
1 means daytime
--]]
mechanics.time = 1;
mechanics.time_text = {"Nighttime", "Daytime"};

mechanics.explore_button_isPressed = false;
mechanics.pickup_button_isPressed = false;
mechanics.rest_button_isPressed = false;
mechanics.build_button_isPressed = false;
mechanics.mine_button_isPressed = false;

mechanics.selected_buttons = 0;

function mechanics.pass_time(healthBar, energyBar, time_text, explore_button, explore_button_pressed,
  pickup_button, pickup_button_pressed, build_button, build_button_pressed, mine_button, mine_button_pressed,
  rest_button, rest_button_pressed)

  if (explore_button_pressed.isVisible) then
    mechanics.energy = mechanics.energy - 100;
    mechanics.updateBars(healthBar, energyBar);

    mechanics.explore_button_isPressed = false;
    explore_button.isVisible = true;
    explore_button_pressed.isVisible = false;
  end

  if (pickup_button_pressed.isVisible) then
    mechanics.energy = mechanics.energy - 100;
    mechanics.updateBars(healthBar, energyBar);
    if (mechanics.time == 1) then
      mechanics.pickup(1, 5);
    else
      mechanics.pickup(0, 3, 3);
    end

    mechanics.pickup_button_isPressed = false;
    pickup_button.isVisible = true;
    pickup_button_pressed.isVisible = false;
  end

  if (rest_button_pressed.isVisible) then
    mechanics.updateBars(healthBar, energyBar);

    mechanics.rest_button_isPressed = false;
    rest_button.isVisible = true;
    rest_button_pressed.isVisible = false;
  end

  if (build_button_pressed.isVisible) then
    mechanics.energy = mechanics.energy - 100;
    mechanics.updateBars(healthBar, energyBar);

    mechanics.build_button_isPressed = false;
    build_button.isVisible = true;
    build_button_pressed.isVisible = false;
  end

  if (mine_button_pressed.isVisible) then
    mechanics.energy = mechanics.energy - 100;
    mechanics.updateBars(healthBar, energyBar);

    mechanics.mine_button_isPressed = false;
    mine_button.isVisible = true;
    mine_button_pressed.isVisible = false;
  end
  
  mechanics.time = 1 - mechanics.time;
  mechanics.selected_buttons = 0;
  time_text.text = mechanics.time_text[mechanics.time + 1];
end

function mechanics.explore()
  local random_number = math.random()
  local choice_count = 10
end

--[[
Pickup function, it generates a random number between min_object and max_object
then with the prob_power given, creates a distribution.
--]]
function mechanics.pickup(min_object, max_object, prob_power)
  prob_power = prob_power or 4
  for key,value in pairs(mechanics.inventory) do
    number_found = math.floor(min_object + ((max_object + 1) - min_object) * math.random() ^ prob_power);
    mechanics.inventory[key] = mechanics.inventory[key] + number_found;
  end
  print("Wood " .. mechanics.inventory.Wood .. "   ");
  print("Stone " .. mechanics.inventory.Stone .. "   ");
  print("Berry " .. mechanics.inventory.Berry .. "   ");
  print("Branch " .. mechanics.inventory.Branch .. "   ");
end

function mechanics.updateBars(healthBar, energyBar)
  if (mechanics.health > 0) then
    healthBar.width = math.floor(320 * (mechanics.health / 1000));
  else
    healthBar.width = 0;
  end
  if (mechanics.energy > 0) then
    energyBar.width = math.floor(320 * (mechanics.energy / 1000));
  else
    energyBar.width = 0;
  end
end

return mechanics;
