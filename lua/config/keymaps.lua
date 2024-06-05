vim.g.mapleader = " "
local keymap = vim.keymap

-- Quick Exit
keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert" })

-- Number Increment
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- New Line
keymap.set("n", "<leader>O", "O<ESC>", { desc = "Create new line above" })
keymap.set("n", "<leader>o", "o<ESC>", { desc = "Create new line below" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
keymap.set("i", "<C-a>", "<ESC>gg<S-v>G", { desc = "Select all" })

-- Rename
--
keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename File" })

-- Move Lines
keymap.set("n", "<A-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<A-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<A-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<A-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<A-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- ScreenSHot
keymap.set("v", "<leader>cp", ":Silicon<return>", { desc = "Screenshot" })
keymap.set("n", "<leader>cp", "V:Silicon<return>", { desc = "Screenshot" })

-- InsertMode Shift Backspace
keymap.set("i", "<C-bs>", "<ESC>ciw", { desc = "Delete" })

-- keymap.set("v", "<leader>p", function()
--   require("telescope").extensions.yank_history.yank_history({})
-- end, { desc = "Open Yank History" })
