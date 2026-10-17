# D-20388: Jewelry Terminology and Non-Jewelry Rings

Date: 2026-10-14

## Scope

Screened all three active resources and their English/Japanese/Chinese source
CSVs: 3,451 `affix` variant rows, 4,844 `base` rows, and 65,135 `default`
rows. English jewelry words and Korean category terms selected 24, 115, and
755 candidate rows respectively. These are screening counts, not new
dispositions or additional sequential-review coverage. Non-jewelry uses of
`band`, `ring`, and `loop` were separated from equipment names.

English defines meaning. Japanese and Chinese inform the distinction between
necklaces, their pendants, magical amulets, and rings. The official Korean
manual extraction, PDF page 7, identifies one amulet and two rings as
equipment slots. It calls the former `아뮬렛`; this pass retains the project's
existing `부적` translation in `base` 3985 and `affix` 351 rather than
introducing another synonym. The manual does not supply specific Amrynthian,
Keozai, or Loop of Meditation name/slot evidence.

No PAK or PAK-derived files were consulted. Original CSVs remain read-only.

## Decisions

| Scope | Decision and evidence |
| --- | --- |
| `necklace` | Keep `목걸이`. English `default` 3476 and 25447 distinguish the whole necklace from its pendant. Do not merge these categories. |
| `pendant` | Keep `펜던트`; no `팬던트` spelling was found in the active files. Correct `default` 45543 and 51870 from `목걸이` to `펜던트`. All three sources explicitly identify a pendant. The cold-protection pendant matches `base` 4208 and `default` 10902/61475. |
| `amulet` | Correct the remaining six `목걸이` renderings at `default` 12925, 13271, 19289, 46307, 58371, 61434 to `부적`. Preserve other names and sentence meaning; adapt Korean particles. `default` 61434 is the equipment-slot explanation, so it must agree with the generic `base` label. |
| `medallion` | Keep `메달`, distinct from a necklace or pendant. At `default` 9734, change `왕실 훈장` to `왕실 메달` for the same Seal of Ansilla called a medallion at 43136 and 61590. Keep actual awarded military medals translated as `훈장`, including 48080 and 52634. |
| Jewelry `band` | Change `default` 8739 `구리 고리` to `구리 반지` and 57985 `은제 고리` to `은제 반지`. Chinese specifies finger rings; English 64454 contrasts platinum bands with gold/silver rings. Reuse the equipment distinction at D-19505/18954 and D-19897/41117. |
| Amrynthian Band | English 11022, 39286, and 57945 explicitly identify a crown. Reuse D-19795/31987's `암린시안 관(Amrynthian Band)` across all ten `default` references and `base` 3132. Eight default cells and one base cell need edits; 11022 and 31987 already agree. Chinese's ring wording must not override explicit English/Japanese crown context. |
| Ring of Keozai | Standardize all twelve full-name `default` references to `케오자이의 고리(Ring of Keozai)`. English 15489 calls it a great circle, 19820 identifies a member, and 63790 identifies branches of the great tree. Eleven cells require changes; 63790 already agrees. At 1029, `We are the Ring` refers to the Twelve/branches, so change `반지` to `고리(Ring)`. |
| Other `ring`/`hoop`/`loop` | Keep non-jewelry meanings: key ring (`base` 4662 / `default` 17742), map symbol (9338), head hoop (35299), chain links/weapon hoops (19653/40472), ruins called Ring of the Watcher, metaphors, and ring components (64421). Do not replace every `고리` with `반지`. |
| `base` 4674 `Band` | Keep `밴드`. D-18202 records the user's confirmation that it is not a ring and supersedes D-003. This exception is not generalized to named equipment bands. |
| Loop of Meditation | Change `base` 3509 `명상의 고리` to `명상의 반지` and `default` 30334 `고리` to `반지`. English describes a wearable loop that improves actions; Chinese explicitly calls the object 戒指 (ring). Keep the established item meaning consistent across name and description. |

34 distinct `Texto` cells changed from the initial state: two `base` and
32 `default`; no `affix` edit. The six follow-up edit events include two
additional IDs (`base` 3509 and `default` 30334) plus refinements to three
cells already changed in the first pass.
The full edited-cell English/Japanese/Chinese comparison and exact Korean
before/after strings are in
[`jewelry-terminology-edits-D20388.tsv`](jewelry-terminology-edits-D20388.tsv).
Six follow-up edit events also correct object particles in `default` 500,
43446, and 13271 after `관`/`부적`, change `default` 51870 to
`펜던트의 반응`, and resolve the Loop of Meditation slot at `base` 3509 /
`default` 30334 from the Chinese source's explicit ring identification.

Previously settled keys are not reopened or counted as newly reviewed.
This is a focused consistency correction, not a global disposition
reconciliation. Sequential review remains complete through D-20377 /
`default` ID 65134. Next available focused-review number: D-20389.

## Verification

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| `affix` (unchanged) | `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e` | `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e` |
| `base` | `437986dea9000fca2fa96fee0dd98b71c678bc12db0c3e11ff45a7904e22cd70` | `b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac` |
| `default` | `e6112db6ec6ea420d689526caf5aef6c93065e8e9639aa64adda2f9d588a849a` | `f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234` |

Initial byte-identical backups:

- `/private/tmp/ko-translate-backups/20261014/before-jewelry-D20388/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261014/before-jewelry-D20388/locatexts_zh_cn.koalocatext_default.csv`

The byte-identical backups immediately before the five follow-up cells are:

- `/private/tmp/ko-translate-backups/20261014/jewelry-followup-D20388/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261014/jewelry-followup-D20388/locatexts_zh_cn.koalocatext_default.csv`

Byte-identical backup immediately before the final particle correction:

- `/private/tmp/ko-translate-backups/20261014/jewelry-particle-followup-D20388/locatexts_zh_cn.koalocatext_default.csv`

The bulk-edit helper
[`apply-jewelry-terminology-D20388.rb`](apply-jewelry-terminology-D20388.rb)
and
[`apply-jewelry-followup-D20388.rb`](apply-jewelry-followup-D20388.rb)
and
[`apply-jewelry-particle-followup-D20388.rb`](apply-jewelry-particle-followup-D20388.rb)
require the expected starting hashes and byte-identical backups.
Inverse byte reconstruction restores every original byte, proving bytes
outside the selected `Texto` spans are unchanged. Headers, keys, variants,
ordered row counts, and all expected texts were checked. UTF-8 BOM and the
exact line-ending sequence remain intact: `affix` 3,452 CRLF, `base` 4,845
CRLF, `default` 72,084 CRLF; zero bare LF in every file.

No build, publication, or in-game validation was requested or performed.
