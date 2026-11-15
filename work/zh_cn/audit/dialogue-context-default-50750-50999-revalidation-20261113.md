# Sequential `default` Revalidation: IDs `50750`-`50999`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 60 existing four-language fingerprints; all match. Added the
  other 190 IDs to the review ledger without changing existing rows.
- Recorded 14 current correction-candidate IDs and four evidence-limited
  holds. These groups do not overlap; 232 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger entries remain unchanged as historical records.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `50751` | Speech level / naturalness | Korean uses marked `-게`/`-오게` 하게체, while Japanese uses a respectful address followed by a comparatively direct request. Consider a natural conversational imperative that preserves the respectful address to the Hero; do not infer an individual speaker from the linked asset. | Medium |
| `50765` | Meaning / naturalness | The poem's image in `Perdition like the terrestrial cane, / A crutch that saps the dew of youth` is difficult to follow in Korean, and the modifier placement obscures which image drains youth. Rework the Korean imagery against English and Japanese while preserving the poem and all 12 embedded line breaks. | Medium |
| `50816` | Naturalness / register | The polite response `네` and ending `-이에요` frame the sentence politely, but `내 생각엔` shifts to a casual first-person form. Consider `제 생각엔` or another internally consistent phrasing without changing the causal claim. | Medium-high |
| `50835` | Naturalness | `비용을 아끼지 않고, 영주들은...` leaves the introductory phrase awkwardly detached. Recast so the lords are clearly the subject who spare no expense on their mercenaries' distinctive armor. | High |
| `50836` | Terminology | `Flawless` is rendered `완벽한`; the accepted equipment-quality form is `흠 없는`. Align the prefix while retaining `미타란(Mitharan)`, `증폭`, and `리벳`. | High |
| `50844` | Meaning / syntax | English says Sigra distributed the erroneous invoices from her husband's potion shop. Korean instead makes the shop the issuer (`가게가 잘못 발행한`). Recast the sentence to identify Sigra as the distributor without changing the count, destinations, or quest-log perspective. | High |
| `50853` | Terminology | `Flawless` is rendered `완벽한`; use the accepted equipment-quality form `흠 없는`, retaining the Mitharan and enchanted-rivet components. | High |
| `50876` | Speech level / naturalness | The same sentence shifts from 하게체 (`공부하게`) to 해체 (`아니야`); Japanese is conversational in both clauses. Consider a consistent conversational form such as `열심히 공부해. 비전술은 장난이 아니야.` | High |
| `50889` | Format | `Stonecandle Mining Log` is a named log title but has no English pairing. Add the complete title, e.g. `스톤캔들 광산 기록(Stonecandle Mining Log)`. | High |
| `50891` | Terminology | `Flawless` is rendered `완벽한`; use the accepted equipment-quality form `흠 없는`, retaining the Mitharan, ravenous, and hilt components. | High |
| `50963` | Meaning / naturalness | The second question `코노바르는 죽었고?` reads as an unfinished continuation, although English and Chinese ask whether Connovar is dead. Consider `코노바르(Connovar)는 죽었어?`; Japanese is less explicit and asks about his fate. | High |
| `50967` | Speech level / naturalness | The first sentence uses 해체 (`지켰어`) but the taunt ends in 하게체 (`생각하나?`). Use one register throughout; the surrounding wording supports a conversational challenge such as `네게 대체 무슨 승산이 있다고 생각해?`. | High |
| `50974` | Objective format | The quest objective uses the direct command `찾아라`, while the established objective form is concise `-기`. Consider `성스러운 통로 찾기`. | High |
| `50984` | Terminology / naturalness | `elite shock-troops` is translated literally as `정예 충격 부대`; Japanese gives `精鋭突撃部隊`. Consider `정예 돌격 부대` while preserving the Legion's role and the gauntlets' history. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `50834` | Meaning / oath nuance | Retain the existing hold: English `In Giran's name` may be an oath or an invocation of Giran's cause, while Japanese reads more like “for Giran.” The prior faction-name pairing is already present; do not revise the oath without stronger context. |
| `50923` | UI meaning | The isolated label `Aggressive` is rendered `공격적`; Japanese `敵意` and Chinese `侵袭` suggest related but not identical hostile/aggressive senses. The row and available asset catalog do not establish whether this is a mode, state, or ordinary adjective. Keep the label unresolved rather than changing it to a different UI term. |
| `50980` | Title / role | `Adept` may be a rank within the Scholia Arcana. Japanese uses a mage term, Chinese an attendant-like term, and the linked asset does not resolve the office. Keep `숙련자` provisional; do not standardize the title from this row alone. |
| `50997` | Source conflict / location | English says `Outlaw Pit`, Japanese identifies Emaire Prison, and Chinese gives an outlaw stronghold. The Korean `무법자 투기장` follows the English-style reading, but the location conflict remains unresolved. |

## Rechecked Findings and Structure

- All 60 pre-existing ledger fingerprints in this range match the current
  English, Japanese, Chinese, and Korean rows. Existing entries were not
  overwritten.
- The earlier candidate at `50951` is cleared for the current Korean
  `재료를 가져올게`: English `reagents`, Japanese `素材`, and the quest's
  ingredient context support this broader wording. Its historical ledger row
  remains unchanged.
- The established `Sky Blossom` form supports retaining
  `하늘꽃(Sky Blossom)` at `50873`, although this English key is spelled
  `Skyblossom`.
- Fifty-nine exact-English duplicate groups touch the range, covering 59
  target rows. Korean matches within every group, including the `50765` /
  `58929` poem pair.
- Seven entries contain embedded line breaks: `50761` (one), `50765` (12),
  `50837` (two), `50880` (four), `50915` (four), `50993` (two), and `50999`
  (one). All four languages have 26 embedded breaks in total. Runtime and
  display-token identities and order match across the range.
- Of 250 IDs, 194 have indexed asset associations, represented by 196
  ID-asset links across 120 assets; 56 have no indexed asset. Of the 190 new
  ledger IDs, 134 have indexed associations and 56 do not. Asset links do
  not establish per-key speakers or playback order.

## Range Result

- This range has 14 current correction-candidate IDs and four
  evidence-limited holds; 232 IDs have no current finding.
- After appending 190 IDs, the ledger covers 54,705 of 65,135 unique
  `default` IDs (83.99%), leaving 10,430. Sequential coverage reaches
  `50999`; next is `51000`-`51249`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
