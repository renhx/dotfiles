DOTFILES = $(shell pwd)

help:
	@echo "make [all, bash, bash-append, fish, tmux, vim, xvim, git, tig, homebrew, iterm, alfred, ruby]"

all: bash fish tmux vim git tig homebrew iterm alfred ruby

bash:
	if [ -f ${HOME}/.bashrc ]; then \
		cp -f ${HOME}/.bashrc ${HOME}/.bashrc.dotfiles-original; \
	fi
	if [ -f ${HOME}/.bash_profile ]; then \
		cp -f ${HOME}/.bash_profile ${HOME}/.bash_profile.dotfiles-original; \
	fi
	ln -s -f ${DOTFILES}/.bash_profile ${HOME}/.bash_profile
	ln -s -f ${DOTFILES}/.bashrc ${HOME}/.bashrc

bash-append:
	echo "if [ -f ${DOTFILES}/.bash_profile ]; then . ${DOTFILES}/.bash_profile; fi" >> ~/.bash_profile
	echo "if [ -f ${DOTFILES}/.bashrc ]; then . ${DOTFILES}/.bashrc; fi" >> ~/.bash_profile

fish:
	if [ ! -d ${HOME}/.config/fish/ ]; then \
		mkdir -p ${HOME}/.config/fish/; \
	fi
	ln -s -f ${DOTFILES}/.config/fish/config.fish ${HOME}/.config/fish/config.fish
	@echo "--------------------"
	@echo "Run the following line"
	@echo "echo '/usr/local/bin/fish' >> /etc/shells && chsh -s /usr/local/bin/fish"
	@echo "--------------------"

tmux:
	ln -s -f ${DOTFILES}/.tmux.conf ${HOME}/.tmux.conf
	ln -s -f ${DOTFILES}/.tmux-login-shell ${HOME}/.tmux-login-shell

vim:
	if [ ! -d ${HOME}/.vim/bundle/neobundle.vim/ ]; then \
		curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh; \
	fi
	mkdir -p ${HOME}/.vim/undodir/
	mkdir -p ${HOME}/.vim/dict/
	ln -s -f ${DOTFILES}/.vimrc ${HOME}/.vimrc
	${HOME}/.vim/bundle/neobundle.vim/bin/neoinstall

xvim:
	ln -s -f ${DOTFILES}/.xvimrc ${HOME}/.xvimrc

git:
	ln -s -f ${DOTFILES}/dot.gitignore ${HOME}/.gitignore

tig:
	ln -s -f ${DOTFILES}/.tigrc ${HOME}/.tigrc

homebrew:
	#ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	./Brewfile.sh
	
	# ricty font
	@echo "--------------------"
	@echo "Run the following lines"
	@echo "cp -f /PATH/TO/RICTY/fonts/Ricty*.ttf ~/Library/Fonts/"
	@echo "fc-cache -vf"
	@echo "--------------------"

iterm:
	@echo "iTerm2"
	@echo "Preferences -> General -> Load preferences from a custom folder or URL"
	@echo "~/Dropbox/Configs/iTermSync/"

alfred:
	@echo "Alfred"
	@echo "Preferences -> Advanced -> Syncing"
	@echo "~/Dropbox/Configs/AlfredSync/"

ruby:
	ln -s -f ${DOTFILES}/.gemrc ${HOME}/.gemrc

# init mac
#  xcode-select --install
