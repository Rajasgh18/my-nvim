-- Statusline: lualine (replaces the disabled mini.statusline).
-- Gives the AstroNvim look: git branch/diff icons, diagnostics, filetype icon.
vim.pack.add {
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('lualine').setup {
  options = {
    theme = 'auto', -- derives from the active colorscheme (tokyonight) and follows changes
    globalstatus = true, -- one statusline for all splits
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'neo-tree', 'toggleterm' },
    },
  },
  sections = {
    lualine_a = { { 'mode', icon = '' } },
    lualine_b = {
      { 'branch', icon = '' },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
      { 'filename', path = 1, symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' } },
    },
    lualine_x = {
      -- Active LSP client name
      {
        function()
          local clients = vim.lsp.get_clients { bufnr = 0 }
          if #clients == 0 then return '' end
          local names = {}
          for _, c in ipairs(clients) do
            table.insert(names, c.name)
          end
          return ' ' .. table.concat(names, ', ')
        end,
      },
      'encoding',
      { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { { 'location', icon = '' } },
  },
  extensions = { 'neo-tree', 'toggleterm', 'lazy', 'trouble' },
}
