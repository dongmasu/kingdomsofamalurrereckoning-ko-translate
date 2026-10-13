# Disposition and Edit Batch: `default` IDs 28251-28300

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28251-28300, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, two `not an issue`, and six uncertain.
- Accepted corrections at IDs 28251 and 28260 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28251 | `얼마를 받아낼 수 있는지` for “what kind of price you can get out of him” | Accepted: change to `그에게서 얼마를 받을 수 있는지 알아봐`. Japanese explicitly frames the line as how much the item can be sold for; the current `받아내다` adds a coercive sense not established by the source. |
| 28260 | `난 내게 필요한 걸 찾았지` for “I found it for myself” | Accepted: change to `난 그걸 스스로 찾았지`. English and Chinese refer back to the earlier “something better”; the Korean adds the unsupported “what I needed.” |
| 28286 | `#NAMED_ICON_360_A#` tutorial marker | Not an issue: the icon identity and its position in the instruction are preserved. |
| Remaining ordinary dialogue, objectives, and concise UI wording in IDs 28251-28300, excluding separately listed findings | Keep current wording. | Not an issue: no additional isolated meaning or register correction is better supported by the checked references. |
| 28252 | `보가트 칩` for “Boggart Chips” | Uncertain: English and Japanese preserve a name-like item phrase, while Chinese interprets `Chips` as fries. Confirm the item type before adapting or standardizing the label. |
| 28282 | Gallows Tree / Midden / Taibreah literary passage | Uncertain: Korean preserves the three-part deterioration and Taibreah exception, but “the sorrows in others” is poetic and locale renderings differ. Retain pending integrated literary/context review. |
| 28296 | `행맨(The Hanged Men)` | Uncertain: the source names a faction; Japanese gives a pirate-group reading, while the historical audit flags its canonical Korean name and bilingual display. |
| 28297 | `아르카디움(Arcadium)` | Uncertain: English and Japanese identify a proper name; Chinese alone renders it as “arena.” Retain the source-name reading pending glossary confirmation. |
| 28298 | `티린의 안식처(Tirin's Rest)` | Uncertain: the English presents a place name, while Japanese/Chinese suggest a town, inn, or lodging and Korean selects “sanctuary.” Confirm the referent before changing the name. |
| Other named terms in IDs 28251-28300 | Nepenth, Prophet, Ventrinio, Mel Senshir, Warsworn, Eamonn's Isle, Angharad, Cape Solace, Gallows Tree, Midden, Taibreah, pre-Arcane Age, Hand of Lyria, Tirin's Rest, and Kandrian | Uncertain: preserve current identities and defer spelling, title/rank, faction, place, and literary terminology to the corpus-wide glossary/context pass. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- Each locale contains IDs 28251-28300 once and in identical order. Embedded
  line-break counts and normalized runtime-token identities/order match. The
  icon marker at ID 28286 is intact.
- Only Korean `Texto` at IDs 28251 and 28260 changed. No source CSV, key,
  row order, or variant structure changed.
- Active default CSV SHA-256:
  `8cb6ab2bb3595da65fc8480678131cd0e3a53473d276cecacd579570c3861276`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 874 accepted, 2,999 `not an issue`, and
  4,986 uncertain (8,859 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28301; 36,834 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
