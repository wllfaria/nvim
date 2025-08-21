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
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/slugbyte/lackluster.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/kndndrj/nvim-dbee" },
})

vim.cmd.colorscheme("lackluster-hack")
vim.api.nvim_set_hl(0, "StatusLine", { bg = nil })
