local mechanics = {};
local health = 1000;
mechanics.health = health;
local energy = 1000;
mechanics.energy = energy;
local inventory = {
  Wood = 0;
  Stone = 0;
  Berry = 0;
  Branch = 0;
};
mechanics.inventory = inventory;
--[[
0 means nigttime
1 means daytime
--]]
local time = 1;
mechanics.time = time;
local time_text = {"Nighttime", "Daytime"};
mechanics.time_text = time_text;


local selected_buttons = 0;
mechanics.selected_buttons = selected_buttons;


function mechanics.pass_time()
  mechanics.time = 1 - mechanics.time;
  mechanics.selected_buttons = 0;
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
  for key,value in pairs(inventory) do
    number_found = math.floor(min_object + ((max_object + 1) - min_object) * math.random() ^ prob_power);
    inventory[key] = inventory[key] + number_found;
  end
  print("Wood " .. inventory.Wood .. "   ");
  print("Stone " .. inventory.Stone .. "   ");
  print("Berry " .. inventory.Berry .. "   ");
  print("Branch " .. inventory.Branch .. "   ");
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
