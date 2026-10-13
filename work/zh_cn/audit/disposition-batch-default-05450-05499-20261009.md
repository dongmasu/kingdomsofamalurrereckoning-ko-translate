# Disposition and Edit Batch: `default` IDs 5450-5499

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 5450-5499. The historical question at ID 5461 was included.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register and markup
  conventions; Chinese was a supporting cross-check.
- Twenty-six findings were dispositioned: three accepted, sixteen
  `not an issue`, and seven uncertain. Three accepted `Texto` cells were
  changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5450 | `greatest debate` / `The Concourse` | Defer formal-trial meaning and canonical place type. | D-1373: uncertain. |
| 5451 | Ability-slot tutorial labels | Localize the payloads of both `*1` wrappers; preserve all control tokens. | D-1374: accepted. |
| 5452 | Relic resource-gathering vs. destructive mortal extraction | Keep the contrast and disdainful voice. | D-1375: not an issue. |
| 5453 | `A Dimming Wait` | Defer title-versus-description status. | D-1376: uncertain. |
| 5454 | The Lykeios losing popularity and possibly closing | Keep the question and institution name. | D-1377: not an issue. |
| 5457 | `Woven Sativa Fibers` / `{*3Physical}` | Localize the visible category as `{*3물리}`; retain the wrapper ID. | D-1378: accepted. |
| 5459 | `Cambodia` | Keep the shared source name without inferring a test-string error. | D-1379: not an issue. |
| 5461 | Drunkard entering and reminding the speaker of her sons | Keep the irritated rhetorical question; do not invent their relationship. | D-1380: not an issue. |
| 5464 | Tywili refugees and the speaker's disbelief | Keep the skeptical rebuttal without independently declaring the refugees' claim false. | D-1381: not an issue. |
| 5465 | `as he said` / King Bisarane in Cursewood | Keep the unspecified antecedent and the “our king” relation. | D-1382: not an issue. |
| 5466 | `southern Sidhe` / Detyre | Defer whether Sidhe is a region or realm and canonical spellings. | D-1383: uncertain. |
| 5467 | Midden and beings older than the Fae | Keep the named place and deliberately broad description of its inhabitants. | D-1384: not an issue. |
| 5468 | Clyeth Arne's hereditary Staff and Talisman | Defer proper-name spelling and item-title conventions. | D-1385: uncertain. |
| 5470 | Talisman as a piece of the Well of Souls | Keep the shared fragment reading and stated life-force effect. | D-1386: not an issue. |
| 5475 | Unknown item used to summon Niskaru | Keep the unknown item's identity and contrast in who knew its use. | D-1387: not an issue. |
| 5477 | Floating city as greatest accomplishment and failure | Keep the pride/regret contrast without naming the city. | D-1388: not an issue. |
| 5479 | Faelands welcome heading and character description | Translate the heading as `{*1패란즈에 오신 것을 환영합니다}`; preserve both `LINE_LEFT` tokens and the `*1` wrapper. | D-1389: accepted. |
| 5481 | Nameria Kent / Sister of Niahm | Keep the sibling reading supported by Japanese and Chinese; Korean `자매` does not specify relative age. | D-1390: not an issue. |
| 5485 | Maire leaving Irion and former lovers comparison | Keep the apparent separation and contrast without adding a cause. | D-1391: not an issue. |
| 5486 | Lightning, stun, Shocking damage, and Mana tooltip | Keep the four lines, damage types, and all numeric values. | D-1392: not an issue. |
| 5490 | Pyromancer Louisa Ealan's mock-formal quotation | Keep the dry admonition; defer canonical name/title spelling. | D-1393: uncertain. |
| 5491 | Sorrows / Saturnyn / Eldest | Defer faction/place, character, and title standardization. | D-1394: uncertain. |
| 5494 | House of Vengeance and becoming Tuatha | Defer formal House status and the unresolved meaning of “tore at me.” | D-1395: uncertain. |
| 5497 | Misspelled English `promisary notes` | Keep the intended promissory-note sense and real-coin contrast. | D-1396: not an issue. |
| 5498 | `Scholia Arcana` | Keep the established `스콜리아 아르카나` form used consistently elsewhere. | D-1397: not an issue. |
| 5499 | Verse-like `We leave these scoundrels to the sea:` fragment | Keep the fragment and terminal colon pending continuation/context. | D-1398: not an issue. |

All uncertain rows remain unchanged.

## Applied Corrections

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5451 | `...{*1abilities}...{*1ability}...` | `...{*1능력}...{*1능력}...` | D-1374: localize visible UI labels while retaining wrapper IDs and order. |
| 5457 | `{*3Physical}` | `{*3물리}` | D-1378: localize the displayed category while retaining `*3`. |
| 5479 | `{LINE_LEFT}{*1Welcome to the Faelands}{LINE_LEFT}` | `{LINE_LEFT}{*1패란즈에 오신 것을 환영합니다}{LINE_LEFT}` | D-1389: use the established Korean rendering `패란즈` and preserve marker structure. |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs; IDs 5450-5499 are present in matching order.
- The Korean CSV parses successfully and retains its UTF-8 BOM, semicolon
  delimiter, CRLF record endings, and zero bare LF bytes.
- Marker identity/order and embedded line-break counts match all four
  locales in the three edited rows: ID 5451 retains `{1}`, two `*1` wrappers,
  `{LINE_SPACE}`, and `{2}`-`{5}` in order; ID 5457 retains `*3`; ID 5479
  retains both `{LINE_LEFT}` markers and `*1`.
- No row keys, marker identifiers, or text outside the three accepted cells
  were authorized by this batch.
- Active Korean `default` CSV SHA-256:
  `9de4904c86cdba3998bbb0c8d76af737a11e49f1cda7e950a61e8fb345d5f848`
- Cumulative dispositions: 274 accepted, 357 `not an issue`, and 767
  uncertain. Resume at `default` ID 5500; 59,635 rows remain.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
