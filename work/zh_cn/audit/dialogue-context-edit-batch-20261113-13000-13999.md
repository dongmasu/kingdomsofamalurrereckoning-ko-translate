# Dialogue Context Translation Edit Batch: IDs `13000`-`13999`

- Date: 2026-11-13.
- Scope: adjudicate all 37 candidates in this range against the current
  English, Japanese, Chinese, and Korean rows, then check directly related
  repeated titles and terminology.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- No speaker attribution or playback order was inferred from asset links.

## Decisions

Thirty-three candidates received source-supported corrections. Three were
already resolved in the active translation or earlier edit batches:
`13015`, `13502`, and `13670`. Candidate `13041` was retained because all 19
exact-English `Maire, Queen of Cups` rows already use the same consistent
name/title construction. Evidence-limited findings in the range reports
remain unresolved and were not changed.

The 37 adjudicated candidate IDs are `13000`, `13015`, `13031`, `13041`,
`13072`, `13120`, `13140`, `13148`, `13208`, `13362`, `13385`, `13422`,
`13436`, `13438`, `13446`, `13476`, `13494`, `13502`, `13539`, `13544`,
`13579`, `13591`, `13592`, `13670`, `13724`, `13739`, `13748`, `13836`,
`13837`, `13857`, `13858`, `13882`, `13884`, `13920`, `13943`, `13951`,
and `13952`.

The source-based corrections:

- Place the signed Longsword damage value correctly at `13000`; pair
  `Castellan Grian Shane` at `13031` and in related entries.
- Use the established `[패시브]` display label while preserving its wrapper
  at the reviewed UI IDs.
- Remove an unsupported location at `13120`, avoid choosing the sister's
  relative age at `13140`, make the plea at `13148` natural, and recast the
  merchant's quip at `13208`.
- Align the bounded `Master's Tallow` references to `장인의 동물성 지방`,
  pair the named material, and use the established `Hurvar's Doorsill`
  rendering in the related rows.
- Correct the phrasing at `13385`, `13422`, `13438`, `13446`, `13539`,
  `13544`, `13579`, `13591`, `13724`, `13739`, and `13748`, preserving each
  row's meaning and register.
- Use the complete `Kandrian Keep` name at `13436`; keep the unresolved
  job-title question separate. Render the identical status entries at
  `13476` and `32309` in the supported plain style.
- Name `Missives of Sable` at `13494`, and correct `Lopoku` to `Lupoku` in
  the bounded occurrences, including both mentions in poem `10523`.
- Pair `The Burn` where the named Rathir location occurs; use the tournament
  sense at `13837`, clarify the material brought to Skald at `13857`, and
  remove the hearsay implication at `13858`.
- Pair `Scaith` in its army label and `Augur` in the private-camp label.
- Use `유골함` for the bounded Teeth of Naros ash-urn references and clarify
  the corruption description at `54630`.
- Standardize the reviewed `dreg` insults to the selected core rendering
  `천것` where the sentence supports it. The optional comma-only change at
  `62054` was excluded.

The row-level edits were checked again for meaning, Korean naturalness,
register, name pairing, embedded line breaks, and formatting tokens. Findings
whose referent or terminology remains uncertain stay held as documented.

## Application and Verification

- The ID-scoped application manifest is
  [`dialogue-context-edit-batch-20261113-13000-13999.json`](dialogue-context-edit-batch-20261113-13000-13999.json).
- Applied 115 guarded text-fragment operations to 112 unique IDs using
  `tools/replace_text_preserve_eol.py`. The manifest's ordered edits reverse
  to the exact pre-edit text for every target ID.
- Refreshed only the four-language fingerprints for those 112 IDs; all other
  ledger fields, rows, and order remain unchanged.
- The active CSV retains its UTF-8 BOM, all 65,135 rows, 71,845 CRLF record
  endings, and 244 LF-only record endings.
- The 65,135-ID ledger check, index/catalog reproducibility checks, all 11
  CSV-preservation tests, and CRLF-aware `git diff --check` passed.
- CSV SHA-256:
  `91b6be27fd62a0e329141ae365f02d8f5fbbc3d9088d22bfad5ee94134cf4f3c`.
- Ledger SHA-256:
  `ce029dad0a64224f187691da9406e47b4bbecb3ebcd85691e181f951476dde74`.
- No source CSV, extracted asset, or game binary was modified.

Candidate adjudication now covers 494 of approximately 3,155 candidates
(about 15.7%). Later candidates remain in progress; this is not a claim that
all findings are resolved.
