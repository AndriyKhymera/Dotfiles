return {
  'nvimdev/dashboard-nvim',
  commit = "74e3b981a49dbbd0b901531a21495ddd06af19c9",
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' projects',
            group = 'Number',
            action = 'Telescope projects',
            key = 'p',
          },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
