# Disposition and Edit Batch: `default` IDs 30301-30350

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  30301-30350, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, recurring terminology, and
  source-keyed historical notes.
- Decisions: three accepted, three `not an issue`, and twelve uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 30301 | `이젠 아무렇지도 않아. 그들은 내 숨을 들일 가치도 없어.` | `이젠 아무렇지도 않아. 그들과 말 섞을 가치도 없어.` | English `they're not worth my breath` is a dismissive idiom about not spending speech or attention on them. The literal Korean suggests they are not worth breathing for; the proposed line preserves the contempt naturally. |
| 30314 | `자신의 괴롭히던 자` | `자신을 괴롭히던 자` | The wounded soldier is pleased that the person who tormented him was slain. The object particle was malformed; English, Japanese, and Chinese support `자신을`. |
| 30331 | `레드 리전의 로그 메드거와 오스거 크라스트` | `레드 리전의 메드거와 오스거 크라스트` | The English names Medgar and Osgar Krast, then calls both men rogues in the next sentence. Korean's extra `로그` inserts an unsupported class/role and duplicates the following characterization. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30302, 30304-30305, 30307-30311, 30313, 30315, 30317-30322, 30324-30326, 30329-30330, 30332, 30334-30337, 30339-30341, 30344-30345, 30347, 30349-30350 | Remaining dialogue, objectives, item descriptions, and labels | Not an issue: the Korean retains the evident source meaning and register at preliminary level. Proper names and lore terms are tracked separately where needed. |
| 30303 | Poison effect values and duration | Not an issue: the 15% per-hit chance, 40 Poison Damage, five-second duration, and 25% sustained cost are retained in the matching two-line structure. |
| 30343 | Junk and merchant tutorial markup | Not an issue: `{1}`, `{*1junk}`, and `{*1merchant}` retain their identities, indices, order, and localized payload positions; the one-button sale instruction remains. |

## Uncertain

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30303 | `Sustained Cost: 25% Mana` | Uncertain: the Japanese explicitly says 25% of maximum mana, while English and Chinese do not specify the mana pool. Keep the existing number and defer the exact stat meaning and Korean label. |
| 30306 | `the spiders got them` | Uncertain: the context strongly implies the parents died, but Korean states directly that the spiders killed them, while English is colloquial and Chinese says they were attacked. |
| 30312, 30323 | Scav / scav-skin | Uncertain: the Korean transliteration is internally consistent, but Chinese describes acid-spitting creatures and historical findings leave Scav's species/group status unresolved. |
| 30316 | `Farm boy` | Uncertain: Korean changes the compact identity to “grew up on a farm”; English and Chinese support a farm-boy identity while Japanese says shepherd. The exact social/occupational nuance needs context. |
| 30327 | Flowering | Uncertain: capitalization may indicate a named rite or event; Japanese explicitly calls it a rite, while Chinese reads it as a flowering period. |
| 30328 | Hyperian / Hyperian rising | Uncertain: this row spells the entity `히페리안`, while ID 30111 uses `히페리온` for the same English spelling. The entity's nature and the verb describing its rise also need lore context. |
| 30333 | The Crossing | Uncertain: the capitalized term may be a named site or a generic passage, and the corpus's bilingual display convention is unsettled. |
| 30338 | `be reborn to it` | Uncertain: the antecedent of `it` is not explicit. Korean resolves it as the time for healing, but the English and other locale renderings do not establish that reading conclusively. |
| 30342 | Travelers | Uncertain: capitalization and context suggest the named faction/order, while Korean uses a generic plural. Align with the corpus-wide faction convention. |
| 30346 | Hireling | Uncertain: it may be a generic hired worker, formal rank, or class/title. Locale renderings differ and no canonical Korean term is established. |
| 30348 | Hierophant | Uncertain: Korean renders it as `대사제`, while many rows use `히에로판트`; the active corpus contains both forms. Do not normalize this isolated occurrence before deciding the global title convention. |
| Other named terms in IDs 30301-30350 | Lyria / Crows / Cartery Jayck / Windstones / Dark Harbor / Benwick Athelm / Skald Atlas / Matrim Hawkins / Hyperian / Medgar and Osgar Krast / Crossing / Drewn Ansilla / Long Winter / Grim Onwig / Argine / Travelers / Guian and related terms | Uncertain: canonical spelling, faction/title display, and lore-name conventions require integrated glossary review. Ordinary sentence meaning was dispositioned separately where clear. |

## Verification

- IDs 30301-30350 occur once and in ascending order in English, Japanese,
  Chinese, and Korean. All four files contain 65,135 rows.
- Embedded line-break counts and normalized runtime-token identities/order
  match across the four locales. The seven-paragraph 30301 journal layout,
  two-line 30303 effect, and 30343 tutorial markers are preserved.
- The values at 30303 and the 10-stack cap at 30320 are unchanged.
- Only the three accepted Korean `Texto` cells at IDs 30301, 30314, and
  30331 changed. The UTF-8 BOM, 72,046 CRLF endings, and 39 existing bare-LF
  endings are preserved.
- Active default CSV SHA-256:
  `2d88766713098179351139699bf1483fba924dce442776e7f5e286180ba5a61e`.
- Register totals after this batch: 916 accepted, 3,417 `not an issue`, and
  5,487 uncertain (9,820 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 30351; 34,784 `default` IDs remain.

These working dispositions are not independent linguistic approval.
