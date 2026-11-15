# Dialogue Context Translation Edit Batch: IDs `25000`-`25249`

- Date: 2026-11-14.
- Rechecked all 20 new correction candidates and four retained candidates
  against current English, Japanese, Chinese, and Korean rows. English
  established meaning, Japanese guided voice/register and line layout, and
  Chinese supported the comparison.
- Applied 22 supported corrections within the range and eight linked-ID
  updates, for 30 changed IDs total. `25128` already matched the approved
  objective form.
- Retained the evidence-limited register questions at `25173`, `25202`, and
  `25214`; no speaker/addressee assumptions were made.
- No speaker identity or dialogue order was inferred from asset associations.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `25031` | Paired the complete `Flawless Mitharan Frosted Rivets` item label. |
| `25052` | Paired the complete alliance title as `올그혼 요새 동맹(Fort Olghorn Alliance)`. |
| `25055` | Paired the complete `Flawless Mitharan Sharpening Fulcrum` item label. |
| `25056` | Paired the complete `Master Mitharan Energizing Bindings` item label. |
| `25058` | Added the established `샘(The Font)` pairing. |
| `25071` | Recast the full hesitant line in consistent polite speech and first-person forms while preserving the stutter and self-correction. |
| `25105` | Added Marten's English name and converted the objective to the established `-하기` form. |
| `25118` | Paired the named vigilante title `처형인(The Executioner)` while retaining the complete Boots of Last Breath item name. |
| `25131` | Paired the formal office title `Castellan` without identifying its office-holder. |
| `25150` | Combined the personal name and rank as `드레판 중위(Lieutenant Drefan)` and used the established objective form. |
| `25163` | Changed the marked `-시오` ending to a natural plain blessing, matching the Japanese/Chinese register evidence. |
| `25171` | Corrected `공허` to `동굴` for the cave/hollow. |
| `25184`, `26110`, `34718`, `35326` | Standardized the named title as `운명의 뮤즈(Muse of Fate)` in the explanation, label, and introductions. |
| `25185`, `9016`, `44431` | Corrected Aluck's spelling to `알럭(Aluck)` and added the pairing to unpaired references. |
| `25190` | Replaced the unsupported blade-strike implication in `mauled` with `끔찍하게 훼손돼 있었다`. |
| `25197` | Paired the complete creature type as `볼간 거한(Bolgan Brute)`. |
| `25205` | Paired the complete `Flawless Mitharan Illuminator's Shaft` item label. |
| `25208` | Removed three Korean line breaks that split clauses; the 11 remaining breaks now match the Japanese and Chinese layout while preserving paragraph breaks and content. |
| `25210` | Paired the specific document as `국경 통행증(Border Permit)` and retained the rightful-owner meaning. |
| `25241` | Paired the complete heading `Forward: Primal Magic Examined`. |
| `25242`, `49463`, `51827`, `53400` | Standardized the law title as `콜로사이 법(Kollossae Law)` across the sentence and all three exact duplicate labels. |
| `25247` | Kept the whole hesitant line in consistent plain speech. |

## Already Resolved Or Held

- `25128` and its exact-source duplicates `20541` and `24041` already use
  `오스트 오르두라(Ost Ordura)와 대화하기`; no edit was needed.
- Earlier findings `25157` and `25204` already match their accepted wording.
- `25173` remains held for unclear speaker/register context; `25202` retains
  its deferential register pending addressee context; `25214` remains held
  because the row does not establish the intended deference.

## Verification

- Refreshed only the 30 changed IDs' `source_fingerprint` values. The ledger
  validates all 65,135 IDs against the four current language tables.
- The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and 244
  LF-only endings. The CRLF count decreased from 71,845 to 71,842 solely
  because three erroneous embedded line breaks were removed at `25208`.
- All 20 CSV-preservation and context-index regression tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `25250`-`25499`.
