-- Session management: auto-saves a session per project directory so you can
-- reopen Neovim and restore all your buffers/splits exactly as you left them.
vim.pack.add {
  'https://github.com/folke/persistence.nvim',
}

require('persistence').setup()

-- Under <leader>S (Session) so it never collides with <leader>s (Search).
vim.keymap.set('n', '<leader>Ss', function() require('persistence').load() end, { desc = 'Restore session (this dir)' })
vim.keymap.set('n', '<leader>Sl', function() require('persistence').load { last = true } end, { desc = 'Restore last session' })
vim.keymap.set('n', '<leader>Sd', function() require('persistence').stop() end, { desc = "Don't save session on exit" })
