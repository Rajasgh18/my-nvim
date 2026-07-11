-- ============================================================
-- OPTIONS — core Neovim settings & leader keys
-- `:help vim.o` · `:help option-list`
-- ============================================================

-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Set <space> as the leader key (must happen before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- We have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Line numbers (absolute + relative for easy jumps)
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode (handy for resizing splits)
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the statusline
vim.o.showmode = false

-- Sync clipboard between OS and Neovim (scheduled to keep startup fast)
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent
vim.o.breakindent = true

-- Indentation: use 2 spaces per level (feels compact & normal)
vim.o.tabstop = 2 -- how many columns a <Tab> counts for
vim.o.softtabstop = 2 -- how many spaces <Tab>/<BS> insert/delete while editing
vim.o.shiftwidth = 2 -- spaces per indent step (>>, <<, autoindent)
vim.o.expandtab = true -- turn tabs into spaces
vim.o.smartindent = true -- context-aware autoindent for new lines

-- Persistent undo across sessions
vim.o.undofile = true

-- Case-insensitive search unless \C or a capital letter is used
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep the sign column on so text doesn't shift when signs appear
vim.o.signcolumn = 'yes'

-- Faster update time & shorter mapped-sequence wait
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Open new splits to the right and below
vim.o.splitright = true
vim.o.splitbelow = true

-- Show certain whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
vim.opt.termguicolors = true
vim.opt.showtabline = 2

-- Preview substitutions live as you type
vim.o.inccommand = 'split'

-- Highlight the cursor's line
vim.o.cursorline = true

-- Keep some context around the cursor
vim.o.scrolloff = 10

-- Ask to save instead of failing on :q with unsaved changes
vim.o.confirm = true
