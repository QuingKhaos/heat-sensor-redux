local hit_effects = require("__base__.prototypes.entity.hit-effects")
local khaosbash = require("__khaosbash__.prototypes.lib")
local khaosbash_constant_combinator = require("__khaosbash__.prototypes.base.combinator.constant-combinator")
local khaoslib_entity = require("__khaoslib__.prototypes.entity")
local sounds = require("__base__.prototypes.entity.sounds")

--- @type data.ConstantCombinatorPrototype
local constant_combinator = khaoslib_entity.get("constant-combinator", "constant-combinator")

--- @type data.HeatPipePrototype
local heat_pipe = khaoslib_entity.get("heat-pipe", "heat-pipe")

--- @type data.Color
local color = settings.startup["heat-sensor-redux-combinator-color"].value --[[@as data.Color]]

local heat_sensor = khaoslib_entity:load {
  type = "reactor",
  name = "heat-sensor",
  flags = {"placeable-neutral", "player-creation", "not-upgradable"},
  localised_name = {"item-name.heat-sensor"},
  max_health = 120,
  corpse = "small-remnants",
  dying_explosion = "constant-combinator-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  damaged_trigger_effect = hit_effects.entity(),
  icon_draw_specification = {scale = 0.5},

  consumption = "1W",
  energy_source = {
    type = "burner",
    render_no_power_icon = false,
    fuel_inventory_size = 0,
  },

  heat_buffer = {
    max_temperature = 1000,
    specific_heat = "1J",
    max_transfer = heat_pipe.heat_buffer.max_transfer,
    connections = heat_pipe.heat_buffer.connections,
  },

  working_sound = {
    sound = {filename = "__base__/sound/combinator.ogg", volume = 0.45, audible_distance_modifier = 0.2},
    fade_in_ticks = 4,
    fade_out_ticks = 20,
    match_speed_to_activity = true,
  },
  open_sound = sounds.combinator_open,
  close_sound = sounds.combinator_close,

  picture = khaosbash_constant_combinator.entity_sprites_from_tint(color).south,

  circuit_wire_max_distance = combinator_circuit_wire_max_distance,
  circuit_connector = {
    points = constant_combinator.circuit_wire_connection_points[3],
  },
  default_temperature_signal = {
    type = "virtual",
    name = "signal-T",
  },
} :set_minable {mining_time = 0.1, result = "heat-sensor"}
  :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/constant-combinator", color))

if mods["space-age"] then
  heat_sensor:set {heating_energy = "50kW"}
end

heat_sensor:commit()
