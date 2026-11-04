# Groundwork

An agent skill for **setting up a machine, bootstrapping a new project, or repairing an existing one** — with explicit rules and verifiable steps instead of vibes.

It is a distilled operational layer over [vibe-coding-toolkit](https://github.com/soumatheusgomes/vibe-coding-toolkit) (MIT): the same discipline, reduced to what an agent needs in context, plus a map of which prompt or tool to use when.

Works with any host that reads `SKILL.md` with `name` / `description` frontmatter.

## What it gives you

- **Three paths** with checklists: machine setup, new project, existing project.
- **Nine non-negotiable rules** — product before foundation, no silent stack migrations, no secrets in plaintext, no `--force` to hide dependency conflicts, no push without an explicit request.
- **A default stack table** (Next.js / Drizzle / Zod / Pino / Vitest) with its limits, so deviations are argued instead of accidental.
- **All 16 toolkit prompts mapped** to "when to use it / what it produces".
- **23 external tools mapped** to what actually exists in a given agent host and what to substitute.

## What it is not

- Not a fork of the toolkit: templates and full prompts stay upstream.
- Not a project generator: it does not scaffold anything by itself.
- Not a replacement for code review or security audit skills.

## Install

Copy the directory into the client's skills path:

| Host | Path |
|---|---|
| Hermes | `<hermes-home>/skills/groundwork` |
| Claude Code | `~/.claude/skills/groundwork` |
| agentskills / Codebuff / Freebuff | `~/.agents/skills/groundwork` |
| Codex | `~/.codex/skills/groundwork` |
| OpenCode | `~/.config/opencode/skills/groundwork` |

```bash
git clone https://github.com/nemesis1978/groundwork.git
cp -r groundwork ~/.claude/skills/
```

With Hermes you can also install it straight from the registry:

```bash
hermes skills install nemesis1978/groundwork
```

Registry identifier: `nemesis1978/groundwork`.

For several hosts at once: edit `TARGETS` in `scripts/sync-skill.sh` and run it. Restart the agent session afterwards.

## Prerequisite

The skill references the upstream toolkit as `<TOOLKIT>`:

```bash
git clone https://github.com/soumatheusgomes/vibe-coding-toolkit.git
```

Without it the skill still works: the references carry the essential commands, while `.template` files are recreated from the project.

## Structure

```
SKILL.md                        triggers, rules, 3 paths, default stack
references/bootstrap-nextjs.md  7 steps with real commands
references/existing-project.md  diagnose → plan → batches → before/after
references/prompts.md           the 16 prompts, mapped
references/tools-map.md         23 tools → host equivalents
scripts/sync-skill.sh           copy to multiple agent hosts
```

## Language

`SKILL.md` and the references are written in **Italian**. The structure, commands and code are language-neutral; an English translation is a separate, mechanical pass. Open an issue if you need it.

## Attribution

Derived from [vibe-coding-toolkit](https://github.com/soumatheusgomes/vibe-coding-toolkit) by Matheus Gomes, MIT licensed. This repository contains no upstream code: it is a distillation with references, plus original rules and routing.

If you find this useful, star the upstream project — that is where the real work lives.

## License

MIT, see [LICENSE](LICENSE).
