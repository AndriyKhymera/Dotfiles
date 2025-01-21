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

    -- Add a keymap for Telescope projects
    vim.api.nvim_set_keymap(
      "n",
      "<leader>pr",
      "<cmd>Telescope projects<cr>",
      { noremap = true, silent = true, desc = "Find projects" }
    )

  end
}
