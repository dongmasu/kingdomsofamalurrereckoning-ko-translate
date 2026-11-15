# Candidate Reconciliation: IDs `40500`-`40749`

- Date: 2026-11-14.
- Rechecked all 31 in-range correction candidates against the English,
  Japanese, Chinese, active Korean, and prior scoped decisions.
- The 29 source-supported corrections in the existing application manifest
  were already present in the active CSV. `40558` already had the complete
  `Watchers` pairing.
- The item label at `40652` was corrected to `수수께끼의 상자(Mysterious
  Case)`. The linked prose at `40950` describes the container generically and
  was not changed.
- The in-range report also referenced `24673` as a cross-range
  `Winter Realm` candidate; it was already reconciled and counted in the
  `24500`-`24749` pass.
- Exact-source follow-up found a new pairing omission at `38472`. Its English,
  Japanese, and Chinese strings are identical to `40575`, but its Korean
  omitted `Templar` from `Templar Octienne`. The Korean rows now match
  exactly. This adds one newly identified candidate to the candidate pool.
  The prior overall uncertainty at `38472` remains open; this format
  correction does not infer a speaker or resolve that separate hold.
- Five evidence-limited holds in this range remain: `40586`, `40597`,
  `40606`, `40615`, and `40747`.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `40503`, `40508`, `40510`, `40517`, `40518`, `40555`, `40575`, `40598`, `40603`, `40618`, `40623`, `40630`, `40638`, `40669`, `40672`, `40679`, `40689`, `40691`, `40704`, `40705`, `40708`, `40717`, `40731`, `40732`, `40739`, `40743`, `40745`, `40746`, `40749` | Confirmed the source-supported text from the existing application manifest; meaning, names, terminology, speech level, and objective form were checked against the language rows. |
| `40558` | Retained the already complete `감시자들(Watchers)` pairing. |
| `40652` | Corrected the container meaning and paired the complete standalone item name as `수수께끼의 상자(Mysterious Case)`. |
| `38472` | Newly identified exact-source pairing correction; now matches `40575` in all four languages. Its separate prior uncertainty remains open. |

## Linked Consistency

- `38472` and `40575` have identical English, Japanese, and Chinese rows.
  Their Korean now matches exactly:
  `옛 동료 벤트리니오 데셀리니(Ventrinio Descellini)야. 한동안 성전 기사 옥티엔(Templar Octienne) 밑에서 함께 일했지. 뛰어난 학자였지만, 인간성은 형편없었어.`
- `40652` is the standalone `Mysterious Case` item label. `40950` is a
  descriptive sentence about the empty case, not an identical title row.
- Candidate `24673` was already reconciled in the `24500`-`24749` pass and
  was not counted again.
- Exact-source duplicate groups touching the in-range candidates were
  checked; no other Korean mismatch remained.

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `40586` | Register differs across languages, but the asset does not map this line to a speaker or stage. |
| `40597` | `Plagueshield` does not establish whether the item is a ward, barrier, remedy, or product. |
| `40606` | The route direction differs across English, Japanese, and Chinese; the scene does not resolve it. |
| `40615` | The role of `second` differs across the language sources. |
| `40747` | The response and invitation conflict across the four language rows. |

## Verification

- All 31 in-range candidates were dispositioned; 32 unique IDs were newly
  reconciled after excluding previously counted `24673` and including the
  newly discovered `38472` candidate.
- Two Korean rows changed (`38472`, `40652`); only those fingerprints were
  refreshed. The existing overall uncertainty status at `38472` was
  preserved.
- All 65,135 ledger fingerprints and index, asset-catalog, and ID-catalog
  reproducibility checks passed.
- The 11 CSV-preservation tests and nine dialogue-context tests passed.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840 CRLF
  sequences, 242 LF-only separators, and no bare CR.
- Exact-source checks and the CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.

Candidate reconciliation now covers 2,635 / 4,019 (65.56%), with 1,384
remaining.
