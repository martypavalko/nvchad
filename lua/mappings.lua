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

map("n", "<leader>hl", "<cmd>!helm lint %:p:h:h<cr>", { desc = "Helm lint chart" })
map("n", "<leader>ht", "<cmd>!helm template %:p:h:h<cr>", { desc = "Helm template chart" })
map("n", "<leader>hd", "<cmd>!helm template %:p:h:h --debug<cr>", { desc = "Helm debug template" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
