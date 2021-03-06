# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
zstyle :compinstall filename '/home/ericp//.zshrc'

autoload -Uz compinit
compinit

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

autoload -Uz promptinit
promptinit
PROMPT='%F{red}%n%f@%F{blue}%m%f %F{cyan}%1~%f %# '
RPROMPT='%F{yellow}[%T]%f%(1j. - [%j]%f.)'

#------------------------------
## Simple Alias stuff
##------------------------------
alias reload="source ~/.zshrc"
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias spm="sudo pacman"

#------------------------------
## AlayaCare Aliases
#------------------------------
alias start_nabu="nabu switch-profile live;nabu login"

#------------------------------
## Python Related Aliases
#------------------------------
alias pipupdate="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"


#------------------------------
# Path Stuff
#------------------------------
export PATH=/home/ericp/.local/bin:$PATH

#------------------------------
## ShellFuncs
#------------------------------
# coloured manuals
man() {
  env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

#Fix Corrupt Hist File
fix_hist() {
	mv ~/.histfile ~/.histfile_bad
	strings ~/.histfile_bad > ~/.histfile
	fc -R ~/.histfile
	rm ~/.histfile_bad
}




# Add plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -U compinit && compinit
