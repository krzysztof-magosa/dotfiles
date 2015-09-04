#! /usr/bin/env bash

function make_symlinks()
{
    cd "$(dirname "${BASH_SOURCE}")"
    path=$(pwd)

    for name in .* ; do
        [[ "$name" =~ ~$ ]] && continue
        [ "$name" == "." ] && continue
        [ "$name" == ".." ] && continue
        [ "$name" == ".git" ] && continue

        echo "Linking $name..."
        ln -sf "$path/$name" ~/
    done
}

if [ "$1" = "--force" ] ; then
    make_symlinks
else
    echo "All files/directories beggining with . in this repository"
    echo "will be symlinked to your home directory, existing symlinks"
    echo "may be overwritten, are you sure to continue?"
    
    select yn in "yes" "no";
    do
        case $yn in
            yes) make_symlinks; break;;
            no) exit;;
        esac
    done
fi

