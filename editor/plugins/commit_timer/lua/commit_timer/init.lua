local M = {}

local sqlite = require("commit_timer.sqlite")
local db_path = vim.fn.stdpath("data") .. "/commit_time.sqlite3"
local timer_start = nil

function M.setup()
  local db = sqlite.new(db_path)
  db:exec [[
    CREATE TABLE IF NOT EXISTS commit_times (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      commit_hash TEXT,
      duration_seconds INTEGER,
      timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
    );
  ]]

  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "COMMIT_EDITMSG",
    callback = function()
      timer_start = os.time()
    end,
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "COMMIT_EDITMSG",
    callback = function()
      if timer_start then
        local duration = os.time() - timer_start

        local handle = io.popen("git rev-parse HEAD")
        local commit_hash = handle:read("*a"):gsub("\n", "")
        handle:close()

        db:insert("commit_times", {
          commit_hash = commit_hash,
          duration_seconds = duration,
        })

        timer_start = nil
      end
    end,
  })
end

return M