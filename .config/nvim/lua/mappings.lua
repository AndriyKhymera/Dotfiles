require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--get_projects map({ "n", "i", "v" }, "<C-s>", "<cmd> wcr>")

--nvim-cmp arrow keys mapping in sugessions. From some reason these doesn't work by defoult. Maybe there is some conflict, but imap doesn't show anything
map('i', '<Up>', require('cmp').mapping.select_prev_item())
map('i', '<Down>',require('cmp').mapping.select_next_item())
