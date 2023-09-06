#!/usr/bin/env bash
# Mount hm_images folder to the VM instance

set -e

if [ $# -eq 0 ];then
    FOLDER=hm_images
    printf "\nNo arguments passed! Setting dir to be $FOLDER\n"
else
    FOLDER=$1
    printf "\nSetting dir to be $FOLDER\n"
fi

printf "\nChecking directory ...\n"
mkdir -p $HOME/mnt/$FOLDER

printf "\nMounting bucket ...\n"
gcsfuse --implicit-dirs $FOLDER "$HOME/mnt/$FOLDER"

# To unmount
#fusermount -u $HOME/mnt/$FOLDER
