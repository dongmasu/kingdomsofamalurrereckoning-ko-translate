# `SQ16` / Canneroc and Webwood Quest Revalidation

- Date: 2026-11-11.
- Scope: all 107 `default` IDs linked to `522638.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Six correction candidates and five evidence-limited holds are recorded.
  No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `SQ16`, 107 distinct localization keys, two
NPC symbols (`NPC_DAL_ALM_GaranerVernt` and `NPC_DAL_VAR_Barten`), and 45
serialized `dialog_line_*` handlers. Its conditional quest-state names
include `find_barten`, `garaner_deal`, `killed_barten`, and `saved_barten`,
showing that the asset includes different outcome states. This supports
grouping the rows with the Canneroc/Webwood quest involving Garaner Vernt and
Barten. The asset-level NPC symbols and handler serialization do not map an
individual key to either NPC, a callback, a branch, an addressee, or playback
position. Per-key speaker attribution and dialogue order remain unknown.

All 107 rows were compared across English, Japanese, Chinese, and active
Korean. Seven exact-English duplicate groups occur in the asset; each group
has identical Korean text. No reviewed row has a line-break, runtime
placeholder, or markup difference between the four locales.

Previously accepted dispositions were not reopened. In particular, ID
`3875` retains its accepted idiomatic `헛것이나 쫓다` reading; ID `21532`
retains the corrected outcome without an invented reward/exchange relation;
and ID `37180` retains its previously corrected conversational register.
The name `Gossamer End` is already paired in the active Korean at IDs
`30038` and `40490`.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `11438` | Naturalness / speech level | `get yourself accommodated with your new quarters quickly` is expressed as `새 숙소에 빨리 익숙해지게`, an awkward directive with marked `-게` speech. Japanese also gives a plain directive to see the new home and return. Consider `새 숙소에 얼른 적응해. 요르반 성(Castle Yolvan)으로 보내야 할지도 모르겠어.` This is a row-level source comparison, not an attribution to a particular NPC. | Medium |
| `19323` | Speech level / naturalness | Korean `자네 일은 어떻게 되어 가나?` uses marked `하게체`; Japanese is plain and asks how the player's work is going. Consider a conversational form such as `여기서도 할 일이 있지만... 네 일은 어떻게 돼 가?` No shared speaker voice is inferred. | Medium-high |
| `30038` | Naturalness / speech level | `날 구해 준 보답으로 고맙다는 말을 하고 싶어` awkwardly frames the thanks as a reward, and `자네에게 주겠네` shifts to marked older-style speech. The English and Japanese thank the player and offer the house for their use. Consider `날 구해 줘서 고마워. 마을에 있는 집 고서머 엔드(Gossamer End)도 네가 써도 좋아.` | Medium-high |
| `30290` | Speech level / naturalness | `자네처럼` introduces an old-fashioned address in an otherwise conversational line; Japanese is plain and Chinese is neutral. Consider changing only the address/register, for example `나에겐... 캐너록(Canneroc)에도 너처럼 특별한 재주를 가진 사람이 필요해.` The speaker is not assigned. | Medium |
| `40490` | Speech level | Korean uses `그대`, `-겠소`, and `-것이오`, while Japanese is plain and Chinese is neutral. Consider a plain conversational rendering, for example `이번 일에 대한 보답으로 우리가 가진 몇 안 되는 집 중 하나인 고서머 엔드(Gossamer End)를 줄게. 마을 대장장이 빌리스 에이데(Billis Aideh)가 필요한 대로 개조해 줄 거야.` The line is not attributed to Barten or Garaner. | Medium |
| `59947` | Format / title | `A Tangled Web` appears among the `SQ16` quest asset's strings and is rendered `얽힌 거미줄`. The translation preserves the title's web imagery; consider adding the original title as `얽힌 거미줄(A Tangled Web)` if quest-title labels in this resource are to follow the project's bilingual-name convention. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `14316` | Meaning / role | English calls Barten the village's `chief defender`, Japanese calls him a militia captain, and Chinese/Korean use broader defender wording. Other SQ16 rows identify him as the militia captain, but the sources do not establish whether `chief defender` is a formal office or descriptive wording. Retain the current `수석 방어관` pending a role/title decision. This carries forward the historical uncertainty rather than resolving it from asset co-occurrence alone. |
| `15517`, `15812`, `21937` | Speech level / text type | The Korean uses `-습니다` (`사망했습니다`, `없습니다`, `배신했습니다`) where Japanese is plain. These short outcome statements may be quest-state/journal text rather than spoken dialogue, and the asset does not map them to speakers or display contexts. Retain pending evidence of text type; do not assign an NPC voice. |
| `15771` | Meaning / scene context | The earlier review held the source of the cave traces and the “bloody Widow” inference. The SQ16 context confirms the Webwood/Widow quest topic but does not establish who left the footprints or torn webs. Preserve the existing hold; the active `위도우(The Widow)` name form is consistent with the established character rendering. |

## Retained Text

The other 96 rows were retained after comparison. This includes all seven
exact-English duplicate groups, whose Korean translations already match,
and the repeated quest, place, and character labels. The asset's conditional
outcome states were not treated as a linear dialogue sequence. No speaker,
gender, branch order, or playback order was inferred from IDs or serialized
handler names.

## Complete Reviewed ID Set

The exact 107-ID membership is represented by the asset links in
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) and the
corresponding fingerprinted rows in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
