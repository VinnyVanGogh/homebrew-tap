# Homebrew Tap for Agent-Mesh

Official Homebrew tap for [Agent-Mesh (`mesh`)](https://github.com/VinnyVanGogh/agent-mesh) — Autonomous AI Agent Ops, Quota Pacing & Cross-AI Context Platform for Claude Code and Google Antigravity.

## Installation

```bash
brew tap VinnyVanGogh/tap
brew install mesh
```

## Available Formulae

| Formula | Description |
|---|---|
| `mesh` | Agent-Mesh CLI (`mesh`) and background telemetry daemon (`meshd`) |

## Quick Start

```bash
# Verify installation
mesh version

# Initialize directories and start background watcher
mesh init

# Add shell integration to ~/.zshrc
eval "$(mesh init --shell)"
```

## Documentation

For full architecture documentation, command guides, and executive reporting instructions, see the main [Agent-Mesh repository](https://github.com/VinnyVanGogh/agent-mesh).
