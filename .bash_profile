export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Applications/android-sdk-mac_x86/tools"
export PATH="$PATH:/Applications/android-sdk-mac_x86/platform-tools"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

if which rbenv >/dev/null 2>&1; then eval "$(rbenv init -)"; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
if [ -f ~/.local-bashrc ]; then . ~/.local-bashrc; fi
