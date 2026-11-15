# Dialogue Context Translation Edit Batch: IDs `6000`-`6999`

- Date: 2026-11-13.
- Scope: recheck all 45 correction candidates in the four sequential
  revalidation reports against the current English, Japanese, Chinese, and
  Korean rows, then apply source-supported changes and related exact-duplicate
  or terminology fixes.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from asset links.

## Candidate Decisions

| ID | Decision |
| ---: | --- |
| `6044` | Added the full `Queen of Staves` pairing and applied it to all 26 exact-English copies. |
| `6117` | Replaced the unexplained `덴` with the gambling venue `도박장(The Den)`; aligned related mentions. |
| `6144` | Recast the English-shaped “someone who can't find” phrase as a natural, restrained offer. |
| `6243` | Rewrote the full parallel structure to retain the source's contrast of fear, war, glory, and valor. |
| `6245` | Changed the label to `넝마주이(Rag Pickers)`. |
| `6286` | Identified the capitalized `Den` as the gambling venue and paired its name. |
| `6312` | Added `Day of the Pale Swans` to the named historical event. |
| `6327` | Joined the dangling comparison to the advice about pursuing one's dreams. |
| `6372` | Replaced generic `지하 통로` with the established structure name `패스팅(Fastings)`. |
| `6398` | Recast the awkward locative construction as natural casual speech. |
| `6512` | Restored “you found me here” and the source's rhetorical aside about bad luck. |
| `6517` | Broadened `혈연 관계` to the source-supported `관련`; completed both Court name pairings. |
| `6556` | Changed `돌려줘야` to `전달해야`, avoiding an unsupported prior-ownership implication. |
| `6591` | Replaced weapon-specific `휘두른` with the source-appropriate `사용한`. |
| `6594` | Added the source spelling `Vangard` to the unit label. |
| `6613` | Made the greeting consistently friendly and polite. |
| `6638` | Changed the title to `사고 지연의 저주(Curse of Slow Thought)`. |
| `6644` | Retained: all 20 exact-English copies already use the complete `King of Cups` and `Irion` pairings. |
| `6650` | Replaced generic `지하 통로` with `패스팅(Fastings)`. |
| `6657` | Recast the awkward veteran phrase and clarified the boast about being drunk by noon. |
| `6658` | Changed `노움 작위` to the broader, source-supported `노움 칭호`. |
| `6662` | Removed the unsupported military sense of `진격하자`; now says `가자`. |
| `6691` | Retained: the current label already reads `레소토(Lesotho)`. |
| `6703` | Added `East Timor` to the standalone label. |
| `6724` | Replaced archaic `-소` with contemporary polite `-어요`; no speaker was inferred. |
| `6734` | Kept the English pairing at first mention and removed its two redundant repeats within the same journal entry. |
| `6758` | Removed the repeated `Mel Aglir` pairing within the entry. Kept the established rank terms `사반트` and `숙련자`. |
| `6763` | Retained: all 17 exact standalone copies already consistently read `마법의 궁정(Court of Enchantments)`, including the cited comparison at `18263`. |
| `6766` | Added `The Desert Runner` to Lyana's epithet at its first mention; preserved both paragraph breaks. |
| `6780` | Paired the standalone title as `불의 왕(Fire King)`. |
| `6783` | Replaced age-specific `여동생` with age-neutral `자매`. |
| `6805` | Rendered `appointment` as the meeting, not a promise or task, and restored the closing “Shall we?” |
| `6817` | Clarified Walen's designated role in the duel as `보조역`. |
| `6829` | Retained `각반`: active `base` labels `Chausses` as `각반` (`466`, `1311`), distinct from the user's `Leggings` → `레깅스` decision. |
| `6834` | Changed the opening from sincere `사랑하는` to the wry `우리 앨더`. |
| `6855` | Recast the literal “Where is the future for me here?” as natural conversational Korean. |
| `6870` | Retained: the current entry already reads `제1차 대화재(First Burning)`. |
| `6893` | Recast the unnatural gossip idiom while preserving the conversational register and pause-free source structure. |
| `6907` | Added the missing `House of Ballads` pairing. |
| `6909` | Added `God Under the Mountain` to both exact-English title copies. |
| `6933` | Aligned all 10 exact standalone `Mayor Eswin` labels to `에스윈 시장(Mayor Eswin)`, matching the full form already used at `5991`. |
| `6938` | Retained: `발라드의 집(House of Ballads)` is already complete. |
| `6941` | Replaced the clothing-like `걸쳤던` with the source-supported `빌렸던` for inhabiting a body. |
| `6976` | Made the playful hesitation and self-correction conversational. |
| `6983` | Separated and paired the creature class and name: `상급 니스카루(Greater Niskaru) 발로르(Balor)`. |

All 11 evidence-limited holds from the range reports remain unchanged:
`6032`, `6056`, `6122`, `6123`, `6420`, `6530`, `6562`, `6710`, `6779`,
`6781`, and `6797`.

## Related Occurrences

- The exact English `Argine, Queen of Staves` occurs at 26 IDs; all now share
  `지팡이 여왕(Queen of Staves) 아르진(Argine)`.
- The named gambling venue `The Den` was aligned at `5902`, `6117`, `6286`,
  and `9459`. Generic uses of lowercase `den` were not changed.
- The full `Mayor Eswin` display label is now consistent in its 10 exact
  copies. Other sentence-level references were left in their existing
  grammatical form.
- Both exact English `God Under the Mountain` copies now use the same paired
  title. The already-paired `House of Ballads` entry at `6938` was retained.

The ID-scoped application manifest is
[`dialogue-context-edit-batch-20261113-6000-6999.json`](dialogue-context-edit-batch-20261113-6000-6999.json).

## Verification

- Rechecked the 45 candidates against current four-language rows before
  editing. Thirty-nine candidate decisions were applied; six were retained
  because the row was already correct, a full-corpus form was already
  consistent, or the source evidence supported the existing translation.
- Applied 76 unique row edits sequentially with
  `tools/replace_text_preserve_eol.py`; the manifest's pre-edit SHA-256 was
  verified before the first write. Only the target `Texto` fields changed.
- Refreshed the review-ledger source fingerprints for exactly those 76 IDs.
  The full 65,135-ID ledger check passed.
- Exact-English consistency checks passed for the 26 `Queen of Staves`
  labels, 10 `Mayor Eswin` labels, and two `God Under the Mountain` labels.
- The CSV retains its UTF-8 BOM, all 65,135 rows, and the pre-edit newline
  inventory: 71,845 CRLF and 244 LF-only endings. Existing poem and journal
  line breaks were preserved.
- Index and both catalogs passed reproducibility checks; all 20 CSV and
  context-index regression tests passed; CRLF-aware `git diff --check` passed.
- No source CSV, extracted asset, or game binary was modified.

Candidate adjudication now reaches 204 IDs (about 6.5% of the approximately
3,155-candidate inventory). This is not a claim that remaining candidates
have been resolved. The next sequential range is `7000`-`7999`.
