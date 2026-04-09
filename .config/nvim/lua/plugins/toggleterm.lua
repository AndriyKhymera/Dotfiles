return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { [[<c-\>]], mode = { "n", "t" }, desc = "Toggle terminal" },
    { "<leader>k", desc = "Toggle k9s" },
  },
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
    })

    -- close terminal from within terminal mode in one step
    vim.keymap.set("t", [[<c-\>]], "<cmd>ToggleTerm<cr>", { desc = "Close terminal" })

    local Terminal = require("toggleterm.terminal").Terminal
    local k9s = Terminal:new({
      cmd = "k9s",
      hidden = true,
      direction = "float",
      on_open = function(term)
        vim.keymap.set("t", [[<c-\>]], function()
          term:toggle()
        end, { buffer = term.bufnr, desc = "Close k9s terminal" })
      end,
    })

    vim.keymap.set("n", "<leader>k", function()
      k9s:toggle()
    end, { desc = "Toggle k9s" })
  end,
}
