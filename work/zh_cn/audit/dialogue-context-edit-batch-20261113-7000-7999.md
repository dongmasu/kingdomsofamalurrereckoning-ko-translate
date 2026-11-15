# Dialogue Context Translation Edit Batch: IDs `7000`-`7999`

- Date: 2026-11-13.
- Scope: recheck all 42 correction candidates from the four sequential
  revalidation reports against the current English, Japanese, Chinese, and
  Korean rows, then apply supported corrections and directly related
  exact-English or terminology fixes.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from asset links.

## Candidate Decisions

| ID | Decision |
| ---: | --- |
| `7015` | Replaced the literal `여행자 친구` vocative with natural, friendly address. |
| `7027` | Recast the sentence to clarify that the garment's enchantment pattern resembles the pattern Artan saw in his fate. |
| `7042` | Added `Tapestry of Fate` to the name pairing. |
| `7049` | Held: the precise Korean mining term for `stope` is not established. |
| `7079` | Separated the title and name as `컵의 여왕(Queen of Cups) 메어(Maire)`; aligned all 19 exact-English copies. |
| `7090` | Kept `Weave` distinct from `Tapestry of Fate` and aligned its pairing to the established `운명의 실(Weave)`. |
| `7104` | Resolved with related source evidence: translated the named shop as `황금시대 연금술점(Golden Age Alchemy)` and paired its journal reference at `33659`. |
| `7106` | Changed blinking to pulsing and clarified that the minimap marker indicates the quest objective. |
| `7114` | Held: the source does not settle whether the murderer is behind the devices or crimes involving them. |
| `7129` | Changed `낡은 곡물 요리` to `묵은 곡물 요리`; preserved the fable's existing paragraph breaks. |
| `7147` | Smoothed the question about joining the Warsworn ranks without adding an unsupported “our.” |
| `7155` | Retained: `겨울 상궁정(High Court of Winter)` follows the established `상궁정` form also used for the High Court of the Seelie. |
| `7189` | Removed the redundant `Lightning Damage` parenthetical from the effect sentence. |
| `7190` | Restored the missing possessive particle in `콜로사이(Kollossae)의 삶의 모든 면`. |
| `7223` | Paired the actual label `Ballads Library`; aligned all four exact-English copies. |
| `7239` | Recast the gratitude idiom as a direct, natural thank-you. |
| `7245` | Removed the isolated 하오체 shift and retained a conversational plain register. |
| `7247` | Retained `의약제`: the list context and Japanese medicinal/laxative reading support a medicinal-product sense. |
| `7249` | Recast the challenge and expressed earned respect idiomatically. |
| `7339` | Held: English `it` has no secure antecedent in the row or asset evidence. |
| `7346` | Recast the literal “new desire” phrase as a clear, ominous threat. |
| `7398` | Naturalized the comparison while retaining the elevated, ominous tone. |
| `7402` | Corrected `만났어` to `발견했어` and restored the sense of the speaker's last first mate. |
| `7406` | Changed the game's `Health` attribute to the established `체력`. |
| `7479` | Restored the source's explicit belief that the lullaby will lead somewhere important. |
| `7510` | Changed the detached description into the source's direct threat to offer the addressee to Belen. |
| `7527` | Rendered “as far as you can” as making one's utmost effort, not traveling a physical distance. |
| `7567` | Clarified that the person knew the Beckoned. |
| `7577` | Replaced the isolated 하오체 greeting with natural polite speech. |
| `7598` | Retained: `Savant Goyen Reen` is already completely paired. |
| `7612` | Recast the Great Cycle line to express resurrection naturally and removed the repeated parenthetical. |
| `7667` | Retained: its `Queen of Staves` and `Argine` pairings were completed in the preceding batch. |
| `7683` | Matched the casual Japanese greeting and retained the respectful address. |
| `7714` | Replaced gender-implying `그자` with gender-neutral `그 사람`. |
| `7720` | Added missing English pairings for Borri, Hanrik, and Gwyn; retained all five names and the teasing list structure. |
| `7730` | Restored the repeated friendship emphasis without reducing it to good treatment. |
| `7733` | Recast the awkward possessive as “a member of our kind”; aligned its exact-English copy at `8516`. |
| `7783` | Changed `냉기 피해` to the distinct `빙결 피해(Freezing Damage)`. |
| `7850` | Corrected the English parenthetical from `Sagecraft` to `Sagecrafting`. |
| `7901` | Recast the sarcastic “How convenient” idiom naturally. |
| `7907` | Rendered “a live one” as a lively newcomer and kept the playful welcome. |
| `7935` | Corrected `출세주의자` to the taunting `건방진 신참`, matching the supported sense at `7062`. |

The remaining evidence-limited items from these reports were left unchanged:
`7049`, `7114`, `7339`, `7257`, `7322`, `7420`, `7447`, `7532`, `7553`,
`7748`, `7824`, `7852`, `7865`, and `7926`.

## Related Occurrences

- The exact-English `Maire, Queen of Cups` label now has one consistent title/name format in all 19 copies.
- The exact-English `Ballads Library` label now uses `발라드의 집 도서관(Ballads Library)` in all four copies.
- The exact-English Hallam sentence now has identical Korean at `7733` and `8516`.
- IDs `7332` and `11660` have identical Korean because their English, Japanese, and Chinese source rows match; both now use `겨울 페이인 사촌`.
- The related shop label and journal mention at `7104` and `33659` both pair `Golden Age Alchemy`.
- ID `7141` now keeps the `House of Ballads` pairing only at its first mention in the journal entry.

The ID-scoped application manifest is
[`dialogue-context-edit-batch-20261113-7000-7999.json`](dialogue-context-edit-batch-20261113-7000-7999.json).

## Verification

- Rechecked all 42 correction candidates. Thirty-five were corrected, four were already correct or had established wording, and three remain held for insufficient source evidence.
- Applied supported changes sequentially with `tools/replace_text_preserve_eol.py`. The manifest records 60 unique edited IDs, including exact-source copies and directly related entries.
- Refreshed the review-ledger source fingerprints for exactly those 60 IDs.
- The active CSV retains its UTF-8 BOM, 65,135 rows in ID order, and the existing newline inventory: 71,845 CRLF and 244 LF-only endings. Existing embedded breaks in the fable and journal text were preserved.
- Exact-English Korean consistency checks passed for all duplicate groups touching edited IDs; the four-language rows for `7332` and `11660` were also confirmed identical.
- The review ledger validated all 65,135 IDs. Index and both catalogs passed reproducibility checks.
- All 11 CSV-preservation tests and all nine context-index tests passed; CRLF-aware `git diff --check` passed.
- No source CSV, extracted asset, or game binary was modified.

Candidate adjudication now reaches 246 IDs (about 7.8% of the approximately
3,155-candidate inventory). This is not a claim that remaining candidates
have been adjudicated. The next sequential range is `8000`-`8999`.
