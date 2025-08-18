return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>S", function() require("spectre").open() end, desc = "Spectre: Find and Replace" },
    { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Spectre: Replace Word" },
    { "<leader>sf", function() require("spectre").open_file_search() end, desc = "Spectre: Replace in current file" },
  }
}
