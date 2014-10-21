#------------------------------
# Basic
#------------------------------
set -e fish_greeting 
set fish_greeting "Welcome to fish "(printf (_ '%s><((°>%s') (set_color -o blue) (set_color normal))

#------------------------------
# PATH
#------------------------------
set -x PATH /usr/local/bin /usr/local/sbin $PATH

set -x PATH /Applications/android-sdk-mac_x86/tools $PATH
set -x PATH /Applications/android-sdk-mac_x86/platform-tools $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH

set -x PATH "$HOME/.pyenv/bin" $PATH
. (pyenv init - | psub)

set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
#. (rbenv init - | psub)
rbenv rehash >/dev/null ^&1

#------------------------------
# import from .bashrc
#------------------------------
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias ..='cd ..'
alias cl='clear'
alias opn='open ./'
alias tailf='tail -f'
alias psg='ps aux | grep Ren'
alias nano='nano -w -i -S -T 4 -k'
alias grep='grep --color=auto'
alias lesss='less -RF'
function grepcd
  find ./ -type f -print | xargs grep --color=auto $argv[1] /dev/null
end

function whoisjp
  whois $argv[1] | iconv -f ISO-2022-JP -t UTF-8
end

# Ruby, Rails
alias be="bundle exec"
alias irbc='irb -r irb/completion'

# Git
alias gic='git commit'
alias gis='git status'
alias gil='git log'
alias gib='git branch'
function gii
  curl "http://www.gitignore.io/api/$argv"
end

# MacVim
if which mvim >/dev/null 2>&1
  #alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 mvim -v $ARGV'
  alias vimm='vim --remote-tab-silent'
  set -x EDITOR 'mvim -v'
else
  set -x EDITOR 'vim'
end

# tmux
if which tmux >/dev/null 2>&1
  alias tm='tmux'
  alias ta='tmux a'
  alias ti='tmuxinator'
end

#------------------------------
# KeyBindings
#------------------------------
function fish_user_keybindings
  # eval fish_vi_key_bindings
  # #bind \cx 'ls'

  # #map C-s <Esc> #C-jが使えないので...
  # bind \cs -M insert -m default end-selection force-repaint
  # bind \cs -M visual -m default end-selection force-repaint
end


#------------------------------
# Prompt: デフォルトのClassic + Gitに、viのモード表示を追加したもの。
#------------------------------
function fish_prompt --description 'Write out the prompt'
	
	set -l last_status $status

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end
	
	if not set -q -g __fish_classic_git_functions_defined
		set -g __fish_classic_git_functions_defined

		function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
			if status --is-interactive
				set -e __fish_prompt_user
				commandline -f repaint ^/dev/null
			end
		end
		
		function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
			if status --is-interactive
				set -e __fish_prompt_host
				commandline -f repaint ^/dev/null
			end
		end
		
		function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
			if status --is-interactive
				set -e __fish_prompt_status
				commandline -f repaint ^/dev/null
			end
		end
	end

	set -l delim '>'

	switch $USER

	case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

	case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end

	end

	set -l prompt_status
	if test $last_status -ne 0
		if not set -q __fish_prompt_status
			set -g __fish_prompt_status (set_color $fish_color_status)
		end
		set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
	end

	if not set -q __fish_prompt_user
		set -g __fish_prompt_user (set_color $fish_color_user)
	end
	if not set -q __fish_prompt_host
		set -g __fish_prompt_host (set_color $fish_color_host)
	end

	echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" @ "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd) (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" "$delim" ' '
end

function fish_right_prompt -d "Write out the right prompt"

  set_color green
  echo -n -s "[" (date "+%H:%M:%S") "]"
  set_color normal

  # switch $fish_bind_mode
    # case default
      # set_color --bold --background red white
      # echo "[Normal]"
    # case insert
      # # set_color --bold --background green white
      # # set_color --bold --background blue white
      # echo "[Insert]"
    # case visual
      # set_color --bold --background magenta white
      # echo "[Visual]"
  # end
  # set_color normal

end
