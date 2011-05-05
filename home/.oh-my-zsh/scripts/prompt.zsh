emulate -L zsh

setopt extendedglob
setopt nullglob
zmodload zsh/curses
zmodload zsh/datetime
zmodload zsh/system

prompt() {
  integer posy=1
  mainw=$(( $COLUMNS ))
  mainh=$(( $LINES  ))
  integer history_items=0

  prompt.draw() {
    zcurses addwin cmd 4 $mainw 0 0
    zcurses border cmd 
    zcurses bg cmd green/black
    zcurses move cmd 1 1
    thing=$($PROMPT)
    zcurses string cmd $thing
    zcurses addwin res 77 $mainw 4 0
    zcurses border res
    zcurses bg res green/black
  }

  prompt.listen() {
    while true;do
      if [[ -z $key ]]; then
        zcurses input cmd REPLY
          if [[ $REPLY == "q" ]]; then
            break
          fi
      fi
    done
  }
  {
    zcurses init
    prompt.draw
    prompt.listen
  } always
  {
    zcurses delwin cmd
    zcurses delwin res
    zcurses end
  }
}


