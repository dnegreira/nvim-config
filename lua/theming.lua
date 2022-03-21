local cmd = vim.api.nvim_command 

vim.opt.termguicolors = true         -- bool: If term supports ui color then enable
cmd('colorscheme nightfox')       -- cmd:  Set the colorscheme
cmd('hi GitSignsDelete guifg=#c94f6d') -- Somehow the gitlines is swapped, don't know other way to change it.
cmd('hi GitSignsChange guifg=#dbc074')
-- Theme for the status bar
require'lualine'.setup {
	options = { theme = 'nightfox' }
}

