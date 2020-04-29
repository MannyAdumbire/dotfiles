#Use vi keys on command line
set -o vi

#export SHELL='/bin/zsh'
#export HTML_TIDY=~/.config/htmltidy.conf
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export GIT_EDITOR="vim"

#Aliases
alias cdnodemods='cd /usr/local/lib/node_modules'
alias ll='ls -al'
alias dmesg='dmesg --color=always --time-format ctime | less -R'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'


#--------------------------------------------------   FUNCTIONS -------------------------------------------------- 

#Go dark
function dimscreen () {
  echo 10 > /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness 
  xrandr --output eDP-1 --gamma 0.8:0.8:0.8
}

#see no user
john_doe () {
	export PS1='>'
}



#can't rememeber what this is for..
#tildehome=$(sed "s@^$HOME\\(/.*\\)@~\\1@" <<< `pwd`)
#now I remember!

