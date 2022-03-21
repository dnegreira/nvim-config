local opt = vim.opt
local cmd = vim.api.nvim_command
local g = vim.g
g.t_co = 256
g.background = dark
-- Show line numbers
vim.wo.number = true
-- Show cursorline
vim.wo.cursorline = true

opt.syntax = "ON"                -- str:  Allow syntax highlighting
-- Folding
vim.opt.foldmethod = "manual"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
