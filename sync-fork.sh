#!/bin/bash

# CL4R1T4S Fork Synchronization Script
# This script syncs your fork with the upstream repository

set -e

echo "🔄 Starting CL4R1T4S fork synchronization..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -d ".git" ] || [ ! -f "README.md" ]; then
    echo -e "${RED}❌ Error: This script must be run from the CL4R1T4S repository root${NC}"
    exit 1
fi

# Check if upstream remote exists
if ! git remote | grep -q "upstream"; then
    echo -e "${YELLOW}⚠️  Adding upstream remote...${NC}"
    git remote add upstream https://github.com/elder-plinius/CL4R1T4S.git
else
    echo -e "${BLUE}ℹ️  Upstream remote already configured${NC}"
fi

# Fetch latest changes from both remotes
echo -e "${BLUE}📡 Fetching latest changes...${NC}"
git fetch origin
git fetch upstream

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo -e "${YELLOW}⚠️  Switching to main branch...${NC}"
    git checkout main
fi

# Check if fork is behind upstream
BEHIND_COUNT=$(git rev-list --count HEAD..upstream/main)
AHEAD_COUNT=$(git rev-list --count upstream/main..HEAD)

echo -e "${BLUE}📊 Status:${NC}"
echo -e "   • Fork is $BEHIND_COUNT commits behind upstream"
echo -e "   • Fork is $AHEAD_COUNT commits ahead of upstream"

if [ "$BEHIND_COUNT" -eq 0 ]; then
    echo -e "${GREEN}✅ Your fork is already up to date!${NC}"
    exit 0
fi

# Show what will be synced
echo -e "${BLUE}📋 Changes to be synced:${NC}"
git log --oneline HEAD..upstream/main | head -10

if [ "$BEHIND_COUNT" -gt 10 ]; then
    echo -e "${YELLOW}   ... and $(($BEHIND_COUNT - 10)) more commits${NC}"
fi

# Ask for confirmation if running interactively
if [ -t 0 ]; then
    echo -e "${YELLOW}❓ Do you want to sync these changes? (y/N)${NC}"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}⏹️  Sync cancelled${NC}"
        exit 0
    fi
fi

# Perform the sync
echo -e "${BLUE}🔄 Syncing changes...${NC}"

if [ "$AHEAD_COUNT" -eq 0 ]; then
    # Simple fast-forward merge
    git merge upstream/main --ff-only
    echo -e "${GREEN}✅ Fast-forward merge completed${NC}"
else
    # Create merge commit
    git merge upstream/main --no-edit
    echo -e "${GREEN}✅ Merge completed${NC}"
fi

# Push changes to origin
echo -e "${BLUE}📤 Pushing changes to your fork...${NC}"
git push origin main

echo -e "${GREEN}🎉 Synchronization completed successfully!${NC}"
echo -e "${BLUE}📈 Summary:${NC}"
echo -e "   • Synced $BEHIND_COUNT commits from upstream"
echo -e "   • Your fork is now up to date"
echo -e "   • Changes pushed to ARJ999/CL4R1T4S"

# Show latest commits
echo -e "${BLUE}📝 Latest commits:${NC}"
git log --oneline -5
