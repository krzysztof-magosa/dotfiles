#!/bin/zsh

source="${HOME}/Downloads"
target="/nas/files/Downloads"
online_marker="/nas/files/.online"

if [ ! -f "${online_marker}" ] ; then
  echo "NAS is offline, exiting..."
  exit 1
fi

cd ${source}
find ./ -type f -mmin +$[48*60] -print0 | rsync -av --files-from=- --from0 --remove-source-files ./ ${target}/
