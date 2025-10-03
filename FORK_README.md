# CL4R1T4S Personal Fork

This is a personal fork of [elder-plinius/CL4R1T4S](https://github.com/elder-plinius/CL4R1T4S) that stays automatically synchronized with the upstream repository.

## About This Fork

This fork maintains a personal copy of the CL4R1T4S repository (AI system prompts collection) while ensuring it stays up-to-date with the original repository through automated synchronization.

## Synchronization Methods

### 1. Automated Sync (Recommended)

The fork uses GitHub Actions to automatically sync with the upstream repository every 6 hours. The workflow:

- Runs automatically every 6 hours
- Can be triggered manually from the Actions tab
- Merges upstream changes without conflicts
- Provides detailed sync summaries

**To view sync status:**
1. Go to the [Actions tab](../../actions)
2. Look for "Sync Fork with Upstream" workflows
3. Check the latest run for sync status and summary

### 2. Manual Sync Script

For local synchronization, use the provided script:

```bash
# Navigate to repository directory
cd CL4R1T4S

# Run the sync script
./sync-fork.sh
```

The script will:
- Check for upstream changes
- Show what will be synced
- Ask for confirmation (if running interactively)
- Perform the sync and push changes

### 3. Manual Git Commands

For advanced users who prefer manual control:

```bash
# Fetch latest changes
git fetch upstream
git fetch origin

# Check status
git status

# Merge upstream changes
git checkout main
git merge upstream/main

# Push to your fork
git push origin main
```

## Repository Structure

This fork maintains the same structure as the upstream repository:

- **ANTHROPIC/**: Claude system prompts
- **GOOGLE/**: Gemini and other Google AI prompts
- **CURSOR/**: Cursor AI development tool prompts
- **DEVIN/**: Devin AI agent prompts
- **MANUS/**: Manus AI system prompts
- And many more AI systems...

## Upstream Repository

- **Original Repository**: [elder-plinius/CL4R1T4S](https://github.com/elder-plinius/CL4R1T4S)
- **Purpose**: Collection of leaked system prompts from major AI systems
- **License**: AGPL-3.0
- **Activity**: Very active with frequent updates

## Sync Status

- ✅ **Automated Sync**: Enabled (every 6 hours)
- ✅ **Manual Sync**: Available via script
- ✅ **Upstream Tracking**: Configured
- ✅ **Push Access**: Enabled

## Troubleshooting

### Sync Failures

If automated sync fails:

1. Check the [Actions tab](../../actions) for error details
2. Run manual sync script: `./sync-fork.sh`
3. If conflicts occur, resolve manually:
   ```bash
   git fetch upstream
   git checkout main
   git merge upstream/main
   # Resolve conflicts if any
   git push origin main
   ```

### Script Issues

If the sync script fails:

1. Ensure you're in the repository root directory
2. Check that upstream remote is configured: `git remote -v`
3. Verify you have push access to your fork
4. Run with verbose output: `bash -x ./sync-fork.sh`

## Contributing

This is a personal fork for reference purposes. For contributions to the main project:

1. Visit the [upstream repository](https://github.com/elder-plinius/CL4R1T4S)
2. Follow their contribution guidelines
3. Submit pull requests to the original repository

## License

This fork maintains the same AGPL-3.0 license as the upstream repository.

---

**Last Updated**: $(date)
**Fork Maintainer**: ARJ999
**Upstream**: elder-plinius/CL4R1T4S
