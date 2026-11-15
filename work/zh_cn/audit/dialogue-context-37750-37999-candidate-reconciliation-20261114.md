# Candidate Reconciliation: IDs `37750`-`37999`

- Date: 2026-11-14.
- Rechecked all 19 candidate IDs against English, Japanese, Chinese, active
  Korean, and existing terminology decisions.
- English anchored meaning; Japanese guided voice and register; Chinese was
  supporting evidence. No speaker or playback order was inferred from asset
  membership.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `37751` | Retained | The active text already uses `최대 체력` for temporary total-health increase. |
| `37757` | Retained | `Verdant Blades` is already paired; the return-to-Drewn objective is intact. |
| `37772` | Retained | The first arriving group of Gask's soldiers and the severed communication are both present. |
| `37786` | Corrected | Paired the self-identified name as `앰비스(Ambyth)` and replaced marked 하오체 with conversational plain speech. Other active rows confirm the spelling. |
| `37810` | Corrected | Paired the exact source form `House of Gastyr`, preserving the distinct `House Gastyr` label used elsewhere. |
| `37829` | Retained | The friendly nickname is already paired as `파이어볼(Fireball)`. |
| `37830` | Corrected | Changed `너희 민족의 태동기에` to `너희 민족의 기억이 시작되던 무렵`, avoiding the unsupported implication that the people themselves were just beginning. |
| `37835` | Retained | `암살의 대가` accurately avoids turning `master assassin` into an unsupported claim that Gedrick is the best assassin. |
| `37862` | Retained | `주군` matches Japanese `我が主`; no royal rank is inferred. |
| `37865` | Corrected | Added the exact place-name pairing and rendered the quest objective in the established `-하기` form. |
| `37889` | Retained | The active row already uses the established `서약방패병(Pledgeshield)` rank. The earlier report's alleged shift to `환영하네`/`영광일세` is absent from the active text, which consistently uses `-한다`/`-이다`; no further register change was justified. |
| `37901` | Corrected | Paired `Prester's Path` without deciding whether it names an institution or place. |
| `37909` | Corrected | Retained the clear location term `검자루 끝` and smoothed the cracking/shattering sequence. |
| `37926` | Corrected | Paired the named card as `진실(The Truth) 카드`, without duplicating the English title elsewhere. |
| `37936` | Retained | The current `처형인(Headsman)` terminology is already complete. |
| `37938` | Corrected | Replaced the isolated imperative with the concise objective `울릭(Urlik) 처치하기`. |
| `37978` | Retained | The active sentence already expresses that the Champion funds the gambling den naturally. |
| `37980` | Corrected | Recast the relationship-status message naturally and preserved `{1}` and `{2}` exactly once. |
| `37986` | Corrected | Kept the first `Deadeye(Deadeye)` pairing and removed the redundant English parenthetical at the second mention. |

## Linked Duplicate And Holds

- ID `6347` has exactly the same English, Japanese, and Chinese source as
  `37830`. Its Korean text was updated in the same edit so both rows remain
  identical, including all four embedded line breaks. `6347` is a linked
  consistency row, not an additional candidate counted in this batch.
- Existing evidence-limited holds `37858`, `37882`, `37892`, and `37943` remain
  unresolved; no missing context or referent was guessed.

## Verification

- Reconciled 19 candidate IDs: 10 were edited and nine were already supported.
  No IDs in this batch had been counted in earlier application manifests.
  Cumulative reconciliation is 2,394 / 4,015 (59.63%), with 1,621 remaining.
- Changed Korean `Texto` at 10 in-range IDs plus linked ID `6347`; refreshed
  only those 11 `source_fingerprint` fields.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,838 CRLF
  sequences, 244 LF-only separators, and no bare CR. Rows `6347` and `37830`
  are identical across all four languages and retain four embedded breaks.
- Both runtime placeholders at `37980` are present once. The 11 CSV
  preservation tests, nine dialogue-context tests, all-ID ledger fingerprint
  validation, index/catalog reproduction, and CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
