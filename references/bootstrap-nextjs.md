# Bootstrapping a new project (Next.js reference)

Operational extract of `docs/04-project-bootstrap.md` from the local toolkit.
Toolkit root: `<TOOLKIT>`

## 0. Before touching anything

- Identify: destination directory, existing instructions (`AGENTS.md`, `CLAUDE.md`, `README`), client in use, runtime, package manager, files already present, uncommitted local changes.
- If the destination is the toolkit itself, create a sibling directory for the product.
- Use a single toolkit revision per project.

## 1. PRODUCT.md

From `templates/product.md.template`. Minimum content: problem, audience, objective, flows, MVP, requirements, constraints, acceptance criteria.
Reversible assumptions are stated; missing external facts stay open instead of being invented.

## 2. Official scaffold

Check at execution time: `create-next-app --help`, stable versions on the registry, peer dependencies.
Defaults: App Router, strict TypeScript, Tailwind, ESLint, `src/`, `@/*` alias.

```bash
npx --yes create-next-app@latest my-project --typescript --tailwind --eslint --app \
  --src-dir --import-alias '@/*' --use-pnpm --disable-git \
  --no-react-compiler --no-cache-components --no-agent-feedback --yes
```

- Negative flags avoid saved preferences; verify their current support.
- Non-empty destination: scaffold in a temporary directory, then merge without overwriting.
- Never regenerate an existing application. Initialize Git only if needed, with no remote and no publishing.

## 3. Project core

Drizzle + PostgreSQL is the default for new persistence. Existing stacks are not migrated.

```bash
npm install drizzle-orm pg server-only zod pino clsx tailwind-merge
npm install -D drizzle-kit @types/pg @next/env vitest eslint-plugin-drizzle @types/node@24
```

Adapt to the package manager. `@types/node` follows the real runtime; `@next/env` follows the Next.js version.
No `--force` / `--legacy-peer-deps`.

Then copy `templates/next/` into the app, stripping the `.example` suffix **except** for `.env.example`.
The template includes: `src/lib/env.ts` (Zod validation), `src/lib/logger.ts` (Pino with redaction), `src/db/index.ts` (lazy pool), and Vitest tests that need no credentials.

Database schema starts empty, with no fictional tables. `getDb()` validates the URL and creates the pool lazily: the initial build needs no database.
Product without persistence: omit the database modules and dependencies, use the lightweight lint profile, and document the reason.

## 4. Project skills

Only the ones the project needs, never `--all`. Check the frontmatter `name`, not the directory name.
On Windows or without portable links, use copy mode. Record `skills-lock.json`.
Installing a deployment skill publishes nothing.

## 5. Documentation and clients

From `templates/project-docs/manifest.json`: **4 files in root** + **5 in `docs/`**.
Fill them with product and code facts; remove unused fields and placeholders.
`CLAUDE.md` imports `AGENTS.md` instead of duplicating its rules.

Portable memory contract: native memory or a short index into canonical documents, the actual loading mechanism, the source, the last verification, and the invalidation triggers.

## 6. Quality

- Next.js/TypeScript presets plus typed async checks.
- 350-line file limit: beyond that, refactor by responsibility (`docs/prompts/09-file-size-refactor.md`).
- Reproducible commands in the project README (install, dev, build, lint, test, typecheck).

## 7. Verification and handover

- Green build, clean lint, tests runnable **without credentials**.
- Documentation with no placeholders.
- Evidence reported (commands + real output), not assertions.
- An explicit list of what remains open.
