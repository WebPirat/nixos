local M = {}

local timer_start = os.time()
local latest_filetype = nil

-- Gibt z. B. ~/.local/share/nvim/nvim_usage/2025_06.sqlite3 uuhblub
local function get_db_path()
  local date = os.date("*t")
  local dir = vim.fn.stdpath("data") .. "/nvim_usage"
  vim.fn.mkdir(dir, "p")
  return string.format("%s/%04d_%02d.sqlite3", dir, date.year, date.month)
end

-- SQL-Init über `sqlite3`
local function init_db(db_path)
  local create_cmd = string.format([[
    sqlite3 %s "
      CREATE TABLE IF NOT EXISTS nvim_sessions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        repo TEXT,
        branch TEXT,
        commit_hash TEXT,
        file_ext TEXT,
        duration_seconds INTEGER,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    "
  ]], db_path)
  os.execute(create_cmd)
end

-- Session-Daten eintragen
local function insert_session(db_path, data)
  local insert_cmd = string.format([[
    sqlite3 %s "
      INSERT INTO nvim_sessions (repo, branch, commit_hash, file_ext, duration_seconds)
      VALUES ('%s', '%s', '%s', '%s', %d);
    "
  ]], db_path,
    data.repo or "unknown",
    data.branch or "unknown",
    data.commit or "unknown",
    data.file_ext or "none",
    data.duration or 0
  )
  os.execute(insert_cmd)
end

-- Git-Daten auslesen
local function get_git_info()
  local function run(cmd)
    local h = io.popen(cmd)
    if not h then return nil end
    local result = h:read("*a")
    h:close()
    return result and result:gsub("%s+", "") or nil
  end

  return {
    branch = run("git rev-parse --abbrev-ref HEAD 2>/dev/null"),
    commit = run("git rev-parse HEAD 2>/dev/null"),
    repo = (run("basename `git rev-parse --show-toplevel 2>/dev/null`") or "unknown")
  }
end

-- Autocommand zum Merken der letzten Dateiendung
local function setup_filetype_tracking()
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
      local ext = vim.fn.fnamemodify(args.file, ":e")
      if ext ~= "" then
        latest_filetype = ext
      end
    end
  })
end

-- Haupt-Setup
function M.setup()
  local db_path = get_db_path()
  init_db(db_path)
  setup_filetype_tracking()

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      local duration = os.time() - timer_start
      local git_info = get_git_info()

      insert_session(db_path, {
        repo = git_info.repo,
        branch = git_info.branch,
        commit = git_info.commit,
        file_ext = latest_filetype or "none",
        duration = duration
      })

      print(string.format("[nvim_timer] Session saved: %d sec, repo=%s, branch=%s, ext=%s",
        duration, git_info.repo, git_info.branch, latest_filetype or "none"))
    end
  })
end

return M
