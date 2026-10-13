# Disposition Batch: `default` IDs 2150-2199

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions in
  `default` IDs 2150-2199.
- Evidence order: English for meaning; Japanese for voice/register and
  supporting interpretation; Chinese as a secondary cross-check; active
  Korean corpus terminology for consistency.
- This is a partial editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2152 | Pledgeshield Bolton | Unchanged; formal rank and Korean title unresolved. | D-336: uncertain |
| 2153 | Rag-pickers / the Wending | Unchanged; group status and canonical place spelling unresolved. | D-337: uncertain |
| 2160 | Blazing Salve Potions | Unchanged; source item-category conflict unresolved. | D-338: uncertain |
| 2161 | Prosperity going unnoticed | `내 번영이 남들 눈에 띄지 않을 거라고 생각할 만큼 순진하진 않았어.` | D-339: accepted |
| 2164 | Mad Dog getting his digs in | `그래야 미친개(Mad Dog)가 그 틈에 제대로 공격할 수 있으니까.` | D-340: accepted |
| 2168 | Dispelling | `마법 해제` | D-341: accepted |
| 2170 | QA Test Land | Unchanged; internal versus player-facing label unresolved. | D-342: uncertain |
| 2174 | Cowl / Temple of Lyria / Maire fragment | Unchanged; Korean preserves the unfinished relation. | D-343: not an issue |
| 2182 | Skald Atlas / Cinderpit / Crow Peak | Unchanged; canonical Korean name forms unresolved. | D-344: uncertain |
| 2185 | Mission on the hill | Unchanged; the institution/building referent is unresolved. | D-345: uncertain |
| 2186 | Apotyre belongs to its settlers | Unchanged; the Korean claim is supported by all three references. | D-346: not an issue |
| 2188 | The Flowering | Unchanged; named-event treatment and Korean term need corpus-wide reconciliation. | D-347: uncertain |
| 2193 | A game of Hexes | Unchanged; current Korean conveys the named game without a demonstrated row-level defect. | D-348: not an issue |

The seven uncertain decisions concern source/context or canonical-name
questions and authorize no CSV changes. The three `not an issue` decisions
also leave their rows untouched.

## Approved Korean Changes

| ID | Previous Korean | Applied Korean | Basis |
| ---: | --- | --- | --- |
| 2161 | `내 번영이 눈에 띄지 않을 거라 생각한 건 순진했어.` | `내 번영이 남들 눈에 띄지 않을 거라고 생각할 만큼 순진하진 않았어.` | The English says the speaker knew better than to expect their prosperity to go unnoticed; the previous Korean reversed that stance. |
| 2164 | `그래야 미친개(Mad Dog)가 한 방 먹일 수 있으니까.` | `그래야 미친개(Mad Dog)가 그 틈에 제대로 공격할 수 있으니까.` | The source idiom means landing attacks in the opening created by the distraction, not necessarily a single blow. |
| 2168 | `디스펠` | `마법 해제` | The English/Japanese/Chinese identify the Dispelling skill; the active Korean corpus already uses `마법 해제(Dispelling)` for it. |

Only these three approved `Texto` cells were edited.

## Structural Verification

- English, Japanese, Chinese, and Korean `default` CSVs each parse to 65,135
  rows with identical complete ID order.
- IDs 2150-2199 are present in all four locales. Embedded newline counts and
  localized marker identities/order match across the range.
- The three approved Korean values at IDs 2161, 2164, and 2168 match the
  decision register exactly.
- The active `affix`, `base`, and `default` CSVs retain their UTF-8 BOM and
  CRLF record endings; no bare LF bytes remain.
- This targeted structural check does not constitute independent linguistic
  approval of the full translation corpus.

## Checkpoint

- Decisions recorded: D-336-D-348.
- Cumulative dispositions: 112 accepted, 35 `not an issue`, and 201
  uncertain.
- Next range: `default` IDs 2200-2249, using
  [`default-ids-02200-02249-preliminary.md`](default-ids-02200-02249-preliminary.md).
