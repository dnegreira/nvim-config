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

-- setup telescope-file-browser
require'telescope'.setup {}

require'telescope'.load_extension "file_browser"
