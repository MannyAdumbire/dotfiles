# My dotfiles and configs

Config files, dotfiles and other customizations for popular linux programs.

## Useage 
Assuming the dotfiles repo is at $HOME/dotfiles, run the below in a shell to copy files one level upwards to $HOME:

`$ find . -maxdepth 1 -not -path "./git.*"  -not -name "." | xargs -I %% sh -c "rm -vrf ../%% && cp -vr %% .." > /tmp/filesmoved.md`