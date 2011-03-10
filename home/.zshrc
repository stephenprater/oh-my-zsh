# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

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

PROMPT_INFO="$(draw 21 ul hbar) $(host_name)
$(draw 21 ll hbar) $(dir_name)"
DEF_PROMPT="${(e)${PROMPT_INFO}} %F{cyan} [ %f"
INS_MODE_PROMPT="${(e)${PROMPT_INFO}} %F{red} [ %f"

RPROMPT_INFO="$(draw 21 vbar) %F{green}%* %F{241}[%j] %F{blue}$(free_mem)"
DEF_RPROMPT="%F{red}%(?..[ %? ]) $(git_prompt_info) %F{cyan}]%f ${(e)${RPROMPT_INFO}} "
INS_MODE_RPROMPT="%F{red}%(?..[ %? ]) $(git_prompt_info) %F{red}]%f ${(e)${RPROMPT_INFO}} "

RPROMPT=$DEF_RPROMPT
PROMPT=$DEF_PROMPT
