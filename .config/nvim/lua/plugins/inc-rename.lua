return {
  "smjonas/inc-rename.nvim",
  lazy = false,
  config = function()
    require("inc_rename").setup()
  end,
  keys = {
    -- Shift + F6
    { "<80>F8", ":IncRename", desc = "IncRename" }
  }
}
