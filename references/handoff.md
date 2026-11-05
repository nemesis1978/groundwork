# Handoff — what the next session needs

A handoff is a **file**, not a memory. Compacting the conversation reduces context; it does not move state into the repository.

## Where it lives

`docs/HANDOFF.md` in the project. One file, **rewritten** at the end of every working session — not appended to, not duplicated in three places.

## What it must answer

1. What this project is, and where its source of truth lives.
2. What state was **verified**: the commands run and their real result, not impressions.
3. What remains open, in order, and why each item is not done.
4. What must not be repeated: the traps already paid for.
5. The single next action.

If a reader needs the conversation to understand the file, the file failed.

## Template

```markdown
# Handoff — <project>

- Date: YYYY-MM-DD
- Source of truth: PRODUCT.md / docs/SPEC.md
- Plan: docs/BUILD_PHASES.md — phase <N> of <M>
- Phase status: PASS | FAILED | BLOCKED | NOT RUN

## Verified state

| Check | Command | Result |
|---|---|---|
| build | `npm run build` | ok, 1.2 s |
| tests | `npm test` | 40 passed, no credentials |

## Open, in order

| # | Work | Why it is not done | Prerequisite |
|---|---|---|---|
| 1 | ... | ... | ... |

## Do not repeat

- <trap> — <what happens if you try it again>

## Next action

<one sentence: one file, or one command>
```

## Difference from the other artefacts

| File | Answers |
|---|---|
| `PRODUCT.md` | what the product must do |
| `docs/SPEC.md` | how it must behave, verifiably |
| `docs/BUILD_PHASES.md` | in what order, with which gates |
| `docs/PROJECT_STATE.md` | the current measurable state, without narrative |
| `docs/HANDOFF.md` | where work stopped and what comes next |

## When the handoff is wrong

**Symptom:** a new session reopens a question the handoff should have closed.
**Cause:** it recorded intentions instead of verified facts.
**Fix:** rewrite it with commands and their output. Adjectives are not evidence.

**Symptom:** two sessions in a row write a different "next action".
**Cause:** the handoff was written before the work was verified.
**Fix:** write it last, after the gate, never in the middle.
