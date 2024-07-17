local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Alabaster'
config.font_size = 13.5

config.window_frame = {
  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#F0F0F0',
}

config.colors = {
  tab_bar = {
    background = "#FAFAFA",  -- Alabaster theme background

    active_tab = {
      bg_color = "#F7F7F7",  -- Slightly darker than the background
      fg_color = "#000000",  -- Black text for contrast
    },

    inactive_tab = {
      bg_color = "#ECECEC",  -- Light gray for inactive tabs
      fg_color = "#808080",  -- Gray text for inactive tabs
    },

    inactive_tab_hover = {
      bg_color = "#E0E0E0",  -- Match the active tab background on hover
      fg_color = "#000000",  -- Black text on hover
      italic = true,
    },

    new_tab = {
      bg_color = "#F7F7F7",  -- Match inactive tab background
      fg_color = "#808080",  -- Gray text for new tab
    },

    new_tab_hover = {
      bg_color = "#E0E0E0",  -- Match the active tab background on hover
      fg_color = "#000000",  -- Black text on hover
      italic = true,
    },
  },
}

return config

