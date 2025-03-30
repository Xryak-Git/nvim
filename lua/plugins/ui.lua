return {
    {
        'neanias/everforest-nvim',
        version = false,
        lazy = false,
        priority = 1000,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies  = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'everforest',
                component_separators = '|',
                section_separators = '',
            }
        }
    },
}
