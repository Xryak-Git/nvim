
local map = vim.keymap.set

map('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })


-- Explorer
map('n', '<leader>e', vim.cmd.Ex, { desc = 'Explorer' })
-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')


-- Move highlighted blocks with J and K
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted blocks down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted blocks up' })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Windows
vim.keymap.set('n', '<leader>J', ':split<CR>')
vim.keymap.set('n', '<leader>L', ':vsplit<CR>')

vim.keymap.set('n', '<c-h>', ':split<CR>')

vim.keymap.set('n', '<c-Q>', ':qa!<CR>')

    --   { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
    --   { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
    --   { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
    --   { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
    --   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },