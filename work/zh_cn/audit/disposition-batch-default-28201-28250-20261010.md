# Disposition and Edit Batch: `default` IDs 28201-28250

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28201-28250, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: one accepted, two `not an issue`, and six uncertain.
- The accepted insult-strength correction at ID 28218 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28218 | `이 거짓말쟁이!` for “You're a lying dog!” | Accepted: change to `이 거짓말쟁이 자식!`. English uses `dog` as an insult, and Japanese `野郎` confirms a rough personal insult. The current Korean accusation is accurate but too mild for the source's force. |
| 28222, 28226 | Save-capacity choices and hammer damage values | Not an issue: both save-data alternatives are present, and `+20` Physical Damage and `+35%` Hammer Damage remain distinct with their units and line separation. The Japanese-only extra break at 28222 is not copied because English, Chinese, and Korean are single-line. |
| Remaining ordinary dialogue, objectives, and concise UI wording in IDs 28201-28250, excluding separately listed findings | Keep current wording. | Not an issue: no additional isolated meaning or register correction is better supported by the checked references. |
| 28207 | Hospitalis Quarters / Adessa human merchants | Uncertain: English names the Hospitalis Quarters, while Japanese generalizes it as a relief area and Chinese describes medical barracks. The task's donation relation is retained, but the canonical institution term remains open. |
| 28214 | Desert Runner / bird / Rattlesnake tale | Uncertain: the English tale shifts from “the bird” to a reply attributed to Desert Runner and later addresses Rattlesnake; Japanese and Chinese retain similar attribution tension. Preserve the current sequence and paragraph structure pending source context. |
| 28237 | `시체 확인하기` for “Identify the Corpses” | Uncertain: English and Chinese support identifying corpses, while Japanese says to check them. Korean may mean inspect rather than identify; determine the in-game objective action before changing it. |
| 28241 | King's Thimble venue name | Uncertain: the Korean keeps the literal name and English in parentheses, and Japanese/Chinese also render it literally. Whether this wordplay should be adapted or retained needs a consistent proper-name policy. |
| 28242 | Scion / Akara / Dead Kel names and role | Uncertain: all locales support the sequence of events, but canonical Korean forms for the title and setting names remain part of corpus-wide glossary alignment. |
| Named terms across IDs 28201-28250 | Gravehal, Adessa, Apule, Plagueshield, Lyria, Tychon, Draug's Toothpicks, Hanged Men, Mitharu, Dead Kel, Blades and the Seal, Idylla, and Rathir | Uncertain: retain current identities and meanings pending the historical audit's corpus-wide name, faction, item, and place-term alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- The existing preliminary scan records matching IDs/order, runtime-token
  structure, and English/Chinese/Korean line breaks; the Japanese-only break
  difference at 28222 is preserved as a documented locale exception.
- Only Korean `Texto` at ID 28218 changed. Keys, row order, and source CSVs
  remain unchanged.
- Active default CSV SHA-256:
  `40adf5ed05b646b74fe344fcf21fa018f59cc30abafa26abe9b0c48250b6b89e`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 872 accepted, 2,997 `not an issue`, and
  4,980 uncertain (8,849 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28251; 36,884 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
