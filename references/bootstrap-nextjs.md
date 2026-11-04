# Bootstrap progetto nuovo (Next.js di riferimento)

Estratto operativo da `docs/04-project-bootstrap.md` del toolkit locale.
Repo: `<TOOLKIT>`

## 0. Prima di toccare qualsiasi cosa

- Individua: directory di destinazione, istruzioni esistenti (`AGENTS.md`, `CLAUDE.md`, `README`), client in uso, runtime, package manager, file gia' presenti, modifiche locali non committate.
- Se la destinazione e' il toolkit stesso, crea una directory sorella per il prodotto.
- Usa una sola revisione del toolkit per progetto.

## 1. PRODUCT.md

Da `templates/product.md.template`. Contenuto minimo: problema, pubblico, obiettivo, flussi, MVP, requisiti, vincoli, criteri di accettazione.
Le assunzioni reversibili si dichiarano; i dati esterni mancanti restano aperti, non si inventano.

## 2. Scaffold ufficiale

Verifica al momento: `create-next-app --help`, versioni stabili sul registry, peer dependencies.
Default: App Router, TypeScript strict, Tailwind, ESLint, `src/`, alias `@/*`.

```bash
npx --yes create-next-app@latest my-project --typescript --tailwind --eslint --app \
  --src-dir --import-alias '@/*' --use-pnpm --disable-git \
  --no-react-compiler --no-cache-components --no-agent-feedback --yes
```

- I flag negativi evitano preferenze salvate; verificane il supporto attuale.
- Destinazione non vuota: scaffold in directory temporanea, poi merge senza sovrascrivere.
- Non rigenerare un'applicazione esistente. Git solo se serve, senza remote e senza pubblicare.

## 3. Core del progetto

Drizzle + PostgreSQL e' il default per la persistenza nuova. Gli stack esistenti non si migrano.

```bash
npm install drizzle-orm pg server-only zod pino clsx tailwind-merge
npm install -D drizzle-kit @types/pg @next/env vitest eslint-plugin-drizzle @types/node@24
```

Adatta al package manager. `@types/node` segue il runtime reale; `@next/env` segue la versione di Next.
Niente `--force`/`--legacy-peer-deps`.

Poi copia `templates/next/` nell'app rimuovendo il suffisso `.example` **tranne** `.env.example`.
Il template include: `src/lib/env.ts` (validazione Zod), `src/lib/logger.ts` (Pino con redazione), `src/db/index.ts` (pool lazy), test Vitest che non richiedono credenziali.

Schema DB: parte vuoto, niente tabelle finte. `getDb()` valida l'URL e crea il pool lazy: la build iniziale non richiede database.
Prodotto senza persistenza: ometti moduli e dipendenze DB, usa il profilo lint leggero e documenta il motivo.

## 4. Skill del progetto

Solo quelle che servono, senza `--all`. Verifica il `name` nel frontmatter, non il nome della directory.
Su Windows o senza link portabili usa la modalita' copia. Registra `skills-lock.json`.
Installare una skill di deploy non pubblica nulla.

## 5. Documentazione e client

Dal manifest `templates/project-docs/manifest.json`: **4 file in root** + **5 in `docs/`**.
Riempi con fatti di prodotto e codice, rimuovi campi inutilizzati e placeholder.
`CLAUDE.md` importa `AGENTS.md` invece di duplicarne le regole.

Contratto di memoria portabile: memoria nativa o indice breve verso i documenti canonici, meccanismo di caricamento reale, fonte, ultima verifica, trigger di invalidazione.

## 6. Qualita'

- Preset Next.js/TypeScript + controlli async tipizzati.
- Limite di 350 righe per file: oltre, refactor per responsabilita' (`docs/prompts/09-file-size-refactor.md`).
- Comandi riproducibili nel README del progetto (install, dev, build, lint, test, typecheck).

## 7. Verifica e consegna

- Build verde, lint pulito, test eseguibili **senza credenziali**.
- Documentazione senza placeholder.
- Evidenza riportata (comandi + esito reale), non dichiarazioni.
- Elenco esplicito di cio' che resta aperto.
