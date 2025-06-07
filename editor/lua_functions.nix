# ./lua_functions.nix
{ pkgs, ... }:

# Wir geben hier einen String zurück, der den Lua-Code enthält.
# Dieser String wird dann in extraConfigLua eingefügt.
''
  -- Diese Funktion fügt ein Funktionsgerüst basierend auf dem Dateityp ein.
  -- Sie ist global verfügbar, da sie im _G (globalen) Kontext definiert wird.
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
      -- Optional: Eine Nachricht anzeigen, wenn kein Snippet gefunden wurde
      -- vim.notify("Kein passendes Funktionsgerüst für den Dateityp '" .. filetype .. "' gefunden.", vim.log.levels.INFO)
      return
    end

    if #snippet_text == 0 then
      -- Dies sollte nicht passieren, wenn die obigen Bedingungen abgedeckt sind
      return
    end

    -- Teilen des Snippets in Zeilen
    local lines = vim.split(snippet_text, "\n", { plain = true })

    -- Aktuelle Cursorposition abrufen (1-basiert für Zeile, 0-basiert für Spalte)
    local current_row = vim.api.nvim_win_get_cursor(0)[1]
    local current_col = vim.api.nvim_win_get_cursor(0)[2]

    -- Buffer-ID des aktuellen Buffers
    local bufnr = vim.api.nvim_get_current_buf()

    -- Fügt den Text direkt nach der aktuellen Zeile ein.
    -- vim.api.nvim_buf_set_lines(bufnr, start_line_0_based, end_line_0_based, strict_indexing, replacement_lines)
    -- Da 'current_row' 1-basiert ist, müssen wir es für den start_line-Parameter auf 0-basiert umwandeln.
    -- current_row als 1-basierter Index ist die Zeile NACH der wir einfügen wollen.
    -- Wenn wir an Zeile 'current_row' (0-based: current_row - 1) einfügen wollen, müssen wir die API so aufrufen:
    vim.api.nvim_buf_set_lines(bufnr, current_row, current_row, false, lines)

    -- Cursor an den Anfang des eingefügten Textes positionieren
    -- Das Snippet wird an der 'current_row' (0-basiert) eingefügt.
    -- Also setzen wir den Cursor auf Zeile 'current_row + 1' (1-basiert) und Spalte 0.
    vim.api.nvim_win_set_cursor(0, {current_row + 1, 0})
  end
''
