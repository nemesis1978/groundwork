# Strumenti citati dal toolkit: cosa esiste, cosa sostituire

Il toolkit cita un ecosistema esterno. Non dare per scontato che sia installato: verifica, poi mappa.

| Strumento | A cosa serve | In Hermes | Se manca |
|---|---|---|---|
| **Superpowers** (`docs/tools/01`) | design, piano, esecuzione, verifica | non incluso | usa la skill `plan` + `egix-engineering` |
| **Subagent orchestration** (`02`) | ondate parallele con ownership dei file | `delegate_task` | evita il parallelo, procedi sequenziale |
| **RTK** (`03`) | compressione output shell / token | plugin `rtk-hermes` | nessun sostituto: riduci i comandi rumorosi |
| **Ponytail** (`04`) | la modifica piu' piccola e completa | regola di stile, non software | applicala come principio |
| **Caveman** (`05`) | conversazione concisa | regola di stile | applicala come principio |
| **ESLint/Biome gate** (`06`) | soglie di qualita' in CI | script del progetto | configura nel progetto, non globale |
| **Graphify** (`07`) | grafo del codice | non incluso | `search_files` + lettura mirata |
| **Obsidian memory** (`08`) | memoria su vault | skill `obsidian` | usa il vault esistente |
| **Claude memory** (`09`) | contratto di memoria | `memory` + `AGENTS.md` | documenta il meccanismo reale |
| **Hooks** (`10`) | automazioni su eventi | plugin Hermes (hook) | non simulare hook inesistenti |
| **agent-browser** (`11`) | verifica visiva nel browser | `browser_exec` | dichiara se non hai browser |
| **Context7** (`12`) | doc aggiornate delle librerie | MCP context7 | usa le fonti ufficiali via web |
| **Anthropic skills** (`13`) | skill portabili | `hermes skills install` | formato SKILL.md standard |
| **Chrome DevTools MCP** (`14`) | debug del browser | `browser_cdp` | esplicita il limite |
| **Codex workflow** (`15`) | flusso Codex | `~/.codex/skills` | stessa skill copiata |
| **Vercel skills** (`16`) | catalogo skill Next/Vercel | `hermes skills search` | installa solo le usate |
| **Next.js perf** (`17`) | istruzioni runtime/perf | skill dedicata | adatta, non forzare versioni |
| **PostgreSQL skills** (`18`) | best practice Postgres | skill dedicata | vale col core Drizzle |
| **gh-fix-ci** (`19`) | riparare CI GitHub | `gh` CLI + MCP github | richiede PR/run autorizzata |
| **differential-review** (`20`) | review di un diff | `code-reviewer` | report privato |
| **shadcn** (`21`) | UI kit | solo se adottato | non imporre UI kit |
| **Sentry MCP** (`22`) | error tracking | solo se il servizio esiste | OAuth esplicito |
| **Harness2** (`23`) | valutazione del harness | metodo nativo + `14`/`15` | CLI ufficiale solo in lab separato |

## Regola

Un tool mancante blocca **solo** la sua capacita', non l'intero setup. Ogni riga riceve una decisione registrata: adottato, equivalente, scartato.

## Nota di sicurezza

Gli strumenti che gestiscono credenziali, wallet o pagamenti per chiamata non si installano come effetto collaterale di un bootstrap. Restano decisioni separate e revocabili.
