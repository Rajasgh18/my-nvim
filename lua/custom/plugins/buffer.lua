-- Buffer line (tabs) + buffer management keymaps
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
    -- Nerd Font glyphs for close/modified indicators (AstroNvim vibe)
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

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

-- Cycle buffers (respects the visible bufferline order)
vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })

-- Move buffers around in the bufferline
vim.keymap.set('n', '<leader>b>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer right' })
vim.keymap.set('n', '<leader>b<', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer left' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<cr>', { desc = 'Pin/unpin buffer' })

-- Delete the buffer WITHOUT closing the window/split (this is the fix you wanted).
-- mini.bufremove ships inside mini.nvim, which is already installed in init.lua.
vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete(0, false) end, { desc = 'Delete buffer (keep window)' })
vim.keymap.set('n', '<leader>bD', function() require('mini.bufremove').delete(0, true) end, { desc = 'Delete buffer (force, keep window)' })

-- Close all other buffers except the current one
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close other buffers' })
