-- lua/custom/keymaps.lua
-- Loaded last (see the bottom of init.lua), so mappings here win any conflicts.

local map = vim.keymap.set
local Terminal = require('toggleterm.terminal').Terminal

---------------------------------------------------------------------
-- Terminal
---------------------------------------------------------------------
local float_term = Terminal:new { hidden = true, direction = 'float' }
map('n', '<leader>tt', function() float_term:toggle() end, { desc = 'Floating terminal' })
map('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

---------------------------------------------------------------------
-- General
---------------------------------------------------------------------
map('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
map({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<CR><Esc>', { desc = 'Save file' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit window' })
map('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Force quit all' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

---------------------------------------------------------------------
-- Better navigation (keep cursor centered)
---------------------------------------------------------------------
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

---------------------------------------------------------------------
-- Window navigation
---------------------------------------------------------------------
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize with arrows
map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase height' })
map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase width' })

---------------------------------------------------------------------
-- Window management  (<leader>w — moved off <leader>s, which is Search)
---------------------------------------------------------------------
map('n', '<leader>wv', '<C-w>v', { desc = 'Split vertical' })
map('n', '<leader>ws', '<C-w>s', { desc = 'Split horizontal' })
map('n', '<leader>we', '<C-w>=', { desc = 'Equalize splits' })
map('n', '<leader>wc', '<cmd>close<CR>', { desc = 'Close split' })

---------------------------------------------------------------------
-- Clipboard (system)
---------------------------------------------------------------------
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard' })
map({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

---------------------------------------------------------------------
-- Explorer (neo-tree)
---------------------------------------------------------------------
map('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Explorer (toggle)', silent = true })

---------------------------------------------------------------------
-- Find (Telescope) — <leader>f group
---------------------------------------------------------------------
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help tags' })
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent files' })

---------------------------------------------------------------------
-- LSP goto
---------------------------------------------------------------------
map('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Goto definition' })

-- NOTE: The following were removed to fix conflicts / duplicates:
--   * <leader>sv/sh/se/sx (splits)  -> moved to <leader>w* (was clobbering Search)
--   * <leader>bd (bdelete)          -> now in buffer.lua via mini.bufremove (keeps window)
--   * <S-h>/<S-l> (buffer cycle)    -> H / L in buffer.lua (BufferLine cycle)
--   * <leader>lg (lazygit)          -> moved to <leader>gg in lazygit.lua
--   * <leader>xx (Trouble)          -> defined once in trouble.lua
