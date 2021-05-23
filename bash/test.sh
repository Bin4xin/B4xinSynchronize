#!/bin/bash

git_commit_filename=`git log --pretty=format:"" --name-only  -1`
update_commit=`date -R`
IFS=$'\n'
for line in $git_commit_filename
  do
    echo "git commit -m "$update_commit $line commit by B4xinSynchronize.""
  done

