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
      command = "google-java-format",
      args = { "-" },
      stdin = true,
    },
  },
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
