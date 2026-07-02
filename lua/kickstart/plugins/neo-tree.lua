-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

-- NOTE: <leader>e toggle is defined in lua/custom/keymaps.lua (loaded last).

require('neo-tree').setup {
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = true,
  -- AstroNvim-style git status icons in the tree (needs a Nerd Font)
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added = '',
        modified = '',
        deleted = '✖',
        renamed = '󰁕',
        -- Status type
        untracked = '★',
        ignored = '◌',
        unstaged = '',
        staged = '✓',
        conflict = '',
      },
    },
    diagnostics = {
      symbols = {
        hint = '󰌵',
        info = '',
        warn = '',
        error = '',
      },
    },
  },
  filesystem = {
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = true, -- show hidden/gitignored files but dimmed
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    window = {
      mappings = {
        ['<leader>e'] = 'close_window',
      },
    },
  },
}
