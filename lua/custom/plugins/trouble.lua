vim.pack.add {
  { src = "https://github.com/folke/trouble.nvim" },
}

require("trouble").setup()

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", {
  desc = "Diagnostics",
})

vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", {
  desc = "Quickfix",
})
