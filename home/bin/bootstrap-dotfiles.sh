#!/bin/bash
reposhome=$HOME/.homesick/repos

git clone git@github.com:andsens/homeshick $reposhome/homeshick

repos="dotfiles-gh dotfiles-apps dotfiles-awesome4 dotfiles-fortune-bible dotfiles-task dotfiles-tmux dotfiles-vim dotfiles-spacemacs dotfiles-zsh hydesite ansible-personal"

for repo in $repos
do
    git clone git@github.com:vonpupp/$repo $reposhome/$repo
done

ln -sf ~/.homesick/repos/dotfiles-gh/.mu_repo ~/.homesick/repos/.mu_repo

cd ~/.homesick/repos/
mu pull

source $reposhome/homeshick/homeshick.sh

for repo in $repos
do
    homeshick -f link $repo
done
