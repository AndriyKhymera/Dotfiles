return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim'},
  keys = {
  },
  config = function ()
    require("telescope").setup({
      pickers = {
          find_files = {
            hidden = true, -- Enable hidden file searching
          },
      }
    })
    -- Add a keymap for Telescope projects
    vim.api.nvim_set_keymap(
      "n",
      "<leader>pr",
      "<cmd>Telescope projects<cr>",
      { noremap = true, silent = true, desc = "Find projects" }
    )
  end
}
