-- =====================================================================
--  Neovim config (built on kickstart.nvim + vim.pack)
--  Keybindings & docs:  see KEYBINDINGS.md in this directory
--
--  Structure:
--    lua/config/*    core: options, keymaps, autocmds, plugin-manager hooks
--    lua/plugins/*   kickstart plugins, one concern per file
--    lua/kickstart/  optional kickstart extras (debug, lint, neo-tree, ...)
--    lua/custom/     YOUR layer: custom plugins + keymaps (loaded LAST, wins)
-- =====================================================================

-- 1. Core (order matters: options set leader/have_nerd_font before plugins;
--    pack hooks must register before any vim.pack.add runs)
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.pack'

-- 2. Plugins (kickstart core)
require 'plugins.ui'
require 'plugins.git'
require 'plugins.telescope'
require 'plugins.lsp'
require 'plugins.completion'
require 'plugins.formatting'
require 'plugins.treesitter'

-- 3. Kickstart extras
require 'kickstart.plugins.debug'
require 'kickstart.plugins.indent_line'
require 'kickstart.plugins.lint'
require 'kickstart.plugins.autopairs'
require 'kickstart.plugins.neo-tree'

-- 4. Your custom layer (auto-loads lua/custom/plugins/*.lua, then your keymaps)
require 'custom.plugins'
require 'custom.keymaps'

-- vim: ts=2 sts=2 sw=2 et
