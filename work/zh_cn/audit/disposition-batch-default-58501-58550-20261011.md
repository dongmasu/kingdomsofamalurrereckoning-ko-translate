# Disposition Batch: `default` IDs 58501-58550

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 32 `not an issue` IDs, and 18 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not the
  Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. Unresolved title, proper-name,
gameplay-term, and setting-context questions remain uncertain rather than
being normalized speculatively.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17673 | 58503 | Standalone Feride Ouet name; locale phonetics and Korean variants differ, so canonical spelling remains open. |
| D-17674 | 58504 | The city principles and worker effort are retained, but English is compressed and Korean makes the labor itself produce “perfect harmony.” |
| D-17675 | 58507 | `{*1[...]}` identity and two-line skill text are preserved; the localized `Weapon Attacks` label and canonical Korean combat term need alignment. |
| D-17676 | 58508 | Witchknight Anira is identified; compound title and Anira spelling vary across the corpus and source locales. |
| D-17677 | 58512 | Capitalized `The Freemen` may be a named faction; Korean uses a generic translated plural while the corpus also uses bilingual faction forms. |
| D-17678 | 58513 | `dustlings` may be a species/name or a contemptuous epithet; Japanese, Chinese, and Korean readings differ. |
| D-17679 | 58515 | “In the name of the red” remains ambiguous between a cause/faction and bloodshed; Chinese alone specifies the Red Gang. |
| D-17680 | 58516 | The ancient key and destination are clear; the canonical Hierophant title and whether `Den` is a named location remain open. |
| D-17681 | 58518 | Flamed Rivets components are retained; Mitharan is distinct from Mitharu, but its Korean form and compound order are unsettled. |
| D-17682 | 58520 | Mithros is retained bilingually; the Korean place-name spelling needs corpus-wide alignment. |
| D-17683 | 58524 | The speaker's wordplay distinguishing Fae and land is preserved; lower-case `Fae lands` may still refer to the named Faelands. |
| D-17684 | 58525 | The regret over killing an ally and the unknowable future are retained; English `partnership` is more specific than Korean `관계`, but the intended alliance type is unclear. |
| D-17685 | 58527 | English and Japanese specify a successful Parry; Chinese says block and Korean uses generic `막기`. Prior audit decisions also leave the gameplay term unsettled. |
| D-17686 | 58530 | Quest objective is clear; Desiderus Trav and Shadow Pass have unresolved Korean name forms. |
| D-17687 | 58534 | Standalone Vigor Broadshield name; active Korean variants and locale phonetics differ. |
| D-17688 | 58536 | Roles/audition wordplay is retained; the canonical player-title form for `Beckoned` remains inconsistent across accepted and uncertain historical decisions. |
| D-17689 | 58544 | The assignment to eradicate monsters is preserved; Tala-Rane's Korean spelling varies elsewhere and the English source is awkwardly phrased. |
| D-17690 | 58546 | The instruction to become a Traveler is retained; it is unclear whether singular `a Traveler` names a faction role or generic occupation. |

## Not an Issue

Decision D-17691 records these 32 IDs: 58501-58502, 58505-58506,
58509-58511, 58514, 58517, 58519, 58521-58523, 58526, 58528-58529,
58531-58533, 58535, 58537-58543, 58545, and 58547-58550. They preserve
evident meaning, voice/register, structure, markers, and values. In
particular, 58523 follows the general-condition reading also supported by
Chinese, while 58541 and 58547 retain their unspecified plural/antecedent
rather than inventing context.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58501-58550 once
  and in identical ascending order; each full default resource contains
  65,135 records.
- IDs 58507 and 58514 each retain one embedded newline in all locales. The
  localized `{*1[...]}` marker identity at 58507 is unchanged. The 20%
  chance and 175 Poison Damage at 58514 are preserved.
- Reconciled the source-keyed historical prompts for IDs 58450-58549.
  Applicable terminology and context questions remain above; later prompts
  remain for their own batches.
- The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are unchanged. The active CSV SHA-256 remains
  `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58501/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`).

D-17673-D-17690 record 18 uncertain findings; D-17691 records the remaining
32 `not an issue` IDs. Direct register totals: 1,713 accepted, 12,514
`not an issue`, and 11,099 uncertain (25,326 total); next D-17692.

Resume at `default` ID 58551; 6,584 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
