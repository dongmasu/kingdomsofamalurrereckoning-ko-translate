# Disposition Batch: `default` IDs 55851-55900

- Date: 2026-10-11. Compared all 50 active IDs with English, Japanese,
  Chinese, the preliminary scan, source-keyed historical notes, prior
  terminology decisions, lineation, runtime markers, and numeric values.
  These working dispositions are not independent final linguistic approval.
- Zero accepted corrections, 38 `not an issue` IDs, and 12 uncertain IDs.

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 55851 | Uncertain | The item's Mitharan, ebony, and frost attributes are retained; `Dowel` component terminology and its established Korean craft term need glossary context. |
| 55855 | Uncertain | All three quoted sections and seven line breaks are preserved, but the English middle question is malformed and its pronouns/imagery remain ambiguous across locales. |
| 55856 | Uncertain | `Second leg` is translated as a segment, while Japanese and Chinese suggest a point or round; the UI/game context is absent. |
| 55857 | Uncertain | The speaker's desire for control is clear, but `subjects` can mean experimental subjects or political subjects, and the locale readings differ. |
| 55862 | Uncertain | English/Chinese say Hall while Japanese says shrine; canonical form and institution type of the Firstsworn location remain open. |
| 55865 | Uncertain | The gladiator/gambler livelihood and “jewel of Detyre” epithet are retained; House of Valor's canonical Korean form remains unsettled. |
| 55871 | Uncertain | The recruitment chief's role and warning that notices are only the beginning are preserved; the implied next step is unspecified. |
| 55872 | Uncertain | Crops, repeated shooing, cultists, and ignored warning are retained; `critters` varies from small animals to imp-like creatures across locales. |
| 55882 | Uncertain | The Faelands/Dalentarth relationship and Fae seat of power are retained; the antecedent of `its canopy` is outside the row. |
| 55891 | Uncertain | Korean follows English/Chinese place names, while Japanese substitutes Frostroot for Gale Crossing; canonical place forms and source divergence remain open. |
| 55899 | Uncertain | The active English key is the standalone name `Seawatch`; Korean preserves it, but Chinese translates it and the canonical display form is unsettled. |
| 55900 | Uncertain | The request to find the speaker's `Lyra` is retained; the identity and canonical Korean spelling of the named person are not established. |

## Not an Issue

The other 38 IDs retain the apparent English meaning and structure. This
includes the recent rise in ruin power with its cause explicitly unknown
(55864), the localized `{*1...}` ability labels with both marker indices and
order preserved (55878), and Herc Adwold's excessive challenges (55886).

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 55851-55900 once
  in identical ascending order; each default CSV contains 65,135 records.
- At 55855 all locales retain three quoted sections and seven line breaks.
  At 55878 both `{*1...}` markers retain identity and order while display
  labels are localized. Other newline counts and recognized runtime-token
  sequences match throughout the batch.
- Rechecked the source-keyed historical range `55850-55949`, including
  the dowel, cryptic quotation, Second leg, Testament subjects, Firstsworn
  Hall, House of Valor, recruitment notices, critters, ability markers,
  canopy, Herc Adwold, and place-name divergence.
- The historical summary associates a Lyria/card-reading prompt with ID
  55899, but the active English source at 55899 is `Seawatch`. The Lyria
  card-reading line is separately present at ID 55771 and was dispositioned
  in the preceding batch. ID 55900 is a distinct request to find `Lyra`;
  the historical mismatch was not used to reinterpret either active row.
- The pre-batch CSV and backup are byte-identical at SHA-256
  `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`.
  No CSV cell changed; the post-batch hash is identical. Backup:
  `/private/tmp/ko-translate-backups/20261011/before-resume-55851/locatexts_zh_cn.koalocatext_default.csv`.

Decisions D-16855 through D-16866 record the 12 uncertain findings;
D-16867 records the remaining 38 `not an issue` IDs. Direct register totals:
1,634 accepted, 11,140 `not an issue`, and 10,387 uncertain (23,161 total);
next D-16868.

Resume at `default` ID 55901; 9,234 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-55901-55950-preliminary.md`](default-ids-55901-55950-preliminary.md).
