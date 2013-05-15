# Customize to your needs...
export PATH=/home/stephen_coll02ftp/.rbenv/bin/:/usr/bin:$PATH
export EDITOR=/usr/bin/vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1


load_avg() {
  LA=$(cat /proc/loadavg)
  echo $LA
}

free_mem(){
  FM=$(ruby -e "x=open('/proc/meminfo').each_line.to_a; y = [x[0],x[1],x[6]].flatten.join.scan(/([0-9]*?)\skB/)\
.flatten.map { |i| i.to_i / 1000 }; puts \"#{y[1]}/#{y[2]}/#{y[0]}\"")
  echo $FM
}
