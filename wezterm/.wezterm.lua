-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Afterglow'

config.font_size = 14

config.set_environment_variables = {
  COLORTERM="truecolor",
}

config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
config.enable_tab_bar = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_decorations = 'RESIZE'
config.enable_tab_bar = false

-- Key bindings
config.keys = {
  {
    key = 'w',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

return config
