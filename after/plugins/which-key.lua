local whichKey = require("which-key")
local mappings = {
  ["<leader>"] = {
    p = {
      name = "+project",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      g = { "<cmd>Telescope live_grep<cr>", "Grep String" },
      b = { "<cmd>Telescope buffers<cr>", "Open Recent File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
    t = {
      name = "+tree",
      t = {"<cmd>NERDTreeToggle<cr>", "Show File Tree"},
    },
    s = {
      name = "+source",
      v = { "<cmd>source ~/.config/nvim/init.vim<cr>", "Source init.vim" },
    }
  },
}

whichKey.register(mappings)
whichKey.setup {}
