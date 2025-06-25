return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function telescope_grep_in_dir()
          local node = api.tree.get_node_under_cursor()
          local path = node and node.absolute_path or vim.fn.getcwd()
          require("telescope.builtin").live_grep({ search_dirs = { path } })
        end

        vim.keymap.set("n", "<leader>fi", telescope_grep_in_dir,
          { desc = "Live grep in folder", buffer = bufnr, noremap = true, silent = true })
    end

    require("nvim-tree").setup {
      on_attch = on_attach(),
      -- respect_buf_cwd = true,
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
      },
    }
  end
}
