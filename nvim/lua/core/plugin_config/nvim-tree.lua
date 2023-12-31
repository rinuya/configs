vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n', '<leader>ee', '<cmd> NvimTreeToggle <CR>', { desc='Toggle NvimTree' })
vim.keymap.set('n', '<leader>ef', '<cmd> NvimTreeFindFile <CR>', { desc='Find file in NvimTree' })
vim.keymap.set('n', '<leader>eF', '<cmd> NvimTreeFindFile! <CR>', { desc='Find file in NvimTree and update root' })