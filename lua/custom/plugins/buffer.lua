vim.pack.add {
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

vim.opt.termguicolors = true
vim.opt.showtabline = 2

require('bufferline').setup {
  options = {
    mode = 'buffers',
    always_show_bufferline = true,
    diagnostics = 'nvim_lsp',
    separator_style = 'thin',

    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        text_align = 'center',
        separator = true,
      },
    },
  },
}

vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
