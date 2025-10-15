-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Normal mode
vim.keymap.set("n", "<leader>sa", "gg<S-v>G", { desc = "Select All" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better paste (doesn't yank replaced text)
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })
