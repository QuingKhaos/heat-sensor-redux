local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

khaoslib_recipe:load {
  type = "recipe",
  name = "heat-sensor",
  enabled = false,
  energy_required = 0.5,
} :set_ingredients {
  {type = "item", name = "constant-combinator", amount = 1},
  {type = "item", name = "heat-pipe", amount = 4},
} :set_results {
  {type = "item", name = "heat-sensor", amount = 1}
} :commit()
