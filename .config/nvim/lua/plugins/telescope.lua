return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",         -- this includes hidden files
          "--no-ignore",      -- overrides .gitignore
          "--glob=!**/.git/*" -- avoids noisy .git
        },
      },
      pickers = {
        find_files = {
          hidden = true, -- Enable hidden file searching
          find_command = {
            "fd",
            "--type", "f",
            "--hidden",
            "--exclude", ".git"
          }
        },
      },
      keys = {
        { "<Leader>gt", false }
      }
    })
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
  end
}
