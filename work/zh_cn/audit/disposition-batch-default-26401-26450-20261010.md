# Disposition and Edit Batch: `default` IDs 26401-26450

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26401-26450, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and three uncertain.
- Accepted correction at ID 26436 is applied to the active Korean CSV.
  Named-item, material, lore, and place-name questions remain open.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26401-26402, 26404-26405, 26407-26413, 26415-26416, 26418, 26421, 26425-26427, 26429-26433, 26435, 26437-26438, 26442-26450 | Dialogue / concise UI | Not an issue: reviewed short dialogue and labels preserve their source intent and tone. |
| 26403, 26414, 26431, 26441, 26446 | Combat values / Warsworn quest / narrative details / idiom | Not an issue: block values, two captains and separate locations, relic-investigation sequence, and “in this together” reassurance are preserved. |
| 26436 | Warden Rask | Accepted: change `경비대장` to `감시관`, matching the accepted treatment at IDs 26093 and 26374. English does not specify a guard-captain role. |
| 26405, 26408, 26417, 26420, 26424, 26428, 26430, 26432, 26434, 26437, 26439-26444, 26447 | Sorrows / named people and places / factions / relic terms | Uncertain: canonical name forms and lore/faction relationships need corpus-wide context. |
| 26406, 26419, 26422-26423, 26434 | Master's Key / Arrivus Engine / seasteel / Crossing / Adarus Key | Uncertain: item status, material, and capitalized lore terms require comparison with related entries before changing Korean. |
| 26436 | Headhunter Nora Pepper | Uncertain: the item's owner's “Headhunter” title and Korean equivalent need context, separate from the accepted Warden correction. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 26401-26450 once in
  identical order.
- ID 26403 retains all three block values (63 Magic, 47 Melee, 47 Ranged).
  ID 26414 retains both captains, their dagger proof, and their separate
  locations; ID 26441 retains the relic, Castellan, keep, plain, and region
  sequence.
- The only Korean CSV edit in this batch is ID 26436. UTF-8 BOM, 72,046 CRLF
  endings, and 39 pre-existing bare-LF endings are preserved.
- Active default CSV SHA-256:
  `c20d0944d4f649aa3e3a39820c116b3e9770b606b5712ef9debf5ec730a774fe`.
- Register totals after this batch: 835 accepted, 2,907 `not an issue`, and
  4,836 uncertain (8,578 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26451; 38,684 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
