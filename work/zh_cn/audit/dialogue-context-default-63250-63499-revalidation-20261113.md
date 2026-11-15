# Sequential `default` Revalidation: IDs `63250`-`63499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 64 pre-existing ledger fingerprints and preserved those
  append-only rows. Appended the remaining 186 IDs in ascending order.
- Twelve new correction candidates and 17 new evidence-limited rows are
  recorded. Nine Korean multiline rows retain embedded CRLF separators
  against LF source separators; these bytes were not normalized. ID `63429`
  has a separate source line-break discrepancy.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `63252` | Name / format | Myria is rendered `미리아` without its source form, unlike the established `미리아(Myria)` used elsewhere. Add the English name without changing the sentence. | High |
| `63255` | Meaning | English says the speaker's group trails behind; Korean `우리 뒤를 따라오며` instead says someone follows behind the group. Recast the first clause so the group itself follows behind while watching for a Tuatha ambush. | High |
| `63284` | Name / format | The named concept `Harmonic Quarternion` is rendered only as `조화의 사원소`. Pair the translated term with the source wording; preserve the source spelling, including its apparent typo. | Medium |
| `63292` | Name / format | Capitalized `the Mission` is rendered `선교원` without its English label. Other entries use `선교원(Mission)`; add the source form if this is the same named institution, without inferring its identity beyond the text. | Medium |
| `63326` | Meaning / naturalness | `tales are cheap` means stories have little value or are easily produced; `이야기만으론 부족하고` instead says stories are insufficient. Recast the clause naturally while preserving the warning that legends mislead. | Medium-high |
| `63329` | Name / format | `Keloren's Legion` is rendered `켈로렌 군단` without the name pairing used elsewhere (`켈로렌 군단(Keloren's Legion)`). Add the English form. | High |
| `63376` | Terminology | The gameplay attribute `Health` is rendered `생명력`; the established numeric stat term is `체력`. Use `체력` and make clear that both Health and Total Damage increase by 100%. | High |
| `63378` | Meaning / format | After the localized item-unlock sentence already states the purchase condition and delivery, a second unmarked sentence repeats that the game purchase grants the item. Remove the redundant sentence while preserving all four localized marker spans in order. | High |
| `63380` | Name / format | `Lir` in “scribe to Lir” is a person’s name but is unpaired in Korean. Add `리르(Lir)` without adding the unsupported title “King” found only in Japanese. | High |
| `63402` | Meaning | `You're in able hands` reassures the passengers that capable people are handling things. `우리가 잘 지켜줄 테니` changes this to a specific promise by “us” to protect them. Use a neutral reassurance about being in capable hands. | Medium |
| `63408` | Name / format | The named relic `Eye of Lyria` and historical event `Year of Waking Knives` are translated without their English forms. Pair both names while preserving the current chronology and wording. | Medium-high |
| `63420` | Name / format | `Hour of the Setting Sun` is a named object/title but appears only as `지는 해의 시간`. Add the English form; the corrected physical-place reading `아만(Amman)의 동굴` is already present. | High |

## Evidence-Limited Holds

