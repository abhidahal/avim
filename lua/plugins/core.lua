return {
  { "nvim-lua/plenary.nvim" },
  -- { "github/copilot.vim" },

  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<Tab>", neocodeium.accept)
    end,
  },
  { "L3MON4D3/LuaSnip" },
  { "fladson/vim-kitty" },
  { "wakatime/vim-wakatime" },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "mg979/vim-visual-multi",
    config = function()
      vim.g.VM_default_mappings = 0
    end,
  },
}
