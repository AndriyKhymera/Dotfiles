local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    html = { "prettier" },
    json = { "jq" },
    hocon = { "jq" },
  },
}


return options
