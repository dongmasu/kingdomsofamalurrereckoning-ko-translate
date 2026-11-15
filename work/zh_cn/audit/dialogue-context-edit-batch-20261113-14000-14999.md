# Dialogue Context Translation Edit Batch: IDs `14000`-`14999`

- Date: 2026-11-13.
- Scope: adjudicate all 59 correction candidates in this range against the
  current English, Japanese, Chinese, and Korean rows, then verify documented
  neighboring candidates and exact-name groups.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- No speaker attribution or playback order was inferred from asset links.

## Decisions

Fifty candidates received source-supported corrections. Seven were already
resolved in the active translation, one was retained, and one remains held
because `Templar` has no settled Korean title. The related findings at `6411`
and `34912` were also addressed from their existing source-backed reports.
Uncertain findings elsewhere in the range remain unchanged.

The application made 98 guarded text-fragment edits across 90 unique IDs.
Changes include:

- Naturalize dialogue and quest-log wording at IDs `14079`, `14092`, `14150`,
  `14179`, `14180`, `14190`, `14204`, `14241`, `14243`, `14255`, `14325`,
  `14335`, `14355`, `14375`, `14401`, `14442`, `14524`, `14577`, `14621`,
  `14728`, `14818`, `14831`, `14841`, `14850`, `14894`, and `14903`, while
  retaining each row's meaning and register.
- Apply source-supported names, titles, and forms, including `말가르(Malgar)`,
  `여사제 세라논(Priestess Seranon)`, `스틸 여사(Lady Still)`,
  `가빈 둘락(Garvin Dulac)`, `나르카 페이블레이드 전사(Narca
  Faebladesman)`, `킨 대사(Ambassador Keen)`, and the complete
  `Taint Boggart` label. `Lady Oleyn` references now use `올레인 여사(Lady
  Oleyn)`; the three additional epithets in ID `34912` are paired with their
  full English titles.
- Pair the named ring `메이지의 행운(Maisie's Luck)` in its explicit
  references, correct the inconsistent spelling at `40034`, and change the
  objective at `6411` to the concise `-기` form.
- Use `크로싱의 수호자들` across all checked `Crossing Keepers` and `Keepers
  of the Crossing` occurrences, preserving each source's English title form.
- Standardize the Motus Mining handbook references to `지점 업무 안내서`,
  the House of Valor arena references to `투기장`, and the `Infrequent` UI
  wording to `흔하지 않은`, preserving markup.
- Retain the established `티레니움(Tyrenium)` form at `47146`.

## Application and Verification

- The ID-scoped application manifest is
  [`dialogue-context-edit-batch-20261113-14000-14999.json`](dialogue-context-edit-batch-20261113-14000-14999.json).
- Every expected text fragment matched exactly before editing. The edits were
  applied by ID through `tools/replace_text_preserve_eol.py`; reversing the
  98 fragment edits restores the exact input CSV SHA-256:
  `91b6be27fd62a0e329141ae365f02d8f5fbbc3d9088d22bfad5ee94134cf4f3c`.
- The active CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLF
  endings, and 244 LF-only endings.
- Only the four-language fingerprints for the 90 edited IDs were refreshed
  in the review ledger. The ledger still contains 65,135 IDs.
- The 11 CSV-preservation tests, 9 context-index tests, ledger fingerprint
  validation, index/catalog reproducibility checks, and CRLF-aware
  `git diff --check` passed.
- Active CSV SHA-256:
  `5aedbf20b1a742d7b19ee67b8fc5f0bb460cabd0f98b89242c0c327107198702`.
- Review ledger SHA-256:
  `3fdc9f813818210733d96546395d54a7d3daf28659e0c3f801ae316c1738c7ec`.
- No source CSV, extracted asset, or game binary was modified.

Candidate adjudication now covers 544 of approximately 3,155 candidates
(about 17.2%). Later candidates remain in progress; this is not a claim that
all findings are resolved.
