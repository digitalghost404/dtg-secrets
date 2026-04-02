# dtg-secrets

Fish shell integration for GPG-backed secrets management via `pass`.

## What this does

- Auto-injects global API keys into every shell session (`GITHUB_TOKEN`, `TAVILY_API_KEY`, etc.)
- Auto-renders `.env.local` files when you `cd` into a project with a `.env.template`
- Secrets live in `~/projects/pass-store` (private, GPG-encrypted)

## Setup

### Prerequisites

```fish
sudo pacman -S pass gnupg
```

### First-time setup

1. Initialize pass store (see `docs/superpowers/plans/2026-04-02-secrets-vault.md`)
2. Run the installer:

```fish
fish install.fish
```

3. Open a new terminal — secrets are now available.

### New machine setup

```fish
git clone git@github.com:digitalghost404/pass-store ~/projects/pass-store
gpg --import digitalghost-gpg-private.asc   # from USB backup
git clone git@github.com:digitalghost404/dtg-secrets ~/projects/dtg-secrets
cd ~/projects/dtg-secrets && fish install.fish
```

## Usage

```fish
# Get a secret
pass api-keys/anthropic

# Add a new secret
pass insert api-keys/new-service

# Rotate a secret
pass edit api-keys/tavily

# Sync to GitHub
pass git push

# Re-render .env.local for a project
env-render

# Manual inject (if auto didn't fire)
source ~/.config/fish/conf.d/secrets.fish
```

## Store layout

```
~/projects/pass-store/
  api-keys/        anthropic, elevenlabs, elevenlabs-voice-id, github-pat, govee, tavily, voyage
  upstash/         kv-token, kv-readonly-token, kv-url, vector-token, vector-readonly-token
  dtg-cortex/      jwt-secret, cron-secret
```
