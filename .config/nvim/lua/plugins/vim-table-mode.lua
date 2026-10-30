return {
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "text" }, -- Lazy load on specific filetypes
    init = function()
      -- Configure settings using vim.g
      vim.g.table_mode_corner = "|" -- Use pipes for corners instead of '+'
      -- Buffer-local, only while table mode is active
      vim.g.table_mode_motion_right_map = "<Tab>"
      vim.g.table_mode_motion_left_map = "<S-Tab>"
    end,
    keys = {
      { "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Toggle Table Mode" },
    },
  },
}
