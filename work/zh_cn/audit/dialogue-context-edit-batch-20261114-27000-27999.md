# Dialogue Context Translation Edit Batch: IDs `27000`-`27999`

- Date: 2026-11-14.
- Rechecked all 54 current ledger candidates in this range against their
  linked English, Japanese, and Chinese evidence and the active Korean rows.
- Three in-range translations needed correction; 50 already reflected their
  supported findings. The `Templar` terminology candidate at `27767` remains
  unresolved because the project has not selected a consistent Korean title.
- A cross-corpus review of all 19 English `Silkfarmer`/`silkfarming`
  occurrences selected `비단 채집꾼` for the people/occupation and retained
  `비단 채취` for the activity. Five related Korean rows were aligned.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `5691`, `10336`, `24189`, `61174`, `62222` | Standardized the occupation to `비단 채집꾼`, based on the spider-silk harvesting context and the established wording in most of the 19 source occurrences. Kept activity descriptions such as `silkfarming` distinct as `비단 채취`. |
| `27577` | Recast the awkward literal `상처투성이 생각` as `상처투성이인 속내` and made the spoken clause flow naturally without changing its contemptuous tone. |
| `27915` | Recast the detached parallel objects as `나와 너를 기다리고 있지`, preserving the ominous repetition and conversational tone. |
| `27930` | Replaced `마법의 문구` with `주문`, matching the same quest's Japanese `呪文` and related Korean references while preserving the objective's meaning. |

## Retained And Held

- Fifty candidate rows already reflected their source-supported correction or
  consistency direction and were not overwritten.
- `27767` remains a candidate pending a project-wide decision for the title
  `Templar`; no competing title was selected by frequency alone.
- Existing evidence-limited holds and ledger dispositions were preserved.

## Fingerprints And Verification

- Initial validation found 186 stale ledger fingerprints. Every affected
  Korean row differed from `HEAD`; only those IDs' `source_fingerprint`
  fields were refreshed. No ledger status, evidence reference, row order, or
  other field was changed.
- The ledger validates all 65,135 IDs against the four current language
  tables, with zero stale fingerprints.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and 71,842
  CRLF / 244 LF-only line endings.
- All 20 CSV-preservation and dialogue-context-index tests pass.
- The eight changed Korean rows retain their prior line-break, runtime-token,
  and markup signatures. No exact-English/Japanese/Chinese duplicate group
  touching an edited row has divergent Korean text.
- The CRLF-aware `git diff --check` passes.

The next sequential candidate range is `28000`-`28249`.
