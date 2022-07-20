#!/usr/bin/env bash
projects=`echo "rerevisor startrack" | tr ' ' '\n'`
selected=`echo "$projects" | fzf`
read -p "branch: " branch
read -p "campaign id: " cid
cd ~/Codes/work/$selected
git checkout master
git pull origin master
if [ $selected == "rerevisor" ]; then
    git checkout develop
    git pull origin develop
    git checkout -B $branch develop
    tmux splitw -v -l 10 /bin/zsh
    tmux last-pane
    cd config
    # check if config exists
    find -name "$cid*"
else
    git checkout -B $branch master
    tmux splitw -v -l 10 /bin/zsh
    tmux last-pane
    cd startrack/domain/services/redirect_url_builders/custom/starkek
    # check if config exists
    cat *.* | grep $cid
    cat desktop_configs/*.* | grep $cid
    cat platform_configs/*.* | grep $cid
fi
exec zsh
