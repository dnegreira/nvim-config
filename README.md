Put it on your ~/.config/nvim/

The python jedi server is hardcoded for my homedir as I was lazy to add it to my $PATH
make sure to change it unless you are also `dnegreira` ;-)

Install some stuff:
* fonts from [nerd fonts](https://www.nerdfonts.com/) for all the icon goodies. I use [UbuntuMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip)
* `apt install ripgrep fd-find` for telescope to work properly. Make sure to run `:healthcheck telescope` to see that it is fine.
* `pip install -U jedi-language-server` for the lsp.

First run is still giving me errors, will fix it in the future... maybe.
* nvim
* :PackerInstall
* :PackerCompile
* :q

Congrats you now have a copy of my config with nvim!

Heavy inspiration from:
https://github.com/glepnir/lspsaga.nvim
