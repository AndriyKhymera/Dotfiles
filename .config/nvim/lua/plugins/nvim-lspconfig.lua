return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      -- disable jdtls config from lspconfig
      jdtls = function()
        return true
      end,
    },
  },
  keys = {
    {
      "<leader>lf",
      function()
        vim.lsp.buf.format()
      end,
      desc = "Format current buffer"
    }
  }
}
