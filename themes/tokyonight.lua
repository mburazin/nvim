-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

