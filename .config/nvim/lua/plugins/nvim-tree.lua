return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local tree_api = require('nvim-tree.api')

    local bulk_paste = function()
      local marked_nodes = tree_api.marks.list()
      local destination = tree_api.tree.get_node_under_cursor()

      if next(marked_nodes) == nil then
        vim.api.nvim_echo({{"No nodes are marked to paste","None"}},false,{})
        return
      end
      if not destination or destination.type ~= "directory" then
        vim.api.nvim_echo({{"Please put your cursor on a folder to paste into","WarningMsg"}},false,{})
        return
      end

      for _,file in ipairs(marked_nodes) do
        tree_api.fs.copy.node(file)
      end

      tree_api.fs.paste(destination)

      tree_api.fs.clear_clipboard()
      tree_api.marks.clear()
    end

    local function on_attach(bufer_number)
      -- Add default nvim-tree mappings
      tree_api.config.mappings.default_on_attach(bufer_number)
      vim.keymap.set('n', 'p', bulk_paste, { desc = 'Tree: ' .. "Paste marked files", buffer = bufer_number , noremap = true, silent = true })
    end

    require("nvim-tree").setup {
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
      on_attach = on_attach
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
