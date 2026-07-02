vim.pack.add {
  { src = 'https://github.com/folke/tokyonight.nvim' },
}

require('tokyonight').setup {
  transparent = true,

  styles = {
    sidebars = 'transparent',
    floats = 'transparent',
  },
}

vim.cmd.colorscheme 'tokyonight'
