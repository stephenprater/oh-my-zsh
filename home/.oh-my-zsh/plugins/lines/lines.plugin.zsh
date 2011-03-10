typeset -A altchar
set -A altchar ${(s..)terminfo[acsc]}
setopt EXTENDED_GLOB

draw-core() {
  collect=""
  for i in $@
  do
    case $i in
      [0-9]*)
        string="%{$(tput setaf ${i})%}" ;;
      ul)
        string="${altchar[l]:--}" ;;
      ll)
        string="${altchar[m]:--}" ;;
      lr)
        string="${altchar[j]:--}" ;;
      ur)
        string="${altchar[k]:--}" ;;
      up)
        string="$terminfo[rmacs]$terminfo[cuu1]$terminfo[smacs]" ;|
      down)
        string="$terminfo[rmacs]$terminfo[cud1]$terminfo[smacs]" ;|
      left)
        string="$terminfo[rmacs]$terminfo[cub1]$terminfo[smacs]" ;|
      right)
        string="$terminfo[rmacs]$terminfo[cuf1]$terminfo[smacs]" ;|
      hbar)
        string="${altchar[q]:--}" ;;
      vbar)
        string="${altchar[x]:-|}" ;;
      x[0-9]*)
        v=${i:s/x//}
        for count in {2..$v}; do
          newstring+="${string}" 
        done
        string=${newstring}
        ;;
      *)
        string="${altchar[${i}]:-?}" ;;
    esac
    collect+="${string}"
  done
  echo "${collect}" 
}

draw-console() {
  echoti smacs 
  echo "$(draw-core $@)"
  echoti rmacs
}

draw () {
  local prefix
  local suffix
  #prefix="$terminfo[enacs]$terminfo[smacs]"
  
  prefix="%{$terminfo[smacs]%}"
  suffix="%{$terminfo[rmacs]%}"
  string=""

  echo "%{$terminfo[enacs]%}${prefix}$(draw-core $@)${suffix}"
}
