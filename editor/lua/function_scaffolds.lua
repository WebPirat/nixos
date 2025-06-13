
local M = {}

function M.insert_function_by_filetype()
  local filetype = vim.bo.filetype

  local lines = {}

  if filetype == "go" then
    lines = {
      "func FunctionName() {",
      "\t// TODO",
      "}"
    }
  elseif filetype == "javascript" or filetype == "javascriptreact" or filetype == "typescript" then
    lines = {
      "function functionName() {",
      "\t// TODO",
      "}"
    }
  elseif filetype == "php" then
    lines = {
      "function functionName() {",
      "\t// TODO",
      "}"
    }
  else
    vim.notify("Unsupported filetype: " .. filetype, vim.log.levels.WARN)
    return
  end

  vim.api.nvim_put(lines, "l", true, true)
end

return M
