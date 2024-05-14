#!/bin/bash

set -x

DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if command -v pwsh &> /dev/null ; then
    mkdir -p ~/.config/powershell

    if [ ! -f "$HOME/.config/powershell/profile.ps1" ]; then
        ln -s $DIR/config/powershell/profile.ps1 ~/.config/powershell/profile.ps1
    fi

    pwsh -c "Install-Module -Name PSReadline"
    pwsh -c "Install-Module -Name Posh-Git"
    pwsh -c "Install-Module -Name Terminal-Icons"
    pwsh -c "Install-Module -Name PowerShellHumanizer"
fi

if [ ! -f "$HOME/.config/starship.toml" ]; then
    ln -s $DIR/config/starship.toml ~/.config/starship.toml
fi

if [ ! -d "$HOME/.vim" ]; then
    ln -s $DIR/vim ~/.vim
fi

if [ ! -f "$HOME/.bashrc" ]; then
    ln -s $DIR/mybashrc ~/.bashrc
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s $DIR/tmux.conf ~/.tmux.conf
fi
