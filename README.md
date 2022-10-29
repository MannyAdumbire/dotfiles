# My dotfiles and configs

Config files, dotfiles and other customizations for poupular linux programs.

## Useage 
Assuming the dotfiles repo is at $HOME/dotfiles, run the below in a shell to copy files one level upwards to $HOME:

`$ find . -maxdepth 1 -not -path "./.git.*"  -not -path "." | xargs -I %% cp -vr %% .. `