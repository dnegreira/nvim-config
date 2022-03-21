-- Plugin management via Packer
require("plugins")
require("options")
require("keybindings")
require("theming")

require'nvim-autopairs'.setup {}

require'lspconfig'.gopls.setup {
}

-- Setup nvim-cmp.
require'neogit'.setup {}

