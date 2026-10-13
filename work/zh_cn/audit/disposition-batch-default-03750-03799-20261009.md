# Disposition and Edit Batch: `default` IDs 3750-3799

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 3750-3799.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Twenty findings were dispositioned: six accepted, six `not an issue`, and
  eight uncertain. Six accepted corrections were applied to six `Texto`
  cells.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3750 | Historical `Apotyre` question | No edit; the active row is about strange lights seen from a mountain and contains no `Apotyre`. | D-801: not an issue; historical question is mis-keyed for this row. |
| 3751 | `Testament` versus Belen Covenant | Retain current English-based rendering; the locale-name conflict is unresolved. | D-802: uncertain. |
| 3753 | House of Ballads' function | Retain `발라드의 집 ... 하는 곳`; the meaning is supported and no definite category error is established. | D-803: not an issue. |
| 3755 | Master's Pick | Retain `달인의 자물쇠따개`; all references identify a lock-opening tool. | D-804: not an issue. |
| 3760 | Daughter of Lyria / devoted Sons and Daughters | Keep the affiliation title but render the broader group as worshippers, avoiding literal parentage/gender wording. | D-805: accepted. |
| 3761 | Plagueshield | Retain the proper-name form; the sources do not establish whether it is medicine, ingredient, or treatment. | D-806: uncertain. |
| 3762 | Crows sentence | Replace the awkward comparison with natural Korean; retain the match result and second-match count. | D-807: accepted. |
| 3763 | `grants his blessing` | Retain the Korean permission reading supported by Japanese and Chinese. | D-808: not an issue. |
| 3765 | `Echoes Of Fate - Projectile` | Retain pending confirmation whether it is visible UI or an internal asset label. | D-809: uncertain. |
| 3771 | Interrupted utterance | Retain; all sources are fragmented but do not establish the same exact unfinished clause. | D-810: uncertain. |
| 3773 | `reclaim our brethren` | Retain pending context because the references differ between reclaiming, reforming, and recovering the group. | D-811: uncertain. |
| 3774 | `Even` | Retain pending the UI/game context; Japanese indicates even-number and Chinese tie. | D-812: uncertain. |
| 3775 | Guidance wording | Replace the stiff `방향 제시` calque with a natural guidance phrase and retain the speaker's punchline. | D-813: accepted. |
| 3776 | Research / misspelled `neccessary` | Retain; Japanese confirms the research reading and the source typo does not alter meaning. | D-814: not an issue. |
| 3781 | Brothers of St. Odwig | Retain `수도사들`, supported by Japanese's explicit monk term. | D-815: not an issue. |
| 3782 | Testament spared the speaker | Make the speaker explicit as the person spared; retain the Testament/Belen naming conflict as unresolved. | D-816: accepted. |
| 3788 | Cairn “relates” the ballad | Clarify that the Cairn conveys the ballad's story, supported by Japanese and Chinese. | D-817: accepted. |
| 3790 | `Pilager` | Retain the source-based phonetic form; a likely typo is not authority to silently change a named item. | D-818: uncertain. |
| 3795 | Brigand Hall | Retain pending resolution of the English/Chinese hall versus Japanese cave difference and canonical name. | D-819: uncertain. |
| 3799 | `breach of honor` | Replace the misleading defamation sense with an idiomatic expression for having one's honor violated. | D-820: accepted. |

Historical questions for same-numbered `base` item rows, including IDs
3762-3763, 3778, and 3786, were not merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 3760 | `우리 사원에 온 걸 환영해. 나는 리리아(Lyria)의 딸이야. 이곳에 헌신한 수많은 아들과 딸 중 하나지.` | `우리 사원에 온 걸 환영해. 나는 리리아(Lyria)의 딸이야. 이곳에 헌신한 신도는 나 말고도 많아.` | D-805 |
| 3762 | `보딘 보그(Bodine Borgue)와 그의 마법사들은 나와 크로우즈(The Crows)의 상대가 아니었어. 용맹의 투기장에서 두 번째 경기를 이겼지.` | `보딘 보그(Bodine Borgue)와 그의 마법사들은 나와 크로우즈(The Crows)에게 상대가 되지 못했어. 용맹의 투기장에서 두 번째 경기를 이겼지.` | D-807 |
| 3775 | `...그에게는 약간의 방향 제시가 필요했어. 내가 그 역할을 했고.` | `...그에게 필요한 건 앞길을 잡아 줄 사람이었어. 그게 나였고.` | D-813 |
| 3782 | `...그들이 내 가족을 죽였지만... 난 살려 뒀어...` | `...그들은 내 가족을 죽였지만... 나만은 살려 줬어...` | D-816 |
| 3788 | `...발라드와 관련이 있습니다...` | `...발라드의 이야기를 전합니다...` | D-817 |
| 3799 | `이런 명예 훼손에 대비할 방법은 없었어.` | `이렇게 명예를 더럽히는 짓까지 당할 줄은 몰랐어.` | D-820 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  3750-3799 once and in identical order.
- Embedded line-break counts match across the four locales in this range.
  ID 3770 retains `{*1...}` and its source break; ID 3788 remains two
  sentences. The six accepted edits do not alter keys, row order, line
  breaks, variables, or marker structure.
- No immutable source, sidecar, variant, or non-`work/zh_cn/` file was edited.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `3ba3e10070793aa389f79e586b188d6145cc38b2dc072e917f63fe43393ee218`
- Current cumulative dispositions: 190 accepted, 139 `not an issue`, and
  491 uncertain. Resume at `default` ID 3800.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
