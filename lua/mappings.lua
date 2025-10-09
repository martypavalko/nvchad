require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = "Toggle nvim-tree" })
map("n", "<C-N>", vim.cmd.NvimTreeFocus, { desc = "Toggle nvim-tree" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "H", vim.cmd.bprev)
map("n", "L", vim.cmd.bnext)

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
