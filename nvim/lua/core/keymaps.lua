local opts = {
    noremap = true,
    silent = true
}

vim.g.mapleader = ' '

-----------------
-- Normal mode --
-----------------

-- Navigating windows
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resizing windows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)


-- Navigating buffers
vim.keymap.set('n', '<TAB>', ':bn<CR>')
vim.keymap.set('n', '<S-TAB>', ':bp<CR>')

vim.keymap.set('n', '<leader>fd', '<cmd>execute "cd ~/.config/nvim" | e init.lua <CR><cmd>NvimTreeFindFile!<CR>', { desc='Open Neovim config' })

vim.keymap.set('n', ',', 'i<CR><esc>', { desc='break line while in normal mode' })

-------------------
-- Miscellanious --
-------------------

vim.keymap.set("n", "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "[F]or[M]at files" })

vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- clear hlsearch when by pressing esc
vim.keymap.set('n', '<esc>', '<cmd>noh<CR><esc>')
vim.keymap.set('i', '<esc>', '<cmd>noh<CR><esc>')

-- select all lines in a file
vim.keymap.set("n", '<leader>A', 'ggVG', { desc = "Select all" })
-- other keymaps for plugins can be found in separate config files in   
-- core/plugin_config
