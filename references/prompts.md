# The 16 toolkit prompts

Local path: `<TOOLKIT>/docs/prompts/`
Every file is self-contained: paste it into the client and adapt the context.

| # | File | When to use it | What it produces |
|---|---|---|---|
| 01 | `01-project-sanitation.md` | messy repo, before working on it | measurement and code reorganisation |
| 02 | `02-eslint-warning-burndown.md` | too many accumulated warnings | measured warning reduction, in batches |
| 03 | `03-multi-agent-code-review.md` | a specialised review is needed | multi-perspective review with findings |
| 04 | `04-brainstorm-to-plan.md` | vague request to refine | a constrained plan before code |
| 05 | `05-parallel-wave-dispatch.md` | independent tasks in parallel | waves with file ownership |
| 06 | `06-memory-bootstrap.md` | context lost between sessions | a persistent memory contract |
| 07 | `07-eslint-complete-setup.md` | advanced lint config needed | complete, justified configuration |
| 08 | `08-eslint-quality-gates-install.md` | rules to copy and measure | quality gates installed with evidence |
| 09 | `09-file-size-refactor.md` | files too large | refactor by responsibility |
| 10 | `10-development-environment-setup.md` | machine to prepare | global environment + manifest |
| 11 | `11-next-project-bootstrap.md` | **new project** | product + configured foundation |
| 12 | `12-existing-project-setup.md` | **existing project** | full setup with before/after |
| 13 | `13-security-review.md` | security review | private, evidence-based report |
| 14 | `14-harness-evaluation.md` | check whether instructions work | disposable tests on instructions, recovery, review |
| 15 | `15-harness-improvement.md` | improve the working flow | native adaptation of the harness method |
| 16 | `16-security-audit.md` | in-depth audit **on request** | 4 private artifacts, remediation batches, checkpoints |

## Usage rules

- **11** for a new project, **12** for an existing one, **10** for the machine. The rest are focused tasks.
- **16 is never run automatically**: it is a separate task, only on explicit request.
- One prompt at a time. Queueing them produces results nobody can verify.
- After every prompt: real outcome and files touched, not a summary of intentions.

## Adaptation

The prompts assume an agent with terminal, filesystem, and network access. If a client lacks a cited tool (Context7, subagents), adapt the prompt and declare the substitution instead of pretending to have used it.
