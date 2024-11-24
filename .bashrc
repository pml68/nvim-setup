#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export CPPFLAGS="-Wall -Weffc++ -Wextra -Werror -Wconversion -Wsign-conversion -pedantic-errors -std=gnu++2b -fmodules-ts"
export EDITOR=nvim
export HISTSIZE=1000
export HISTFILESIZE=2000
export TERM=xterm-256color

YELLOW="\[$(tput setaf 3)\]"
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"

avg_time() {
  #
  # usage: avg_time n command ...
  #
  n=$1; shift
  (($# > 0)) || return                   # bail if no command given
  for ((i = 0; i < n; i++)); do
    { time -p "$@" &>/dev/null; } 2>&1 # ignore the output of the command
      # but collect time's output in stdout
    done | awk '
    /real/ { real = real + $2; nr++ }
    /user/ { user = user + $2; nu++ }
    /sys/  { sys  = sys  + $2; ns++}
    END    {
    if (nr>0) printf("real %f\n", real/nr);
    if (nu>0) printf("user %f\n", user/nu);
        if (ns>0) printf("sys %f\n",  sys/ns)
        }'
}

alias grep='grep --color=auto'
alias eza='eza --icons'
alias tree='eza --tree'
alias fvim='nvim $(fzf)'
alias c='clear'
alias diff='diff --color -up'
alias oil='~/.oil-ssh.sh'

parse_git_bg() {
  if [[ $(git status -s 2> /dev/null) ]]; then
    tput setaf 160
  else
    tput setaf 34
  fi
}

PS1="╭─${YELLOW}"
PS1+="\u${GREEN}"
PS1+="@${RED}"
PS1+="\h${BLUE} "
PS1+="\W${RESET}"
PS1+="\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"" 
PS1+="\$(parse_git_bg) "
PS1+=" (BRANCH) " 
PS1+="${RESET}\")\n" 
PS1+="╰─" 
PS1+="\\$ " 
PS1+="${RESET}"
export PS1

export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
