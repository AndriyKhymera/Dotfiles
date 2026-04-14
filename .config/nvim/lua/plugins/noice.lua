return {
  "folke/noice.nvim",
  event = "UIEnter",
  opts = {
    messages = {
      view_history = "messages", -- :messages opens noice split
    },
    views = {
      messages = {
        backend = "split",
        enter = true,
        size = "40%",
      },
    },
  },
  keys = {
    { "<leader>mn", "<cmd>Noice history<cr>", desc = "Message history" },
    { "<leader>ml", "<cmd>Noice last<cr>", desc = "Last message" },
    { "<leader>md", "<cmd>Noice dismiss<cr>", desc = "Dismiss notifications" },
  },
  dependencies = {
    "mistweaverco/uzuri.nvim", -- Ensures uzuri loads first
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
