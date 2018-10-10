#!/bin/bash
# Installation script for m0re's dotfiles
# Author: Michiel - michiel@dutchnaoteam.nl

err_report() {
    echo "Error on line $1"
}

trap 'err_report $LINENO' ERR

SCRIPT_PATH=$(echo $0 | sed "s|^\.\./|`pwd`/../|" | sed "s|^\./|`pwd`/|")
DOT_FOLDER="$(dirname $SCRIPT_PATH)"
echo "Installing dotfiles from folder $DOT_FOLDER"


echo -n "Do you want to symlink general dotfiles like .bashrc, .gitconfig, etc.. ([y]/n): "
read LINK_GENERAL
LINK_GENERAL=${LINK_GENERAL:-y}
echo -n "Do you want to symlink i3 config ([y]/n): "
read LINK_i3
LINK_i3=${LINK_i3:-y}
echo -n "Do you want to symlink terminator config ([y]/n): "
read LINK_TERMINATOR
LINK_TERMINATOR=${LINK_TERMINATOR:-y}
echo -n "Do you want to symlink vscode config ([y]/n): "
read LINK_VSCODE
LINK_VSCODE=${LINK_VSCODE:-y}



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


link_general () {
  echo " -- Setting general symlinks.."
  SYS_FILES="$DOT_FOLDER/system/.??*"
  GIT_FILES="$DOT_FOLDER/git/.??*"
  VIM_FILES="$DOT_FOLDER/vim/.??*"
  for f in $SYS_FILES $GIT_FILES $VIM_FILES
  do
    file="$(basename $f)"
    if [[ ! -e  "$HOME/$file" ]]; then
      echo "Linking $file to $HOME/"
      ln -s $f "$HOME/$file"
    else
      echo "$HOME/$file already linked"
    fi
  done
}

link_i3 () {
  echo " -- Linking i3 related configuration.."
  # Link i3 files to ~/.config/i3/
  i3_FILES="$DOT_FOLDER/i3/??*"
  i3_CONFIG_DIR="$HOME/.config/i3"
  # check if i3 config directory exists
  if [[ ! -d $i3_CONFIG_DIR ]]; then
    mkdir -p $i3_CONFIG_DIR
  fi
  for f in $i3_FILES
  do
    file="$(basename $f)"
    if [[ ! -e  "$i3_CONFIG_DIR/$file" ]]; then
      echo "Linking $file to $i3_CONFIG_DIR"
      ln -s $f "$i3_CONFIG_DIR/$file"
    else
      echo "$i3_CONFIG_DIR/$file already linked"
    fi
  done

  i3_STATUS_FILES="$DOT_FOLDER/i3status/??*"
  i3_STATUS_CONFIG_DIR="$HOME/.config/i3status/"
  # check if i3status config directory exists
  if [[ ! -d $i3_STATUS_CONFIG_DIR ]]; then
    mkdir -p $i3_STATUS_CONFIG_DIR
  fi
  for f in $i3_STATUS_FILES
  do
    file="$(basename $f)"
    if [[ ! -e  "$i3_STATUS_CONFIG_DIR/$file" ]]; then
      echo "Linking $file to $i3_STATUS_CONFIG_DIR/"
      ln -s $f "$i3_STATUS_CONFIG_DIR/$file"
    else
      echo "$i3_STATUS_CONFIG_DIR/$file already linked"
    fi
  done
}

link_terminator () {
    echo " -- Setting Terminator symlinks.."
    TERMINATOR_CONFIG_DIR="$HOME/.config/terminator"
    file="$DOT_FOLDER/system/terminator.config"
    if [[ ! -e  "$TERMINATOR_CONFIG_DIR/config" ]]; then
      echo "Linking $file to $TERMINATOR_CONFIG_DIR/"
      ln -s $file "$TERMINATOR_CONFIG_DIR/config"
    else
      echo "$TERMINATOR_CONFIG_DIR/$(basename $file) already linked"
    fi
}

link_vscode () {
  echo " -- Setting vscode symlinks"
  VSCODE_CONFIG_DIR="$HOME/.config/Code/User"
  VSCODE_FILES="$DOT_FOLDER/vscode/??*"
  if [[ ! -d $VSCODE_CONFIG_DIR ]]; then
    mkdir -p $VSCODE_CONFIG_DIR
  fi
  for f in $VSCODE_FILES
  do
    file="$(basename $f)"
    if [[ ! -e  "$VSCODE_CONFIG_DIR/$file" ]]; then
      echo "Linking $file to $VSCODE_CONFIG_DIR/"
      ln -s $f "$VSCODE_CONFIG_DIR/$file"
    else
      echo "$VSCODE_CONFIG_DIR/$file already linked"
    fi
  done
}

if [[ "$LINK_GENERAL" == "y" ]]; then
  link_general
fi

if [[ "$LINK_i3" == "y" ]]; then
  link_i3
fi

if [[ "$LINK_TERMINATOR" == "y" ]]; then
  link_terminator
fi

if [[ "$LINK_VSCODE" == "y" ]]; then
  link_vscode
fi

# Install stuff
sudo apt install fortune cowsay imagemagick scrot

echo "Source .bashrc or restart your terminal to load your system changes"
