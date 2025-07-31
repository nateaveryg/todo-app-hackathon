#!/bin/bash

# A script to add, commit, and push changes to GitHub.

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if a commit message was provided as an argument.
if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: ./deploy.sh \"Your commit message\""
  exit 1
fi

# Get the current branch name.
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

echo "🚀 Starting deployment process for branch '$BRANCH_NAME'..."

git add .
echo "✅ Files staged."

git commit -m "$1"
echo "✅ Files committed with message: \"$1\""

git push origin "$BRANCH_NAME"
echo "✅ Pushed to origin/$BRANCH_NAME. All done!"
