local khaoslib_setting = require("__khaoslib__.settings.setting")

khaoslib_setting:load {
  type = "color-setting",
  name = "heat-sensor-redux-combinator-color",
  setting_type = "startup",
  default_value = util.color("b09d3b"),
  order = "a[advanced]-a[combinator-color]",
  hidden = not mods["khaos-advanced-settings"]
} :commit()
