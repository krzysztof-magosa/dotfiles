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
        [ "$name" == ".gitignore" ] && continue
        [ "$name" == ".gitmodules" ] && continue

        echo "Linking $name..."
        ln -sf "$path/$name" ~/
    done
}

function template_gitconfig()
{
    if [ ! -f ~/.gitconfig-local ] ; then
        cd "$(dirname "${BASH_SOURCE}")"
        path=$(pwd)
        cat $path/gitconfig-local.template > ~/.gitconfig-local

        echo "Remember to fill ~/.gitconfig-local with your details."
    fi
}

if [ "$1" = "--force" ] ; then
    make_symlinks
    template_gitconfig
else
    echo "All files/directories beggining with . in this repository"
    echo "will be symlinked to your home directory, existing symlinks"
    echo "may be overwritten, are you sure to continue?"
    
    select yn in "yes" "no";
    do
        case $yn in
            yes) make_symlinks; template_gitconfig; break;;
            no) exit;;
        esac
    done
fi

