# Customize to your needs...
export PATH=/usr/bin:$PATH
export EDITOR=/usr/bin/vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1

alias gem='sudo gem'
alias ls='ls --color -lh'
alias elinks="elinks google.com"
alias install="sudo yaourt -S"
alias search="sudo yaourt -Ss"
alias update="sudo yaourt -Sy"
alias upgrade="sudo yaourt -Syu --aur"
alias uninstall="sudo yaourt -Rs"
alias remove="sudo yaourt -R"
alias info="yaourt -Si"
alias fetch="yaourt -G"
alias list_files="yaourt -Ql"
alias search_local="sudo yaourt -Qs"
alias local_install="sudo pacman -U"
alias tmux="tmux -2u"



load_avg() {
  LA=$(cat /proc/loadavg)
  echo $LA
}

free_mem(){
  FM=$(ruby -e "x=open('/proc/meminfo').each_line.to_a; y = [x[0],x[1],x[6]].flatten.join.scan(/([0-9]*?)\skB/)\
.flatten.map { |i| i.to_i / 1000 }; puts \"#{y[1]}/#{y[2]}/#{y[0]}\"")
  echo $FM
}


update_wallpaper() {
  x=$(ping -c1 google.com 2>&1 | grep unknown)
  if [ "$x" = "" ]; then
    if [ -e "$HOME/.potd.jpg" ]; then
      find "$HOME/.potd.jpg" -mtime +1 -exec rm {} \;
    fi

    if [ ! -e "$HOME/.potd.jpg" ]; then
      /usr/bin/wget -q http://toolserver.org/~daniel/potd/potd.php/enwiki/1024x768 -O $HOME/.potd.jpg
      /usr/bin/convert -modulate 10,0,100 $HOME/.potd.jpg $HOME/.potd.jpg
      /usr/bin/convert -crop 1024x768+0+0 $HOME/.potd.jpg $HOME/.potd.jpg
    fi

    if [ -e "/tmp/potd.jpg" ]; then
      fbv -ciuker $HOME/.potd.jpg << EOF
      q
EOF
    fi

    export FBTERM_BACKGROUND_IMAGE=1
 fi
}


