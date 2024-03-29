# Change the value of RECIPEPREFIX to something other than a tab character.
.RECIPEPREFIX = >

all: install

install:
> echo "Installing neovim config..."
> mkdir -p ~/.config/nvim
> cp -r ./* ~/.config/nvim
> rm -rf ~/.config/nvim/.git
> rm ~/.config/nvim/Makefile
> nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
> echo "Done!"
