local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    html = { "prettier" },
    json = { "jq" },
    hocon = { "jq" },
    java = { "google-java-format" },
  },
  formatters = {
    ["google-java-format"] = {
      command = vim.fn.expand("~/.dotfiles/.config/nvim/bin/google-java-format-java21.sh"),
      args = { "-" },
      stdin = true,
    },
  },
  keys = {
    {
      "<leader>fr",
      function()
        require("conform").format({ async = true })
      end,
      mode = { "n" },
      desc = "Conform: Format file"
    }
  },
}

return options
