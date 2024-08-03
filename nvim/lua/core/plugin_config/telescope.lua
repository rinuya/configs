local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc='[F]ind [F]iles (from working directory)' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc='[F]ind/[G]rep string in working directory' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc='[F]ind [R]ecently opened files' })