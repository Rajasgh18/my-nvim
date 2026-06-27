vim.pack.add {
  { src = "https://github.com/akinsho/toggleterm.nvim" },
}

require("toggleterm").setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_terminals = true,
  insert_mappings = true,
  terminal_mappings = true,
  start_in_insert = true,
  persist_size = true,
  persist_mode = true,
  direction = "float",

  float_opts = {
    border = "rounded",
    width = math.floor(vim.o.columns * 0.9),
    height = math.floor(vim.o.lines * 0.9),
  },
})
