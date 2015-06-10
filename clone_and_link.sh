#!/bin/bash

pushd "$HOME/Projects"

  if [ -d "dot-files" ]; then
    pushd "dot-files"
      git smart-pull
    popd
  else
    git clone "git://github.com/AniaCodequest/dot-files.git" "dot-files"
  fi

  ls -1d ~/Projects/dot-files/files/* ~/Projects/dot-files/files/.* | while read f; do
    [ "$f" == '~/Projects/dot-files/files/.' ] ||
    [ "$f" == '~/Projects/dot-files/files/..' ] ||
    [ "$f" == '~/Projects/dot-files/files/.git' ] ||
    ln -vsf "$f" /~
  done

popd
