-- Line numbering and relative line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- 2 spaces tabbing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- This is a test, might change later
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Enable seach highlight, but clears when pressing <Esc> on normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
   desc = "Highlight when yanking text",
   group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
   callback = function()
      vim.highlight.on_yank()
   end,
})
