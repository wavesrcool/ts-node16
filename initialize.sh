#!/bin/bash

NAME_BASE="ts-node16"
DESCRIPTION_BASE="A Typescript base in Node.js version 16"
README_FILE=README.md

echo "What is the name of the project..."
read NAME

if [ -z "$NAME" ]
then
    echo "... unspecified ( $NAME_BASE )"
    NAME=$NAME_BASE
else
echo "# $NAME" > "$README_FILE"
fi

mv package.json temp.json
jq -r ".name |= \"$NAME\"" temp.json > package.json
rm temp.json

echo ""
echo "What is the description of the project..."
read DESCRIPTION

if [ -z "$DESCRIPTION" ]
then
    echo "... unspecified ( $DESCRIPTION_BASE )"
    DESCRIPTION=$DESCRIPTION_BASE
else
echo "" >> "$README_FILE"
echo "$DESCRIPTION" >> "$README_FILE"
fi

mv package.json temp.json
jq -r ".description |= \"$DESCRIPTION\"" temp.json > package.json
rm temp.json

rm -rf .husky
rm -rf node_modules
rm -rf .git
rm .env
rm .env.example
git init
yarn
yarn husky install 
cat pre-commit.txt > .husky/pre-commit
chmod ug+x .husky/pre-commit
echo "PORT=4000" > .env
yarn c
yarn envs
yarn start