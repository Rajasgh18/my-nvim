# ⌨️ Neovim Keybindings & Config Reference

> **Leader key = `Space`**. Press `<Space>` and wait — **which-key** pops up and shows
> every following key live, so you rarely need this file. This doc is the full map.
>
> ### 🗂️ Config layout (modular)
>
> ```
> init.lua                      # slim orchestrator — just requires the modules in order
> lua/
>   config/                     # CORE
>     util.lua                  #   gh() GitHub-URL helper
>     options.lua               #   vim options, leader, have_nerd_font
>     keymaps.lua               #   base keymaps + diagnostic config
>     autocmds.lua              #   autocommands (yank highlight)
>     pack.lua                  #   vim.pack build hooks
>   plugins/                    # KICKSTART PLUGINS (one concern per file)
>     ui.lua                    #   which-key, colorscheme, todo, mini.*  + all which-key groups
>     git.lua                   #   gitsigns (signs + hunk keymaps, single setup)
>     telescope.lua             #   fuzzy finder + LSP pickers
>     lsp.lua                   #   language servers, Mason, LSP keymaps
>     completion.lua            #   blink.cmp + LuaSnip
>     formatting.lua            #   conform.nvim
>     treesitter.lua            #   syntax / indentation
>   kickstart/plugins/*.lua     # kickstart extras (neo-tree, debug, lint, autopairs, indent_line)
>   custom/                     # 👤 YOUR LAYER — loaded LAST, wins all conflicts
>     keymaps.lua               #   your general keymaps
>     plugins/*.lua             #   one file per plugin, auto-loaded (bufferline, lualine, flash, …)
> ```
>
> **Load order** (from `init.lua`): `config.*` → `plugins.*` → `kickstart.plugins.*` → `custom.*`.
> Because `custom/` loads last, anything you set there overrides the core.

---

## 🧭 Cheat sheet (the ones you'll use daily)

| Key | Action |
|-----|--------|
| `<Space>` | Open which-key (discover everything) |
| `<leader>e` | Toggle file explorer (neo-tree) |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in project) |
| `<leader><leader>` | Switch buffers |
| `H` / `L` | Previous / next buffer |
| `<leader>bd` | **Close buffer, keep the window** ✅ |
| `<leader>gg` | LazyGit |
| `<leader>tt` | Floating terminal |
| `s` | Flash jump (hop anywhere on screen) |
| `gd` / `grr` | Goto definition / references |
| `<leader>lf` | Format file |
| `<C-s>` | Save |
| `jk` | Exit insert mode |

---

## 📁 Files & Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle neo-tree explorer |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |

## 🔎 Search — `<leader>s` (kickstart Telescope)

