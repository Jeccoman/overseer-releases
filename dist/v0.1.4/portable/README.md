# Overseer

[![Latest Release](https://img.shields.io/github/v/release/Revaycolizer/overseer?display_name=tag)](https://github.com/Revaycolizer/overseer/releases/latest)
[![CI](https://img.shields.io/github/actions/workflow/status/Revaycolizer/overseer/ci.yml?branch=main&label=CI)](https://github.com/Revaycolizer/overseer/actions/workflows/ci.yml)
[![Channel Stable](https://img.shields.io/badge/channel-stable-15803d)](https://github.com/Revaycolizer/overseer/releases/latest)
[![Windows Installer](https://img.shields.io/badge/installer-windows--x64-0f766e)](https://github.com/Revaycolizer/overseer/releases/latest)

Overseer is a desktop-first local AI operator built with Rust and Dioxus 0.7. It combines chat, workflows, tools, supervised desktop control, artifacts, work items, and execution traces in one local workspace.

## What Overseer Is For

Overseer is for people who want more than a chat wrapper:

- inspect the local machine and grounded system state
- run desktop-aware tasks and supervised computer actions
- capture and reuse artifacts like screenshots, files, and run outputs
- coordinate work through explicit work items instead of loose chat memory
- inspect traces so failures stay visible and recoverable

## Current Product Shape

### Local AI Workspace

- Persistent conversations, runs, and trace timelines
- Editable agents, tools, supervisors, and planners from in-app workshops
- Workflow automation with stored run history and fail-fast execution

### Desktop Operator

- Native fast paths for screenshots, process inspection, browser state, file search, file open, and file read
- Hybrid desktop control on Windows using machine state, screenshots, and growing UI Automation support
- Approval-aware computer control with pause, emergency stop, and session guardrails

### Artifact and Work Item Layer

- Run outputs stored as first-class artifacts instead of only chat text
- Artifact inspection surfaces for summary, review, compare, and handoff
- Work items that can be queued, run, tracked, and reopened as persistent workspace sessions

## Platform Status

- Windows: packaged installer and portable release available now
- macOS: source/build path exists, packaged public release not yet published
- Linux: source/build path exists, packaged public release not yet published

## Prerequisites For Development

- Rust toolchain
- Dioxus CLI: `cargo install dioxus-cli`
- Ollama for local model execution
- Python 3 for Python-backed tools that still use the optional extension runtime
- On Windows desktop builds:
  - Visual Studio Build Tools with `Desktop development with C++`
  - `protoc.exe` available at `C:\tools\bin\protoc.exe` or on `PATH`

## Run In Development

From the repo root:

```powershell
.\run_overseer_desktop.bat
```

If your MSVC environment and `protoc` are already configured:

```powershell
dx serve --platform desktop
```

## Release Workflow

Release metadata lives in:

- `CHANGELOG.md`
- `releases/releases.json`
- `releases/notes/`

Build the packaged Windows release:

```powershell
.\scripts\build-release-windows.ps1
```

That creates:

- `dist/<tag>/Overseer-<tag>-windows-x64-setup.exe`
- `dist/<tag>/Overseer-<tag>-windows-x64.zip`
- checksums and a Windows release manifest

Tag the release:

```powershell
.\scripts\tag-release.ps1
.\scripts\tag-release.ps1 -Push
```

CI and tagged release automation live in:

- `.github/workflows/ci.yml`
- `.github/workflows/release.yml`

## Installation

Install into `LocalAppData` with Start Menu and Desktop shortcuts:

```powershell
.\scripts\install-overseer.ps1
```

Uninstall:

```powershell
.\scripts\uninstall-overseer.ps1
```

## Microsoft Store

Overseer can be submitted to the Microsoft Store using the packaged Windows installer path. The current repo guidance lives in:

- `MICROSOFT_STORE.md`

## Project Layout

```text
.github/workflows/ GitHub CI and tagged release automation
assets/            UI assets and bundled branding
config/            Seed configuration for agents and runtime defaults
migrations/        SQLite schema migrations
releases/          Release metadata and release notes
scripts/           Packaging, tagging, install, uninstall, and registry helpers
src/               Rust application source
src/engine/        Orchestration engine, tools, runtime helpers, and desktop control
src/routes/        Dioxus desktop UI
src/backend.rs     Database-facing application logic and persistence APIs
src/db.rs          Database initialization, seeding, and migration handling
```

## Notes

- Local development databases from older revisions may need a reset if migration checksums drifted.
- `releases/releases.json` powers the release hub, updater-facing metadata, and public website release surfaces.
- The current desktop-control story is strongest on Windows, where the native control and UI Automation layers are being hardened aggressively.
