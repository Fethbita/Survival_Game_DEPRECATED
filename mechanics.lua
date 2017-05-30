local mechanics = {};

--[[
Returns
--VAR--
health, energy, inventory, time, time_text, day
--FUNC--
first_button_off, pass_time
--]]

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

mechanics.day = 1;

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

local function update_bars()
  if (mechanics.health > 0) then
    HEALTHBAR.width = math.floor(320 * (mechanics.health / 1000));
  else
    HEALTHBAR.width = 0;
  end
  if (mechanics.energy > 0) then
    ENERGYBAR.width = math.floor(320 * (mechanics.energy / 1000));
  else
    ENERGYBAR.width = 0;
  end
end

local function update_texts()
  TIMETEXT.text = mechanics.time_text[mechanics.time + 1];
  DAY.text = "Day " .. mechanics.day;
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

function mechanics.pass_time(explore_group, rest_group, build_group, mine_group, pickup_group)
  if (explore_group.is_pressed) then
    mechanics.energy = mechanics.energy - 100;
    update_bars();
    mechanics.first_button_off(explore_group[2], explore_group[1]);
    explore_group.is_pressed = false;
  end

  if (rest_group.is_pressed) then
    mechanics.energy = mechanics.energy + 150;
    update_bars();
    mechanics.first_button_off(rest_group[2], rest_group[1]);
    rest_group.is_pressed = false;
  end

  if (build_group.is_pressed) then
    mechanics.energy = mechanics.energy - 100;
    update_bars();
    mechanics.first_button_off(build_group[2], build_group[1]);
    build_group.is_pressed = false;
  end

  if (mine_group.is_pressed) then
    mechanics.energy = mechanics.energy - 100;
    update_bars();
    mechanics.first_button_off(mine_group[2], mine_group[1]);
    mine_group.is_pressed = false;
  end

  if (pickup_group.is_pressed) then
    if (mechanics.time == 1) then
      pickup(1, 5);
    else
      pickup(0, 3, 3);
    end
    mechanics.energy = mechanics.energy - 100;
    update_bars();
    mechanics.first_button_off(pickup_group[2], pickup_group[1]);
    pickup_group.is_pressed = false;
  end

  mechanics.time = 1 - mechanics.time;
  if (mechanics.time == 1) then
    mechanics.day = mechanics.day + 1;
  end
  update_texts();
end

return mechanics;
