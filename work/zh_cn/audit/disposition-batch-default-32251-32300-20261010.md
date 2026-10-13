# Disposition Batch: `default` IDs 32251-32300

- Decision date: 2026-10-10.
- Scope: all 50 rows and preliminary findings for IDs 32251-32300, compared
  across English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring terminology,
  line breaks, and runtime tokens.
- Decisions: one accepted, six `not an issue`, and eleven uncertain.
- CSV changes: ID 32252.

## Findings

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 32251 | `Unsocketable Items` / `보석 장착 불가 아이템` | Uncertain: English, Japanese, and Chinese differ on whether the label means items that cannot accept a socket/gem or items that cannot be equipped; standalone UI context is insufficient. |
| 32252 | `For the House of Ballads` / `발라드 가문을 위하여` | Accepted: change to `발라드의 집을 위하여.` Reuse the established named-faction form accepted at ID 31544 (D-10221). |
| 32256 | Six-line Great Cycle / Arcane Veil history | Uncertain: all six lines and the sequence are retained, but `Lord Ohn culled his strength` and the referent of `its destruction` remain disputed among English and locale readings. |
| 32259 | `Ohn's Stand` / `온의 진지` | Uncertain: it may be a place/fortress or refer to Ohn's resistance; the locale references do not settle the name's meaning. |
| 32265 | Two-paragraph Night of Fire and Blood history | Uncertain: the paragraphs and event sequence are retained, but the compressed English syntax and image of fires seen from Rathir need broader context. |
| 32269 | Route through `the Pryderi` | Not an issue: Korean preserves leaving the shop, going left through the named Pryderi, and finding Favian Tyrn; its exact institutional type is not needed to understand this instruction. |
| 32276 | `Global Associate Product Manager` retained in English | Uncertain: English/Japanese retain the title and Chinese translates it; the isolated row does not establish whether this is a player-facing credit or test text. |
| 32277 | `LMENU` / `왼쪽 메뉴` | Uncertain: Japanese and Chinese expand the left-menu meaning, but it is unclear whether the English all-caps string is an internal control identifier that should remain literal. |
| 32282 | Faeblades passive and `{*1[지속 효과]}` | Not an issue: the passive wrapper, label, mastery claim, and Summer Court Fae relation are preserved. |
| 32283 | `sent to his maker` / `저승에 보내다` | Not an issue: Korean preserves the rumor and euphemistic implication that the speaker wishes to have killed Castor, supported by Japanese and Chinese. |
| 32285 | North-sea captains using a small dose | Uncertain: Korean retains small quantities, sleepless watches, and floating-ice danger, but the antecedent of `it` and exact use depend on surrounding context. |
| 32287 | Pellewyn / Mydara's Mists at Dawn | Uncertain: both artistic images are retained, but personal/place-name spellings need integrated terminology alignment. |
| 32294 | `Ancient Varani Text` / `고대 바라니어 문서` | Uncertain: the standalone label may name a particular text or describe a document written in Ancient Varani. |
| 32295 | Blood Rite / Red Legion ties | Uncertain: the completed rite and severed relationship are retained, but active Korean alternates between `피의 의식` and `혈의 의식`; the canonical name remains open. |
| 32297 | `Camp Moondown` / `문다운 캠프` | Not an issue: the source name is transliterated and remains distinct from Moon Camp; variation in parenthetical display does not establish a row-local error. |
| 32300 | `Moon Camp` / `문 캠프` | Uncertain: the anecdote is preserved, but the active corpus varies among `문 캠프`, `달 야영지`, `달의 야영지`, and `달빛 야영지`. |
| 32251-32300 | Four-locale row order, line breaks, and runtime markers | Not an issue: each locale contains the same 50 IDs in the same order; the poem, two-paragraph history, stat break, passive wrapper, and numeric values are preserved. |
| Remaining ordinary text in IDs 32251-32300 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported semantic or Korean-usage defect was identified beyond the dispositions above. |

## Verification

- English, Japanese, Chinese, and Korean each contain all 50 IDs exactly once
  and in identical order.
- Embedded line-break counts match throughout the range, including the
  six-line passage at ID 32256, two-paragraph history at ID 32265, and the
  stat break at ID 32270.
- The `{*1...}` passive wrapper at ID 32282, values `24-42` and `14` at ID
  32270, and all inspected runtime markers retain their identities and order.
- ID 32252 now reads `발라드의 집을 위하여.`
- Active default CSV SHA-256 is
  `25d66dc6c490c7ba7dfd829e514622481328448c817b51b5e219c4bdc41056af`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- Register totals after this batch: 976 accepted, 3,602 `not an issue`, and
  5,894 uncertain (10,472 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 32301; 32,834 `default` IDs remain.

These working dispositions are not independent linguistic approval.
