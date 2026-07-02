return {
  'echasnovski/mini.animate',
  version = false,
  config = function()
    require('mini.animate').setup({
      -- Animates cursor movements
      cursor = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'ms' }),
      },
      -- Animates window scrolling
      scroll = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'ms' }),
      },
    })
  end,
}
