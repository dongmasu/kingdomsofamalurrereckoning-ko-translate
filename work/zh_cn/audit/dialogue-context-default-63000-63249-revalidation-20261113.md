# Sequential `default` Revalidation: IDs `63000`-`63249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 62 pre-existing ledger rows and preserved them. Appended the
  remaining 188 IDs in ascending order.
- Seven new correction candidates, eight evidence-limited meaning/format
  holds, and 12 embedded-line-ending/layout holds are recorded. Holds do not
  authorize a speculative translation or newline edit.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `63074` | Meaning / format | `For High Roll, the highest roller ... wins` is rendered as the highest die face; the aligned Japanese and established descriptions of this two-dice game specify the higher sum. Clarify the Korean rule as the higher total winning, and pair the named games as `하이 롤(High Roll)` and `레인지 롤(Ranged Roll)`. English is compressed here, so do not extend the rule beyond the cross-row game evidence. | High |
| `63152` | Title / format | The line confers the formal title `Neophyte`, but Korean gives only `수련생`. Preserve the current Korean meaning and add the exact source title, e.g. `수련생(Neophyte)의 칭호`; this does not settle the best standalone Korean rank term. | Medium |
| `63164` | Name / format | The named historical event `Battle of Galafor Plains` appears only as `갈라포르 평원 전투`. Pair the full event name in English while retaining the current Korean rendering; the person and faction names in the same sentence are already paired. | Medium |
| `63194` | Meaning / terminology | `the Authority's order` is rendered `권위회의 명에 따라`, which reads as an authority council. The project's established deity name is `권능(Authority)` (see `default:6908`); use that name and preserve the source's reference to its order. Do not infer from Japanese alone that `1470` explicitly means a death year. | High |
| `63204` | Meaning / terminology | `the hollow of Sinsear` is rendered `신시어(Sinsear) 공허`, suggesting an abstract void. Japanese identifies a cave and Chinese a valley, so use a physical-place term supported by the quest context rather than `공허`; the exact choice between cave and valley remains contextual. | High |
| `63229` | Name / format | The capitalized standalone category `Great House` is only `대가문`. Add the exact English label, e.g. `대가문(Great House)`, while leaving its precise social/lore scope open. | Medium |
| `63244` | Naturalness | `가난한 우리 난민을 노리는` is awkward and can misattach `가난한` to `우리`. Recast as `우리처럼 가난한 난민을 노리는` or an equally natural phrase without changing who is targeted. | Medium-high |

## Evidence-Limited Holds

| ID | Question and disposition |
| ---: | --- |
| `63018` | `FAIL LINE` is identical in English/Japanese/Korean while Chinese renders it as failed dialogue. It may be an internal/test label; keep unchanged until player-facing intent is established. |
| `63020` | `French Southern Territories` appears unrelated to the fantasy setting and may be test data. All source locales identify the same real-world territory, but no context establishes whether the row is intentional game text. |
| `63040` | Capitalized `Scale` and `Eldest` may be lore concepts; the short row does not establish whether Korean `저울` and `맏이` are intended literal terms or titles. |
| `63102` | English `I'm down!` can mean either being defeated or agreeing to participate; Japanese and Chinese favor defeat. Keep the current reading pending dialogue context. |
| `63129` | `Orison` could denote a prayer, rite, or named concept. Keep `오리슨(Orison)` rather than forcing a meaning from the divergent Japanese and Chinese. |
| `63131` | English `the Court` does not identify which court; Japanese and Chinese name different courts. Retain the unqualified Korean `궁정` until context resolves the referent. |
| `63178` | `Master's Pick` is rendered `달인의 자물쇠따개`; Japanese retains `ピック`, while Chinese reads it as a selection. The isolated objective does not establish what the object is, so retain it pending quest/item context. |
| `63202` | English says mortals must keep their weapons “controlled”; Japanese says weapon use is forbidden, while Chinese aligns more closely with controlled weapons. Korean preserves the controlled/reckless-use sense. Do not strengthen it to a total ban or further narrow it without context. |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; their rows and prior
dispositions remain unchanged.

