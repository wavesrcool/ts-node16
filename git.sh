#!/bin/bash

echo "What is the url of the git remote repository..."
read REMOTE

if [ -z "$REMOTE" ]; then
    echo "Error. Requires remote url."
    exit 1
fi

git add .
git commit -m "initial commit"
git branch -M main
git remote add origin $REMOTE
git push -u origin main
