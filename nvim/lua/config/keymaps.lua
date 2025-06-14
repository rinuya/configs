vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Navigate Up and Down based on visual lines
vim.keymap.set('n', 'j', 'gj', { desc = 'Up', noremap = true})
vim.keymap.set('n', 'k', 'gk', { desc = 'Down', noremap = true})

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

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- select all lines in a file
vim.keymap.set("n", '<leader>A', 'ggVG', { desc = "Select all" })

-- NvimTree
vim.keymap.set('n', '<leader>ee', '<cmd> NvimTreeToggle <CR>', { desc='Toggle NvimTree' })
vim.keymap.set('n', '<leader>ef', '<cmd> NvimTreeFindFile <CR>', { desc='Find file in NvimTree' })
vim.keymap.set('n', '<leader>eF', '<cmd> NvimTreeFindFile! <CR>', { desc='Find file in NvimTree and update root' })