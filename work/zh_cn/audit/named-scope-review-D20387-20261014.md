# D-20387: Sagrell Name Standardization Across Localization Resources

Date: 2026-10-14

## Scope and Decision

Searched the complete active `affix`, `base`, and `default` resources and
compared matches with the English, Japanese, and Chinese source CSVs. English
was the semantic reference; Japanese and Chinese provided pronunciation and
context checks.

No Sagrell references occur in `affix` or `base` in any checked locale. The
complete 4,844-row `base` resource and all `affix` rows were checked; neither
active resource required an edit. The English `default` source has 136 rows
containing Sagrell. All 136 corresponding Korean rows were reviewed against
the matching Japanese and Chinese entries.

Reuse the accepted name `사그렐` from D-9132 and the honorific form
`사그렐 경` established by D-20193/D-20197. Standardize Korean spelling
variants (`새그렐`, `서그렐`, `세이그렐`, and others) to `사그렐`. Pair
the name with its English form in each cell: `사그렐(Sagrell)`,
`사그렐 경(Sir Sagrell)`, or `사그렐 부인(Lady Sagrell)` as supported by
the English source. Where a cell already pairs the name through a complete
English title, retain that form rather than adding redundant parentheses.
Repeated mentions within a cell use the bilingual form at the first
reference; later mentions retain the normalized Korean spelling.

Of the 136 Korean rows, 82 lacked an English Sagrell name/title pairing.
Updated 98 `default` `Texto` cells to standardize spelling and/or complete
the bilingual name form. The other 38 rows were already canonical and
remain unchanged: 89, 1239, 1426, 1730, 3333, 4838, 7399, 14058, 21739,
22155, 22202, 22953, 23814, 24110, 27135, 27756, 29190, 46796, 50587,
51129, 51270, 51771, 51992, 52811, 53471, 53763, 55919, 56146, 60262,
60352, 61250, 61428, 61455, 61817, 62524, 63527, 63635, and 64109.
The per-ID English/Japanese/Chinese comparison and before/after text for all
98 edited rows is in
[`sagrell-name-edits-D20387.tsv`](sagrell-name-edits-D20387.tsv).

The official Korean manual files were checked but contain no Sagrell name
reference, so they provide no specific spelling evidence for this pass. No
prior disposition was reopened, duplicated, or recounted; global totals were
not adjusted. No PAK data was consulted.

## Verification

- Pre-edit active `default` SHA-256:
  `f825a2cf617a15267f9ee1c08f7d79b86b10d6df9fdcf6b42c85e1224befe10a`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261014/before-sagrell-D20387/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit active `default` SHA-256:
  `e6112db6ec6ea420d689526caf5aef6c93065e8e9639aa64adda2f9d588a849a`.
- Unchanged active resource hashes: `affix`
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`;
  `base`
  `437986dea9000fca2fa96fee0dd98b71c678bc12db0c3e11ff45a7904e22cd70`.
- Confirmed all 136 source-keyed rows have a Korean `사그렐` form and an
  English bilingual name/title; no former spelling variants remain.
- Exactly 98 `Texto` cells changed and match the 98-row edit manifest.
  Parsed row count/order and every non-`Texto` field are unchanged.
- UTF-8 BOM remains present; line endings remain 72,084 CRLF and zero bare
  LF, identical to the backup. The edit helper's inverse-byte reconstruction
  restored the complete original CSV bytes.
- The review helper is
  [`apply-sagrell-name-standardization-D20387.rb`](apply-sagrell-name-standardization-D20387.rb).
