local mechanics = {};

--[[
Returns
--VAR--
health, energy, inventory, time, time_text, day
--FUNC--
first_button_off, pass_time
--]]

mechanics.thoughts = List.new();

mechanics.health = 1000;
mechanics.energy = 1000;
mechanics.inventory = {
  0, false, -- Branch
  0, false, -- Leaf
  0, false, -- Stone
  0, false, -- Beeswax
  0, false, -- Hemp
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
  for key, value in pairs(mechanics.inventory) do
    if (type(value) ~= "boolean") then
      number_found = math.floor(min_object + ((max_object + 1) - min_object) * math.random() ^ prob_power);
      mechanics.inventory[key] = mechanics.inventory[key] + number_found;
      if (number_found > 0) then
        mechanics.inventory[key + 1] = true;
      end
    end
  end
end

local function update_thoughts()
  for key, value in pairs(mechanics.thoughts) do
    if (key ~= "first" and key ~= "last" and key ~= "n") then
      SLIDESHOW_OBJECTS[2].texts[mechanics.thoughts.last - key].text = mechanics.thoughts.last - key + 1 .. "-) " .. value;
    end
  end
end

local function bad_luck(chance_to_get_hit, hit_lower_bound, hit_upper_bound, text_to_print)
  local random_number = math.random(1,100);
  if (random_number <= chance_to_get_hit) then
    mechanics.health = mechanics.health - math.random(hit_lower_bound, hit_upper_bound);
    while (mechanics.thoughts.n >= 10) do
      List.popleft(mechanics.thoughts);
    end
    List.pushright(mechanics.thoughts, text_to_print);
  end
end

local function update_bars()
  if (mechanics.health > 0) then
    transition.to(HEALTHBAR, {width = math.floor((_SCREEN.width - _SCREEN.width * G_empty_space_from_sides) * (mechanics.health / 1000))});
  else
    transition.to(HEALTHBAR, {width = 0});
  end
  if (mechanics.energy > 0) then
    transition.to(ENERGYBAR, {width = math.floor((_SCREEN.width - _SCREEN.width * G_empty_space_from_sides) * (mechanics.energy / 1000))});
  else
    transition.to(ENERGYBAR, {width = 0});
  end
end

function emphasize_text(some_text)
  transition.cancel(some_text);
  transition.to(some_text, {time=100, size=_SCREEN.height * G_emphasized_font_size});
  transition.to(some_text, {delay=100, time=100, size=_SCREEN.height * G_font_size});
end

local function update_texts()
  TIMETEXT.text = mechanics.time_text[mechanics.time];
  DAYTEXT.text = "Day " .. mechanics.day;
  for var = 9, 17, 2 do
    TOP_CONTAINER[var].text = mechanics.inventory[var - 8];
    if (mechanics.inventory[var - 7]) then
      emphasize_text(TOP_CONTAINER[var]);
      mechanics.inventory[var - 7] = false;
    end
  end
end

local function button_visible_on(button)
    button.isVisible = true;
end

local function button_visible_off(button)
    button.isVisible = false;
end

local function buttons_can_be_pressed()
  buttons.buttons_can_be_pressed = true;
end

function mechanics.first_button_off(button_to_off, button_to_on)
  transition.cancel(button_to_off);
  transition.cancel(button_to_on);
  transition.to(button_to_off, {delay=50, time=100, alpha=0, onComplete=button_visible_off, onComplete=buttons_can_be_pressed});
  transition.to(button_to_on, {delay=0, time=150, alpha=1.0, onStart=button_visible_on});
end

function mechanics.pass_time(explore_group, cookneat_group, build_group, get_food_group, search_group)
  if (explore_group.is_pressed) then
    if (mechanics.energy < 100) then
      mechanics.energy = 0;
    else
      mechanics.energy = mechanics.energy - 100;
    end
    mechanics.first_button_off(explore_group[2], explore_group[1]);
    explore_group.is_pressed = false;
  end

  if (build_group.is_pressed) then
    if (mechanics.energy < 100) then
      mechanics.energy = 0;
    else
      mechanics.energy = mechanics.energy - 100;
    end
    mechanics.first_button_off(build_group[2], build_group[1]);
    build_group.is_pressed = false;
  end

  if (get_food_group.is_pressed) then
    if (mechanics.energy < 100) then
      mechanics.energy = 0;
    else
      mechanics.energy = mechanics.energy - 100;
    end
    mechanics.first_button_off(get_food_group[2], get_food_group[1]);
    get_food_group.is_pressed = false;
  end

  if (search_group.is_pressed) then
    if (mechanics.time == 2) then
      pickup(1, 5);
    else
      pickup(0, 3, 3);
    end
    if (mechanics.energy < 100) then
      mechanics.energy = 0;
    else
      mechanics.energy = mechanics.energy - 100;
    end
    mechanics.first_button_off(search_group[2], search_group[1]);
    search_group.is_pressed = false;
  end

  if (cookneat_group.is_pressed) then
    if (mechanics.energy > 850) then
      mechanics.energy = 1000;
    else
      mechanics.energy = mechanics.energy + 150;
    end
    mechanics.first_button_off(cookneat_group[2], cookneat_group[1]);
    cookneat_group.is_pressed = false;
  end


  if (mechanics.time == 1) then  -- If it's nighttime
    bad_luck(10, 100, 200, "You have been attacked by an animal");
    bad_luck(10, 100, 200, "You have had an accident");
    mechanics.day = mechanics.day + 1;
    mechanics.first_button_off(NIGHTICON, DAYICON);
  else
    bad_luck(5, 100, 200, "You have been attacked by an animal");
    bad_luck(5, 100, 200, "You have had an accident");
    mechanics.first_button_off(DAYICON, NIGHTICON);
  end

  mechanics.time = 3 - mechanics.time;

  update_thoughts();
  update_bars();
  update_texts();
end

return mechanics;
