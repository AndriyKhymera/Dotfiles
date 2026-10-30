return {
  "crusj/bookmarks.nvim",
  keys = {
    { "<leader>bm", mode = { "n" }, desc = "Toggle bookmarks" },
  },
  branch = "main",
  dependencies = { "nvim-web-devicons" },
  config = function()
    require("bookmarks").setup({
      keymap = { toggle = "<leader>bm" },
    })
    require("telescope").load_extension("bookmarks")
  end,
}
