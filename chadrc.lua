---@type ChadrcConfig
 local M = {}
 M.ui = {theme = 'catppuccin',
         statusline = {
           theme = 'vscode_colored',
         },
         nvdash = {
           load_on_startup = true,
                   header = {
                     "                                 ",
                     "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
                     "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
                     "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
                     "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
                     "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
                     "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
                     "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
                     "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    }
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
 return M
