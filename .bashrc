# Alias
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias llt='ls -lt'
alias ..='cd ..'
alias cl='clear'
alias opn='open ./'
alias tailf='tail -f'
alias psg='ps aux | grep Ren'
alias nano='nano -w -i -S -T 4 -k'
alias grep='grep --color=auto'
alias lesss='less -RF'
function grepcd() {
  find ./ -type f -print | xargs grep --color=auto $1 /dev/null
}
function whoisjp() {
  whois $1 | iconv -f ISO-2022-JP -t UTF-8
}

# Ruby, Rails
alias be="bundle exec"
alias irbc='irb -r irb/completion'

# Git
alias gic='git commit'
alias gis='git status'
alias gil='git log'
alias gib='git branch'
function gii() { curl https://www.gitignore.io/api/$@ ;}

# MacVim
if which mvim >/dev/null 2>&1; then
  #alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 mvim -v "$@"'
  alias vimm='vim --remote-tab-silent'
fi

# tmux
if which tmux >/dev/null 2>&1; then 
  alias tm='tmux'
  alias ta='tmux a'
fi

# for bash_completion
if which brew >/dev/null 2>&1; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
  fi
fi

# added by travis gem
[ -f /Users/Ren/.travis/travis.sh ] && source /Users/Ren/.travis/travis.sh
