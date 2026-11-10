# SQ69 / Captain Keloran Context Revalidation

- Date: 2026-11-10.
- Scope: all 82 `default` keys associated with `611596.quest_bxml`
  (`SQ69`).
- All nine correction-candidate IDs below were corrected and rechecked
  against the four locale rows.
- No extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ69`, the asset-level symbol
`NPC_ALA_LJO_CaptainKeloran`, seven quest-target handlers, and 29 serialized
`dialog_line_*` handlers. Its text covers the assault on Shadow Pass, the
Ariad reinforcements, and Desiderus Trav's campaign against the Tuatha. The
NPC symbol and handler count do not map individual localization keys to
speakers, callbacks, branches, or playback order. All 82 keys were absent
from the review ledger before this pass.

## Correction Candidates

These source-checked corrections were applied. The table records the
ID-specific wording and evidence used for revalidation.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `30637` | naturalness / consistency | The two sentences shared with `19172` and `42787` have identical English, Japanese, and Chinese, but Korean varies. Prefer aligning the shared passage to `투아사(Tuatha)의 주력 야영지가 바로 앞에 있어. 거기서 나와 함께 몸을 숨긴 뒤 최후의 공격을 논의하자.` while retaining `훌륭해.` for this row's additional `Excellent work.` | High |
| `24771`, `27005`, `35289`, `47483`, `59725` | meaning / terminology | The same spell-casting sentry type is rendered as `주문을 쓰는 보초`, `마법 감시병`, `주문 감시자`, and `주문술 파수병`. Japanese consistently uses `魔法使いの見張り`. Standardize the unit term as `마법사 보초` in these rows; keep generic `sentry` and `sorcerer` distinct. | High |
| `39142` | speech level / naturalness | The line switches from `임무다` to `물러설 수 없어`. Prefer one consistent plain-casual register: `속일 생각은 없어. 이건 죽음을 각오해야 하는 임무야. 하지만 여기까지 왔으니 이제 물러설 수 없어.` | High |
| `45361` | meaning / naturalness | `when Tilera fell` is awkwardly rendered `틸레라가 무너질 때`. Japanese says she died and Chinese says she fell. Prefer `틸레라(Tilera)가 쓰러졌을 때`; keep the distinct `broke and ran` wording at `47976` separate. | Medium-high |
| `27010` | naturalness | `readying his men for our arrival` is rendered as the commander knowing the player is coming and preparing the troops. Use `투아사(Tuatha) 지휘관은 우리가 도착할 것에 대비해 병사들을 준비시키고 있어.` | Medium-high |

## Holds

No additional source-conflict or insufficient-evidence hold was identified.

## Coverage

All 82 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Five correction findings affect nine unique IDs.
All nine exact-English duplicate groups already match across all four
locales: `497` / `2136`, `12376` / `44344`, `18811` / `50930`,
`19172` / `42787`, `20335` / `22059`, `24771` / `27005`,
`34625` / `40075`, `34992` / `42242`, and `48302` / `52613`.
No embedded line breaks, runtime markers, or markup were found. All nine
correction-candidate IDs were applied and rechecked.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
