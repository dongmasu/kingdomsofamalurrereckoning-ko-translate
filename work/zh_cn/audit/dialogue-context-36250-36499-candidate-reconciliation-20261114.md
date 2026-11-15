# Candidate Reconciliation: IDs `36250`-`36499`

- Date: 2026-11-14.
- Rechecked all three current `overall=candidate` IDs against English,
  Japanese, Chinese, active Korean, related rows, and earlier dispositions.
- All three candidates are newly counted. Two previous retentions were
  superseded by the source and terminology evidence noted below.

## Candidate Decisions

| ID | Decision and evidence |
| ---: | --- |
| `36268` | Confirmed `주문` for the phrase that releases Adar's magic circle; that correction was already present. The separate conflict over whether Adar is in or behind the jail remains held. |
| `36279` | Changed `실라레타` to `실라리타(Syllareta)`. Japanese `シラリータ`, Chinese `希拉里塔`, and established Korean references support this spelling. The existing name review confirms `실라리타` for Syllareta; this row is now aligned without changing unrelated references. |
| `36433` | Changed `자기 대리인` to `그녀의 첩자` and refined the offer/refusal sentence. English places the agent in an infiltration mission, Japanese calls the person her `手先`, and Chinese explicitly says spy; together they support the covert-operative sense rather than a proxy. This supersedes the earlier retention based on the isolated ambiguity of `agent`. |

## Evidence-Limited Holds

- `36268`: English places Adar behind the jail in Burren Cove, while Japanese
  and Chinese generally place him in the jail. Retain the current English-led
  location until the map or intended referent is verified.
- `36427` and `36460`: Korean uses formal/literary declarative speech while
  Japanese is plain, but the linked multi-NPC asset does not identify the
  speaker or dialogue stage. Do not normalize register from asset association
  alone.

## Structure And Verification

- Three candidates were newly reconciled; the cumulative candidate
  reconciliation is 2,278 / 4,015 (56.74%), with 1,737 not yet reconciled.
- `36279` and `36433` were edited; only those two IDs' ledger
  `source_fingerprint` fields were refreshed.
- All 65,135 ledger fingerprints validate. The generated index and both
  catalogs reproduce exactly. CSV-preservation and context-index regression
  tests: 20 passed.
- The active CSV retains 65,135 ordered records, its UTF-8 BOM, and the
  newline inventory of 71,838 CRLF, 244 LF-only, and no bare CR.
- The four language tables have matching IDs and line-break counts for the
  three candidates. No runtime token or markup was changed. CRLF-aware
  `git diff --check` passes.
- No source CSV, extracted asset, or game binary was changed. No commit was
  made.

See the four-language range review at
[`36250`-`36499`](dialogue-context-default-36250-36499-revalidation-20261112.md),
the SQ41 / Adar review at
[`1241289`](dialogue-context-1241289-sq41-adar-revalidation-20261111.md),
the Syllareta name definition at
[`D-21209`](proper-name-discovery-definitions-D21209.tsv),
and the HM01 / House of Ballads review at
[`HM01`](dialogue-context-hm01-revalidation-20261110.md).
