# Contributing

This repository holds a **skill**: a folder of instructions an AI agent loads when a task matches. It is not an application and it has no runtime. That shapes what a useful contribution looks like.

Short version:

> Corrections are welcome as pull requests. Changes to the rules are welcome after an issue.

---

## Two lanes

### Fast lane — open a pull request directly

- Typo, broken link, wrong command flag, inaccurate version.
- A **complete** translation of `SKILL.md` plus the four references.
- A clearer sentence that says the same thing.
- A bug in `scripts/validate-skill.sh` (with the case that reproduces it).

### Slow lane — open an issue first

- Changing, adding, or removing one of the **nine rules**.
- Adding or removing a **path** (machine setup, new project, existing project).
- Changing the **default stack**, or the limits in its table.
- Adding a new reference file, or a new section to `SKILL.md`.
- Anything that makes the skill longer without making it more precise.

An issue for the slow lane needs three things, and will be closed without them:

1. **A real case** where the current skill gave the wrong instruction or none.
2. **Why the existing content does not cover it** — quote the line.
3. **What gets worse** if we add it (length, ambiguity, a new failure mode).

"Feels cleaner" is not a case. The skill's value is that it is short and decided.

---

## Invariants

These are not up for discussion in a pull request. Breaking one is a rejection, not a review comment.

| Invariant | Why |
|---|---|
| `name` in the frontmatter is **identical** to the directory name | hosts resolve skills by directory; a mismatch silently fails to load |
| Rules stay **numbered 1–9** | other documents and translations reference them by number |
| There are exactly **three paths** | a fourth path turns a decision procedure into a menu |
| Translations keep code blocks, file paths, and rule numbers **identical** | otherwise the versions drift and cannot be compared |
| **No absolute paths** in any `.md` | the skill must work on someone else's machine |
| **No secrets**, ever | it is a public repository |
| The **upstream attribution** stays in `README.md` and `LICENSE` | MIT requires it, and the credit is not ours to drop |

---

## Definition of done

A pull request is ready when both are true:

```bash
bash scripts/validate-skill.sh      # must print PASS and exit 0
```

- `CHANGELOG.md` has an entry under `[Unreleased]` describing the change in one line.

If the validator fails, the pull request is not ready — it is not a matter of taste. Run it locally before pushing; it needs only bash and coreutils (Git Bash, WSL, macOS, or Linux).

---

## Writing style

The skill is read by an agent under a token budget, and by a human deciding whether to trust it.

- **English** is the canonical language. Translations are welcome as separate PRs.
- **Direct voice.** "Never migrate an existing stack as a side effect", not "it is generally advisable to consider whether".
- **No hype.** No "supercharge", "10x", "game-changing". The README sells nothing.
- **Short sentences.** One rule, one idea.
- **Second person.** "You do not invoke it" — not "we".
- **No emoji** in `SKILL.md` or the references. The README may use a diagram instead.
- **Numbers over adjectives.** "350-line limit" beats "keep files reasonably small".

---

## Commits

- One logical change per commit.
- Imperative mood: `Fix truncated existing-project reference`, not `Fixed stuff`.
- Reference the issue when one exists: `Clarify Path C batch rule (#12)`.

Large reformatting mixed with a substantive change will be asked to split. A diff nobody can read is a diff nobody can review.

---

## What gets rejected

- Rewrites that change wording without changing meaning.
- Tools added to the catalog because they are popular, with no verified behaviour.
- Content generated and never executed — especially commands with untested flags.
- PRs that mix a rule change with cosmetic edits.
- Adding length to `SKILL.md` instead of a reference file. `SKILL.md` is loaded first, on every matching task; it must stay under 200 lines.
- Anything requiring a paid service to follow the instructions.

---

## Licensing

Contributions are accepted under the **MIT license** of this repository (inbound = outbound). There is no CLA and no copyright assignment. By opening a pull request you confirm you wrote the content or that it may be redistributed under MIT.

If your contribution derives from another project, say so in the pull request and add the attribution to `README.md` and `LICENSE` in the same commit.

---

## Local workflow

```bash
git clone https://github.com/nemesis1978/groundwork.git
cd groundwork
bash scripts/validate-skill.sh      # baseline: PASS

# make your change
bash scripts/validate-skill.sh      # must still PASS

git add -A
git commit -m "Describe the change in the imperative"
```

To try the skill in an agent before opening the pull request, copy the directory into that agent's skills path (`~/.claude/skills/groundwork`, `~/.codex/skills/groundwork`, `~/.agents/skills/groundwork`, `~/.config/opencode/skills/groundwork`) and restart the session.

If your change alters behaviour rather than wording, say in the pull request **which prompt you ran and what the agent did differently**. That is the only evidence that matters for an instruction file.
