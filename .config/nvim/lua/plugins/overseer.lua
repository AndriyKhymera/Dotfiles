return {
  'stevearc/overseer.nvim',

  config = function()
    require("overseer").setup({
      templates     = { "builtin", "make" , "idea_make"}
    })
  end,

  keys = {
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "OverseerRun" },
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "OverseerToggle" },
  }
}
