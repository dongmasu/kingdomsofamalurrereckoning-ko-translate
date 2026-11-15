# Sequential `default` Revalidation: IDs `8250`-`8499`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `8250`-`8499`; add only IDs without a current review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- All 250 IDs were checked. The 80 existing records had current four-language
  fingerprints and their prior dispositions were retained. The other 170
  IDs were reviewed and recorded.
- Five new IDs have correction candidates. One new ID has an
  evidence-limited finding.
- Meaning, Korean naturalness, register where assessable, terminology, names,
  and structure were checked. UI, objective, item, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `8258` | Naturalness / objective | `Cast Straton's Play` is rendered `스트라톤(Straton)의 연극에 배역 배정하기`. Japanese confirms that `cast` means assigning roles, but this Korean objective is stiff. Consider `스트라톤(Straton)의 연극 배역 정하기`. The exact-English duplicate at `55074` currently has the same translation and should remain aligned if edited. | High |
| `8294` | Format | The letter's quoted statement begins after `이렇게 쓰여 있어.` but the Korean omits quotation marks, unlike the English, Japanese, and Chinese. Consider marking the two sentences as a direct quotation, preserving the wording and line layout. | High |
| `8301` | Name / format / consistency | `Acathan` is left untranslated and unpaired. The same name is rendered `아카사` in `아카사 습지대(Acathan wetlands)` at `21210`, but `아카탄` in `아카탄의 춤(Acathan Dance)` and `아카사 늪지(Acathan swamps)` at `52524`. Japanese and Chinese support the `아카사` form for the wetlands and Acathan Dance. Consider `아카사(Acathan)` here and reconcile the related spellings together rather than treating this label in isolation. | Medium |
| `8463` | Meaning / terminology | `deadly Headhunter` is translated as `악명 높은 헤드헌터단원(Headhunter)`, shifting `deadly` toward notoriety. Parallel entries for Nora Pepper, Sinder, and Cyrus Pepper use `흉악한`, `악명 높은`, and `위험한`, respectively. English, Japanese, and Chinese describe a dangerous or vicious Headhunter; consider a meaning-preserving form such as `위험한 헤드헌터단원(Headhunter)` and align the parallel descriptions after reviewing them together. | High |
| `8467` | Naturalness | `거래 즐거웠어` is an awkward rendering of the clipped merchant sign-off `Good doing business.` Japanese uses a customary thanks-for-your-business expression. Consider a natural equivalent such as `거래해 줘서 고마워.` | High |

## Evidence-Limited Hold

| ID | Reason |
| ---: | --- |
| `8345` | Korean uses polite speech (`무엇을 도와드릴까요?`, `저도 친구로 대하죠`), while Japanese uses a casual, feminine-sounding register (`何かご用かしら？`, `私の友人よ`); Chinese is less diagnostic. The linked asset contains multiple NPCs and does not map this key to a speaker. Retain the Korean pending speaker or scene evidence; do not infer a register change from the asset association alone. |

## Duplicate and Structural Checks

- Forty-one exact-English duplicate groups touch the range (1,017 rows across
  the corpus). Korean text matches in every group.
- Logical line-break counts and runtime/layout-token identities match across
  all four languages for all 170 new IDs.
- Four Korean strings contain 13 existing CRLF embedded breaks: `8266` (4),
  `8332` (2), `8462` (6), and `8473` (1). They were preserved.
- Of the 170 new IDs, 114 have indexed quest-asset links and 56 have none.
  Asset membership does not establish a speaker, handler mapping, branch, or
  dialogue order.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
