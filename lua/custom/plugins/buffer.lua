return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        mode = 'buffers',              -- Shows open files as tabs
        separator_style = 'thin',      -- Clean divider style
        always_show_bufferline = true, -- Keep the bar visible even with 1 file open
        show_buffer_close_icons = true,
        show_close_icon = true,
      },
    })

    -- Add keymaps to cycle through your tabs easily
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Tab' })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous Tab' })
    vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<CR>', { desc = 'Close Current Tab' })
  end,
}

