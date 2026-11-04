# Progetto esistente: diagnosi, piano, lotti

Estratto da `docs/prompts/12-existing-project-setup.md` e `docs/04-project-bootstrap.md`.

## Regola base

Non si applica il bootstrap a un progetto esistente come se fosse nuovo. Si preserva cio' che funziona e si adotta solo cio' che porta un beneficio misurabile.

## Fase 1 — Diagnosi read-only

1. Stack reale: framework, versioni, runtime, package manager, database, test, lint.
2. Comandi che funzionano davvero (provati, non dedotti dal README).
3. Mappa dei moduli e degli entry point.
4. Punti fragili: file enormi, warning, dipendenze non usate, segreti nel codice, test assenti o rotti.
5. Modifiche locali non committate: vanno salvate prima di qualsiasi intervento.

Output: una scheda breve e verificabile. Nessuna modifica in questa fase.

## Fase 2 — PRODUCT.md ricostruito

Dal codice, non dalle intenzioni: cosa fa il prodotto oggi, per chi, quali flussi esistono, quali sono morti. I disallineamenti tra documentazione e codice sono un finding, non un dettaglio.

## Fase 3 — Piano per componente

Per ogni componente del catalogo una decisione esplicita:

| Decisione | Quando |
|---|---|
| Adotta | manca e il prodotto lo richiede |
| Equivalente presente | esiste gia' un modo di fare la stessa cosa |
| Scarta | non serve a questo prodotto, con motivo scritto |

Il piano deve stare in una pagina. Se serve piu' spazio, e' un progetto, non un piano.

## Fase 4 — Lotti piccoli

- Un lotto = una modifica verificabile con il suo comando di verifica.
- Nessun lotto misto (refactor + feature + config insieme).
- Dopo ogni lotto: stato reale, non 