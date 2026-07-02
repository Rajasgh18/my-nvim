-- Small shared helpers used across the config modules.
local M = {}

--- Expand a `owner/repo` shorthand into a full GitHub URL for `vim.pack.add`.
---@param repo string
---@return string
function M.gh(repo) return 'https://github.com/' .. repo end

return M
