# Candidate Reconciliation: IDs `24000`-`24249`

- Date: 2026-11-14.
- Rechecked all 18 current correction candidates against the active Korean
  and same-ID English, Japanese, and Chinese rows.
- Sixteen candidates are newly counted; `24050` and `24206` were already
  counted. All 18 now match the supported correction or retention.
- The evidence-limited address at `24024` remains unresolved.

## Candidate Decisions

| ID(s) | Decision and evidence |
| --- | --- |
| `24037`, `24041`, `24050`, `24055`, `24092`, `24109`, `24114`, `24125`, `24138`, `24155`, `24172`, `24206`, `24214`, `24237`, `24240`, `24246` | Confirmed that the active Korean contains the source-supported correction recorded in `dialogue-context-edit-batch-20261114-24000-24249.md`. English meaning, Japanese voice/register, and Chinese supporting evidence were checked. |
| `24136` | Retained the exact paired form `하늘꽃(Skyblossom)`; the English source is the single word `Skyblossom`, and Japanese and Chinese support the name. |
| `24154` | Retained `원소 망토(Elemental Cloak)` in the description; the complete set name and the stated armor context are preserved. |

## Linked Exact-Source Correction

The 24000-range edit report said 18 `Maire, Queen of Cups` labels had been
standardized and that `21023` already matched. A separate 21000-range report
also said `21023` had been changed to the complete combined form. Direct
inspection of the active CSV showed all 19 exact-source rows still used
`컵의 여왕(Queen of Cups) 메어(Maire)`. English, Japanese, and Chinese use
the same title/name in all 19 rows. Each row was therefore corrected
individually to `컵의 여왕 메어(Maire, Queen of Cups)`:

`1590`, `1791`, `3885`, `4027`, `5429`, `7079`, `8190`, `10729`, `13041`,
`15037`, `21023`, `22673`, `24172`, `25684`, `25823`, `27984`, `28151`,
`30613`, and `32542`.

The existing audit reports were left intact as historical records. Only these
19 rows' four-language `source_fingerprint` values were refreshed.

## Evidence-Limited Hold

- `24024`: English `dove` may be an affectionate address or a character
  epithet. Japanese omits it, Chinese uses `和平使者`, and the surrounding
  exchange does not settle the choice. No more specific Korean address was
  inferred.

## Verification

- All 18 in-range correction candidates have a current disposition; the two
  previously counted candidates were not counted twice.
- The 19 linked label rows now match their shared English source and
  Japanese/Chinese references.
- The review ledger validates all 65,135 IDs against the four language
  tables. Only the 19 linked `source_fingerprint` fields were refreshed.
- The CSV edit used `tools/replace_text_preserve_eol.py` by exact ID. Its 11
  regression tests passed; ledger validation and line-ending-aware
  `git diff --check` passed.
- Cumulative candidate reconciliation is 1,363 / 4,015 (33.95%), with
  2,652 not yet reconciled.
- No source CSV or extracted asset was changed; no commit was made.
