-- Minimal pure Lua SQLite wrapper
local M = {}
M.__index = M

local function encode(val)
  return "'" .. tostring(val):gsub("'", "''") .. "'"
end

function M.new(path)
  local db = setmetatable({}, M)
  db._path = path
  return db
end

function M:exec(query)
  local cmd = string.format("sqlite3 %s \"%s\"", encode(self._path), query:gsub("\n", " "))
  os.execute(cmd)
end

function M:insert(table_name, data)
  local keys = {}
  local values = {}

  for k, v in pairs(data) do
    table.insert(keys, k)
    table.insert(values, encode(v))
  end

  local query = string.format(
    "INSERT INTO %s (%s) VALUES (%s);",
    table_name,
    table.concat(keys, ", "),
    table.concat(values, ", ")
  )

  self:exec(query)
end

return M