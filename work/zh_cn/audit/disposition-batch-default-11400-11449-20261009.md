# Disposition and Edit Batch: `default` IDs 11400-11449

- Decision date: 2026-10-09.
- Scope: eighteen direct preliminary findings and carried historical
  questions in IDs 11400-11449.
- Compared English meaning, Japanese voice/register and structure, Chinese
  supporting evidence, active Korean, recurring terminology, and prior notes.
- Eighteen findings received dispositions: one accepted, seven `not an issue`,
  and ten uncertain.
- One supported name-form correction was applied only to the active Korean
  `Texto` cell at ID 11427.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 11400 is `not an issue`: small enemies are pulled toward the player,
  while large enemies pull the player toward them, as English, Japanese, and
  Chinese all specify.
- ID 11402 remains uncertain: `Oracle of Idylla, Hallidite` supports the
  Korean oracle/title reading, but Hallidite's identity and Korean name form
  are not established.
- ID 11404 is `not an issue`: the source leaves `them` unidentified, and
  Korean naturally omits the object while retaining the broad search area.
- ID 11406 remains uncertain: `Hoarders` may be a named quest/faction or a
  generic description; the isolated heading does not decide.
- ID 11407 remains uncertain: capitalization and Japanese transliteration
  suggest a title, while Chinese supports an elder reading; `맏이` is not
  confirmed as the intended role.
- ID 11412 remains uncertain: this postposed `of Ice Shield` fragment is
  structurally composable, but no supported Korean whole-name rendering is
  established; leave it unchanged.
- ID 11414 is `not an issue`: Korean preserves Chaos Matter's necessity,
  destruction of Chaos Nodes, and collection of their essence.
- ID 11415 is `not an issue`: the Keepers' purpose and both Courts'
  agreement not to harness the Crossing's power are retained.
- ID 11418 remains uncertain: the letter's sequence and line breaks are
  preserved, but its names and competing “cultivated mystery” and
  truth/light imagery are not resolved by the references.
- ID 11419 remains uncertain: Japanese reads `Paling Wand` as a tilling
  tool, while Chinese reads it as a pointed wand; the English title alone
  does not settle the item's identity.
- ID 11421 remains uncertain: the sources differ on whether Oathblade is
  Kirby's title/rank or a blade-name; Korean preserves the gratitude and
  payment meaning without resolving that identity.
- ID 11424 remains uncertain: English names Mudhold Fasting, while Japanese
  and Chinese differ on the location type; the Korean spelling and place
  identity remain provisional.
- ID 11425 remains uncertain: the poisoning investigation, report, and
  Abergast's attack are retained, but name spellings and the description
  `hermit-merchant` need broader context.
- ID 11427 is accepted: change `야사 경` to `이사 경`, matching the approved
  Ysa form in ID 11236 (D-3266). Leave `발라드의 집` unchanged; the
  corpus-wide House of Ballads convention remains unresolved.
- ID 11432 is `not an issue`: `Bahrain` is rendered with the standard Korean
  transliteration `바레인`; the isolated label does not demonstrate a
  translation error.
- ID 11436 remains uncertain: `예정된 자들` is a plausible rendering of
  this collective, but competing active Korean forms prevent a local
  terminology decision.
- ID 11439 is `not an issue`: `각하` and the polite teasing line preserve
  the courtly, flirtatious sarcasm without a literal ownership reading.
- ID 11447 is `not an issue`: English clearly says the speaker's mages
  assist the addressee's army; Korean preserves both possessive roles.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 11427 | `야사 경이 필멸자의 연호로 거의 500년 전에 세운 발라드의 집(House of Ballads)은 여름 궁정의 위대한 가문, 실리 페이 중에서도 첫 번째였다.` | `이사 경이 필멸자의 연호로 거의 500년 전에 세운 발라드의 집(House of Ballads)은 여름 궁정의 위대한 가문, 실리 페이 중에서도 첫 번째였다.` | D-3335: align Lord Ysa with the accepted form at ID 11236; leave the unresolved House term untouched. |

## Verification

- English, Japanese, Chinese, and Korean contain IDs 11400-11449 in
  identical key order.
- The preliminary structural comparison reports matching normalized
  runtime-marker classes/order and embedded line-break counts. ID 11418's
  letter lineation remains intact; no structural exception was recorded.
- Only Korean `Texto` at ID 11427 changed. The active CSV retains 65,135
  sequential IDs as recorded before this batch, its UTF-8 BOM, and CRLF
  record endings. The system Ruby CSV parser cannot reparse the full file
  because it rejects pre-existing malformed content around physical line
  11029; that unrelated source-format issue was not changed.
- Before this batch: 488 accepted, 1,060 `not an issue`, and 1,773 uncertain.
  After this batch: 489 accepted, 1,067 `not an issue`, and 1,783 uncertain.
- Direct findings and carried historical questions through ID 11449 now have
  dispositions. Resume at ID 11450; 53,685 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
