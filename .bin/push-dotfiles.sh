#!/bin/sh

# Sync dotfiles with remote repo

GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;31m'
NC='\033[0m'

# Navigate to script directory
cd "$(dirname "$(readlink -f $0)")" || return
cd ..

echo -e "${BLUE}Reading local updates from dotfiles repo...${NC}"
echo
if [[ "$(git status --porcelain | wc -l)" -eq 0 ]]; then
  echo -e "${RED}No local updates found.${NC}"
  exit 1
else
  git add .
  echo -e "${BLUE}New local updates found and staged, please insert commit message:${NC}"
  echo
  read -p 'Message: ' commitMessage
  echo
  echo -e "${BLUE}Commiting local updates...${NC}"
  git commit -m "${commitMessage}"
fi
echo
read -p $'\033[1;34mPush local updates to dotfiles repo?[y/n]\033[0m ' -n 1 -r response
echo
if [[ ! $response =~ ^[Yy]$ ]]; then
  echo -e "${BLUE}Leaving local updates unstaged and exit...${NC}"
  echo
  git restore --staged . && exit 1
else
  echo -e "${GREEN}Pushing local updates to dotfiles repo...${NC}"
  echo
  git push
  echo
  echo -e "${BLUE}Local updates synched with dotfiles repo. Bye!${NC}"
  exit 0
fi
