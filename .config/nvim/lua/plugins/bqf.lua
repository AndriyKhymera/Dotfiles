return {
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
    ft = { "qf" },
    config = function()
      require("bqf").setup {
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "━", "┏", "┓", "┗", "┛", "├", "┤" },
        },
        func_map = {
          vsplit = "s",
          split = "i",
          tab = "t",
          ptogglemode = "K",
          stoggleup = "<C-k>",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all" },
          },
        },
      }
    end,
  },
}
