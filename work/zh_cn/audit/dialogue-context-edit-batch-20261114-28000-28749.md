# Dialogue Context Translation Edit Batch: IDs `28000`-`28749`

- Date: 2026-11-14.
- Rechecked all 45 current ledger candidates against English, Japanese,
  Chinese, and the active Korean CSV.
- Applied four in-range corrections. Forty candidates already matched a
  supported reading or were retained after source revalidation.
- Held the Aethan name-continuity question at `28066`; the identity cannot be
  established from the available per-key evidence.
- Applied eleven directly related name and terminology corrections outside
  the range. Fifteen unique Korean rows were changed in total.

## Applied In-Range Corrections

| ID | Correction |
| ---: | --- |
| `28048` | Replaced the misleading literal “unlock” wording with a natural description that damage increases and new attacks become available. |
| `28409` | Recast the quest-log entry in consistent written narration while preserving the meaning that Tari faced his actions. |
| `28570` | Rephrased the answer so it responds clearly without inventing the preceding title or question; clarified that the speaker offers a crafted work for the needed components. |
| `28650` | Retained the established `혼돈 생물` term and added the complete `Chaos Critters` pairing in the surprised response. |

## Related Consistency Corrections

| ID(s) | Correction |
| --- | --- |
| `10131` | Replaced the generic “small animal problem” with the quest's established `혼돈 생물(Chaos Critters)` term and corrected the mismatched `Michael Vogel` English label to `Michaela Vogel`, supported by Japanese, Chinese, and the quest-stage identifier. |
| `12182`, `32904`, `43240`, `55620`, `63580`, `64103` | Standardized the same `Keep Library` location as `요새 도서관`, matching the already-correct forms at `26615`, `28055`, `28144`, and the paired Gravehal library labels. |
| `1032`, `39072`, `44009`, `64491` | Standardized the named rank as `오디 중사(Sergeant Odi)`, correcting inconsistent `하사`/`병장` uses and adding the complete English title pairing. The dialogue at `39072` and `64491` was also made internally consistent with the conversational source register. |

## Retained And Held

- The following 40 candidates already reflected their supported correction,
  or remained accurate after checking the current four-language evidence:
  `28032`, `28055`, `28057`, `28070`, `28093`, `28097`, `28107`, `28120`,
  `28135`, `28142`, `28144`, `28151`, `28172`, `28178`, `28236`, `28248`,
  `28276`, `28301`, `28305`, `28307`, `28310`, `28356`, `28389`, `28399`,
  `28406`, `28427`, `28445`, `28464`, `28491`, `28517`, `28527`, `28530`,
  `28568`, `28604`, `28651`, `28658`, `28669`, `28676`, `28707`, `28737`.
- `28066` remains held only on whether the first name `Aethan` identifies
  the separately recorded Aethan Engar. Its `Savant` title already uses the
  established `사반트(Savant)` form.
- Other existing evidence-limited holds and ledger dispositions were
  preserved.

## Verification

- Refreshed only the 15 changed IDs' `source_fingerprint` fields; all other
  ledger bytes, fields, row order, and dispositions were preserved.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and existing
  71,842 CRLF / 244 LF-only line-ending inventory.
- All 15 changed values were re-read from the saved CSV. The exact-source
  duplicate groups touching edited rows were checked across English,
  Japanese, and Chinese before comparing Korean.
- All 11 CSV-preservation tests and nine context-index tests pass. The full
  65,135-ID ledger fingerprint validation and index/catalog reproducibility
  checks pass, as does the CRLF-aware diff check.
- The first catalog check exposed one pre-existing stale reference at ID
  `25912` in the generated all-ID catalog. Its ledger `finding_ref` had
  already been shortened to the current report filename; the temporary
  regenerated catalog differed only at that row. The generated catalog was
  refreshed from current metadata and then reproduced byte-for-byte.

The next candidate range begins at `28750`.
