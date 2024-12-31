return{
  "ahmedkhalf/project.nvim",
  lazy = false,
  dependencies = {"nvim-telescope/telescope.nvim"},
  config = function()
    require("project_nvim").setup {
      show_hidden = true,
      manual_mode = true
    }
    require('telescope').load_extension('projects')

  end
}
