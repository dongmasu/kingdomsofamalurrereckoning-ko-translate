# SQ58 / Parwen Well Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 92 `default` keys associated with `593901.quest_bxml` (`SQ58`).
- After the user's approval, all seven correction-candidate IDs below were
  corrected and rechecked against the four locale rows.
- No extracted game asset was modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ58`, the asset-level symbol
`NPC_DET_DOK_ParwenWell`, and 33 serialized `dialog_line_*` handlers. Its text
covers Courdan's missing letter, Parwen Well's role as courier, Scholar
Airancourt's orders, and the Domus Politica, alongside dialogue, choices,
quest updates, objectives, and UI labels.

The NPC symbol and handler count do not map individual keys to Parwen, another
speaker, a callback, a branch, or a playback position. Speaker attribution and
dialogue order therefore remain unknown at the key level.

## Correction Candidates

These source-checked corrections were approved and applied. The table retains
the evidence and proposed wording that guided the ID-specific edits.

| ID | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `25581` | Name / formatting consistency | English identifies the courier by the full name `Parwen Well`. Other rows in this quest use `파르웬 웰(Parwen Well)` (`21621`, `53218`, `57653`, `59664`); this row alone splits the pairing as `파르웬(Parwen) 웰`. Use `코던(Courdan)의 심부름꾼 파르웬 웰(Parwen Well)은 상관인 에어랑쿠르(Airancourt) 학자가 시켜서 편지를 잃어버렸다고 털어놨다.` | High |
| `29731` | Terminology / English pairing | `the Isles` is rendered `섬들`, unlike the established `제도(Isles)` form elsewhere (for example `1367`, `51487`, and `51665`). The capitalized institution `the Basilica` is rendered only as `대성당`, while the same location is identified as `Basilica Gnostra` at `11650` and `33555`. Consider `나... 난 제도(Isles)에서 상황이 바뀌었다는 소식은 아직 듣지 못했어. 에어랑쿠르(Airancourt) 학자는 바실리카(Basilica)가 내... 실수에 실망했다고 분명히 밝혔어.` | High |
| `32626` | English pairing | `the Basilica` is the same named institution, but the Korean has only `바실리카에서`. Add its source pairing while preserving the speaker's hesitant delivery: `편지야. 내가 쓰던 편지... 보다시피 난 서기관이거든. 바실리카(Basilica)에서 초안을 작성하라는 연락을 받았어. 에어랑쿠르(Airancourt) 학자가 보낸 거야.` | High |
| `33555` | Terminology consistency | `the Isles` is rendered `군도`, while this place-name use is already rendered `제도(Isles)` elsewhere. Align only that term: `그 여자는 제도(Isles)에 있을 거야. 아마 바실리카 그노스트라(Basilica Gnostra)에 있겠지. 편지에 관해 우리가 알아낸 사실을 들이대야 해!` | High |
| `40386` | Naturalness / meaning | `계급의 지혜가 결정을 좌우하지` is a literal, unnatural rendering of `The wisdom of rank dictates our decision.` Japanese states that orders from above are absolute, clarifying the hierarchy meant here. Consider `하지만 한 학자가 그렇게 요구했고... 따를 수밖에 없었어. 그게 우리 방식이지. 위에서 내린 명령이 전부니까.` | Medium-high |
| `58238` | Terminology / English pairing | This sentence again uses `Isles`, currently `섬들`, and names the three orders `Templars, Scholars and Praetorians`. The first and third already have English pairings in Korean, but `학자` does not. Consider `도무스 폴리티카(Domus Politica)는 제도(Isles)의 템플러(Templars), 학자(Scholars), 프레토리안 근위대(Praetorians)의 정치적 방침을 수립하고 유지하기 위해 존재한다.` | High |
| `62539` | Naturalness | `마지막 세부 사항까지` calques `Every last detail` and sounds unnatural in this spoken line. Consider `내가 준 명령서에 전부 적혀 있어. 사소한 것까지 빠짐없이.` | High |

## Consistency and Format Checks

Two exact-English duplicate groups occur within this asset, covering four
rows; Korean already matches within each group:

| IDs | English |
| --- | --- |
| `11303`, `22249` | `Return to Courdan` |
| `18375`, `31756` | `Where's Courdan's letter?` |

All 92 IDs were checked for meaning, Korean naturalness, register,
address/honorifics, terminology and names, repeated English, runtime markers,
markup, and line breaks. The only runtime markers are matching
`$SQ58.parwen_bribe$` values at `9182` and `48962`; each is preserved in all
four locales. None of the 92 rows contains embedded line breaks.

The complete sorted ID set is:

`983`, `2409`, `2695`, `3244`, `3970`, `6408`, `6890`, `6954`, `7285`,
`8172`, `9182`, `9511`, `11303`, `11582`, `11650`, `11823`, `11939`,
`12292`, `12503`, `13228`, `14336`, `14903`, `15160`, `15527`, `15877`,
`16032`, `16789`, `17160`, `18375`, `18952`, `20646`, `21373`, `21457`,
`21537`, `21621`, `22249`, `22314`, `22571`, `24168`, `24687`,
`25581`, `28522`, `28836`, `28939`, `29731`, `30585`, `31737`, `31756`,
`32478`, `32626`, `32779`, `32890`, `33555`, `33752`, `33952`, `34013`,
`34699`, `34885`, `37034`, `38044`, `40334`, `40386`, `41301`, `43045`,
`44391`, `44441`, `45174`, `46183`, `46941`, `47121`, `47876`, `47919`,
`48398`, `48827`, `48962`, `51175`, `52027`, `53218`, `53596`, `54538`,
`57323`, `58145`, `58214`, `58238`, `58462`, `59857`, `61955`, `62539`,
`63157`, `63948`, `64763`, `64912`.

The linked review ledger records all 92 IDs and their four-language source
fingerprints. Seven correction findings are recorded. No key was mapped to a
specific speaker, callback, branch, or playback position. All seven
correction-candidate IDs were applied and rechecked; no extracted game asset
was modified.
