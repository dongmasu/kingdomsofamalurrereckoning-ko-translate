# Preliminary Language Scan: `base` IDs 450-549

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 450-549.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Checked applicable project terms in the official Korean manual glossary.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 482 | 기술서(상업) | Use the official-manual form `상술` for `Mercantile`, pending any documented UI-specific exception. | The project glossary explicitly gives `Mercantile = 상술`; the current `상업` does not match the established skill term. | High |
| 494 | 스커틀러(Scuttler) | Verify whether `Scuttler` is a proper entity/item name or whether the row is a source-key mismatch. | English names a `Scuttler`; Japanese says “emergency escape,” and Chinese says “porthole.” The active Korean follows English transliteration, but the references disagree materially. | Low |
| 549 | 유골함 | Confirm whether `Urn` is specifically a funerary urn in this context. | English is the broader `Urn`; Japanese says jar and Chinese says magical urn. Korean `유골함` narrows it to an ash/cremation container. | Medium |

## Other Checks

- ID 403's `Dokkalfar` term conflict with the official manual is recorded in
  [`base-ids-00400-00449-preliminary.md`](base-ids-00400-00449-preliminary.md).
- ID 434 follows the official glossary for `Ward` (`워드`).
- ID 457's `Mana Sap` is rendered as `마나 흡수`; verify against the item's effect before standardizing.
- ID 504's `Gallow's Bloom` is rendered literally; the English spelling differs from `Gallows`, so preserve the source-key distinction pending context.

## Batch Status

IDs 450-549 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
