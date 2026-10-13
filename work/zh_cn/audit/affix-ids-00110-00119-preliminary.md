# Preliminary Language Scan: `affix` IDs 110-119

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 110-119 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 112 | `Examine the grave of` | 무덤 조사하기: | Recompose the Korean fragment with the following name, such as `[name]의 무덤 조사하기`, after checking the actual UI assembly order. | English and all available sibling locales retain the possessive relation to the following name. Korean instead puts the action first and leaves `of` unexpressed, which may produce an unnatural or structurally misleading prompt when concatenated. Check the full assembled string before proposing a final form. | Medium |
| 115 | `of the Reckoned` | 심판받은 자의 | Confirm the in-world sense of `Reckoned` and reconcile it with the official `Reckoning` terminology. | German, Spanish, and French lean toward recompense/condemnation; Italian and Russian differ, while Chinese uses a punishment-related term. Korean “one judged” is plausible but may not match the game's title/term. Needs composed item and lore context. | Low |
| 116 | `of Phasing` | 위상 변화의 | Confirm that the suffix refers to shifting/phasing rather than synchronization or another game effect. | Spanish, French, Russian, and Chinese broadly indicate phase/shift; German differs substantially and Italian suggests transmigration. The current Korean is plausible but remains context-dependent. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 110-119 were examined.
- The active Korean text is identical across variants for each ID; preserve all
  six keys even where the translated string repeats.
- English has one `FF` row per ID, so its meaning was matched by ID. Exact
  variant references were checked in all available locales.
- IDs 110 (`Ravager's`), 111 (`of Clarity`), 113 (`of Plenty`), 114 (`of
  Preservation`), 117 (`Fortune's`), 118 (`Sentinel`), and 119 (`of
  Shattering`) had no additional high-confidence concern in this pass.

## Batch Status

All 60 target variant rows for IDs 110-119 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
