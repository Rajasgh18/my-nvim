vim.pack.add {
  'https://github.com/kdheepak/lazygit.nvim',
}

-- Lives under the Git group (<leader>g). AstroNvim uses <leader>gg for lazygit too.
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', {
  desc = 'LazyGit',
  silent = true,
})
