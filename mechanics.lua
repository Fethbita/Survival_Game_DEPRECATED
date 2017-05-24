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
1 means daytime
0 means nigttime
--]]
local time = 1;
mechanics.time = time;

mechanics.explore = function ()
  local random_number = math.random()
  local choice_count = 10
end

--[[
Pickup function, it generates a random number between min_object and max_object
then with the prob_power given, creates a distribution.
--]]
mechanics.pickup = function (min_object, max_object, prob_power)
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

return mechanics;
