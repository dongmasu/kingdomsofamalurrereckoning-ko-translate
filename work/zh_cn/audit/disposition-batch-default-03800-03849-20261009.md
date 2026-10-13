# Disposition and Edit Batch: `default` IDs 3800-3849

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 3800-3849.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Twenty findings were dispositioned: four accepted, six `not an issue`, and
  ten uncertain. Four accepted corrections were applied to four `Texto`
  cells.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3801 | `Blessing of the Destroyer` | Retain pending confirmation whether Destroyer is a title, deity, or enemy. | D-821: uncertain. |
| 3802 | `Ghennig` | Retain the phonetic draft; no canonical Korean place-name form is established. | D-822: uncertain. |
| 3806 | Unspecified `him` | Keep the English ambiguity; Japanese alone specifies a younger brother. | D-823: uncertain. |
| 3809 | Unnamed source of Summer Court magic | Keep the source's unnamed `It`; do not invent its antecedent. | D-824: not an issue. |
| 3810 | Incomplete Arkes fragment | Retain the unfinished wording; the English/Chinese fragment does not support a completion. | D-825: uncertain. |
| 3814 | Eventide clan / pass | Retain pending canonical name and pass-versus-valley context. | D-826: uncertain. |
| 3815 | Nearby work/contracts | Korean preserves the omitted object and contract/payment sequence; no specific board is established. | D-827: not an issue. |
| 3818 | `sagecrafting` | Retain the established project term `마법물품 제작`. | D-828: not an issue. |
| 3819 | `When they do` / double concessive | Restore the temporal clause and simplify the Korean without guessing the antecedent of `they`. | D-829: accepted. |
| 3826 | Nyralim wood / Tasker's Throne | Retain pending whether Throne is a seat, audience hall, or other named structure. | D-830: uncertain. |
| 3827 | Dirgesinger | Retain pending whether the compound is a proper title/name or should be translated. | D-831: uncertain. |
| 3828 | Unbound Shrine | Retain pending the lore status of Unbound and the canonical shrine term. | D-832: uncertain. |
| 3831 | Bisarane / the Sorrows | Make Bisarane the explicit agent who began unleashing the Sorrows; do not resolve the Sorrows' identity. | D-833: accepted. |
| 3833 | Plaguetimes / First Burning | Apply the established `제1차 대화재` form and consistently mark both capitalized historical names. | D-834: accepted. |
| 3834 | Six spoken / twelve readable languages | Korean preserves both counts and the boast. | D-835: not an issue. |
| 3837 | The Champion ballad | Render undertaking the ballad with caution as `신중하게 임하다`, not handling an object. | D-836: accepted. |
| 3842 | Mitharans | Retain pending whether this denotes a people/culture or Mitharu worshippers. | D-837: uncertain. |
| 3845 | `Higher` | Retain pending the UI context and whether it denotes height, rank, value, or option. | D-838: uncertain. |
| 3846 | Fomorous Hugues | Retain `포모러스 휴그`, the dominant form in the active Korean corpus. | D-839: not an issue. |
| 3849 | Warden Rask / investigation | Retain `교도관` and the body/clue investigation sequence, supported by English and Chinese. | D-840: not an issue. |

Historical questions for same-numbered `base` item rows, including IDs
3802-3805, 3814-3815, 3819, 3825, and 3833, remain separate from these
`default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 3819 | `그들이 그렇게 하더라도, 네가 운명에 묶여 있지 않을지라도 죽음은 널 찾아올 수 있다는 걸 알아 둬.` | `그들이 그렇게 하면, 네가 운명에 얽매이지 않더라도 죽음은 널 찾아올 수 있다는 걸 알아 둬.` | D-829 |
| 3831 | `비사라네(Bisarane)를 죽였지만, 그 전에 비탄의 힘(Sorrows)을 풀어놓기 시작했어. 타이브리아(Taibreah)에게 알파르(Alfar)가 그들에게 해를 입지 않게 막을 방법이 있는지 물어봐야 해.` | `비사라네(Bisarane)를 죽이긴 했지만, 그자는 그전에 이미 비탄의 힘(Sorrows)을 풀어놓기 시작했어. 타이브리아(Taibreah)에게 알파르(Alfar)가 그들에게 해를 입지 않게 막을 방법이 있는지 물어봐야 해.` | D-833 |
| 3833 | `기념비: 역병의 시대와 '첫 번째 불태움'` | `기념비: 역병의 시대(Plaguetimes)와 제1차 대화재(First Burning)` | D-834 |
| 3837 | `그녀의 명령을 따라야 하지만, 어떻게 할지는 신중히 정하자. 이 발라드 '챔피언(The Champion)'은 아주 조심해서 다뤄야 해.` | `그녀의 명령을 따라야 하지만, 어떻게 할지는 신중히 정하자. 이 발라드 '챔피언(The Champion)'은 아주 신중하게 임해야 해.` | D-836 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  3800-3849 once and in identical order.
- Embedded line-break counts match across the four locales in this range.
  ID 3805 retains its source break; ID 3810 remains an incomplete source
  fragment. The four accepted edits do not alter keys, row order, line
  breaks, variables, or marker structure.
- No immutable source, sidecar, variant, or non-`work/zh_cn/` file was edited.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `bf68c4584037348aaf5fd363c16a8ab3a17309a128469f26cf5f335ce94e9b56`
- Current cumulative dispositions: 194 accepted, 145 `not an issue`, and
  501 uncertain. Resume at `default` ID 3850.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
