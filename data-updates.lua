local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if mods["khaoscircuitrygroup"] then
  khaoslib_item:load("heat-sensor"):set {subgroup = "circuit-input"} :commit()
end

-- Unlock heat sensor whenever heat pipe is unlocked.
local techs = khaoslib_technology.find(function(tech)
  return khaoslib_technology.has_unlock_recipe(tech, function(effect)
    return effect.type == "unlock-recipe" and effect.recipe:match("heat%-pipe")
  end)
end)

for _, tech in pairs(techs) do
  khaoslib_technology:load(tech)
    :add_unlock_recipe("heat-sensor")
    :commit()
end
