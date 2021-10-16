"set exrc

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/maps.vim
source $HOME/.config/nvim/themes/onedark.vim

luafile $HOME/.config/nvim/after/plugins/nvim-cmp.lua
luafile $HOME/.config/nvim/after/lsp/python-ls.lua
luafile $HOME/.config/nvim/after/lsp/vue-ls.lua
luafile $HOME/.config/nvim/after/plugins/lspsaga.lua
luafile $HOME/.config/nvim/after/plugins/treesitter.lua
luafile $HOME/.config/nvim/after/plugins/telescope.lua
luafile $HOME/.config/nvim/after/plugins/lualine.lua
luafile $HOME/.config/nvim/after/plugins/which-key.lua

source $HOME/.config/nvim/general/settings.vim

" Themes
luafile $HOME/.config/nvim/themes/tokyonight.lua

