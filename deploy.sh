#!/bin/bash

# If a command fails then the deploy stops
set -e

# Add changes to git.
git add .

# Commit changes.
msg="Delolyed on $(date +'%Y-%m-%d %H:%M:%S')"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

git push