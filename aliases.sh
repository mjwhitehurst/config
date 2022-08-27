function SetAlias(){
  #need $1 and $2 (arguments)
  if [[ ! -z $1 && ! -z $2 ]];
  then
    #if we want to display help
    if [[ ! -z $DISPLAY_HELP ]];
    then
      warn "Alias: ${CLR_GREEN}$1 ${CLR_MAGENTA}-> ${CLR_CYAN}$2"
    fi
    newcmd=$1

    alias $newcmd="$2"

  else
    warn "Alias not set, one or both blank [$1] [$2]!!"
  fi
}


#Better grep by standard
HelpText "Simpler grep behaviour"
  SetAlias "s" "grep -nr --include='*.c' --include='*.h' --include='*.plugin'"

#cd
HelpText "cd changes"
  SetAlias ".."   'cd ..'
  SetAlias "up"   'cd ..'
  SetAlias "cd.." 'cd ..'
  SetAlias "..."  "cd ..; cd .."
  SetAlias "back" 'cd -'

#Typos
HelpText "Typos"
  SetAlias "gerp"       "grep"
  SetAlias "vo"         "vi"
  #autocorrect dir name typos
  if [[ ! -z $DISPLAYHELP ]];
  then
    warn "Directory name autocorrect ENABLED"
  fi
  shopt -s cdspell

##Command Shortcuts
#ls
HelpText "ls"
  SetAlias "la"           "ls -a"
  SetAlias "lah"          "ls -lah"
  SetAlias "larth"        "ls -larth"

HelpText "Ls Colours set (see LS_COLORS )"
LS_COLORS="no=00:fi=00:di=00;36:ln=00;37:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32    :*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.r    pm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;3    1:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.    jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm    =01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32    :*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:"


#debugging
HelpText "Debugging Help"
  SetAlias "pdb"          "gdb -tui -p"
  SetAlias "pg"           "ps -ef | grep"

  SetAlias "gdbtui"       'gdb -tui'

#misc
HelpText "misc/other"
  SetAlias "whatsbig"     "du -khs .[^.]* * | sort -h"
  SetAlias "please"       'sudo $(history -p !!)'
  SetAlias "tim"          "command vim"


