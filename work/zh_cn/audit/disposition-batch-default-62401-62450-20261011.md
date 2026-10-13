# Disposition Batch: `default` IDs 62401-62450

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- One accepted correction, 35 `not an issue` IDs, and 15 uncertain findings.
  ID 62450 has separate accepted lineation and uncertain ingredient-name
  findings, so it appears in both categories. These are working dispositions,
  not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

Decision D-18000 authorizes this `Texto` structure correction:

| ID | Previous structure | Applied structure | Rationale |
| ---: | --- | --- | --- |
| 62450 | Four internal recipe separators were CRLF. | Four internal recipe separators are LF. | English, Japanese, and Chinese use LF for the same four breaks. Normalize only the embedded separators, retaining the paragraph gap and all three ingredient lines. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18001 | 62402 | Korean preserves the lack of suitable material and expectation of findings; the kind of material is intentionally unspecified in English/Japanese, while Chinese suggests clothing. |
| D-18001 | 62404 | The respectful `Archsage` address is preserved; the canonical Korean title remains a project terminology question. |
| D-18001 | 62407 | The ambush report and hunt objective are preserved; Brownies, Detyre, and Sidhe remain setting/name terms requiring context. |
| D-18001 | 62408 | Korean follows the English pronouns and codex reading; the antecedent of `she` and exact codex referent are context-dependent. |
| D-18001 | 62409 | The escort, other hidden Treasure, and reward are retained; `Treasure` may be a formal category/name and Urlik's precise service role is unclear. |
| D-18001 | 62412 | Korean follows the Japanese meat reading for `specialty cuts`; the precise product/cut is not established by the row. |
| D-18001 | 62414 | The gnomish protocol and incomplete conditional are retained; English ends mid-thought, so the consequence of someone seeing the correction is unknown. |
| D-18001 | 62416 | `Wreath of Absolution` is translated as `사면의 화관`; Japanese says ring and Chinese feathered crown, leaving the artifact's form and canonical name unresolved. |
| D-18001 | 62420 | The rescue objective is clear; `Court of Enchantments` may name an institution, place, or its members, and locale forms differ. |
| D-18001 | 62421 | Korean preserves the loss-of-reason progression and dolls becoming family; the narrative remains sensitive to wider character context. |
| D-18001 | 62422 | Korean chooses `집사` for `steward`; Japanese says servant and Chinese subordinate, so the formal role is not established here. |
| D-18001 | 62423 | The disabled-use warning is retained; `Piercing DoT` may be a technical/internal combat label and its canonical Korean form is unverified. |
| D-18001 | 62424 | The tower crisis, Well of Souls, Ventrinio, and defense against the Sons of Laz are retained; faction/title forms and Well-control mechanics remain lore questions. |
| D-18001 | 62439 | The raw `CubicVolume21` identifier is preserved; whether it is an internal/debug label remains unverified. |
| D-18001 | 62450 | Reagent quantities and recipe structure are preserved; canonical Korean names for Prismere Dust, Leechwood Bark, and Bloodroot remain terminology questions. The newline correction is separately accepted under D-18000. |

## Not an Issue

Decision D-18002 records these 35 IDs: 62401, 62403, 62405-62406,
62410-62411, 62413, 62415, 62417-62419, 62425-62438, 62440-62449. These
rows preserve available meaning, voice, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean contain IDs 62401-62450 once and in
  identical ascending order.
- At ID 62450, all four locales have four embedded breaks, including the
  paragraph gap before the ingredients. English, Japanese, and Chinese use
  LF; Korean previously used CRLF for all four embedded separators. They are
  normalized to LF. No outer CSV record separator changed.
- The recipe still names Prismere Dust (3), Leechwood Bark (2), and Bloodroot
  (1). No numeric values or paragraph breaks were removed.
- Rechecked source-keyed questions for material (62402), Archsage (62404),
  Brownies/Detyre/Sidhe (62407), codex pronoun (62408), Urlik/Treasure
  (62409), specialty cuts (62412), gnomish protocol (62414), Wreath (62416),
  Court of Enchantments (62420), dolls/family (62421), Jottun steward (62422),
  Piercing DoT (62423), Well/tower defense (62424), CubicVolume21 (62439),
  Ljosalfar glossary (62441), Akara's creation (62444), Mairu (62446), and
  the potion recipe (62450).
- Only the `Texto` structure at ID 62450 changed. Pre-edit SHA-256:
  `a41a7a89e28b3d42c9856ce05e6626aa6950475b401f30635c4eee7becdfaf39`.
  Post-edit SHA-256:
  `6c5a72c1eb52f824320eb4ab0a20025ce2350196c4f5d922a297176d665474d6`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62401/locatexts_zh_cn.koalocatext_default.csv`.
- The UTF-8 BOM, 65,135 records, key order, and total 72,084 LF characters
  are preserved. Four internal-break normalizations change aggregate counts
  from 72,044 CRLF/40 bare LF to 72,040 CRLF/44 bare LF; outer CSV record
  separators are unchanged.

D-18000 records one accepted correction, D-18001 records 15 uncertain
findings (one overlaps an accepted ID), and D-18002 records 35 `not an issue`
IDs. Direct register totals: 1,777 accepted, 15,384 `not an issue`, and
12,073 uncertain (29,234 dispositions total); next D-18003.

Resume at `default` ID 62451; 2,684 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
