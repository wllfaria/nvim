require("keymaps")
require("autocmds")
require("options")
require("commands")
require("lsp")

vim.opt.laststatus = 3
vim.opt.statusline = " %f%m%=%l:%c "

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/saecki/crates.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/yazeed1s/minimal.nvim" },
})

vim.cmd.colorscheme("minimal-base16")
vim.api.nvim_set_hl(0, "StatusLine", { bg = nil })
vim.g.loaded_matchparen = 1

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = true,
  linehl = {
    [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    [vim.diagnostic.severity.WARN] = "WarningMsg",
    [vim.diagnostic.severity.HINT] = "None",
    [vim.diagnostic.severity.INFO] = "None",
  },
})
