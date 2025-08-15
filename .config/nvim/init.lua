-- Update the path for lua to find rocks
-- This is one default set by luarocks
package.path = package.path .. ";/Users/andriikhymera/.luarocks/share/lua/5.1/?.lua"

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function()
    local file = vim.fn.expand("<afile>")
    local size = vim.fn.getfsize(file)
    if size > 1000000 then  -- ~1MB
      vim.b.large_file = true
      vim.cmd [[
        syntax off
        filetype off
        setlocal noswapfile
        setlocal noundofile
        setlocal noloadplugins
        setlocal foldmethod=manual
      ]]
    end
  end
})
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- require('overseer').setup()
