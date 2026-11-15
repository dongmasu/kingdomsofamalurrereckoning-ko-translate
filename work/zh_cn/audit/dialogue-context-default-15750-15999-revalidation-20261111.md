# Sequential `default` Revalidation: IDs `15750`-`15999`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- All 250 IDs were checked across the four language tables. Fifty-six
  existing ledger rows had current fingerprints; 194 new rows were added.
- Two correction candidates and 17 evidence-limited holds are recorded.
  Existing ID `15794` was reclassified in place as a meaning candidate;
  existing IDs `15846` and `15902` were reclassified as evidence-limited.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `15794` | Meaning | English `bless your head`, Japanese `君の頭脳に誉れあらんことを`, and Chinese `祝你永远聪慧` praise the addressee's intelligence. Korean `네게 축복이 있기를` gives a general blessing and omits that compliment. Consider a natural Korean line that retains the playful praise, such as `머리도 좋구나!` | High |
| `15985` | Naturalness / tone | English `the little scamp`, Japanese `あの腕白者`, and Chinese `这个小淘气` affectionately describe Geoff as mischievous. Korean `그 꼬마` retains his youth but loses the teasing quality. Consider `그 장난꾸러기`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `15775` | Meaning | `Enemies in High Places` may mean powerful/high-ranking enemies or enemies at an elevated place. Japanese supports the former, Chinese the latter, and the title alone does not resolve it. Retain the existing unresolved disposition; do not propagate another ID's wording. |
| `15804` | Meaning | English describes a key to Maun's Horde, Japanese says a key to Maun's treasure, and Chinese says a key into the tribe. The key's relation to the named group/object is unresolved. |
| `15809` | Terminology | The isolated title `The Hierophant` is rendered as a guide/leader in Japanese, high priest in Chinese, and `대사제` in Korean. The title's local sense is not established by this label. |
| `15827` | Meaning / terminology | The report of a chained woman and the invocation `Hierophant keep us` do not establish whether Hierophant is a person, office, or religious formula; the language versions diverge. |
| `15830` | Speech level | The short `Welcome back` is plain in Korean but polite in Japanese. Without a supported speaker/addressee relationship, the register difference cannot be resolved. |
| `15839` | Meaning / format | All versions preserve a multi-paragraph letter, but English's unusual `sunsets above the sky` is rendered differently across Japanese, Chinese, and Korean. The intended image cannot be settled from this row. |
| `15846` | Meaning / terminology | Japanese reads `Paling Wand` as a cultivating tool, Chinese as a pointed wand, and English/Korean retain the name phonetically. The item and place references are not sufficiently identified to choose a meaning-based form. |
| `15852` | Meaning | `Curious scuttle` may refer to an odd container, movement, or another result of exploring the wreck; Japanese and Chinese also differ. Korean's `수상한 움직임` remains provisional. |
| `15902` | Meaning / title | The isolated label `Coveting Tragedy` has competing grammatical readings in Japanese and Chinese, and its role as title or phrase is not established. |
| `15905` | Meaning | The isolated `Well` is read as a spring in Japanese and a well in Chinese; English alone does not identify the feature. Retain `우물` provisionally. |
| `15916` | Meaning / source | English says `Gravehal Fasting`, while Japanese and Chinese identify an underground passage. The likely source-label problem does not establish which Korean correction is intended. |
| `15921` | Meaning | `Madness` may refer to literal madness or a wider local affliction; the Chinese wording differs and no context in this row resolves the referent. |
| `15925` | Terminology | The Japanese omits a specific Hierophant title while English and Chinese name it. The Korean `대사제` cannot be confirmed or replaced from this row alone. |
| `15927` | Meaning / name | `The Grazing Grounds` is a grazing area in English and Chinese but a burning land in Japanese. The short label does not resolve the source conflict. |
| `15930` | Meaning / terminology | Capitalized `Delvers` may be a named group or a generic role; Japanese transliterates it, Chinese says researchers, and Korean uses `탐구자`. |
| `15934` | Speech level | `Welcome, welcome!` is plain in Japanese but polite in Korean. No speaker evidence establishes whether this is a register mismatch. |
| `15994` | Meaning / terminology | The Korean explicitly identifies `the Sorrows' location` as the House of Sorrows; English only says `Sorrows`, while Japanese and Chinese give different readings. The added specificity is not established. |

## Existing Findings Rechecked

- All 56 prior ledger records in the range have fingerprints matching the
  current English, Japanese, Chinese, and Korean rows. Fifty-three prior
  dispositions were retained. ID `15794` was reopened as a meaning candidate;
  `15846` and `15902` were changed from `not-issue` to `uncertain` because
  the four-language evidence does not settle their meanings.
- Existing candidates and uncertain findings at `15771`, `15774`, `15784`,
  `15811`, `15812`, `15816`, `15850`, `15871`, `15879`, `15885`, `15886`,
  `15933`, `15964`, and `15965` remain linked to their prior reports and were
  not duplicated.
- The unresolved title question for `15775` remains scoped to that key;
  earlier decisions for other `Enemies in High Places` rows were not changed.
- The known distinction at `23436` remains: the English pronoun refers to
  reagents in the FFQ03 context, so its Korean may differ from other exact
  English duplicates.

## Duplicate and Structural Checks

- Fifty-six exact-English duplicate groups touch this range, covering 641
  corpus rows. One group (`15997`, `23436`, `44607`, `60830`) has different
  Korean wording. The wording at `23436` is context-supported by the FFQ03
  review; the other three rows retain their existing translation.
- All 250 IDs are present in matching order in the four language tables.
  Logical line-break counts and runtime-argument, variable, layout-token,
  and display-wrapper signatures match across all four languages.
- The localized text inside `{*1...}` at `15781` differs by language as
  expected. At `15881`, English/Korean place difficulty before options,
  while Japanese/Chinese reverse the visible labels; the wrapper identities
  are intact and this source-local ordering difference is not treated as a
  Korean structural error.
- Five Korean strings contain 25 existing embedded CRLF breaks:
  `15803` (3), `15839` (4), `15887` (1), `15889` (11), and `15952` (6).
  Their line breaks were preserved.
- Of the 194 new IDs, 128 have indexed asset links and 66 do not; two link
  to multiple assets (`15750` and `15939`). These are context clues only.
  No per-key speaker, handler, branch, addressee, or playback order was
  inferred.

The ledger now contains 28,841 of 65,135 IDs (44.28%), leaving 36,294
unreviewed. Four-language fingerprints and per-ID dispositions are recorded
in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