| Key | Action |
|-----|--------|
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>sr` | Resume last search |
| `<leader>sc` | Search commands |
| `<leader>sn` | Search Neovim config files |
| `<leader>ss` | Search Telescope builtins |
| `<leader>s.` | Recent files |
| `<leader>s/` | Grep in open files |
| `<leader>/` | Fuzzy find in current buffer |

## 📄 Buffers — `<leader>b`

| Key | Action |
|-----|--------|
| `H` / `L` | Previous / next buffer |
| `<leader>bd` | Delete buffer **(keeps window/split open)** |
| `<leader>bD` | Force delete buffer |
| `<leader>bo` | Close all other buffers |
| `<leader>bp` | Pin / unpin buffer |
| `<leader>b<` / `<leader>b>` | Move buffer left / right |

## 🪟 Windows — `<leader>w` + navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move to left/down/up/right window |
| `<C-Up/Down>` | Resize height |
| `<C-Left/Right>` | Resize width |
| `<leader>wv` | Split vertical |
| `<leader>ws` | Split horizontal |
| `<leader>we` | Equalize splits |
| `<leader>wc` | Close split |

## 🌿 Git — `<leader>g` + hunks `<leader>h`

| Key | Action |
|-----|--------|
| `<leader>gg` | Open **LazyGit** |
| `]c` / `[c` | Next / previous change (hunk) |
| `<leader>hs` | Stage hunk (works in visual too) |
| `<leader>hr` | Reset hunk (visual too) |
| `<leader>hS` | Stage whole buffer |
| `<leader>hR` | Reset whole buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hi` | Preview hunk inline |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>hq` / `<leader>hQ` | Hunks → quickfix (file / repo) |
| `<leader>tb` | Toggle inline line-blame |
| `<leader>tw` | Toggle word diff |
| `ih` | Text object: inside git hunk (e.g. `dih`, `vih`) |

**Git icons** now show in the gutter (▎ bars), the file tree (neo-tree), and the
statusline (branch  + added/modified/removed counts) — AstroNvim style.

## 🧠 LSP — `gr*`, `g*`, `<leader>l`

| Key | Action |
|-----|--------|
| `gd` | Goto definition |
| `grd` | Goto definition (kickstart) |
| `grr` | Goto references |
| `gri` | Goto implementation |
| `grt` | Goto type definition |
| `grD` | Goto declaration |
| `grn` | Rename symbol |
| `gra` | Code action |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `K` | Hover docs |
| `<C-k>` (insert) | Signature help |
| `<leader>lf` | Format buffer (conform) |
| `<leader>th` | Toggle inlay hints |
| `[d` / `]d` | Previous / next diagnostic |

## 🚑 Diagnostics / Trouble — `<leader>x`

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle Trouble diagnostics |
| `<leader>xq` | Toggle Trouble quickfix |
| `<leader>sd` | Telescope diagnostics list |

## 🔧 Toggle / Terminal — `<leader>t`

| Key | Action |
|-----|--------|
| `<leader>tt` | Floating terminal (toggle) |
| `<C-\>` | Toggleterm open/close |
| `<Esc><Esc>` | Exit terminal mode → normal |
| `<leader>tc` | Toggle sticky code context |
| `<leader>th` | Toggle inlay hints |
| `<leader>tb` | Toggle git line blame |
| `<leader>tw` | Toggle git word diff |

## 💾 Session — `<leader>S`

| Key | Action |
|-----|--------|
| `<leader>Ss` | Restore session for this directory |
| `<leader>Sl` | Restore last session |
| `<leader>Sd` | Don't save session on exit |

## ✏️ Editing & motion (general)

| Key | Action |
|-----|--------|
| `jk` (insert) | Exit to normal mode |
| `<C-s>` | Save file |
| `<leader>q` | Quit window |
| `<leader>Q` | Force quit all |
| `<Esc>` | Clear search highlight |
| `<C-d>` / `<C-u>` | Half-page down/up (centered) |
| `n` / `N` | Next/prev search (centered) |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<leader>p` | Paste from system clipboard |
| `s` | **Flash** — jump anywhere on screen |
| `gc` / `gcc` | Comment motion / line (built-in) |
| `gsa` / `gsd` / `gsr` | Surround add / delete / replace (mini.surround) |
| `va)` `ci"` `yi(` … | Around/inside text objects (mini.ai) |

---

## 🧩 Installed plugins & what they do

| Plugin | Purpose |
|--------|---------|
| **bufferline.nvim** | Buffer tabs at the top with icons & diagnostics |
| **lualine.nvim** | Statusline (git branch/diff, diagnostics, LSP, filetype) |
| **neo-tree.nvim** | File explorer with git status icons |
| **telescope.nvim** | Fuzzy finder (files, grep, symbols, …) |
| **gitsigns.nvim** | Git gutter signs + hunk actions + blame |
| **lazygit.nvim** | Full git TUI inside Neovim (`<leader>gg`) |
| **which-key.nvim** | Popup that shows available keybindings |
| **flash.nvim** | Fast on-screen jump motion (`s`) |
| **trouble.nvim** | Pretty diagnostics / quickfix list |
| **todo-comments.nvim** | Highlight TODO/FIXME/HACK comments |
| **noice.nvim** | Better cmdline / messages / LSP UI |
| **toggleterm.nvim** | Integrated terminal(s) |
| **conform.nvim** | Formatting (prettier, stylua, black…) on save |
| **blink.cmp** | Autocompletion |
| **nvim-lspconfig + mason** | Language servers |
| **nvim-treesitter** | Syntax highlighting / indentation |
| **nvim-treesitter-context** | Sticky function/class header while scrolling |
| **nvim-ts-autotag** | Auto close/rename HTML & JSX/TSX tags |
| **mini.nvim** | icons, statusline bits, ai, surround, bufremove, animate |
| **persistence.nvim** | Per-project session save/restore |
| **tokyonight.nvim** | Colorscheme (transparent) |

## 🛠️ Managing plugins (vim.pack — no lazy.nvim)

This config uses Neovim's **built-in** `vim.pack`, not lazy.nvim.

| Command | Action |
|---------|--------|
| `:lua vim.pack.update()` | Update all plugins |
| `:lua vim.pack.update(nil, { offline = true })` | Inspect state / pending updates |
| `:Mason` | Manage LSP servers / formatters |
| `:checkhealth` | Diagnose config problems |

**To add a plugin:** drop a new file in `lua/custom/plugins/`, e.g.:

```lua
-- lua/custom/plugins/example.lua
vim.pack.add { 'https://github.com/author/example.nvim' }
require('example').setup {}
```

It's auto-loaded on next start (see `lua/custom/plugins/init.lua`).

---

## 📝 Recent changes (what was fixed/added on top of your setup)

- ✅ **Icons enabled** (`have_nerd_font = true`) — git/file/statusline icons now render.
- ✅ **`<leader>bd`** now uses `mini.bufremove` → deletes the buffer **without** closing the window.
- ✅ **mini.animate** actually runs now (smooth cursor/scroll) — it was dead lazy-style code.
- ✅ **AstroNvim-style git icons** in the gutter, neo-tree, and lualine.
- ✅ **lualine** replaced mini.statusline for the richer look.
- ✅ **Fixed conflicts:** window splits moved `<leader>s*` → `<leader>w*`; format moved
  `<leader>f` → `<leader>lf` (so `<leader>f` = Find); lazygit `<leader>lg` → `<leader>gg`;
  surround `s*` → `gs*` (so Flash `s` is instant); removed duplicate which-key/bd/lazygit/trouble maps.
- ✅ **New plugins:** lualine, nvim-treesitter-context, nvim-ts-autotag, persistence.nvim.
- ✅ **Modularized:** the 1000-line `init.lua` was split into `lua/config/*` (core) and
  `lua/plugins/*` (one concern per file); `init.lua` is now a slim orchestrator.
- ✅ **gitsigns consolidated** into `lua/plugins/git.lua` — a duplicate `setup()` was
  silently resetting the custom git signs; now there's a single setup.
