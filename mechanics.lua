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
  Branch = 0,
  Leaf = 0,
  Stone = 0,
  Beeswax = 0,
  Hemp = 0
};
--[[
1 means nigttime
2 means daytime
--]]
mechanics.time = 2;
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
    print(key .. " " .. mechanics.inventory[key] .. "  ");
  end
end

local function update_bars()
  if (mechanics.health > 0) then
    transition.to(HEALTHBAR, {width = math.floor(780 * (mechanics.health / 1000))});
  else
    transition.to(HEALTHBAR, {width = 0});
  end
  if (mechanics.energy > 0) then
    transition.to(ENERGYBAR, {width = math.floor(780 * (mechanics.energy / 1000))});
  else
    transition.to(ENERGYBAR, {width = 0});
  end
end

local function update_texts()
  TIMETEXT.text = mechanics.time_text[mechanics.time];
  DAYTEXT.text = "Day " .. mechanics.day;
  TOP_CONTAINER[10].text = mechanics.inventory.Branch;
  TOP_CONTAINER[12].text = mechanics.inventory.Leaf;
  TOP_CONTAINER[14].text = mechanics.inventory.Stone;
  TOP_CONTAINER[16].text = mechanics.inventory.Beeswax;
  TOP_CONTAINER[18].text = mechanics.inventory.Hemp;
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
    if (mechanics.time == 2) then
      pickup(1, 5);
    else
      pickup(0, 3, 3);
    end
    mechanics.energy = mechanics.energy - 100;
    update_bars();
    mechanics.first_button_off(pickup_group[2], pickup_group[1]);
    pickup_group.is_pressed = false;
  end

  if (rest_group.is_pressed) then
    mechanics.energy = mechanics.energy + 150;
    if (mechanics.energy >= 1000) then
      mechanics.energy = 1000;
    end
    update_bars();
    mechanics.first_button_off(rest_group[2], rest_group[1]);
    rest_group.is_pressed = false;
  end

  if (mechanics.time == 2) then
    mechanics.first_button_off(DAYICON, NIGHTICON);
  else
    mechanics.first_button_off(NIGHTICON, DAYICON);
  end

  mechanics.time = 3 - mechanics.time;
  if (mechanics.time == 2) then
    mechanics.day = mechanics.day + 1;
  end
  update_texts();
end

return mechanics;
