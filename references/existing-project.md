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

## Typical mistakes in this phase

- Migrating the stack "while we are here".
- Adding an ORM where the team chose another.
- Introducing an unrequested UI kit.
- Declaring a batch finished without running its verification.
- Rewriting SQL migrations to make them look idempotent.
