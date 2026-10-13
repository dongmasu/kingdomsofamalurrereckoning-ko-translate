# Preliminary Language Scan: `default` IDs 27151-27200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27151-27200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27151-27163, 27165-27190, 27192-27195, 27197-27200 | Dialogue, lore, quest, and concise UI/item text | Recheck tone, context, and recurring names during integrated review. | Korean generally retains English meaning and Japanese tone. ID 27153 preserves the urgency of “living on borrowed time”; ID 27184 retains the stored valuables, refuge, and funding sequence. | Medium |
| 27152, 27195 | House of Sorrows / Warsworn | Standardize the named organization and distinguish its institutional meaning from a family or residence. | ID 27152 uses `하우스 오브 소로스` then `가문`; ID 27195 uses `워스워른`. Historical questions leave the House's form and Warsworn institution open. | Medium |
| 27164 | `Moderate increase to Health` -> `체력 소폭 증가` | Reconcile the magnitude label against the English source and locale disagreement. | English says “Moderate,” Japanese says medium, and Chinese says a slight increase; Korean follows the slight-increase reading. Keep the discrepancy open rather than treating one locale as authoritative. | High |
| 27168, 27191 | Master's Pick / Pledgeshield | Align the artifact name and determine whether Pledgeshield is a formal rank/title. | Korean uses `명장의 곡괭이` for Master's Pick and the vocative `서약의 방패여` for Pledgeshield. The historical log asks whether Pledgeshield is a rank and how it should be rendered. | Medium |
| 27189 | `of Fire Attenuation` -> `화염 방어` | Confirm the intended category and term for this context-free fragment; do not infer a full ability name from the fragment alone. | English is a fragment, Japanese reads “of Fire Guard,” and Chinese gives a different fire-related rendering. The Korean conveys fire defense but the exact game/stat term remains open. | Medium |
| 27196 | `Dame Oleyn` -> `올레인 경녀` | Verify the title and choose a natural Korean convention for Dame; retain Oleyn as a proper name. | The historical log explicitly asks how to render `Dame`. Korean's `경녀` is a literal title rendering; Japanese uses a generic lady/honorific reading, and the role context is not settled here. | High |
| 27155, 27160-27161, 27175-27176 | QA label / stone prompt / deuce / trade ledger / Thresh venom | Preserve the distinct UI meanings, card-game value, and ledger/creature context. | Korean retains the second-card `deuce` as `듀스`, and the dusty ledger description; the historical log flags the deuce, ledger, and Thresh venom. No value or gameplay condition was changed. | Medium |

## Historical Audit Reconciliation

- The source-keyed log specifically covers proper-name/title questions at
  27151, 27168, 27182, 27186, 27188, 27190-27192, 27194, 27196-27197, and
  27199; it asks how to render `Dame` and whether `The Widow`/`Pledgeshield`
  are names, ranks, or descriptive titles.
- It also groups Ballads Oratory, Codex of Destiny, Stone, Ysa's Summer,
  Font, `crown`, Expedition, Weave, House of Sorrows, borrowed time,
  gnomish laws, Chaos weapons, Cursewood, Bitter Cove, Fire Attenuation,
  and Warsworn. ID 27164's locale disagreement was independently checked
  against the active rows.
- These entries remain issue inventory, not approved translation decisions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27151-27200 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. No unexpected Unicode format character was found.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27151-27200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27201.
