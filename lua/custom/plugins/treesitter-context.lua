-- Shows the current function/class/scope "sticky" at the top of the window as you
-- scroll deep inside it. Huge quality-of-life boost in large files.
vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
}

require('treesitter-context').setup {
  max_lines = 3, -- how many sticky context lines to show
  multiline_threshold = 1,
  trim_scope = 'outer',
}

vim.keymap.set('n', '<leader>tc', '<cmd>TSContextToggle<CR>', { desc = 'Toggle sticky context' })
