-- Auto close & auto rename HTML/JSX/TSX tags (great for your React/TS work).
-- Type <div> and it closes to </div>; rename one tag and the pair updates.
vim.pack.add {
  'https://github.com/windwp/nvim-ts-autotag',
}

require('nvim-ts-autotag').setup()
