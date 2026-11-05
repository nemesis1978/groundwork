---
name: groundwork
version: 1.0.4
author: Egix
license: MIT
description: Use when setting up a machine or bootstrapping a project.
metadata:
  category: software-development
  source: soumatheusgomes/vibe-coding-toolkit
  hermes:
    tags: [setup, bootstrap, nextjs, project-init, quality-gates]
    related_skills: [egix-engineering, plan, code-reviewer]
---

# Groundwork

Machine setup and project bootstrap/upgrade, with explicit and verifiable rules.
Distilled from [vibe-coding-toolkit](https://github.com/soumatheusgomes/vibe-coding-toolkit) (MIT) — a derivative work, not a fork.
Templates and the complete 16 prompts live upstream: this skill indexes them and fixes the operating rules.

### Prerequisite: the source toolkit

```bash
git clone https://github.com/soumatheusgomes/vibe-coding-toolkit.git
```

In this skill `<TOOLKIT>` is that directory. If the toolkit is unavailable the skill still works: the references carry the essential commands, while `.template` files are recreated from the project.

## When to Use

- A new machine or a toolchain to prepare.
- A new project from scratch (Next.js by default, but adaptable).
- An existing project to diagnose, configure, or repair.
- Partial adoption: only one piece is needed (ESLint, security review, harness).

Do not use it for focused coding tasks: this skill sets up the environment and the working contract, it does not implement the feature.

## Non-negotiable rules

1. **Product before foundation.** `PRODUCT.md` (problem, audience, flows, MVP, constraints, acceptance criteria) before any stack choice. Reversible assumptions are stated explicitly; what is missing stays pending, not invented.
2. **Proportional.** Never install something just because it appears in the catalog. Every component receives an explicit decision: adopted, equivalent already present, or rejected with a reason.
3. **Never migrate an existing stack as a side effect.** Bootstrap does not authorize changes to framework, ORM, bundler, or UI kit.
4. **One toolkit revision per project.** Do not mix files from different revisions.
5. **No secrets in plaintext.** `.env.local` ignored, `.env.example` versioned and free of credentials. Never `NEXT_PUBLIC_*` for secrets.
6. **No `--force` / `--legacy-peer-deps`** to hide dependency conflicts: resolve them or document them.
7. **Migrations only on an authorized destination**, never during build, import, or a request. No `db:push` in the standard flow.
8. **No push, deploy, or publish** without an explicit request.
9. **Verify before asserting.** Stable versions and channels (`latest` vs `@rc` / `@canary`) are checked at execution time, never assumed.

## Step 0 — Read the project state first

Before any path, look. Do not ask what the directory can answer.

```bash
ls -a                                                   # code, docs, config
git status --short                                      # tracked, uncommitted, or no repository at all
ls PRODUCT.md docs/SPEC.md docs/BUILD_PHASES.md docs/HANDOFF.md 2>/dev/null
```

Declare one state, with evidence: `State: <state> — evidence: <files and commands>`.

| State | Recognised by | Where it goes |
|---|---|---|
| empty | no code, no documents | Path B |
| idea | `PRODUCT.md` or notes, no code | Path B, then `phased-build` phase C |
| scaffold | builds, but no `SPEC.md` / `BUILD_PHASES.md` | `phased-build` phase C |
| in progress | SPEC and BUILD_PHASES exist, phases not all `PASS` | `phased-build` phase E, from `HANDOFF.md` |
| broken | does not build, missing dependencies, no git | Path C first |

Ask the user only when the evidence contradicts itself: two documents describing different products, a `HANDOFF.md` naming files that no longer exist, a build that passes in one directory and fails in another. Never ask what a command can prove.

Reading the state is not a diagnosis: it costs four commands and prevents building on the wrong directory.

## Path A — Machine setup

1. Choose where it runs (native / container / WSL) and record it.
2. Inventory: git, node, package manager, editor, agent CLIs already present. Do not reinstall what exists.
3. Install only what is missing; for every installation record the source, version, and date.
4. Configure each client (Codex, Claude, OpenCode, Hermes) in the format it actually supports.
5. Produce `environment-manifest.json` (template: `<TOOLKIT>/templates/environment-manifest.json.example`).
6. Verify by reproducing: a second run must produce the same result.

## Path B — New project

Full sequence with commands: `references/bootstrap-nextjs.md`.
Summary of the 8 steps:

1. Inspect destination, instructions, clients, runtime, package manager, local changes.
2. Write `PRODUCT.md` from the template (`<TOOLKIT>/templates/product.md.template`).
3. Generate the official scaffold with `create-next-app` (stable version, checked), in a temporary directory if the destination is not empty.
4. Install the core (Drizzle+Postgres, Zod, Pino, Vitest) plus `clsx` and `tailwind-merge` — `templates/next/src/lib/utils.ts` imports them and the scaffold does not include them — then copy `templates/next/`, stripping the `.example` suffix.
5. Install and route the relevant skills: only the ones needed, never `--all`.
6. Generate documentation from the manifest (4 files in root + 5 in `docs/`), configure ESLint and the commands. `AGENTS.md` may be generated and protected by the framework (Next 16 writes a `nextjs-agent-rules` block that `next dev` regenerates): append to it, never replace it, and expect an approval prompt on protected instruction files.
7. Verify: build, lint, **typecheck**, tests without credentials, and report the evidence.
8. Write `docs/HANDOFF.md` (`references/handoff.md`): what exists, what was verified with which command, what is still open. A scaffold without a handoff forces the next session to start from zero.

## Path C — Existing project

1. Read-only diagnosis: real stack, commands that actually work, where the fragile points are. Every finding gets a severity level (`references/existing-project.md`).
2. `PRODUCT.md` rebuilt from the facts in the code, not from intentions.
3. Short plan with a decision per component (adopt / equivalent / reject).
4. Apply in small batches, each one verifiable, without breaking what works.
5. Measurable before/after comparison (lint, warnings, file size, timings).
6. `docs/HANDOFF.md` if work remains open — same format as the bootstrap path (`references/handoff.md`).

Details: `references/existing-project.md`.

## Default stack

A reference decision, not a dogma: every deviation must be justified in `PRODUCT.md` and `docs/architecture.md`.

| Area | Default | Limit |
|---|---|---|
| Application | stable Next.js, App Router, strict TS, Tailwind, ESLint, `src/`, `@/*` | preserve existing app and package manager |
| Persistence | Drizzle ORM + PostgreSQL (`pg`) | a product without persistence omits it, with a stated reason |
| Validation | Zod on env, inputs, external responses | TS types do not validate at runtime |
| Server | `server-only` on env, logger, db | secrets never in the client |
| Logging | structured Pino with redaction of known secrets | redaction does not cover secrets written into messages |
| Tests | Vitest on server logic, no credentials | DOM/E2E only when needed |
| Quality | Next/TS presets, typed async checks, 350-line limit | ORM guards do not replace review |
| Agents | shared `AGENTS.md` + `CLAUDE.md` bridge | preserve client, model and authentication |

## Prompt catalog

16 ready-made prompts in the toolkit's `docs/prompts/`. Map of "when to use which": `references/prompts.md`.

## Tools cited by the toolkit

The toolkit references external tools (Superpowers, Ponytail, Caveman, RTK, Context7, Graphify). Never assume they exist: map and substitutes in `references/tools-map.md`.

## Anti-patterns

- Scaffolding into a non-empty directory without a controlled merge.
- Generated documentation with unfilled placeholders or unused fields.
- `CLAUDE.md` duplicating `AGENTS.md` instead of importing it.
- Skills installed "to be safe" that the product never uses.
- Tests that pass only because they require an unavailable real database.
- Security review with public reports or mandatory paid scanners.

## Multi-agent distribution

The same folder works on every host that reads `SKILL.md` with `name`/`description` frontmatter.

| Host | Path |
|---|---|
| Hermes | `<hermes-home>/skills/groundwork` |
| Claude Code | `~/.claude/skills/groundwork` |
| agentskills / Codebuff / Freebuff | `~/.agents/skills/groundwork` |
| Codex | `~/.codex/skills/groundwork` |
| OpenCode | `~/.config/opencode/skills/groundwork` |

Copy the directory into the path of the client in use; for several clients run `bash scripts/sync-skill.sh`
after adapting the `TARGETS` list. Restart the agent session so it reloads.

Format constraints: `name` lowercase with hyphens and **identical to the directory name**, `description` short (hosts use it to decide whether to load the skill), and no absolute paths in the references if the skill must stay portable.

## Final check

Before declaring done: declared project state, green build, clean lint, **clean typecheck**, tests runnable without credentials, documentation without placeholders, `docs/HANDOFF.md` written, and an honest list of what remains open.
