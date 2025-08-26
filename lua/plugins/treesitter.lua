return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'ray-x/go.nvim', ft = { 'go' } },
}