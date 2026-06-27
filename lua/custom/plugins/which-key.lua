vim.pack.add {
  { src = "https://github.com/folke/which-key.nvim" },
}

require("which-key").setup()

require("which-key").add({
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Git" },
  { "<leader>l", group = "LSP" },
  { "<leader>t", group = "Toggle" },
})
