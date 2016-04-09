#!/bin/bash
reposhome=$HOME/.homesick/repos

git clone https://github.com/andsens/homeshick $reposhome/homeshick

repos="dotfiles-gh dotfiles-apps dotfiles-awesome dotfiles-fortune-bible dotfiles-task dotfiles-tmux dotfiles-vim dotfiles-zsh"

for repo in $repos
do
    git clone https://vonpupp@github.com/vonpupp/$repo $reposhome/$repo
done

ln -sf ~/.homesick/repos/dotfiles-gh/.mu_repo ~/.homesick/repos/.mu_repo

cd ~/.homesick/repos/
mu pull

source $reposhome/homeshick/homeshick.sh

for repo in $repos
do
    homeshick -f link $repo
done
