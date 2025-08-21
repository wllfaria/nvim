local ok, dbee = pcall(require, "dbee")
if not ok then
  return
end

local data_path = vim.fn.stdpath("data")
local bin_path = data_path .. "/dbee/bin"

local result = vim.uv.fs_stat(bin_path)
if result == nil then
  dbee.install()
end

dbee.setup()

vim.keymap.set("n", "<leader>pg", function()
  require("dbee").toggle()
end)

vim.keymap.set({ "n", "v" }, "<leader>eq", function()
  local mode = vim.api.nvim_get_mode().mode
  local query = ""

  if mode == "v" or mode == "V" then
    local start_pos = vim.fn.getpos("v")
    local end_pos = vim.fn.getpos(".")

    local start_row = math.min(start_pos[2], end_pos[2])
    local end_row = math.max(start_pos[2], end_pos[2])
    local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)

    query = table.concat(lines, "\n")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  else
    query = vim.api.nvim_get_current_line()
  end

  if not require("dbee").is_open() then
    return
  end

  require("dbee").execute(query)
end)
