#Use vi keys on command line
set -o vi

#export SHELL='/bin/zsh'
#export HTML_TIDY=~/.config/htmltidy.conf
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export GIT_EDITOR="vim"
export EDITOR=vim

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
alias ........='cd ../../../../../../..'


#--------------------------------------------------   FUNCTIONS -------------------------------------------------- 

#Go dark
#function dimscreen () {
#}

#see no user
john_doe () {
	export PS1='>'
}

#GIT stuff
git config --global --replace-all diff.tool vimdiff


#can't rememeber what this is for..
#tildehome=$(sed "s@^$HOME\\(/.*\\)@~\\1@" <<< `pwd`)
#now I remember!

