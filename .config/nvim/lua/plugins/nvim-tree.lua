return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
      view = {
        -- adapath the width of the window according to file name
        adaptive_size = true
      },
      filters = {
        git_ignored = false
      }
    }
  end
}

-- Old NvChad default confgis
-- require("nvim-tree").setup({
--   sync_root_with_cwd = true,
--   respect_buf_cwd = true,
--   update_focused_file = {
--     enable = true,
--     update_root = true
--   },
-- })