Seventeen holds below are new ledger dispositions. IDs `63411` and `63419`
are pre-existing rows and are report-only rechecks; they are not included in
that count.

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `63254` | Meaning | English, Chinese, and Korean say “Agreed, but you go first”; Japanese instead says the addressee will die. Retain the English-aligned Korean and do not infer the scene's intended reply. |
| `63306` | Meaning / format | English, Chinese, and Korean give a flat `+10 Mana Stolen per Hit`; Japanese says `+10%`. Keep the English-aligned value. Embedded line breaks are preserved as CRLF in Korean. |
| `63316` | Format | Four-language logical line counts and runtime-wrapper order agree; preserve the three localized display markers and the existing embedded CRLF bytes. |
| `63322` | Name / format | The Wyvyrn-Gifres family/group and the separate Wyvyrn/Gifre references carry wordplay. The relation to the separately established `Wyvyrn-Gifre` form is not clear enough to normalize here. |
| `63345` | Meaning | English says `fastings`, while Japanese identifies underground passages and Chinese says passages. Korean follows the passage reading; retain it pending resolution of the apparent English/source discrepancy. |
| `63363` | Format | Avery's signed reflection matches the source meaning and paragraph structure; preserve its existing embedded CRLF separators. |
| `63365` | Name / format | `Wrath of the Storm` is an isolated capitalized label. The row alone does not establish whether it is a formal title or descriptive text, so do not add a speculative English pairing. |
| `63395` | Meaning | English/Chinese describe a “blood grin,” while Japanese describes a blood-covered face. Korean follows the English image; retain it pending scene context. |
| `63411` | Meaning | `Only one head` may refer to a surviving head or to a narrow escape from death. The line does not resolve the dark joke; retain the current reading. |
| `63413` | Honorifics | English `your grace` is rendered `전하`, which can imply a sovereign. Chinese uses a broader honorific and Japanese omits it; the addressee's status is not established here. |
| `63419` | Meaning | `Sidhe` may mean the people or the Faelands. Japanese supports the people reading while Chinese uses the Faelands; retain `시드(Sidhe)` pending context. |
| `63429` | Format | English and Chinese have a newline before a standalone final period; Japanese and Korean do not. Korean follows the Japanese-derived layout and retains the final punctuation. Do not normalize without stronger evidence. |
| `63443` | Format | Runtime-wrapper order matches across languages, but preserve the Korean embedded CRLF separators exactly. |
| `63452` | Format | The Carver verse's meaning and line sequence are retained. Preserve the three embedded CRLF separators rather than converting them to LF. |
| `63461` | Meaning | `hold the miners in thrall` may imply magical enslavement beyond ordinary control. Korean `지배` is retained; do not strengthen it without quest evidence. |
| `63468` | Format | The bargaining dialogue's two-paragraph structure matches; preserve its embedded CRLF separators exactly. |
| `63479` | Meaning | `quickling` may be a species name or an epithet for a short-lived person. Korean `단명자(Quickling)` is plausible but not conclusive without scene context. |
| `63487` | Meaning | `Matchless blades` may describe a named weapon class or blades generically. Korean's `칼날` is plausible; the isolated label does not settle the item category. |
| `63489` | Meaning / format | `un-natured` is unusual lore wording; Korean interprets it as being outside nature's order. Retain that reading provisionally and preserve the four embedded CRLF line breaks. |

## Rechecked Existing Findings

These seven IDs already had append-only candidate rows. Their fingerprints
still match the current four-language text; the rows were not rewritten.

| ID | Recheck |
| ---: | --- |
| `63303` | `Mithroliths` remains `미스로리스` without the English pairing; retain the name/format candidate. |
| `63332` | `단 하나의 사슬도 있지` remains an unnatural calque for the single binding rule; retain the naturalness candidate. |
| `63343` | `Captain` remains `대장` rather than the established rank `대위`; retain the rank-consistency candidate. |
| `63374` | `부모님과 접촉해 달라고 했어` remains stiff for “make contact with her parents”; retain the naturalness candidate. |
| `63389` | `개얼굴아` remains inconsistent with the other rendering of `dog-face`; retain the lexical-consistency candidate. |
| `63399` | The explicit references to Paige and the Chosen remain unpaired; retain the name/title-format candidates. |
| `63431` | The objective remains a bare `업그레이드`; retain the established `-하기` objective-format candidate. |

Four additional recheck questions fall on existing non-candidate ledger rows
and are therefore report-only; their append-only records remain untouched:
`63353` (the technical sense/natural phrasing of `attune`), `63411` (the
“one head” line), `63419` (Sidhe as people or place), and `63428` (`enclave`
rendered as `거주지`). The source does not justify overwriting the previous
ledger rows or assigning a speaker.

The earlier correction to ID `63456` is present in the active text:
`라즈(Laz)` and `라스(Raz)` remain distinguishable. It is not a new finding.

## Additional Cross-Checks

- Forty-seven exact-English duplicate groups touch the range, comprising 48
  range IDs and 1,005 corpus rows. Korean wording matches in every group.
- Ten English rows contain 30 embedded line breaks; Japanese has nine rows
  and 29 breaks; Chinese has ten rows and 30 breaks; Korean has nine rows
  and 29 breaks. The only logical break-count difference is `63429`.
- All nine Korean multiline fields use embedded CRLF where the sources use
  LF. Preserve the bytes; this is separate from logical line-layout review.
- Runtime/display wrapper identities and order match across all four
  languages. Localized marker contents vary by language as expected.
- At `63306`, English/Chinese/Korean use flat `+10 Mana`, while Japanese
  alone uses `+10%`; the English-aligned Korean value is retained.
- Of 250 IDs, 187 have indexed asset associations (191 links across 129
  assets), and 63 have none. Of the 186 new IDs, 123 are linked (126 links
  across 76 assets), and 63 are unlinked. Asset associations do not establish
  per-key speakers or playback order.

## Range Result

- All 64 pre-existing ledger rows remain unchanged; 186 new IDs are appended
  in ascending order. Twelve new correction candidates and 17 new
  evidence-limited rows are recorded.
- The ledger covers 63,959 of 65,135 unique `default` IDs (98.19%), leaving
  1,176 unrecorded. Sequential coverage reaches `63499`; next is
  `63500`-`63749`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `63250`-`63499`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All ledger fingerprints validate, including the 64 rechecked and 186 new
  rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
