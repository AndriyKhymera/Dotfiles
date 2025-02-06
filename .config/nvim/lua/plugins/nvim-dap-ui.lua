return {
  "rcarriga/nvim-dap-ui",
  dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
  keymaps = {
    { "<leader>do", "<cmd>lua require'dapui'.open()<CR>", desc = "dapui.open" }
  }
}
