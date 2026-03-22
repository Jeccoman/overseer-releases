# Changelog

All notable changes to Overseer should be recorded in this file.

The format follows a simple release-by-release log, with the detailed long-form notes stored under `releases/notes/`.

## [0.1.0] - 2026-03-22

### Added

- Local-first desktop runtime built with Rust and Dioxus 0.7.
- Dynamic workshops for agents, tools, supervisors, and planners.
- Workflow automation with persisted runs and step history.
- Execution run and event tracing for conversations and workflows.
- Version snapshots and rollback support for agents and tools.
- Windows release packaging, install scripts, and release metadata foundation.

### Changed

- Tool runtime staging is now OS-aware and Windows-friendly.
- Python and `protoc` detection flow has been hardened for desktop development.
- Workflow execution now uses real orchestration status instead of optimistic completion.

### Fixed

- Windows `nvidia-smi` probing no longer flashes a console window.
- Startup error reporting now surfaces the actual initialization stage that failed.
- Installed builds can now resolve packaged tool scripts relative to the executable.
