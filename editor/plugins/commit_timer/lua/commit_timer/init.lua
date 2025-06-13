local M = {}
local sqlite = require("commit_timer.sqlite")

local timer_start = nil
local db = nil

function M.setup()
  print("[commit_timer] setup() called")

  db = sqlite.new()  -- kein Argument mehr!

  if not db then
    print("[commit_timer] Failed to open DB")
    return
  end

  print("[commit_timer] DB opened")

  db:exec [[
    CREATE TABLE IF NOT EXISTS commit_times (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      commit_hash TEXT,
      duration_seconds INTEGER,
      timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
    );
  ]]
  print("[commit_timer] Table ensured")

  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "COMMIT_EDITMSG",
    callback = function()
      print("[commit_timer] COMMIT_EDITMSG opened")
      timer_start = os.time()
    end,
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "COMMIT_EDITMSG",
    callback = function()
      print("[commit_timer] COMMIT_EDITMSG saved")
      if timer_start then
        local duration = os.time() - timer_start
        local handle = io.popen("git rev-parse HEAD 2>/dev/null")
        local commit_hash = handle and handle:read("*a"):gsub("%s+", "") or "unknown"
        if handle then handle:close() end

        db:exec(string.format([[
          INSERT INTO commit_times (commit_hash, duration_seconds)
          VALUES ('%s', %d);
        ]], commit_hash, duration))

        print(string.format("[commit_timer] Duration saved: %d sec for %s", duration, commit_hash))
        timer_start = nil
      else
        print("[commit_timer] No timer_start set")
      end
    end,
  })
end

return M
