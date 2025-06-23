require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--get_projects map({ "n", "i", "v" }, "<C-s>", "<cmd> wcr>")

--nvim-cmp arrow keys mapping in sugessions. From some reason these doesn't work by defoult. Maybe there is some conflict, but imap doesn't show anything
map('i', '<Up>', require('cmp').mapping.select_prev_item())
map('i', '<Down>',require('cmp').mapping.select_next_item())

map('n', '<leader>bo', ':%bd|e#|bd#<CR>', { noremap = true, silent = true })

-- Normal mode: move current line
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })


map("n", "<leader>rn", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle Relative Numbers" })
