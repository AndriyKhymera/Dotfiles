return {
  'Bekaboo/dropbar.nvim',
  -- optional, but required for fuzzy finder support
  event = "BufReadPre",
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  config = function()
    require("dropbar").setup()
    local dropbar_api = require('dropbar.api')
    vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
    vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
  end
}
