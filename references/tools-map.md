# Tools cited by the toolkit: what exists, what to substitute

The toolkit references an external ecosystem. Do not assume it is installed: verify, then map.

| Tool | Purpose | In Hermes | If missing |
|---|---|---|---|
| **Superpowers** (`docs/tools/01`) | design, plan, execution, verification | not bundled | use the `plan` + `egix-engineering` skills |
| **Subagent orchestration** (`02`) | parallel waves with file ownership | `delegate_task` | avoid parallelism, work sequentially |
| **RTK** (`03`) | shell output / token compression | `rtk-hermes` plugin | no substitute: reduce noisy commands |
| **Ponytail** (`04`) | the smallest complete change | a style rule, not software | apply it as a principle |
| **Caveman** (`05`) | concise conversation | a style rule | apply it as a principle |
| **ESLint/Biome gate** (`06`) | quality thresholds in CI | project scripts | configure per project, not globally |
| **Graphify** (`07`) | code graph | not bundled | `search_files` + targeted reading |
| **Obsidian memory** (`08`) | vault-backed memory | `obsidian` skill | use the existing vault |
| **Claude memory** (`09`) | memory contract | `memory` + `AGENTS.md` | document the real mechanism |
| **Hooks** (`10`) | event automation | Hermes plugin hooks | do not simulate hooks that do not exist |
| **agent-browser** (`11`) | visual verification in a browser | `browser_exec` | state clearly when no browser is available |
| **Context7** (`12`) | up-to-date library docs | context7 MCP | use official sources on the web |
| **Anthropic skills** (`13`) | portable skills | `hermes skills install` | standard `SKILL.md` format |
| **Chrome DevTools MCP** (`14`) | browser debugging | `browser_cdp` | state the limitation |
| **Codex workflow** (`15`) | Codex flow | `~/.codex/skills` | the same skill, copied |
| **Vercel skills** (`16`) | Next/Vercel skill catalog | `hermes skills search` | install only the ones used |
| **Next.js perf** (`17`) | runtime/perf guidance | dedicated skill | adapt, do not force versions |
| **PostgreSQL skills** (`18`) | Postgres best practices | dedicated skill | applies together with the Drizzle core |
| **gh-fix-ci** (`19`) | repair GitHub CI | `gh` CLI + GitHub MCP | requires an authorized PR/run |
| **differential-review** (`20`) | review a diff | `code-reviewer` | private report |
| **shadcn** (`21`) | UI kit | only if adopted | never impose a UI kit |
| **Sentry MCP** (`22`) | error tracking | only if the service exists | explicit OAuth |
| **Harness2** (`23`) | harness evaluation | native method + `14`/`15` | official CLI only in a separate lab |

## Rule

A missing tool blocks **only** its own capability, not the whole setup. Every row gets a recorded decision: adopted, equivalent, rejected.

## Security note

Tools that manage credentials, wallets, or per-call payments are never installed as a side effect of a bootstrap. They remain separate, revocable decisions.
