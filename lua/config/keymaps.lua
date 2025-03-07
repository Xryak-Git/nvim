
local map = vim.keymap.set

map('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })


-- Explorer
map('n', '<leader>e', vim.cmd.Ex, { desc = 'Explorer' })


-- Move highlighted blocks with J and K
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted blocks down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted blocks up' })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })