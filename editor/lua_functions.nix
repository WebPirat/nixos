{ pkgs, ... }:
''
-- =========================================
-- Commit-Timer Setup
-- =========================================
require("commit_timer").setup()

-- =========================================
-- Funktions-Scaffold
-- =========================================
function _G.insert_function_scaffold()
  local filetype = vim.bo.filetype
  local snippet_text = ""

  if filetype == "go" then
    snippet_text = [[
func YourFunctionName(args Type) (ReturnType, error) {
    // TODO: Implementierung
    return nil, nil
}
    ]]
  elseif filetype == "javascript" or filetype == "typescript" then
    snippet_text = [[
function yourFunctionName(args) {
    // TODO: Implementierung
}
    ]]
  elseif filetype == "php" then
    snippet_text = [[
<?php

function yourFunctionName($args) {
    // TODO: Implementierung
}

?>
    ]]
  else
    return
  end

  local lines = vim.split(snippet_text, "\n", { plain = true })
  local current_row = vim.api.nvim_win_get_cursor(0)[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr, current_row, current_row, false, lines)
  vim.api.nvim_win_set_cursor(0, {current_row + 1, 0})
end

-- =========================================
-- Filetype Registrierung für .nuts
-- =========================================
vim.filetype.add({
  extension = {
    nuts = "nuts",
  }
})

-- =========================================
-- Autocommand für nuts-lsp
-- =========================================
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = "*.nuts",
  callback = function()
    -- Prüfen, ob nuts-lsp existiert
    local lsp_exe = vim.fn.exepath("nuts-lsp")
    if lsp_exe == "" then
      vim.notify("nuts-lsp executable not found!", vim.log.levels.ERROR)
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()

    -- Starten eines eigenen LSP-Clients direkt
    vim.lsp.start_client({
      name = "nuts_lsp",
      cmd = {lsp_exe, "--stdio"},
      root_dir = vim.fn.expand("%:p:h"), -- aktuelles Verzeichnis als Root
      filetypes = {"nuts"},
      on_attach = function(client, b)
        if b == bufnr then
          vim.notify("nuts-lsp attached to buffer " .. bufnr, vim.log.levels.INFO)
        end
      end,
    })
  end
})
''
