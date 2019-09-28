#!/bin/bash

extensions=(
  alefragnani.project-manager
  dustinsanders.an-old-hope-theme-vscode
  EditorConfig.EditorConfig
  mauve.terraform
  ms-azuretools.vscode-docker
  ms-python.python
  vscode-icons-team.vscode-icons
)

for ext in ${extensions[@]} ; do
  code --install-extension ${ext}
done

