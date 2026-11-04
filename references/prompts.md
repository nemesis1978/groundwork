# I 16 prompt del toolkit

Percorso locale: `<TOOLKIT>/docs/prompts/`
Ogni file e' autosufficiente: si incolla nel client e si adatta il contesto.

| # | File | Quando usarlo | Cosa produce |
|---|---|---|---|
| 01 | `01-project-sanitation.md` | repo disordinato, prima di lavorarci | misura e riordino del codice |
| 02 | `02-eslint-warning-burndown.md` | troppi warning accumulati | riduzione misurata dei warning, a lotti |
| 03 | `03-multi-agent-code-review.md` | serve una review specializzata | review multi-prospettiva con finding |
| 04 | `04-brainstorm-to-plan.md` | richiesta vaga da raffinare | piano vincolato prima del codice |
| 05 | `05-parallel-wave-dispatch.md` | task indipendenti in parallelo | ondate con ownership dei file |
| 06 | `06-memory-bootstrap.md` | contesto che si perde tra sessioni | contratto di memoria persistente |
| 07 | `07-eslint-complete-setup.md` | serve una config lint avanzata | configurazione completa e motivata |
| 08 | `08-eslint-quality-gates-install.md` | regole da copiare e misurare | quality gate installati con evidenza |
| 09 | `09-file-size-refactor.md` | file troppo grandi | refactor per responsabilita' |
| 10 | `10-development-environment-setup.md` | macchina da preparare | ambiente globale + manifest |
| 11 | `11-next-project-bootstrap.md` | **progetto nuovo** | prodotto + fondazione configurata |
| 12 | `12-existing-project-setup.md` | **progetto esistente** | setup completo con prima/dopo |
| 13 | `13-security-review.md` | review di sicurezza | report privato, basato su evidenza |
| 14 | `14-harness-evaluation.md` | verificare se le istruzioni funzionano | test usa-e-getta su istruzioni, recovery, review |
| 15 | `15-harness-improvement.md` | migliorare il flusso di lavoro | adattamento nativo del metodo harness |
| 16 | `16-security-audit.md` | audit approfondito **su richiesta** | 4 artefatti privati, lotti di remediation, checkpoint |

## Regole d'uso

- **11** per un progetto nuovo, **12** per uno esistente, **10** per la macchina. Gli altri sono task puntuali.
- **16 non si esegue mai automaticamente**: e' un task separato, solo su richiesta esplicita.
- Un prompt alla volta. Accodarli produce risultati non verificabili.
- Dopo ogni prompt: esito reale e file toccati, non un riassunto di intenti.

## Adattamento

I prompt assumono un agente con accesso a terminale, filesystem e rete. Se un client non ha un tool citato (Context7, subagenti), il prompt va adattato dichiarando la sostituzione, senza fingere di averlo usato.
