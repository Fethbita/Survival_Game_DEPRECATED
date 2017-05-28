local mechanics = {};

mechanics.health = 1000;
mechanics.energy = 1000;
mechanics.inventory = {
  Wood = 0,
  Stone = 0,
  Berry = 0,
  Branch = 0
};
--[[
0 means nigttime
1 means daytime
--]]
mechanics.time = 1;
mechanics.time_text = {"Nighttime", "Daytime"};

local function explore()
  local random_number = math.random();
  local choice_count = 10;
end

--[[
Pickup function, it generates a random number between min_object and max_object
then with the prob_power given, creates a distribution.
--]]
local function pickup(min_object, max_object, prob_power)
  prob_power = prob_power or 4;
  for key,value in pairs(mechanics.inventory) do
    number_found = math.floor(min_object + ((max_object + 1) - min_object) * math.random() ^ prob_power);
    mechanics.inventory[key] = mechanics.inventory[key] + number_found;
  end
  print("Wood " .. mechanics.inventory.Wood .. "   ");
  print("Stone " .. mechanics.inventory.Stone .. "   ");
  print("Berry " .. mechanics.inventory.Berry .. "   ");
  print("Branch " .. mechanics.inventory.Branch .. "   ");
end

local function updateBars(healthBar, energyBar)
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

local function button_visible_on(button)
    button.isVisible = true;
end

local function button_visible_off(button)
    button.isVisible = false;
end

function mechanics.first_button_off(button_to_off, button_to_on)
  transition.cancel(button_to_off);
  transition.cancel(button_to_on);
  transition.to(button_to_off, {time=250, alpha=0, onComplete=button_visible_off});
  transition.to(button_to_on, {delay=250, time=250, alpha=1.0, onStart=button_visible_on});
end

function mechanics.pass_time(explore_button, explore_button_pressed, pickup_button, pickup_button_pressed,
  build_button, build_button_pressed, mine_button, mine_button_pressed, rest_button, rest_button_pressed,
  explore_button_isPressed, pickup_button_isPressed, rest_button_isPressed, build_button_isPressed, mine_button_isPressed)

  local to_return = {};
  to_return.explore_button_isPressed = explore_button_isPressed;
  to_return.pickup_button_isPressed = pickup_button_isPressed;
  to_return.rest_button_isPressed = rest_button_isPressed;
  to_return.build_button_isPressed = build_button_isPressed;
  to_return.mine_button_isPressed = mine_button_isPressed;

  if (explore_button_isPressed) then
    mechanics.energy = mechanics.energy - 100;
    updateBars(healthBar, energyBar);
    mechanics.first_button_off(explore_button_pressed, explore_button);
    to_return.explore_button_isPressed = false;
  end

  if (pickup_button_isPressed) then
    mechanics.energy = mechanics.energy - 100;
    updateBars(healthBar, energyBar);
    if (mechanics.time == 1) then
      pickup(1, 5);
    else
      pickup(0, 3, 3);
    end
    mechanics.first_button_off(pickup_button_pressed, pickup_button);
    to_return.pickup_button_isPressed = false;
  end

  if (rest_button_isPressed) then
    mechanics.energy = mechanics.energy + 150;
    updateBars(healthBar, energyBar);
    mechanics.first_button_off(rest_button_pressed, rest_button);
    to_return.rest_button_isPressed = false;
  end

  if (build_button_isPressed) then
    mechanics.energy = mechanics.energy - 100;
    updateBars(healthBar, energyBar);
    mechanics.first_button_off(build_button_pressed, build_button);
    to_return.build_button_isPressed = false;
  end

  if (mine_button_isPressed) then
    mechanics.energy = mechanics.energy - 100;
    updateBars(healthBar, energyBar);
    mechanics.first_button_off(mine_button_pressed, mine_button);
    to_return.mine_button_isPressed = false;
  end

  mechanics.time = 1 - mechanics.time;
  time_text.text = mechanics.time_text[mechanics.time + 1];
  return to_return;
end

return mechanics;
