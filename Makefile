.PHONY: vim-plug macvim neovim homebrew

# Makefile for https://github.com/deepzz0/dotfiles
# Maintainer deepzz.qi@gmail.com

plug_path?=~/.local/share/nvim/site/autoload/plug.vim
nvimrc?=~/.config/nvim/init.vim

vim-plug:
	@if [ ! -f $(plug_path) ]; then \
	    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi;

# install vimrc for macvim
macvim:
	@if [ -f ~/.vimrc ]; then \
	    mv ~/.vimrc ~/.vimrc.bak; \
	fi;
	@cp vimrc ~/.vimrc

# install nvimrc for neovim
neovim:vim-plug
	@if [ -f $(nvimrc) ]; then \
	    mv $(nvimrc) $(nvimrc).bak; \
	else \
	    mkdir -p ~/.config/nvim; \
	fi;
	@cp nvimrc $(nvimrc)

# install tmux.conf for tmux
tmux:
	@if [ -f ~/.tmux.conf ]; then \
	    mv ~/.tmux.conf ~/.tmux.conf.bak; \
	fi;
	@cp tmux.conf ~/.tmux.conf
# install homebrew
homebrew:
	@./homebrew.sh
