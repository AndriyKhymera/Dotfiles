return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim'},
  config = function ()
    require("telescope").setup({
      pickers = {
        find_files = {
          hidden = true, -- Enable hidden file searching
        },
      },
      keys = {
        {"<Leader>gt", false}
      }
    })
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')

  end
}