| ID | Recheck |
| ---: | --- |
| `63049` | English uses the familiar vocative `dove`; Korean `그대` is elevated. Preserve the existing address candidate and its source-backed neutral alternative `친구`; do not infer a speaker from the asset. |
| `63060` | The marked command `이해하게` still shifts into casual speech in the same utterance. Preserve the existing naturalness/speech-level candidate. |
| `63112` | The approved `연도문` terminology is now consistent, but `Acyone` remains only `아시온` here despite the established pairing elsewhere. Preserve the existing name/format candidate. |
| `63113` | `화관(Wreath)` is retained, but `기초는 ... 금이지` remains awkward for the artifact's gold foundation. Preserve the existing naturalness/terminology candidate. |
| `63118` | `돌아왔군` remains stiffer than the conversational Japanese greeting and shifts immediately to `뭘 도와줄까?`. Preserve the existing local naturalness/speech-level candidate without assigning a speaker. |
| `63124` | `the Weave` remains `위브`; the established setting term is `운명의 태피스트리(The Weave)`. Preserve the existing terminology candidate. |
| `63141` | Korean `모험가님도요` is polite while Japanese is plain with a courteous address; no reply edge or speaker mapping is established. Preserve the existing uncertainty. |
| `63146` | This is an action objective, but `리치우드 나무껍질(Leechwood Bark) 수확` remains a bare action noun. Preserve the existing format candidate for the `-하기` objective form. |
| `63221` | The plain Korean `잘 가` may or may not fit the preceding exchange; the asset does not establish its speaker or reply edge. Preserve the existing speech-level uncertainty. |
| `63233` | The exact-English duplicate group `Irion, King of Cups` still pairs only `Irion`, not `King of Cups`. Preserve the existing title-format candidate; the same Korean wording is shared across the duplicate group. |

Earlier preliminary concerns were also checked against the active CSV rather
than copied forward blindly: `63038` now says “things others do not know,”
`63043` preserves likelihood (`가능성이 커`), `63161` uses `명령서` rather
than the older preliminary `영장`, and `63203` uses `호수` rather than the
older preliminary `작은 못`. These are not new correction findings.
`63234` uses the age-neutral `형제분`, so it does not add an unsupported
older-sibling relation.

## Additional Cross-Checks

- Sixty exact-English duplicate groups touch this range, comprising 63
  range IDs and 1,284 corpus rows. Korean matches within every group.
- Eleven rows contain embedded line breaks, totaling 34 breaks in English,
  Japanese, and Korean. Chinese contains 12 multiline rows and 35 breaks
  because of one additional separator at ID `63217`. All 34 Korean embedded
  separators are CRLF while the source separators are LF; preserve the CSV
  bytes and do not normalize them.
- Runtime-marker identities and order match across all four languages.
  ID `63181` localizes marker contents but preserves the same three wrappers
  and order.
- At ID `63236`, English, Chinese, and Korean agree on the gameplay values;
  Japanese differs (`80%`/`85%` versus `90%`/`95%`). Retain the English-
  aligned Korean values. The Roman `XX` at `63166` is numerically equivalent
  to Japanese `20` and is retained.
- Of 250 IDs, 191 have indexed asset associations (195 links across 126
  assets), and 59 have none. Of the 188 new IDs, 129 are linked (133 links
  across 72 assets), and 59 are unlinked. Asset associations do not establish
  per-key speakers or playback order.

## Range Result

- All 62 pre-existing ledger rows remain unchanged; 188 new IDs are appended
  in ascending order. Seven new correction candidates, eight evidence-limited
  meaning/format holds, and 12 embedded-line-ending/layout holds are recorded.
- The ledger covers 63,773 of 65,135 unique `default` IDs (97.91%), leaving
  1,362 unrecorded. Sequential coverage reaches `63249`; next is
  `63250`-`63499`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `63000`-`63249`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All ledger fingerprints validate, including the 62 rechecked and 188
  newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
