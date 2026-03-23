# Overseer

[![Latest Release](https://img.shields.io/github/v/release/Revaycolizer/overseer?display_name=tag)](https://github.com/Revaycolizer/overseer/releases/latest)
[![CI](https://img.shields.io/github/actions/workflow/status/Revaycolizer/overseer/ci.yml?branch=main&label=CI)](https://github.com/Revaycolizer/overseer/actions/workflows/ci.yml)
[![Channel Stable](https://img.shields.io/badge/channel-stable-15803d)](https://github.com/Revaycolizer/overseer/releases/latest)
[![Windows Package](https://img.shields.io/badge/package-windows--x64-0f766e)](https://github.com/Revaycolizer/overseer/releases/latest)

Overseer is a local-first desktop AI orchestration platform built with Rust and Dioxus 0.7. It lets you build, supervise, and automate AI systems with editable agents, planners, supervisors, tools, workflows, and execution traces.

## What It Does

- Runs a desktop-first orchestration app with persistent local conversations
- Lets you edit agents, tools, supervisors, and planners from in-app workshops
- Executes reusable workflows and stores run history
- Records execution runs and event traces so you can inspect what happened
- Keeps data local unless you explicitly connect external services

## Core Capabilities

### Orchestration

- Dynamic agent and supervisor routing from SQLite-backed configuration
- Planner and supervisor hierarchy for domain-specific task execution
- Tool safety controls, intent guardrails, and timeout settings

### Workflows

- Persisted workflows with ordered steps and run history
- Workflow runs linked to underlying execution traces
- Fail-fast workflow execution based on real orchestration status

### Local Control

- SQLite for structured application state
- Local files for attachments and runtime artifacts
- Optional memory layer behind the `memory` Cargo feature

## Prerequisites

- Rust toolchain
- Dioxus CLI: `cargo install dioxus-cli`
- Ollama for local model execution
- Python 3 for Python-backed tools
- Windows desktop builds also need:
  - Visual Studio Build Tools with `Desktop development with C++`
  - `protoc.exe` available at `C:\tools\bin\protoc.exe` or on `PATH`

## Development

Start the desktop app from the repo root:

```powershell
.\run_overseer_desktop.bat
```

If you already have the MSVC environment and `protoc` configured, this also works:

```powershell
dx serve --platform desktop
```

## Releases

Release metadata lives in:

- `CHANGELOG.md`
- `releases/releases.json`
- `releases/notes/`

Create a Windows release package:

```powershell
.\scripts\build-release-windows.ps1
```

That stages a portable build under `dist/<tag>/`, creates a zip, and writes checksums plus a release manifest.

Create and optionally push a git release tag:

```powershell
.\scripts\tag-release.ps1
.\scripts\tag-release.ps1 -Push
```

GitHub automation now includes:

- CI on pushes to `main` and pull requests: `.github/workflows/ci.yml`
- Tagged Windows release publishing for `v*` tags: `.github/workflows/release.yml`

Deployment and packaging notes live in:

- `DEPLOYMENTS.md`

## Installation

Install a packaged build into `LocalAppData` with Start Menu and Desktop shortcuts:

```powershell
.\scripts\install-overseer.ps1
```

Remove an installed build:

```powershell
.\scripts\uninstall-overseer.ps1
```

## Project Layout

```text
.github/workflows/ GitHub CI and tagged release automation
assets/            UI assets and styles
config/            Seed configuration for agents
migrations/        SQLite schema migrations
releases/          Release metadata and release notes
scripts/           Packaging, tagging, install, and uninstall scripts
src/               Rust application source
src/engine/        Orchestration engine, tools, and runtime helpers
src/routes/        Dioxus desktop UI
src/backend.rs     Database-facing application logic
src/db.rs          Database initialization, seeding, and migrations
```

## Notes

- Local development databases from older revisions may need a reset if migration checksums drifted.
- Installed Windows builds package `tool_scripts` and agent prompt files so first-run seeding still works outside the repo layout.
- `releases/releases.json` now carries `latest`, `stable`, badge metadata, and package descriptors for the website hub or updater logic.
