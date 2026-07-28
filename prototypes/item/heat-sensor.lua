local item_sounds = require("__base__.prototypes.item_sounds")
local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_item = require("__khaoslib__.prototypes.item")

--- @type data.Color
local color = settings.startup["heat-sensor-redux-combinator-color"].value --[[@as data.Color]]

khaoslib_item:load {
  type = "item",
  name = "heat-sensor",
  subgroup = "circuit-network",
  place_result = "heat-sensor",
  order = "c[combinators]-d[heat-sensor]",
  inventory_move_sound = item_sounds.combinator_inventory_move,
  pick_sound = item_sounds.combinator_inventory_pickup,
  drop_sound = item_sounds.combinator_inventory_move,
  stack_size = 50
} :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/constant-combinator", color))
  :commit()
