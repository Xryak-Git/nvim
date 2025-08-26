
local map = vim.keymap.set

map('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })


-- Explorer
-- map('n', '<leader>E', vim.cmd.Ex, { desc = 'Explorer' })
-- NeoTree
map('n', '<leader>E:', ':Neotree float reveal<CR>')
map('n', '<leader>e', ':Neotree left reveal<CR>')
map('n', '<leader>o', ':Neotree float git_status<CR>')
          -- Выйти из Neo-tree по <Esc>
map("n", "<s-Esc>", ":Neotree close<CR>")


-- Move highlighted blocks with J and K
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted blocks down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted blocks up' })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Tabs
map('n', '<Tab>', ':BufferLineCycleNext<CR>')
map('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Windows
map('n', '<leader>J', ':split<CR>')
map('n', '<leader>L', ':vsplit<CR>')

map('n', '<c-h>', ':split<CR>') 

map('n', '<c-Q>', ':qa!<CR>')

-- Перемещение между окнами
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

    --   { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
    --   { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
    --   { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
    --   { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
    --   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
