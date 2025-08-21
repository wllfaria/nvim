vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  desc = "Close with <q>",
  pattern = { "git", "help", "man", "qf", "scratch" },
  callback = function(args)
    vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank_highlight", { clear = true }),
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank({ timeout = 50 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    if vim.api.nvim_win_get_config(0).relative ~= "" then
      vim.wo.wrap = true
      vim.wo.linebreak = true
      vim.wo.conceallevel = 0
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local override = vim.api.nvim_get_hl(0, { name = "@keyword.return" })
    local all_hls = vim.api.nvim_get_hl(0, {})

    for name, _ in pairs(all_hls) do
      if type(name) == "string" and name:match("^@comment") then
        pcall(vim.api.nvim_set_hl, 0, name, override)
      end
    end

    pcall(vim.api.nvim_set_hl, 0, "Comment", override)
  end,
})
