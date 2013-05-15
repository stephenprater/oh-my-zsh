# Path to your oh-my-zsh configuration.

# don't use zle on our dev version
if [[ $0 == "./zsh-dev/bin/zsh-dev" ]]; then
  unsetopt zle
fi

export ZSH=$HOME/.oh-my-zsh


# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="nanotech"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"
#
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'e' edit-command-line
bindkey -M vicmd ':' executed-named-command

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)j
if [ $(uname) = "Darwin" ]; then
  plugins=(git github macports osx ruby dirpersist gem lines)
  source $ZSH/scripts/osx.zsh
  source $ZSH/oh-my-zsh.sh
elif [ $(uname) = "Linux" ]; then
  plugins=(git github ruby dirpersist gem)
  source $ZSH/scripts/linux.zsh
  source $ZSH/oh-my-zsh.sh
fi


host_name() {
  local host_prompt=""
  if [ $SSH_CLIENT ]; then
    host_prompt='%F{241}%n@%m'
  else
    host_prompt='%F{241}%n@localhost'
  fi
  echo $host_prompt
}

dir_name() {
  echo "%F{green}%2c"
}

host_add() {
  sudo echo "${2}	${1}" >> /etc/hosts
  sudo killall -HUP mDNSResponder
  dscacheutil -q host -a name $1
}

host_del() {
  sed "/$1/d" /etc/hosts > /tmp/tmp-host
  sudo mv /tmp/tmp-host /etc/hosts
  sudo killall -HUP mDNSResponder
  dscacheutil -q host -a name $1
}

tmux_current() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) $PWD
  fi
}

export FIREHOST_USER=stephen_coll02ftp
export VPN_USER=coll02-sprater 
export VPN_PASS='sv9$Lvy75b$kCh$'
export VPN_PEM_FILE=/Users/stephenprater/Documents/vpn-cert.pem

vpn() {
  echo $VPN_PASS | sudo openconnect --user=$VPN_USER --cafile=$VPN_PEM_FILE vpn-1.firehost.com &
}

#current_position() {
#  echoti u7
#  read -d R current
#  row=$(printf $current | strings)
#  [[ "$row" ([0-9]+);([0-9]) ]] && print -l $MATCH X $matches
#  
#}
#
bindkey -v

# we start two down
#
setopt prompt_subst
bindkey -v

PROMPT_INFO='$(draw f21 ul hbar) $(host_name)- %L
$(draw f21 ll hbar) $(dir_name)'
DEF_PROMPT='${(e)${PROMPT_INFO}} %F{cyan} [ %f'
INS_MODE_PROMPT='${(e)${PROMPT_INFO}} %F{red} [ %f'

DEF_RPROMPT='%F{red}%(?..[ %? ]) $(git_prompt_info) %F{cyan}]%f $(draw f21 vbar) %F{green}%* %F{241}[%j] %F{blue}$(free_mem)$(tmux_current)'
INS_MODE_RPROMPT='%F{red}%(?..[ %? ]) $(git_prompt_info) %F{red}]%f $(draw f21 vbar) %F{green}%* %F{241}[%j] %F{blue}$(free_mem)'

RPROMPT=$DEF_RPROMPT
PROMPT=$DEF_PROMPT

export RBENV_ROOT=/usr/local/opt/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
