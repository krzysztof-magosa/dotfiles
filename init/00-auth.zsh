#! /usr/bin/env zsh

sudo -v
if [ $? != 0 ] ; then
   echo "You must enter password to continue with initialization."
   return 1
fi

