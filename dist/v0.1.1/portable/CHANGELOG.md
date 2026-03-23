# Changelog

All notable changes to Overseer should be recorded in this file.

The format follows a simple release-by-release log, with the detailed long-form notes stored under `releases/notes/`.

## [0.1.1] - 2026-03-23

### Added

- Computer Control surface for session modes, allowlists, action caps, timeout control, and emergency stop handling.
- Approval-backed desktop supervision flow with pending-action staging and one-shot approval from the app.
- Saved tool test cases in the Tools Workshop with pass/fail result tracking.
- Runtime health panel in Settings for Ollama, selected models, Python, and `protoc`.

### Changed

- Chat now auto-creates a conversation on first send and shows stronger starter, routing, and failure states.
- Execution Trace now supports filtered event views, clearer event labels, and expandable raw payloads.
- Workflow automation now shows richer run summaries, better status badges, and clearer rerun controls.
- Computer and desktop tool execution now respects session state, approval mode, action limits, and session timeout policy.

### Fixed

- Follow-up replies like `continue` now stay anchored to active computer supervision sessions.
- Legacy Python tools that import `requests` now run inside the staged runtime without failing immediately.
- Desktop-action approvals now surface as explicit blocked trace events instead of vague supervisor drift.

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
