# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="nanotech"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github macports osx ruby dirpersist gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export DISPLAY=:0.0
export EDITOR=/opt/local/bin/vim
export TERM=xterm-256color
export MANPATH=/opt/local/share/man:$MANPATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias apachectl='sudo /opt/local/apache2/bin/apachectl'
alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown' 
alias cpan='sudo perl -MCPAN -e shell'
alias gem='sudo gem'
alias python='/opt/local/bin/python'
alias seleniumstart='sudo java -jar /Users/stephenprater/selenium-server-1.0.1/selenium-server.jar'
alias vncrestart='sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console'
alias ls='ls -lhG'
alias vim='sudo vim'
alias ruby_prof='/opt/local/lib/ruby/gems/1.9.1/gems/ruby-prof-0.9.2/bin/ruby-prof'
export CLICOLOR=1

if [ -f /opt/local/etc/profile.d/cdargs-bash.sh ]; then
        source /opt/local/etc/profile.d/cdargs-bash.sh
fi

load_avg() {
  LA=$(sysctl vm.loadavg | sed s/'^vm.loadavg: '//)
  echo $LA
}

#introduce some sexy characters


#RPROMPT="%F{red}%(?..[ %? ]) $(git_prompt_info) %F{blue}] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f"
PROMPT="%F{241}%n %F{green}%2c %F{cyan} [ %f"
RPROMPT="%F{red}%(?..[ %? ]) $(git_prompt_info) %F{cyan}] %F{green}%* %F{241}[%j] %F{blue}$(load_avg)%f"

