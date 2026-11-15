# Sequential `default` Revalidation: IDs `61750`-`61999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 80 pre-existing ledger fingerprints and preserved those
  append-only rows. Added the remaining 170 IDs in ascending order.
- Eight new correction candidates and nine evidence-limited ledger holds are
  recorded. The candidates at `61754`, `61767`, and `61844` also have
  separate embedded-line-ending holds.
  Five existing candidates and six existing holds were rechecked without
  rewriting their rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `61754` | Naturalness | In this scholarly journal entry, `사소한 연구 분야` makes `a minor area of study` sound trivial. Consider `일반인들이 강령술이라 부르는 비교적 작은 연구 분야`; preserve the journal's measured register. The separate CRLF storage issue is held below. | Medium |
| `61767` | Format | The ability names are localized inside `{*1...}`, but their English pairings fall outside the display markers. Consider `{*1비전 격노(Arcane Fury)}` and `{*1원소 탈출(Elemental Escape)}` so each displayed label stays together. | High |
| `61785` | Meaning | `Executive Assistant` is rendered `비서실장`, which denotes a chief/head of an office rather than an executive's assistant. Consider `임원 보좌관(Executive Assistant)`. Japanese leaves the English label unchanged and Chinese supports the assistant role. | Medium-high |
| `61809` | Objective style | `Speak to Zefwyn Lan` is rendered as a noun-like objective ending in `대화`. Use the established action form, e.g. `제프윈 랜(Zefwyn Lan)과 대화하기`. | High |
| `61844` | Name formatting | `Ysa` is a proper name in the poem but appears only as `이사`; this can be read as the Korean word for “director.” Consider `이사(Ysa)가`. The embedded line separators are separately held and must not be normalized during review. | High |
| `61925` | Terminology | `Authority` refers to the deity whose divine order governs all. The current `권능자(Authority)` conflicts with the established divine name `권능(Authority)`; consider `권능(Authority)의 계획`. | High |
| `61986` | Title format | `The Perpetual Desolations` is a named title rendered only as `끝없는 황폐`. Consider `끝없는 황폐(The Perpetual Desolations)`. The identical English row `4390` has the same Korean text and an existing candidate; preserve its row and consider the pair consistently if this proposal is accepted. | Medium |
| `61994` | Speech level | The greeting `환영한다, 투기장 전사여!` uses elevated, archaic address, while Japanese has the polite `剣闘士さん` and Chinese uses a direct greeting. Consider `환영합니다, 검투사님!`; no individual speaker is inferred from asset association. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `61770` | Meaning | English `Do you need my touch?` can mean personal intervention, while Japanese explicitly asks whether healing is needed and Chinese says whether help/intervention is needed. Keep `손길` provisional without the scene's meaning. |
| `61813` | Meaning / proper name | English calls this `Cliffbreak Fasting`, while Japanese and Chinese describe an underground passage. Other corpus references do not resolve whether this is a named Dverga-built Fasting or a generic passage; do not invent a normalized place name. |
| `61872` | Speech level | The Korean uses formal `-소/-시오`, while Japanese addresses the addressee plainly with `お前` and Chinese uses an unmarked conversational register. Speaker-level evidence is insufficient to decide the intended Korean register. |
| `61935` | Speech level | Korean uses `나그네여` and repeated `-소`, but the available language rows do not establish the speaker's intended Korean register. Keep the speech-level question open rather than infer a speaker from the asset. |
| `61754`, `61767`, `61807`, `61830`, `61844`, `61854`, `61871`, `61977` | Embedded line-ending format | Each Korean field stores embedded separators as CRLF, while English, Japanese, and Chinese use LF. Per-row logical break counts match. Preserve current CSV bytes; do not normalize separators as part of this review. At `61754`, `61844`, and `61767`, this storage hold is distinct from the report's text/markup proposals. |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; their rows and prior
dispositions remain unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `61750` | The existing speech-level candidate was rechecked against the journal-like first-person text. No per-key speaker is established; preserve the earlier row and do not infer a speaker-specific voice. |
| `61758` | The existing meaning candidate remains supported: `Mine is right here beside me` refers to the mortar and pestle in this potion-making context, not a workbench. |
| `61804` | The existing naturalness candidate remains documented for the account of reforging the Mystic Hammer; preserve its prior row. |
| `61822` | The existing meaning candidate remains documented for the champion's defeat and non-return; preserve its prior row. |
| `61894` | The existing meaning/naturalness candidate remains documented for the contract to eradicate the mountain trolls and avenge Jory; preserve its prior row. |
| `61782` | `The Great Game` differs materially across English/Chinese and Japanese; retain the source-conflict hold. |
| `61836` | `Go on then` has conflicting conversational senses across the language sources; retain the hold. |
| `61845` | The objective-like title `Uncover the Aster Inheritance` does not establish whether the Korean should be an action or a display label; retain the hold. |
| `61926` | `Greetings` has different greeting force in Japanese and Chinese; retain the register/address hold. |
| `61940` | `fastings` is a setting-specific place/construction term and the single line does not resolve its intended Korean rendering; retain the hold. |
| `61999` | `Wreath` is rendered as a wreath in Korean, a ring in Japanese, and a crown in Chinese; retain the unresolved referent. |

## Additional Cross-Checks

- Fifty-one exact-English duplicate groups touch this range, comprising 55
  range IDs and 1,391 corpus rows. Korean wording matches within every group.
- Eight rows contain embedded line breaks, totaling 32 breaks in each of the
  four languages. Per-row counts and logical paragraph structure match.
  The only discrepancy is the Korean storage separator: all 32 are CRLF,
  while source separators are LF.
- Normalized runtime, display, and layout marker sequences match across the
  four languages.
- Of 250 IDs, 203 have indexed asset associations (206 links across 137
  assets), and 47 have none. Of the 170 newly recorded IDs, 123 are linked
  (126 links across 72 assets), and 47 are unlinked. Asset associations do
  not establish per-key speakers or playback order.

## Report-Only Findings

- `61758` also uses `대형 치유 물약` for `Master Healing Potion`, while base
  ID `4216` uses `장인급 치유 물약`; default IDs `29350` and `62662` use the
  same `대형` form. Record this terminology discrepancy for a separate
  decision; do not rewrite the existing ledger row.
- `61781` already pairs the proper name `Astlof Malloi`, and base ID `4672`
  has the same Korean wording. `61848` pairs `Scaith`, `61857` pairs
  `Argine`, and the available evidence does not establish `Resistance Army`
  (`61910`) or `Cursed Amulet` (`61949`) as formal named entities. These
  preliminary pairing ideas are not promoted to candidates.
- `61918` (`Maiden's Ring`) is already recorded as `not-issue`; the source
  rows support the generic Korean `처녀의 반지`, so its English-pairing
  question remains report-only and its ledger row is unchanged.

## Range Result

- All 80 pre-existing ledger rows remain unchanged; 170 new IDs are appended
  in ascending order. Eight new correction candidates and nine new
  evidence-limited ledger holds are recorded. The additional line-ending
  hold covers eight IDs, three of which also have a separate candidate.
- The ledger covers 62,856 of 65,135 unique `default` IDs (96.50%), leaving
  2,279 unrecorded. Sequential coverage reaches `61999`; next is
  `62000`-`62249`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `61750`-`61999`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 62,856 ledger fingerprints validate, including the 80 rechecked and
  170 newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
