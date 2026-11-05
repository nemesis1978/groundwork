# Existing project: diagnosis, plan, batches

Extracted from `docs/prompts/12-existing-project-setup.md` and `docs/04-project-bootstrap.md`.

## Base rule

Bootstrap is not applied to an existing project as if it were new. Preserve what works and adopt only what brings a measurable benefit.

## Phase 1 — Read-only diagnosis

1. Real stack: framework, versions, runtime, package manager, database, tests, lint.
2. Commands that actually work (executed, not inferred from the README).
3. Map of modules and entry points.
4. Fragile points: oversized files, warnings, unused dependencies, secrets in code, missing or broken tests.
5. Uncommitted local changes: save them before any intervention.

Output: a short, verifiable report. No modifications in this phase.

## Phase 2 — PRODUCT.md rebuilt

From the code, not from intentions: what the product does today, for whom, which flows exist, which are dead. Misalignment between documentation and code is a finding, not a detail.

## Phase 3 — Decision per component

One explicit decision for every catalog component:

| Decision | When |
|---|---|
| Adopt | it is missing and the product requires it |
| Equivalent present | another way of doing the same thing already exists |
| Reject | this product does not need it, with the reason written down |

The plan must fit on one page. If it needs more, it is a project, not a plan.

## Phase 4 — Small batches

- One batch = one change with its own verification command.
- No mixed batches (refactor + feature + config together).
- After each batch: real state, not "mostly done".
- If a batch fails twice, stop and report instead of retrying blindly.

## Phase 5 — Before/after comparison

Minimum metrics to report: lint warning count, files over the limit, passing tests, build time, removed dependencies. Without numbers it is not an improvement, it is an opinion.

## Phase 6 — Handoff

If work remains open: objective, real state, decisions with reasons, files touched, blockers, executable next steps, constraints not to break.

## Severity scale

Every finding gets one level, assigned from the **observable consequence**, not from a feeling. Two agents must reach the same level for the same finding — otherwise two diagnoses cannot be compared.

| Level | Test | Typical cases |
|---|---|---|
| **BLOCKER** | the project cannot run, or cannot be rebuilt from scratch | syntax error, missing credential, a dependency that no longer installs |
| **HIGH** | silent data loss, secret exposure, or no way back from a change | secrets reachable in a copy or a backup, secrets committed, **no version control**, destructive script without backup |
| **MEDIUM** | a defect that bites within weeks, or documentation contradicting the code | deprecated API, docstring naming an output path that is not the one written, core logic without tests, unpinned dependencies |
| **LOW** | friction, not failure | file permissions, duplicated folders, dead code |
| **INFO** | observation, no action required | project idle for N days, size on disk |

Rules that make the scale usable:

- **A finding you cannot reproduce is `INFO`, never `HIGH`.** State what you ran.
- **Absent version control is always `HIGH`**: without it every other fix is irreversible, so it outranks most defects.
- **Every level carries its evidence line** — file, command, or output. A level without evidence is an opinion.
- Do not invent intermediate levels ("high-ish"): four levels plus INFO is the whole scale.
- When unsure between two levels, choose the lower one and say what would raise it.

## Typical mistakes in this phase

- Migrating the stack "while we are here".
- Adding an ORM where the team chose another.
- Introducing an unrequested UI kit.
- Declaring a batch finished without running its verification.
- Rewriting SQL migrations to make them look idempotent.
