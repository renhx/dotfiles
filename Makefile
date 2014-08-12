DOTFILES = $(shell pwd)

help:
	@echo "make [all, bash, bash-append, fish, vim, git, homebrew, iterm, alfred, ruby]"

all: bash fish vim git homebrew iterm alfred ruby

bash:
	ln -s -i ${DOTFILES}/.bash_profile ${HOME}/.bash_profile
	ln -s -i ${DOTFILES}/.bashrc ${HOME}/.bashrc

bash-append:
	echo "if [ -f ${DOTFILES}/.bash_profile ]; then . ${DOTFILES}/.bash_profile; fi" >> ~/.bash_profile
	echo "if [ -f ${DOTFILES}/.bashrc ]; then . ${DOTFILES}/.bashrc; fi" >> ~/.bash_profile

fish:
	if [ ! -d ${HOME}/.config/fish/ ]; then \
		mkdir -p ${HOME}/.config/fish/; \
	fi
	ln -s -i ${DOTFILES}/.config/fish/config.fish ${HOME}/.config/fish/config.fish
	@echo "YOU NEED TO RUN: echo '/usr/local/bin/fish' >> /etc/shells && chsh -s /usr/local/bin/fish"

vim:
	if [ ! -d ${HOME}/.vim/bundle/neobundle.vim/ ]; then \
		curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh; \
	fi
	ln -s -i ${DOTFILES}/.vimrc ${HOME}/.vimrc

git:
	ln -s -i ${DOTFILES}/dot.gitignore ${HOME}/.gitignore

homebrew:
	#ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	brew bundle
	
	# macvim
	ln -s -i /usr/local/Cellar/macvim/HEAD/MacVim.app /Applications/MacVim.app
	
	# ricty font
	cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
	fc-cache -vf

iterm:
	@echo "iTerm2"
	@echo "Preferences -> General -> Load preferences from a custom folder or URL"
	@echo "~/Dropbox/Configs/iTermSync/"

alfred:
	@echo "Alfred"
	@echo "Preferences -> Advanced -> Syncing"
	@echo "~/Dropbox/Configs/AlfredSync/"

ruby:
	ln -s -i ${DOTFILES}/.gemrc ${HOME}/.gemrc

# init mac
#  xcode-select --install
