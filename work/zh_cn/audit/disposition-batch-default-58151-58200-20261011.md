# Disposition Batch: `default` IDs 58151-58200

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 34 `not an issue` IDs, and 14 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not the
  Japanese-language reference.

## Accepted Corrections

| ID | Previous Korean / affected text | Applied Korean / replacement | Rationale |
| ---: | --- | --- | --- |
| 58154 | `그곳에 가서 아메테어와 담판을 지어야 한다.` | `그곳에 가서 아메테어를 상대해야 한다.` | Follow accepted D-2432 at ID 8649: English `deal with` is nonspecific, Japanese says confront, and Chinese says negotiate. `담판` overcommits to negotiation; `상대하다` preserves the broader meaning. |
| 58156 | Three repetitions of `과부가 걸어온다.` | First: `위도우(The Widow)가 걸어온다.`; later repetitions: `위도우가 걸어온다.` | The capitalized Widow is the named spider-ruling figure in the Webwood context. Reuse accepted terminology at D-703/D-3054 and preserve the refrain without changing its two embedded line breaks. |

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17555 | 58155 | Paid reset/refund behavior is clear; the canonical Korean service label for `Unbinding your destiny` is not established. |
| D-17556 | 58159 | The faithful friendship and recovery of Rhyderk's Sword are retained; proper-name spellings and the unusual `knight-hands` role remain unresolved. |
| D-17557 | 58162 | The theft and revenge-weapon search are retained; the identity and canonical Korean name of the Glass of Ambient are unresolved. |
| D-17558 | 58163 | Relief at sitting outdoors is preserved, but `야생의 풍경을 바라보며` narrows “enjoyed the wild” to viewing scenery. |
| D-17559 | 58166 | The eager production tone is retained; English `play` does not establish whether the completed item is the play or its script. |
| D-17560 | 58168 | The mortal-directed blessing is retained; English `Keep well after Alarane` is awkward and does not settle whether the instruction is to care for or stay with Alarane. |
| D-17561 | 58169 | The claim to serve in the Alfar army and absence of papers are retained; Korean narrows the unspecified papers to identity-verification documents. |
| D-17562 | 58175 | The sparking key fitting into Marus Torix's book is retained; `책장` can mean a page or bookshelf, and the exact across-page relation needs context. |
| D-17563 | 58177 | The scout's body, reconnaissance, and scent-tracking objective are retained; `his` has multiple male antecedents and name/faction forms need alignment. |
| D-17564 | 58184 | The soldiers' return to Mithros and the people's distance from war are retained; `It's a lot` has emotional/significance readings across locales, while `큰일` can imply trouble. |
| D-17565 | 58186 | The Codex reading, lack of predetermined fate, eastern threat, and need for help are retained; the Korean adds a “lying in wait” image and proper names remain provisional. |
| D-17566 | 58189 | Both the Warlord's endurance and destructive effects are retained; canonical class/title terminology remains open. |
| D-17567 | 58194 | The chalice's transformation of any liquid into fine wine is retained; its canonical artifact name remains unconfirmed. |
| D-17568 | 58199 | The standalone Alyn label is retained; active Korean spellings for Alyn Shir vary and no canonical form is established. |

## Not an Issue

The 34 IDs are 58151-58153, 58157-58158, 58160-58161, 58164-58165,
58167, 58170-58174, 58176, 58178-58183, 58185, 58187-58188,
58190-58193, 58195-58198, and 58200. They preserve evident meaning,
voice/register, structure, runtime markers, and values.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58151-58200 once
  and in identical ascending key order; each full default file contains
  65,135 records.
- ID 58156 retains its two embedded newline characters in all four locales.
  The `$M0_SQ06.total_cost$` token at 58158, `#NAMED_ICON_360_A#` at 58190,
  and `{1}` at 58193 remain intact and in order. No numeric discrepancy was
  found.
- Reconciled the historical source-keyed prompts for IDs 58150-58249.
  Applicable questions are retained above. The Ametair wording also follows
  accepted D-2432 at ID 8649; the Widow name follows accepted D-703/D-3054
  and the related established usage at ID 38003.
- The byte-identical pre-edit backup is
  `/private/tmp/ko-translate-backups/20261011/before-58151/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `85450fbeeb4974a39be47f5e6121c88cdba450642f645b1e665ea21a83c45218`).
  Only the Korean `Texto` cells at IDs 58154 and 58156 changed. The active
  CSV retains its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings.
- Post-edit active default CSV SHA-256:
  `5b21c9f2dea2df846c0845dc6ff26bdc72aa5145dd7cf498197e9c918aadf93f`.

D-17553-D-17554 record the two accepted corrections; D-17555-D-17568 record
14 uncertain findings; D-17569 records the remaining 34 `not an issue` IDs.
Direct register totals: 1,706 accepted, 12,282 `not an issue`, and 10,988
uncertain (24,976 total); next D-17570.

Resume at `default` ID 58201; 6,934 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
