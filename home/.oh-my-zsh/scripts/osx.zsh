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

load_avg() {
  LA=$(sysctl vm.loadavg | sed s/'^vm.loadavg: '//)
  echo $LA
}

function free_mem() {
  FM=$(ruby -e '
    x = `vm_stat`.each_line.to_a[0..4].join.scan(/([0-9]*?)\./).flatten.map { |i| (i.to_i * 4096) / 1000000 };
    y = `sysctl hw.memsize`.split(/:\s/).last.to_i / 1000000;
    puts "%F{82}#{x[0]}%f/%F{yellow}#{x[2]}%f/%F{69}#{y}%f";')
  echo $FM
}

#introduce some sexy characters



