---
name: groundwork
version: 1.0.0
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

Setup della macchina e bootstrap/upgrade di un progetto, con regole esplicite e verificabili.
Distillata da [vibe-coding-toolkit](https://github.com/soumatheusgomes/vibe-coding-toolkit) (MIT) — opera derivata, non un fork.
I template e i 16 prompt completi vivono nel repo originale: questa skill li indicizza e ne fissa le regole operative.

### Prerequisito: il toolkit sorgente

```bash
git clone https://github.com/soumatheusgomes/vibe-coding-toolkit.git
```

Nei percorsi di questa skill `<TOOLKIT>` è quella directory. Se il toolkit non è disponibile la skill resta usabile: le reference contengono i comandi essenziali, mentre i file `.template` vanno ricreati dal progetto.

## When to Use

Quando usarla:

- Macchina nuova o toolchain da preparare.
- Progetto nuovo da zero (Next.js di default, ma adattabile).
- Progetto esistente da diagnosticare, configurare o riparare.
- Adozione parziale: serve solo un pezzo (ESLint, security review, harness).

Non usarla per task puntuali di codice: qui si imposta l'ambiente e il contratto di lavoro, non si implementa la feature.

## Regole non negoziabili

1. **Prodotto prima della fondazione.** `PRODUCT.md` (problema, pubblico, flussi, MVP, vincoli, criteri di accettazione) prima di scegliere lo stack. Assunzioni reversibili esplicite; ciò che manca resta pendente, non inventato.
2. **Proporzionale.** Non installare nulla solo perché compare nel catalogo. Ogni componente riceve una decisione esplicita: adottato, equivalente già presente, o scartato con motivo.
3. **Mai migrare stack esistenti come effetto collaterale.** Il bootstrap non autorizza cambi di framework, ORM, bundler o UI kit.
4. **Un solo revisione del toolkit per progetto.** Non mescolare file di revisioni diverse.
5. **Nessun segreto in chiaro.** `.env.local` ignorato, `.env.example` versionato e senza credenziali. Mai `NEXT_PUBLIC_*` per i segreti.
6. **Niente `--force` / `--legacy-peer-deps`** per nascondere conflitti di dipendenze: si risolvono o si documentano.
7. **Migrazioni solo su destinazione autorizzata**, mai durante build, import o richieste. Niente `db:push` nel flusso standard.
8. **Nessun push, deploy o pubblicazione** senza richiesta esplicita.
9. **Verificare prima di affermare.** Versioni stabili e canali (`latest` vs `@rc`/`@canary`) si controllano al momento, non si assumono.

## Percorso A — Setup macchina

1. Scegli dove girare (nativo / container / WSL) e annotalo.
2. Inventaria: git, node, package manager, editor, agent CLI già presenti. Non reinstallare ciò che esiste.
3. Installa solo i mancanti; per ogni installazione registra fonte, versione, data.
4. Configura i client (Codex, Claude, OpenCode, Hermes) nel formato che ciascuno supporta davvero.
5. Produci `environment-manifest.json` (template: `<TOOLKIT>/templates/environment-manifest.json.example`).
6. Verifica riproducendo: un secondo giro deve dare lo stesso risultato.

## Percorso B — Progetto nuovo

Sequenza completa con comandi: `references/bootstrap-nextjs.md`.
Sintesi dei 7 passi:

1. Ispeziona destinazione, istruzioni, client, runtime, package manager, modifiche locali.
2. Scrivi `PRODUCT.md` dal template (`<TOOLKIT>/templates/product.md.template`).
3. Genera lo scaffold ufficiale con `create-next-app` (versione stabile verificata), in directory temporanea se la destinazione non è vuota.
4. Installa il core (Drizzle+Postgres, Zod, Pino, Vitest) e copia `templates/next/` togliendo il suffisso `.example`.
5. Installa e instrada le skill pertinenti: solo quelle che servono, niente `--all`.
6. Genera la documentazione dal manifest (4 file in root + 5 in `docs/`), configura ESLint e i comandi.
7. Verifica: build, lint, test senza credenziali, e riporta l'evidenza.

## Percorso C — Progetto esistente

1. Diagnosi read-only: stack reale, comandi funzionanti, dove sono i punti fragili.
2. `PRODUCT.md` ricostruito dai fatti del codice, non dalle intenzioni.
3. Piano breve con decisioni per componente (adottare / equivalente / scartare).
4. Applica in lotti piccoli, ognuno verificabile, senza rompere ciò che funziona.
5. Confronto prima/dopo misurabile (lint, warning, dimensione file, tempi).
6. Handoff scritto se il lavoro resta aperto.

Dettaglio: `references/existing-project.md`.

## Stack di default

Decisione di riferimento, non dogma: ogni scostamento va motivato in `PRODUCT.md` e `docs/architecture.md`.

| Area | Default | Limite |
|---|---|---|
| App | Next.js stabile, App Router, TS strict, Tailwind, ESLint, `src/`, `@/*` | preserva app e package manager esistenti |
| Persistenza | Drizzle ORM + PostgreSQL (`pg`) | prodotto senza persistenza: si omette, motivando |
| Validazione | Zod su env, input e risposte esterne | i tipi TS non validano a runtime |
| Server | `server-only` su env, logger, db | segreti mai nel client |
| Logging | Pino strutturato con redazione dei segreti noti | la redazione non copre i segreti scritti nei messaggi |
| Test | Vitest su logica server, senza credenziali | DOM/E2E solo quando servono |
| Qualità | preset Next/TS, controllo async tipizzato, limite 350 righe | i guard Drizzle non sostituiscono la review |
| Agenti | `AGENTS.md` condiviso + bridge `CLAUDE.md` | preserva client, modello e autenticazione |

## Prompt catalog

16 prompt pronti in `docs/prompts/` del repo locale. Mappa "quando usare quale": `references/prompts.md`.

## Strumenti citati dal toolkit

Il toolkit cita strumenti esterni (Superpowers, Ponytail, Caveman, RTK, Context7, Graphify). Non assumere che esistano: mappa e sostituti in `references/tools-map.md`.

## Anti-pattern

- Scaffold dentro una directory già popolata senza merge controllato.
- Documentazione generata con placeholder non riempiti o campi inutilizzati.
- `CLAUDE.md` che duplica `AGENTS.md` invece di importarlo.
- Skill installate "per sicurezza" senza che il prodotto le usi.
- Test che passano solo perché richiedono un database reale non disponibile.
- Review di sicurezza con report pubblici o scanner obbligatori a pagamento.

## Distribuzione multi-agente

La stessa cartella funziona su ogni host che legge `SKILL.md` con frontmatter `name`/`description`.
Path verificati su questo PC:

| Host | Path |
|---|---|
| Hermes | `<hermes-home>/skills/groundwork` |
| Claude Code | `~/.claude/skills/groundwork` |
| agentskills / Codebuff / Freebuff | `~/.agents/skills/groundwork` |
| Codex | `~/.codex/skills/groundwork` |
| OpenCode | `~/.config/opencode/skills/groundwork` |

Copia la directory nel path del client in uso; per più client usa `bash scripts/sync-skill.sh`
dopo aver adattato la lista `TARGETS`. Riavvia la sessione dell'agente perché ricarichi.

Vincoli del formato: `name` minuscolo con trattini e **identico al nome della directory**, `description` breve (la usano per decidere se caricarla), niente path assoluti nelle reference se la skill deve restare portabile.

## Verifica finale

Prima di dichiarare finito: build verde, lint pulito, test eseguibili senza credenziali, documentazione senza placeholder, e un elenco onesto di ciò che resta aperto.
