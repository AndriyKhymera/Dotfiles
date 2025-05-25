return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = false, -- disables LSPSaga's breadcrumb bar
      },
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  },
  keys = {
    { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Lspsaga outline" }
  }
}
