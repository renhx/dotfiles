export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#--------------------
# Homebrew
#--------------------
export PATH="/usr/local/bin:$PATH"

#--------------------
# Linuxbrew
#--------------------
if [ -d ${HOME}/.linuxbrew/ ]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

#--------------------
# ~/usr/local
#--------------------
if [ -d ${HOME}/usr/local/ ]; then
  export PATH=$HOME/usr/local/bin/:$PATH
  export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH
fi

#--------------------
# Langs
#--------------------
if [ -d ${HOME}/.anyenv/ ]; then
  # anyenv
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"

else
  # anyenvへの移行中は各envの設定も残す🐱
  if [ -d ${HOME}/.pyenv/ ]; then
    # pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if which pyenv >/dev/null 2>&1; then eval "$(pyenv init -)"; fi
  fi

  if [ -d ${HOME}/.rbenv/ ]; then
    # rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    if which rbenv >/dev/null 2>&1; then eval "$(rbenv init -)"; fi
  fi
fi

if which go >/dev/null 2>&1; then
  export GOPATH=$HOME/go
fi

export PATH="$PATH:/Applications/android-sdk-mac_x86/tools"
export PATH="$PATH:/Applications/android-sdk-mac_x86/platform-tools"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH=~/.cabal/bin:$PATH
export MONO_GAC_PREFIX="/usr/local"

#--------------------
# misc.
#--------------------
case "$OSTYPE" in
  darwin* ) if [ -f ~/.bashrc ]; then . ~/.bashrc; fi ;; 
esac
if [ -f ~/.local-bashrc ]; then . ~/.local-bashrc; fi
