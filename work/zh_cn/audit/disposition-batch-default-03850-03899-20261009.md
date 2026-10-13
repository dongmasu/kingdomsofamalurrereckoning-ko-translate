# Disposition and Edit Batch: `default` IDs 3850-3899

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 3850-3899.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Twenty-four findings were dispositioned: five accepted, eleven `not an
  issue`, and eight uncertain. Five accepted corrections were applied to
  five `Texto` cells.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3851 | Gwyn/Crudok vulgar impossible-claim idiom | Replace the literal anatomy assertion with a natural Korean impossibility idiom. | D-841: accepted. |
| 3859 | Destiny description / personal-space joke | Retain the joke and align the final address with the formal description register. | D-842: accepted. |
| 3863 | Freemen lurking to murder and steal | Clarify in natural Korean that they hide and wait for opportunities to kill and steal. | D-843: accepted. |
| 3864 | Steg is deliberately lied to | Korean preserves the lie and its present/future consequences. | D-844: not an issue. |
| 3866 | Construction journal / shame and envy | Korean preserves the source's boastful relations and ship-based construction details. | D-845: not an issue. |
| 3867 | `We emerge together` | Replace the literal `함께 나타난다` with natural collective progress; retain all four clauses. | D-846: accepted. |
| 3868 | `Primos` | Retain the established corpus transliteration `프리모스`. | D-847: not an issue. |
| 3869 | `hex` game value | Retain pending the game-rule meaning; English/Japanese and Chinese differ. | D-848: uncertain. |
| 3875 | `chasing shadows` | Retain the idiomatic Korean `헛것을 쫓다` reading. | D-849: not an issue. |
| 3876 | Formal letter opening | Retain the conventional respectful Korean greeting. | D-850: not an issue. |
| 3879 | Britt Hagni's `final resting place` | Retain pending whether this means a grave or last known location. | D-851: uncertain. |
| 3882 | Lord Creth/Nix poem | Retain pending literary/source reconciliation; the locale versions differ in the introduction and poem details. | D-852: uncertain. |
| 3883 | Teaching/dialogue line | Korean preserves that the speaker has taught what they can and is ending the lesson/conversation. | D-853: not an issue. |
| 3885 | Maire, Queen of Cups | Retain pending canonical Maire spelling and title/name order. | D-854: uncertain. |
| 3886 | `One of the Gwynedds` | Retain pending whether Gwynedds are a family, people, or group. | D-855: uncertain. |
| 3888 | Storage-space variable | Korean preserves `$NUM0`, MB, and both instructions. | D-856: not an issue. |
| 3891 | Fae-knights poem | Retain pending whole-poem review of names, knight imagery, and lore; preserve lineation. | D-857: uncertain. |
| 3892 | Akara's flock | Retain the supported religious flock metaphor and practical-wisdom clause. | D-858: not an issue. |
| 3893 | Battle of Mel Senshir | Retain the accurate Korean battle label. | D-859: not an issue. |
| 3894 | Teers / crew count | Retain the four-person count and Teers's idea/map roles. | D-860: not an issue. |
| 3896 | `Good day to you` | Replace the literal good-day wish with a natural greeting. | D-861: accepted. |
| 3897 | Canneroc upgrade-cost variable | Retain the exact runtime token and localized unit. | D-862: not an issue. |
| 3898 | Capitalized `the House` | Retain pending whether it means the House of Ballads or another entity. | D-863: uncertain. |
| 3899 | Titarion's `cycle` | Retain the plausible seasonal reading pending the lore-specific referent. | D-864: uncertain. |

Historical questions for same-numbered `base` items, including IDs 3856,
3860, 3863, 3867, 3876, 3882-3883, 3888-3889, and 3896-3899, remain
separate from these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 3851 | `그윈(Gwyn)이 범인이라면 내가 크루독(Crudok) 엉덩이다.` | `그윈(Gwyn)이 범인이라면 내 손에 장을 지지.` | D-841 |
| 3859 | `...적들은 감히 네 개인 공간을 침범하기도 전에 쓰러집니다.` | `...적들은 감히 당신의 사적인 공간을 침범하기도 전에 쓰러집니다.` | D-842 |
| 3863 | `...프리맨(Freemen)들이 곳곳에 숨어 살인과 도둑질을 노리고 있어.` | `...프리맨(Freemen)들이 곳곳에 숨어서 사람을 죽이고 물건을 훔칠 기회만 노리고 있어.` | D-843 |
| 3867 | `우리는 함께 엮인다./우리는 함께 나타난다./모든 필멸자는/속박 없는 길로 부름받는다.` | `우리는 함께 엮인다./우리는 함께 나아간다./모든 필멸자는/속박 없는 길로 부름받는다.` | D-846 |
| 3896 | `좋은 하루 보내세요.` | `안녕하세요.` | D-861 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  3850-3899 once and in identical order.
- Embedded line-break counts match across the four locales in this range.
  ID 3866 retains its multiline journal; ID 3867 retains four
  slash-separated clauses; IDs 3882 and 3891 retain their poem lineation.
  IDs 3888 and 3897 retain their runtime variables exactly.
- The five accepted edits do not alter keys, row order, line breaks,
  variables, or marker structure.
- No immutable source, sidecar, variant, or non-`work/zh_cn/` file was edited.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `734b2e83178cbb0dffd987ceb700d5e6f4b747b917e12d87ff2c992776cc14bd`
- Current cumulative dispositions: 199 accepted, 156 `not an issue`, and
  509 uncertain. Resume at `default` ID 3900.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
