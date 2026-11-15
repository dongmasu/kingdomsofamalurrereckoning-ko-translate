# Sequential `default` Revalidation: IDs `10750`-`10999`

- Date: 2026-11-11.
- Scope: compare active Korean against English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Fifty-five existing ledger records in this range were retained after their
  four-language fingerprints were verified. The remaining 195 IDs were
  compared and added.
- Nine newly reviewed IDs have correction candidates; six have
  evidence-limited findings. The sets do not overlap.
- Of the 195 new IDs, 138 have indexed quest-asset links and 57 do not. Five
  IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10765` | Name pairing | The named location `Grave of Lieutenant Gancha` is rendered only as `간차 중위의 무덤`. Pair the complete location label with its English source name. | High |
| `10809` | Terminology | `reagents` is rendered `재료`, while the same term is `시약` at ID `10759`; Chinese also uses the reagent term. Use the established alchemy term `시약` and keep the ingredient quantities and line breaks intact. | High |
| `10814` | Speech level / naturalness | `행운을 비오` shifts to conspicuous archaic 하오체 after `그대` and the solemn blessing. Recast the closing wish in a consistent, natural register without flattening the prayer-like tone. | High |
| `10848` | Naturalness | `생존자들을 정리할게` is awkward and can sound as though the survivors themselves are being disposed of. Japanese and Chinese describe organizing them; use a natural verb such as `수습할게` while preserving the contrast with the player's task. | High |
| `10874` | Name pairing | `Lotos` is a named person but appears only as `로토스`. Add the source spelling, consistent with other proper-name references. | High |
| `10897` | Meaning / name pairing | Capitalized `the Villa` refers to the established Sandstone Villa, but `저택만 한 집` turns it into a generic size comparison. Restore the specific place reference and preserve the speaker's joke that the books still have to be purchased. | Medium-high |
| `10925` | Name pairing | `the Wild Hunt` is rendered `야생 사냥` without its English name; the related title `archsages` is also unpaired. Pair the named Hunt and the established `대현자(Archsage)` title without changing who may carry the item. | Medium-high |
| `10946` | Name pairing | `Freehold` is a named place but appears only as `프리홀드`. Add `(Freehold)` while retaining the current Korean form; other rows vary between transliteration and translation, so this finding alone does not authorize a global terminology change. | High |
| `10994` | Meaning / format | English places the `{*3Armor}` label before `-like quality`. Korean already renders that as `방어구와 같은 보호 효과` and then repeats the wrapped label at the sentence end. Integrate the localized token with the `방어구` phrase and remove the duplicated display of the concept, preserving the `{*3...}` wrapper. | High |

## Retained Prior Finding

- ID `10945` already has a name-consistency and English-pairing candidate in
  the SQ66 report. Its four-language fingerprint is unchanged, so that
  candidate remains linked to the prior report and is not counted again here.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `10754` | Meaning / UI context | English says `rent the bed`, while Japanese and Chinese say a room. Korean follows the English literally, but the inn interaction context is not established by this key; retain pending confirmation of what the player actually rents. |
| `10813` | Proper-name status | English capitalizes `the Well`, Japanese quotes `泉`, and Chinese describes a well. Korean `샘` is plausible, but this row does not establish whether `Well` is a named place or a generic water source. |
| `10869` | Meaning / idiom | `my old bones` may be a figurative reference to an old body or literal remains. Japanese omits the bones and Chinese preserves them; the row alone does not settle the intended reading. |
| `10908` | Terminology / source wording | `Young Races` is capitalized, but Japanese and Chinese treat it descriptively; the English paragraph also contains the malformed phrase `the difference conditions of death`. Keep `젊은 종족` provisionally and do not infer a formal faction or term from capitalization alone. |
| `10959` | Meaning | `Five-and-nine by night` is opaque: Japanese reads it as `59`, Chinese gives a measure of fourteen bushels, and Korean transliterates the numbers. Retain pending contextual evidence. |
| `10987` | Meaning / naturalness | The metaphor `that important layer of filth` is rendered literally as `그 중요한 때`; Japanese interprets it as cunning while Chinese stays closer to the dirt metaphor. The intended nuance is unresolved, so do not replace it with a guessed trait. |

## Source Anomalies

- At ID `10790`, English, Japanese, and Korean have four logical line breaks;
  Chinese has three. Korean matches English and Japanese, so this is not a
  Korean formatting correction.
- At ID `10842`, English and Korean label the passage `VI.`, while Japanese
  labels it `第4章`. Korean follows English; preserve the source discrepancy
  rather than changing the chapter number.

## Duplicate and Structural Checks

- Three exact-English duplicate groups touch this range: `Quest Complete`
  (301 rows across the corpus), `Welcome.` (43), and `Farewell.` (142).
  Korean text matches in all 486 rows.
- Runtime placeholder and display-wrapper signatures and brace balance match
  across the four languages for all 195 new IDs. Logical line-break counts
  also match except at ID `10790`, where Chinese has one fewer break.
- Eight Korean strings contain 31 existing embedded CRLF breaks:
  `10790` (4), `10809` (5), `10838` (7), `10842` (4), `10908` (6),
  `10928` (2), `10942` (2), and `10976` (1). All were preserved.
- Asset associations were used only as candidate context. No individual
  speaker or playback order was inferred.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
