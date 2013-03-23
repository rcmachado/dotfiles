#!/bin/bash
#
# Download, assemble and installs global gitignore file
#

GITIGNORE="${1}.gitignore"

GITHUB_BASE_URL="https://raw.github.com/github/gitignore/master/"

FILES="Global/OSX.gitignore Global/VirtualEnv.gitignore Global/vim.gitignore"
FILES="$FILES Global/SASS.gitignore Python.gitignore"

echo > $GITIGNORE
for FILE in $FILES
do
    curl -s "$GITHUB_BASE_URL$FILE" >> "$GITIGNORE"
done
