-- ============================================================
-- PLUGIN MANAGER (vim.pack) — build hooks
-- This config uses Neovim's built-in `vim.pack`, NOT lazy.nvim.
--   :lua vim.pack.update()                       update all plugins
--   :lua vim.pack.update(nil, { offline = true }) inspect state / pending updates
-- Guide: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
--
-- NOTE: This must be required BEFORE any vim.pack.add call so the build hooks
-- fire when plugins that need compiling are first installed.
-- ============================================================

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

-- Run the right build step after a plugin is installed/updated.
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})
