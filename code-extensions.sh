#!/bin/bash

extensions=(
  alefragnani.project-manager
  dustinsanders.an-old-hope-theme-vscode
  EditorConfig.EditorConfig
  mauve.terraform
  ms-azuretools.vscode-docker
  ms-python.python
)

for ext in ${extensions[@]} ; do
  code --install-extension ${ext}
done

