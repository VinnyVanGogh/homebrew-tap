# Homebrew Tap for StayPoint

Official Homebrew tap for [StayPoint (`staypoint`)](https://github.com/VinnyVanGogh/agent-mesh) — Autonomous AI Agent Ops, Quota Pacing & Cross-AI Context Platform for Claude Code and Google Antigravity (formerly Agent-Mesh).

## Installation

```bash
brew tap VinnyVanGogh/tap
brew install staypoint
```

*(Note: `brew install mesh` remains supported as a backwards-compatible alias.)*

## Available Formulae

| Formula | Description |
|---|---|
| `staypoint` | StayPoint CLI (`staypoint`) and background telemetry daemon (`staypointd`) |
| `mesh` | Compatibility formula providing `mesh` and `meshd` aliases to StayPoint |

## Quick Start

```bash
# Verify installation
staypoint version

# Initialize directories and start background watcher
staypoint init

# Add shell integration to ~/.zshrc
eval "$(staypoint init --shell)"
```

## Documentation

For full architecture documentation, command guides, and executive reporting instructions, see the main [StayPoint repository](https://github.com/VinnyVanGogh/agent-mesh).
