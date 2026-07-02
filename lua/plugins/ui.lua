-- ============================================================
-- UI / CORE UX — guess-indent, which-key, colorscheme, todo-comments, mini.*
-- ============================================================
local gh = require('config.util').gh

-- Auto-detect indentation
vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

-- which-key: shows pending keybinds. Configured ONCE here (base + groups).
-- Your custom-plugin keymaps register under these same group prefixes.
vim.pack.add { gh 'folke/which-key.nvim' }
require('which-key').setup {
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
}
require('which-key').add {
  -- kickstart groups
  { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
  { '<leader>t', group = '[T]oggle / Terminal' },
  { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  { 'gr', group = 'LSP Actions', mode = { 'n' } },
  { 'gs', group = '[S]urround', mode = { 'n', 'v' } },
  -- custom groups (see lua/custom/*)
  { '<leader>b', group = '[B]uffer' },
  { '<leader>f', group = '[F]ind' },
  { '<leader>g', group = '[G]it' },
  { '<leader>l', group = '[L]SP' },
  { '<leader>w', group = '[W]indow' },
  { '<leader>x', group = 'Diagnostics ([X])' },
  { '<leader>S', group = '[S]ession' },
}

-- Colorscheme (base install + setup). The final `colorscheme` call, including
-- transparency, lives in lua/custom/plugins/theme.lua so it stays your choice.
vim.pack.add { gh 'folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
  },
}
vim.cmd.colorscheme 'tokyonight-night'

-- Highlight TODO / FIXME / HACK comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

-- mini.nvim — a collection of small modules. Installed here; some modules
-- (bufremove, animate) are used from lua/custom/plugins/*.
vim.pack.add { gh 'nvim-mini/mini.nvim' }

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  -- Backwards-compat shim for plugins expecting nvim-web-devicons
  MiniIcons.mock_nvim_web_devicons()
end

-- Better around/inside text objects (e.g. va), yiiq, ci')
require('mini.ai').setup {
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

-- Add/delete/replace surroundings. Prefix is `gs` (not `s`) so it doesn't
-- collide with Flash's `s` jump. e.g. gsaiw) / gsd' / gsr)'
require('mini.surround').setup {
  mappings = {
    add = 'gsa',
    delete = 'gsd',
    find = 'gsf',
    find_left = 'gsF',
    highlight = 'gsh',
    replace = 'gsr',
    update_n_lines = 'gsn',
  },
}

-- NOTE: statusline is provided by lualine (lua/custom/plugins/lualine.lua),
-- so mini.statusline is intentionally not enabled here.
