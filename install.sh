#!/bin/bash
# Installation script for m0re's dotfiles
# Author: Michiel - michiel@dutchnaoteam.nl

SCRIPT_PATH=$(echo $0 | sed "s|^\.\./|`pwd`/../|" | sed "s|^\./|`pwd`/|")
DOT_FOLDER="$(dirname $SCRIPT_PATH)"
echo "Installing dotfiles from folder $DOT_FOLDER"

if [ -z ${HOME+x} ]; then
    echo "HOME is unset, not able to check for existing links";
    exit 1
else
    echo "HOME is set to '$HOME'";
fi

if [[ ! $DOT_FOLDER = *"projects"* ]]; then
  echo "dotfiles not in 'projects' folder"
  exit 1
fi

export PROJECT_FOLDER="$(dirname $DOT_FOLDER)"
echo "PROJECT_FOLDER is set to '$PROJECT_FOLDER'"

echo "Setting symlinks.."
SYS_FILES="$DOT_FOLDER/system/.??*"
GIT_FILES="$DOT_FOLDER/git/.??*"
VIM_FILES="$DOT_FOLDER/vim/.??*"
for f in $SYS_FILES $GIT_FILES $VIM_FILES
do
    file="$(basename $f)"
    if [[ ! -e  "$HOME/$file" ]]; then
        echo "Linking $file to ~/"
        ln -s $f "$HOME/$file"
    else
        echo "$file already linked"
    fi
done

# Install greeter
sudo apt install fortune cowsay

echo "Source .bashrc or restart your terminal to load your system changes"
