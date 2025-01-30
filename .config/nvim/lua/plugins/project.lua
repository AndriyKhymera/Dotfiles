return{
  "ahmedkhalf/project.nvim",
  lazy = false,
  dependencies = {"nvim-telescope/telescope.nvim", "nvim-tree/nvim-tree.lua"},
  keys = { -- Lazy-load on <leader>pr keypress
        {
            "<leader>pr",
            function()
                require("telescope").extensions.projects.projects() -- Trigger the projects picker
            end,
            desc = "Find projects",
        },
  },

  config = function()
    require("project_nvim").setup {
      show_hidden = true,
      detection_methods = { "pattern" },
      patterns = { ".git"}
    }
    require('telescope').load_extension('projects')

  end
}
