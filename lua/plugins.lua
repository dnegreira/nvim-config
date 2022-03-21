local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(packer_install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        packer_install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- Theme
-- use "Mofiqul/dracula.nvim"
-- use "morhetz/gruvbox"
use "EdenEast/nightfox.nvim"

-- actual plugins list
-- we want packer to package itself :D
use "wbthomason/packer.nvim"
-- Git
use {
    "TimUntersberger/neogit", opt = false,
    requires = {"nvim-lua/plenary.nvim"},
--    config = get_config("neogit")
}

use {"f-person/git-blame.nvim", 
-- config = get_config("git-blame")
    }

use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    event = "BufReadPre",
    config = get_config("gitsigns")
}


-- File browser.
-- nvim-tree
use {                                              -- filesystem navigation
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',       -- filesystem icons
  config = get_config("nvim-tree"),
}
-- LSP
use {
	'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
	config = get_config("lspconfig")
}
use {
	'williamboman/nvim-lsp-installer',
	config = get_config("lsp-installer"),
}
-- StatusLine
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
-- Beacon - to show where the cursor is
use "DanilaMihailov/beacon.nvim"

-- autopairs, to close pairs automatically
use "windwp/nvim-autopairs"

-- vim-go
-- use "fatih/vim-go"
use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}, {"BurntSushi/ripgrep"}, {"sharkdp/fd"},
--    config = get_config("telescope")
}
-- Syntax highlighting
use {
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate"
}

-- use "nvim-treesitter/nvim-treesitter-textobjects"
-- 
use {
    "hrsh7th/nvim-cmp",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"}, 
    },
    config = get_config("cmp")
}

-- requirement for Neogit
use {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
        "DiffviewFocusFiles"
    },
--    config = get_config("diffview")
}

use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}
use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup()
  end
}
