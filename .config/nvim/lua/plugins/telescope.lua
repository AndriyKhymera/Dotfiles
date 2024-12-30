return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
  },
  config = function ()
    require('telescope').load_extension('projects')
    require'telescope'.extensions.projects.projects{}
 require'telescope'.extensions.projects.projects{} end
}
