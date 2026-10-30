return {
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "text" }, -- Lazy load on specific filetypes
    init = function()
      -- Configure settings using vim.g
      vim.g.table_mode_corner = "|" -- Use pipes for corners instead of '+'
     animate = false
    end,
    keys = {
      { "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Toggle Table Mode" },
    },
  },
}
