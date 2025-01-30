return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {'nvim-tree/nvim-web-devicons'},
  config = {
    week_header = {
      enable = true,
      -- concat  --concat string after time string line
      -- append  --table append after time string line
    },
    -- disable_move  -- boolean default is false disable move key
  }
}
