# Five More Asset Revalidations

- Date: 2026-11-11.
- Scope: 53 `default` IDs across five previously unrecorded assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Ten IDs carry correction candidates. No translation CSV was changed.

## Grouping Evidence and Limits

`1985679.quest_bxml`, `2027828.quest_bxml`, and `735988.quest_bxml` each
contain 10 or 11 quest, objective, journal, or status keys and no explicit
`QUEST_ID`, `NPC_` symbol, or `dialog_line_*` handler.

`695267.quest_bxml` has ten dialogue-like keys and ten serialized
`dialog_line_*` handlers whose names have an `SQ23_FIN` prefix. `649344.quest_bxml`
has eleven keys and seven handlers with a `U03_Fin` prefix. Neither asset has
an explicit `QUEST_ID` or `NPC_` symbol. These asset-level prefixes do not
identify individual speakers, keys, callbacks, or order. Conversational lines
were assessed individually; no shared speaker or voice continuity was
inferred.

All 53 rows were compared in English, Japanese, Chinese, and active Korean.
Repeated quest-complete and quest-failed labels already match in Korean. No
embedded line breaks, runtime placeholders, or markup were found.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `22980`, `43167` | Naturalness / format | `Office Upgraded` and `Mine Upgraded` are parallel status labels, but Korean adds `완료` only to the latter. Align the pair, for example `사무실 업그레이드 완료` and `광산 업그레이드 완료`. | Medium-high |
| `60290` | Naturalness | `these possessions` refers to the mine and operating office, but `이 자산들을 살펴보고` sounds financial. Consider `이 시설들을 둘러보고 개선할 방법을 찾아야겠다.` | High |
| `24050` | Naturalness / objective style | `Kill all the sprites` is rendered `스프라이트 모두 처치`, while the adjacent objective uses the established `-기` form (`스프라이트 둥지 찾기`). Consider `스프라이트 모두 처치하기`. | High |
| `32309` | Naturalness / style | This non-dialogue contract-failure notice uses formal polite endings (`사망했습니다`, `이행할 수 없습니다`), unlike equivalent status text such as `14860`, which uses plain narrative style. Consider `계약 당사자 중 한 명이 사망했다. 이 계약을 더는 이행할 수 없다.` | High |
| `33203` | Speech level / naturalness | `아, 살인자 말이군` reads as “I see, you mean the killer,” rather than the short recognition `Ah, the killer.` Its `-군` ending also sounds more elevated than the terse Japanese `ああ、殺人者か`. Consider `아, 살인자구나.` | Medium-high |
| `47949` | Speech level / naturalness | Within one line, `건강해 보이는군` shifts into `우리와 같은 부류야`; Japanese keeps a conversational plain register. Consider `건강해 보이네. 살인은 사람을 그렇게 만들지. 우리 편은 아닐지 몰라도 넌 분명 우리와 같은 부류야.` | High |
| `11365` | Naturalness / objective style | `Return to Sigra` uses the direct imperative `시그라(Sigra)에게 돌아가라`, unlike the project's concise `-기` quest-objective form. Consider `시그라(Sigra)에게 돌아가기`. | High |
| `15041`, `40503` | Terminology | These invoice objective/status labels use `송장`, while the same Sigra quest uses `청구서` at `21566`, `50844`, and `62498`. A wider scan found both terms among invoice occurrences, with `40150` referring to a delivery-goods invoice; settle the billing-document term by context rather than globally replacing `송장`. | Medium-high |

## Retained Text

The other 43 rows were retained after source comparison. In particular,
`Going Primal` at `1023` remains `야성 발현`, respecting the established
title-specific exception; the system term `Primal Sprites` remains `원시
스프라이트`. The polite turns at `7292` and `14777` and the plain turns in
other `649344` rows were assessed individually because the asset does not
prove that they share a speaker. No Korean CSV was changed.

## Complete ID Sets

- `1985679.quest_bxml`: `5712`, `12519`, `18291`, `22980`, `34334`,
  `35024`, `42349`, `43167`, `44962`, `50501`, `60290`
- `2027828.quest_bxml`: `334`, `1023`, `20157`, `22307`, `24050`, `27983`,
  `32309`, `47102`, `58718`, `62308`, `64881`
- `649344.quest_bxml`: `7292`, `14777`, `33287`, `37128`, `39384`, `47308`,
  `54179`, `59842`, `62286`, `63920`, `64059`
- `695267.quest_bxml`: `27823`, `30015`, `33203`, `40379`, `47949`, `49223`,
  `63356`, `63358`, `64009`, `64010`
- `735988.quest_bxml`: `812`, `11365`, `15041`, `21566`, `31923`, `37425`,
  `40503`, `48308`, `50844`, `62498`

All 53 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
