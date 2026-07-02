-- Smooth cursor/scroll animations.
-- mini.animate ships inside mini.nvim (already installed in init.lua), so we only
-- need to call setup(). NOTE: this config uses vim.pack, not lazy.nvim, so the
-- loader just `require()`s this file — returning a lazy-style spec table does nothing.
local animate = require 'mini.animate'

animate.setup {
  -- Animate cursor movement
  cursor = {
    enable = true,
    timing = animate.gen_timing.linear { duration = 120, unit = 'total' },
  },
  -- Animate window scrolling
  scroll = {
    enable = true,
    timing = animate.gen_timing.linear { duration = 120, unit = 'total' },
  },
  -- Leave window resize/open/close animations off (they can feel laggy with splits)
  resize = { enable = false },
  open = { enable = false },
  close = { enable = false },
}
