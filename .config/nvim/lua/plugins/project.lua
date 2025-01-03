return{
  "ahmedkhalf/project.nvim",
  lazy = false,
  dependencies = {"nvim-telescope/telescope.nvim", "nvim-tree/nvim-tree.lua"},

  config = function()
    require("project_nvim").setup {
      show_hidden = true,
      detection_methods = { "pattern" },
      patterns = { ".git"}
    }
    require('telescope').load_extension('projects')

  end
}
