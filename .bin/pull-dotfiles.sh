#!/bin/sh

# Sync dotfiles repo and ensure that dotfiles are tangled correctly afterward

GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;31m'
NC='\033[0m'

# Navigate to script directory
cd "$(dirname "$(readlink -f $0)")" || return
cd ..

echo -e "${BLUE}Pulling updates from dotfiles repo...${NC}"
echo
git pull --rebase --autostash origin main
echo

unmerged_files=$(git diff --name-only --diff-filter=U)
if [[ ! -z $unmerged_files ]]; then
  echo -e "${RED}The following files have merge conflicts after popping the stash:${NC}"
  echo
  printf %"s\n" "$unmerged_files" # Ensure newlines are printed
else
  echo -e "${GREEN}Linking dotfiles...${NC}"
  echo
  # Run stow to ensure all new dotfiles are linked
  stow --verbose --restow */
fi
