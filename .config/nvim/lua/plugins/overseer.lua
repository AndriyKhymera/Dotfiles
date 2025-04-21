return {
  'stevearc/overseer.nvim',

  config = function()
    require("overseer").setup({
      templates = { "builtin", "make" },
      task_dirs = { ".", ".idea" }
    })
  end

}
