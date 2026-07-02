-- ============================================================
-- AUTOCOMPLETE & SNIPPETS — blink.cmp + LuaSnip
-- `:help blink-cmp-config-keymap` · `:help ins-completion`
-- ============================================================
local gh = require('config.util').gh

-- Snippet engine
vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

-- To add premade snippets:
-- vim.pack.add { gh 'rafamadriz/friendly-snippets' }
-- require('luasnip.loaders.from_vscode').lazy_load()

-- Completion engine
vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink.cmp').setup {
  -- 'default' keymap: <c-y> accept, <c-space> menu/docs, <c-n>/<c-p> navigate,
  -- <c-e> hide, <c-k> signature. See `:help ins-completion`.
  keymap = { preset = 'default' },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },

  snippets = { preset = 'luasnip' },

  fuzzy = { implementation = 'lua' },

  signature = { enabled = true },
}
