return{
  -- lazy.nvim
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "mistweaverco/uzuri.nvim",  -- Ensures uzuri loads first
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
}
