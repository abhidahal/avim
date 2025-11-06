-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
local map = LazyVim.safe_keymap_set

map("n", "<leader>O", "O<ESC>", { desc = "Create new line above" })
map("n", "<leader>o", "o<ESC>", { desc = "Create new line below" })

-- Move Lines
-- keymap.set("n", "<A-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- keymap.set("n", "<A-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- keymap.set("i", "<A-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- keymap.set("i", "<A-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- keymap.set("v", "<A-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- keymap.set("v", "<A-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- ScreenShot
map("v", "<leader>cp", ":Silicon<return>", { desc = "Screenshot" })
map("n", "<leader>cp", "V:Silicon<return>", { desc = "Screenshot" })

-- Paste without overwriting register
map("v", "<leader>p", '"_dP')

-- Keep window centered when going up/down
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
