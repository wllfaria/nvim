local function qf_delete_entry()
  local qf_list = vim.fn.getqflist()
  local cur_line = vim.fn.line(".")
  if #qf_list == 0 or cur_line < 1 or cur_line > #qf_list then
    return
  end

  table.remove(qf_list, cur_line)
  vim.fn.setqflist({}, "r", { items = qf_list })

  if #qf_list > 0 then
    if cur_line > #qf_list then
      cur_line = #qf_list
    end
    vim.fn.cursor(cur_line, 1) -- stay inside quickfix list
  else
    vim.cmd("cclose")
  end
end

vim.keymap.set("n", "dd", qf_delete_entry, { buffer = true, silent = true })
