# Changelog

All notable changes to this project are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
The version in `SKILL.md` is the authoritative one.

## [Unreleased]

## [1.0.2] - 2026-11-05

### Added

- Severity scale in `references/existing-project.md`: `BLOCKER`, `HIGH`, `MEDIUM`, `LOW`, `INFO`, each assigned from the observable consequence rather than from a feeling, plus five rules that make two independent diagnoses comparable. Path C now requires a level on every finding.
- `CONTRIBUTING.md`: two-lane contribution model (fast lane for corrections and translations, slow lane for rule changes), seven invariants, and a definition of done.
- `scripts/validate-skill.sh`: executable format contract — checks `name` against the directory, referenced and orphaned files, absolute paths, the nine-rule count, `SKILL.md` length, obvious secrets, and the `[Unreleased]` section.

## [1.0.1] - 2026-11-04

### Added

- Per-host install one-liners for Hermes, Claude Code, Codex, OpenCode, Codebuff/Freebuff, and the skills.sh CLI.
- A copy-paste prompt that lets an agent install the skill by resolving its own skills directory, so the user does not need to know the path.
- Two versioned SVG diagrams (`assets/hero.svg`, `assets/workflow.svg`) used by the README.

### Changed

- `SKILL.md` and all four reference files translated from Italian to English. Structure, commands, file paths, and rule numbering are unchanged, so the two versions remain comparable line by line.
- Wording of the nine rules tightened: each rule now states the prohibition directly instead of describing it.

### Fixed

- `references/existing-project.md` was truncated mid-sentence. Phases 4–6 (small batches, before/after comparison, handoff) and the common-mistakes section are restored.

## [1.0.0] - 2026-11-04

### Added

- Initial release, distilled from [vibe-coding-toolkit](https://github.com/soumatheusgomes/vibe-coding-toolkit) (MIT).
- Three paths: machine setup, new project, existing project.
- Nine non-negotiable rules covering product-before-foundation, proportional adoption, stack migrations, secrets, dependency conflicts, migrations, publishing, and verification.
- Default stack reference (Next.js / Drizzle / Zod / Pino / Vitest) with its explicit limits.
- `references/bootstrap-nextjs.md` — the seven bootstrap steps with real commands.
- `references/existing-project.md` — diagnose, plan, batches, metrics, handoff.
- `references/prompts.md` — the 16 upstream prompts mapped to "when to use it / what it produces".
- `references/tools-map.md` — 23 external tools mapped to host equivalents and substitutes.
- `scripts/sync-skill.sh` — copy the skill into several agent hosts.

[Unreleased]: https://github.com/nemesis1978/groundwork/compare/v1.0.2...HEAD
[1.0.2]: https://github.com/nemesis1978/groundwork/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/nemesis1978/groundwork/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/nemesis1978/groundwork/releases/tag/v1.0.0
