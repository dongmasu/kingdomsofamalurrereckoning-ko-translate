# Sequential `default` Revalidation: IDs `36250`-`36499`

- Date: 2026-11-12.
- Compared all 250 in-range IDs across English, Japanese, Chinese, and active
  Korean; all four CSVs contain the same ordered ID set.
- Rechecked 55 existing ledger entries and added the other 195 IDs to the
  full-corpus ledger.
- Findings below preserve earlier source-key decisions. No translation CSV,
  source asset, or game binary was modified.

## Retained Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `36268` | Terminology / naturalness | Retain the quest-level candidate: the phrase that releases Adar's magic circle varies as `마법의 문구`, `마법의 말`, and `암구호`. Japanese uses `呪文` for the phrase here and in related lines; align this occurrence to `주문` while preserving the sentence structure. | High |
| `36279` | Name consistency | Retain the existing candidate: `Syllareta` is `실라레타` here, while the same character is `실라리타(Syllareta)` / `실라리타 바우너(Syllareta Vauner)` elsewhere, supported by Japanese `シラリータ`. Consider `실라리타` in this quest-status line. | High |
| `36433` | Meaning / naturalness | Retain the existing candidate: the woman asks the recruit to infiltrate the House as her `agent`; Korean `대리인` usually means a proxy or representative. Japanese and Chinese support a spy/underling sense. Consider `그녀의 첩자로 발라드의 집(House of Ballads)에 잠입하라` while retaining the sentence's offer and refusal. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason |
| ---: | --- | --- |
| `36268` | Meaning / location | Retain the separate hold: English places Adar behind the jail in Burren Cove; Japanese and Chinese generally place him in the jail. Korean follows English. Confirm the intended map/location before changing it. |
| `36427`, `36460` | Speech level / naturalness | Korean has formal or literary declarative speech while Japanese is plain. The multi-NPC asset does not map either key to a speaker or stage; do not normalize register by topic or nearby lines alone. |

## Historical Reconciliation and Structure

- The earlier `36251`-`36350` and `36351`-`36450` reviews and exact-key
  reconciliation at D-19838/D-19839 were checked against current rows.
  Previously terminal findings, including accepted corrections at `36287`,
  `36309`, `36310`, `36347`, and `36380`, remain applied and were not
  reopened or recounted.
- D-19840's review of `36451`-`36550` was checked against the current rows.
  Its accepted `도전 타이머` at `36462`, corrected Great Order comparison at
  `36478`, and final `미타란 사람들은` wording at `36487` remain applied.
  Earlier terminal decisions on `36451`, `36454`, `36458`, `36460`, `36464`,
  `36482`, `36485`, `36492`, `36495`, and `36497` remain closed.
- The range has three candidate IDs and two hold IDs; `36268` has both a
  candidate and a separate hold. The other 246 IDs have no active finding
  from this pass.
- Fifty-nine exact-English duplicate groups (1,588 corpus rows) touch this
  range. Korean text is identical within every full-string group.
- Two rows contain embedded line breaks: `36378` (7) and `36466` (3).
  Counts match across all four languages. Normalized runtime-token and markup
  signatures match throughout the range.
- Asset associations remain grouping evidence only. No individual speaker,
  addressee, branch, or playback order is inferred.
- The 195 newly recorded IDs bring the full-corpus ledger to 44,028 of
  65,135 unique `default` IDs (67.60%), leaving 21,107. Sequential coverage
  reaches `36499`; next is `36500`-`36749`.
- The 530-asset and 65,135-ID catalogs reproduce exactly; all 44,028
  four-language ledger fingerprints validate; all nine index tests and the
  audit-scoped diff check pass. Translation CSVs remain unchanged.
