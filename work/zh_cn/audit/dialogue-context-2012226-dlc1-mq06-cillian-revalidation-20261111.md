# DLC1 MQ06 / Cillian Keen Revalidation

- Date: 2026-11-11.
- Scope: all 132 `default` IDs linked to `2012226.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Two rows were aligned with the user's established rule for identical English
  source sentences. No other translation changes were made.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC1_MQ06`, the NPC symbol
`DLC1_NPC_GAL_LJO_CillianKeen`, 36 serialized dialogue handlers, and 132
matched localization IDs. Its text concerns Cillian Keen's beast-training
service at Gravehal Keep. The asset-level NPC and quest evidence supports this
review grouping, but does not map every key to Cillian, a specific handler,
dialogue branch, or playback order. Per-key speaker attribution remains
unassigned and playback order remains unknown.

All 132 rows were compared across English, Japanese, Chinese, and active
Korean. There are no embedded line breaks, runtime variables, or markup tokens
in these rows. Exact groups with matching English, Japanese, and Chinese
sources are identical in Korean except `22647`, `25784`, and `32442`, whose
source is “Bugs collected” / `虫を集めた` / `虫子已收集`.

## Applied Consistency Fix

| ID | Finding and disposition |
| ---: | --- |
| `22647`, `32442` | Their translations (`수집한 벌레 수` and `수집한 벌레`) differed from each other and from the same-source row `25784` (`벌레 수집 완료`). Both were changed to `벌레 수집 완료`, matching the quest's parallel status wording (`고기 수집 완료`) and the user's instruction to use identical Korean for identical English when context agrees. Exact-ID edits used `replace_text_preserve_eol.py`. |

After the edits, all three rows in the repeated-source group use
`벌레 수집 완료`.

## Evidence-Limited Holds and Terminology Note

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `712` | Meaning | English is the fragment “I'll get rid of...”; Japanese `解放する` means release/free, while Chinese `我会去掉...` supports remove/get rid of. Korean `내가 없애 버릴게...` follows the English/Chinese direction, but the omitted object and conflicting Japanese reading prevent a confident correction. Retain pending a key-to-dialogue reference. |
| `12511` | Speech level | Korean `무엇을 원하십니까?` is deferential, while Japanese `どれにする？` and Chinese `你喜欢什么？` are casual/neutral. The asset does not map this key to a speaker or scene stage; retain pending that evidence. |
| `36226`, `47849` | Speech level / text type | These are identical tutorial-like explanations and already match in Korean. Korean uses `-습니다`, while Japanese is plain and Chinese neutral. Their text may be instructional rather than spoken Cillian dialogue; retain rather than imposing the surrounding conversational register. |

The source uses `pet` consistently, while Korean uses both `애완동물` (23
rows) and `반려동물` (11 rows). The wording occurs in a mix of system labels,
quest summaries, and conversational text. No repository-wide choice for this
term was found in the reviewed glossary materials, so this report records the
variation without treating it as a confirmed error or applying a blanket
replacement.

## Complete Reviewed ID Set

`589`, `712`, `2107`, `2422`, `2432`, `2721`, `3811`, `3957`, `5106`,
`5148`, `5353`, `5715`, `6496`, `6632`, `6715`, `7555`, `7636`, `8075`,
`8871`, `8974`, `9051`, `10664`, `10913`, `11779`, `12290`, `12511`,
`12869`, `13316`, `13825`, `13846`, `14522`, `14697`, `15703`, `16653`,
`19473`, `20037`, `20255`, `20391`, `20873`, `21498`, `22213`, `22365`,
`22535`, `22647`, `22846`, `24229`, `24336`, `24416`, `24492`, `24530`,
`25396`, `25466`, `25784`, `26412`, `27422`, `27821`, `28025`, `28768`,
`29523`, `30133`, `30580`, `31206`, `31285`, `31505`, `31618`, `31949`,
`32335`, `32442`, `32552`, `32918`, `32983`, `33028`, `33593`, `34300`,
`34862`, `35074`, `35364`, `36226`, `36455`, `36982`, `38360`, `38775`,
`38893`, `39186`, `39439`, `39639`, `39822`, `40579`, `40700`, `41250`,
`41643`, `42021`, `43308`, `43438`, `46928`, `47849`, `48544`, `49062`,
`49843`, `51472`, `51506`, `51794`, `53226`, `53392`, `53407`, `53485`,
`54418`, `54455`, `55143`, `57034`, `57255`, `57316`, `57409`, `57822`,
`57968`, `58431`, `58674`, `59405`, `59777`, `59877`, `59883`, `60266`,
`60285`, `61178`, `61477`, `62487`, `62901`, `63243`, `63599`, `63741`,
`63886`, `65036`.

All 132 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
