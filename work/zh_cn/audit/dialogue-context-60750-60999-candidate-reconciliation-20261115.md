# Candidate Reconciliation: IDs `60750`-`60999`

- Date: 2026-11-15.
- Rechecked seven new candidates and five earlier candidates against active
  Korean and English, Japanese, and Chinese source rows.
- Five new candidates and three earlier candidates were corrected. Two new
  candidates and two earlier candidates already had supported wording.
- Preserved all existing ledger dispositions and refreshed fingerprints only
  for the eight changed Korean rows.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60807` | Already supported | `마법에 차츰 능숙해지고 있어` conveys the Kollossae beginning to master magic, in line with English and Japanese. |
| `60860` | Corrected | Paired `Niskaru` once in the short two-sentence passage instead of repeating its English parenthetical. |
| `60887` | Corrected | Changed the objective to the established action form `코라 배닉(Cora Banick)과 대화하기`. |
| `60899` | Already supported | `불의 스프라이트 챔피언(Fire Sprite Champion) 처치하기` already expresses the full objective naturally. |
| `60915` | Corrected | Added the missing full pairing `여름 궁정(Summer Court)` alongside `여름 페이(Summer Fae)`. |
| `60934` | Corrected | Paired the full named creature title as `니스카루(Niskaru) 군주(Niskaru Lord)`, matching the established form at `55488`. |
| `60959` | Corrected | Replaced marked `-오/-소` speech with conversational plain endings, matching the English and Japanese register. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60809` | Corrected | Replaced generic `그 망치(Hammer)` with the named item `신비한 망치(Mystic Hammer)`. |
| `60844` | Retained | `미술관` is supported by Japanese `美術館` and the established Gravehal construction context. |
| `60980` | Retained | This occurrence already uses the proposed scoped alchemy term `조제법`; no broader glossary change was inferred. |
| `60982` | Corrected | Made the Hero the agent who bloodied Balor: `발로르(Balor)를 피투성이로 만들고 막 돌아온`. |
| `60998` | Corrected | Changed `노예를 부리는 일` to `노예 매매`, matching the slave-trading sense supported by Japanese and Chinese. |

## Holds and Report-Only Check

- Existing holds `60868` and `60945` remain unresolved; the available asset
  evidence does not map either key to an individual speaker.
- New evidence-limited holds `60941` and `60993` retain their source-matching
  paragraph layout and embedded CRLF separators. `60965` remains unresolved
  because the relation expressed by `the key to the Sorrows` is ambiguous.
- Report-only ID `60999` already contains the supported `도둑질할 때` wording;
  it was not changed.
- No speaker attribution or dialogue order was inferred from asset links.

## Applied Changes

Updated eight IDs with `tools/replace_text_preserve_eol.py`:
`60809`, `60860`, `60887`, `60915`, `60934`, `60959`, `60982`, and `60998`.
Only these IDs' `source_fingerprint` fields were refreshed. No other ledger
field or disposition changed.

## Result and Verification

- Seven new candidates were reconciled: five corrected and two already
  supported. Five earlier candidates were rechecked separately.
- Cumulative reconciliation is `3,399 / 4,026` (`84.43%`), with `627`
  remaining.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
