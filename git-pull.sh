#!/bin/bash

git_pull() {
  for d in $1;

       do
         if [ -d "$d/.git" ]; then
         cd $d; git stash; (git pull &); cd ..;
    else
      git_pull $d;
    fi
  done
}

git_pull "*/"
