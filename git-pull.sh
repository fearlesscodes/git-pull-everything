#!/bin/bash

function exists_gitFolder() {
local gitFolderFound=-1;
local gitFolder=$(find -path '$(pwd)/*' -prune -type d | grep -i "/.git");
if [ -z "$gitFolder" ]; then
    gitFolderFound=0;
else
    gitFolderFound=-1;
fi

echo "$gitFolderFound";
}

git_pull() {
  for d in $1;
       do
         echo "for folder"
         echo $d;
         echo $(pwd);

         if [ -d "$d" ] && [ -d "$d/.git" ]; then
           cd "$(pwd)/$d";echo $(pwd); git stash; (git pull &); cd ..;continue ;
    else
      echo "recursive";

      git_pull "$d/*";
    fi
  done
}
git_pull "*/"


# Example to check if git folder exists.
found=$(exists_gitFolder);
echo $found;
if [ "$found" = 0 ]; then
  echo "FOUND";
else
  echo "NOT FOUND";
fi

