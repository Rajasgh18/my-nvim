-- lua/custom/keymaps.lua

local map = vim.keymap.set
local Terminal = require("toggleterm.terminal").Terminal

---------------------------------------------------------------------
-- Terminal
---------------------------------------------------------------------
local terminal = Terminal:new({
  hidden = true,
  direction = "float",
})

vim.keymap.set("n", "<leader>tt", function()
  terminal:toggle()
end, { desc = "Floating Terminal" })

map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal" })

---------------------------------------------------------------------
-- General
---------------------------------------------------------------------

-- Better Escape
map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save File" })

-- Quit
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Force Quit
map("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force Quit" })

---------------------------------------------------------------------
-- Better Navigation
---------------------------------------------------------------------

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

---------------------------------------------------------------------
-- Window Navigation
---------------------------------------------------------------------

map("n", "<C-h>", "<C-w>h", { desc = "Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Up Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right Window" })

---------------------------------------------------------------------
-- Window Management
---------------------------------------------------------------------

map("n", "<leader>sv", "<C-w>v", { desc = "Vertical Split" })
map("n", "<leader>sh", "<C-w>s", { desc = "Horizontal Split" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize Splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Split" })

---------------------------------------------------------------------
-- Resize Windows
---------------------------------------------------------------------

map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

---------------------------------------------------------------------
-- Buffers
---------------------------------------------------------------------

map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })

map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })

---------------------------------------------------------------------
-- Clipboard
---------------------------------------------------------------------

map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to Clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy Line" })

map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste Clipboard" })

---------------------------------------------------------------------
-- Clear Search Highlight
---------------------------------------------------------------------

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

---------------------------------------------------------------------
-- Neo-tree
---------------------------------------------------------------------

map("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
  desc = "Explorer",
  silent = true,
})

---------------------------------------------------------------------
-- Telescope
---------------------------------------------------------------------

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })

---------------------------------------------------------------------
-- LazyGit
---------------------------------------------------------------------

map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

---------------------------------------------------------------------
-- Trouble
---------------------------------------------------------------------

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", {
  desc = "Diagnostics",
})

---------------------------------------------------------------------
-- Terminal
---------------------------------------------------------------------

map("t", "<Esc><Esc>", [[<C-\><C-n>]], {
  desc = "Exit Terminal Mode",
})
