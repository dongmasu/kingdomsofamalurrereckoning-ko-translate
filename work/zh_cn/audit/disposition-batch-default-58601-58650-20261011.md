# Disposition Batch: `default` IDs 58601-58650

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 34 `not an issue` IDs, and 16 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV matched the 58600 checkpoint SHA-256 before review. A
  byte-identical pre-batch backup is recorded below.

## Accepted Corrections

No translation CSV cells were changed. The English-led readings preserve
the evident meaning, and the remaining name, terminology, and context
questions do not yet support a specific Korean correction.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17711 | 58604 | The oldest-living-mortal claim and Fae-history comparison are explicit and preserved; `Nyralim`'s Korean name form remains provisional, and Japanese omits the name in this line. |
| D-17712 | 58607 | `Principle of Unity` is rendered literally as `통합의 원리`; the row does not establish whether this is a formal doctrine or a generic label. |
| D-17713 | 58610 | The waxy stem and musk/evergreen/sea fragrance notes are retained; the unnamed plant and exact sense of `evergreen` remain unclear. |
| D-17714 | 58614 | Freemen and Lucky Mine are retained, but the English phrase `drove up Lucky Mine` is awkward and the faction's canonical Korean form varies. |
| D-17715 | 58615 | The Travelers' clever hands and dependence on the Hierophant's guiding eyes are preserved; the compressed `gift` antecedent and exact metaphor remain open. |
| D-17716 | 58618 | The recent, tentative divine-inspiration claim and ettin war connection are preserved; whether `divine inspiration` is a formal lore term is unknown. |
| D-17717 | 58619 | The sensed event at the Hyperian is translated without adding a referent; whether Hyperian denotes a place, event, or entity remains unresolved. |
| D-17718 | 58622 | The definition of Finesse as character grace is preserved, but the canonical Korean gameplay-stat term is not established by this row; locale readings differ. |
| D-17719 | 58624 | The English name `Arnie Schnegar` is retained parenthetically; Korean phonetic spelling varies across locales, so `아니` is not normalized without a project-wide name decision. |
| D-17720 | 58628 | The inability to follow the speaker into Bhaile and the reason are preserved; the Korean place-name form varies elsewhere in the corpus. |
| D-17721 | 58632 | All three retrieval locations and item relations are retained; `circlet` is rendered broadly as `관`, and the item and place-name forms need terminology alignment. |
| D-17722 | 58634 | This standalone `Hroth Magnus` name is preserved parenthetically; Korean and other locale phonetic forms differ and remain provisional. |
| D-17723 | 58640 | The surprised question is preserved, but `Child of Dust` may be a title/species phrase and its relation to `dustling` terminology is unresolved. |
| D-17724 | 58643 | Both the pale rocks and high death rate are given as reasons for the name; canonical treatment of `Bone Town` as a place name is unresolved. |
| D-17725 | 58647 | The source initial `R.` is preserved; Japanese and Chinese expand it, but the identity and canonical Korean surname spelling are not established. |
| D-17726 | 58648 | The simultaneous Laz/door and Ventrinio/machinery actions are preserved; the actors' identities and canonical Korean name forms remain open. |

## Not an Issue

Decision D-17727 records these 34 IDs: 58601-58603, 58605-58606,
58608-58609, 58611-58613, 58616-58617, 58620-58621, 58623, 58625-58627,
58629-58631, 58633, 58635-58639, 58641-58642, 58644-58646, and 58649-58650.
These rows preserve the evident English meaning and Korean register without
unsupported additions. In particular, 58603 retains the reward and intended
use of the weapons; 58626 retains the unavailable-DLC condition, restart
instruction, `{LINE_SPACE}`, and unsaved-progress warning; 58630 retains
the four-line verse and its imagery; and 58644/58650 retain the exact
separate `+17`, `+30%`, and `+60%` effects and conditions.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58601-58650 once
  and in ascending order; the full resources contain 65,135 records with
  matching key order.
- The four-line verse at 58630 retains three embedded line breaks in all
  locales. `{LINE_SPACE}` at 58626 is present in the same position.
- The +17 Physical Damage and +30% Greatsword effects at 58644 remain
  separate; the +60% stunned-enemy effect at 58650 is unchanged.
- Reconciled the source-keyed historical prompts covering IDs 58550-58649.
  Unresolved applicable prompts are recorded as uncertain above; they are
  not treated as accepted corrections.
- No translation CSV cells changed. The active default CSV SHA-256 remains
  `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.
  Its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings remain as recorded at the prior checkpoint.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58601/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`).

D-17711-D-17726 record 16 uncertain findings; D-17727 records the remaining
34 `not an issue` IDs. Direct register totals: 1,713 accepted, 12,580
`not an issue`, and 11,133 uncertain (25,426 total); next D-17728.

Resume at `default` ID 58651; 6,484 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
