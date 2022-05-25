#!/bin/bash

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t LoveIt # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# 切换到gh-pages
git checkout gh-pages

# Add changes to git.
git add .

# Commit changes.
msg="Published on $(date +'%Y-%m-%d %H:%M:%S')"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

git pull --rebase origin gh-pages
# Push source and build repos.
git push -f origin gh-pages