#!/bin/bash

# Loop through each item in the current directory
for dir in */; do
    # Check if the item is a directory and contains a .git folder
    if [ -d "$dir" ] && [ -d "$dir/.git" ]; then
      # Change to the directory
      cd "$dir" || return
      # Get the repository name (directory name)
      repo_name=$(basename "$dir")
      # Get the current branch name
      branch_name=$(git rev-parse --abbrev-ref HEAD)
      # Display the repository name and current branch name
      echo ""
      echo "Repository: $repo_name, Branch: $branch_name"
      # Pull the lastest changes from the remote repository
      git pull
      # Change back to the parent directory
      cd ..
    fi
done
