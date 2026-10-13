# Disposition Batch: `default` IDs 59851-59900

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, preliminary
  findings, source-keyed historical questions, terminology, line breaks,
  markers, and numeric values. These are working dispositions, not
  independent final linguistic approval.
- Zero accepted corrections, 35 `not an issue` IDs, and 15 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before disposition; no CSV
  cells were changed in this batch.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17872 | 59851 | Galafor's sanctification/blessing and the survivors' additional blessing are preserved; canonical religious terminology remains open. |
| D-17872 | 59857 | Airancourt's name/title and the quarry delivery sequence are retained; verify canonical spelling and role. |
| D-17872 | 59863 | Band of Brother Monks may be a group, bond, or named item/ring; the isolated label does not settle its type. |
| D-17872 | 59864 | The Sanctuary/collections-box theft and stakeout are preserved; whether the site is named and the box specifically holds money require context. |
| D-17872 | 59865 | The elderly are hardest hit and not all survive; verify that Korean `모두` retains the intended older-person antecedent. |
| D-17872 | 59870 | “I owe you my love” is retained literally; whether it is romantic, idiomatic, or a favor differs across locales and needs scene context. |
| D-17872 | 59875 | Both 40% effects and their separate propagation/damage functions are preserved; align Shocking Damage and Storm Bolt with the combat glossary. |
| D-17872 | 59878 | Capitalized card-game call `Higher` may be a named wager term; Korean renders the comparison rather than the term. |
| D-17872 | 59881 | House Vengeance is retained as a named faction candidate; canonical House/faction treatment is unresolved. |
| D-17872 | 59884 | `the Sorrows` may mean House members, an entity, or a power/artifact; Korean's people/rescue interpretation is not confirmed by English. |
| D-17872 | 59887 | `Hierophant gone` and `guide` are both retained, but the title's role and whether `gone` means absent, departed, or dead remain open. |
| D-17872 | 59890 | Canyon Hill Site's exact location type is unclear; retain the named site and wild-Fae occupation without inventing a mine or ruin. |
| D-17872 | 59891 | Order, Mission, and Ordination Tome are setting institutions/objects; preserve the membership argument pending canonical terminology review. |
| D-17872 | 59895 | King Wencen's “new telling” may be a named fate tradition, story, or role; Korean's “new story begins” is plausible but interpretive. |
| D-17872 | 59899 | The bow requirement is explicit; whether `before proceeding` means resuming, starting, or entering the activity depends on UI context. |

## Not an Issue

Decision D-17873 records these 35 IDs: 59852-59856, 59858-59862,
59866-59869, 59871-59874, 59876-59877, 59879-59880, 59882-59883,
59885-59886, 59888-59889, 59892-59894, 59896-59898, and 59900. These rows
preserve evident meaning and register without resolving unsupported lore.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain the 50 target IDs
  exactly once and in ascending order. All four full resources contain
  65,135 records with matching key order.
- Rechecked historical prompts for Galafor/Lyria, Airancourt/quarry,
  Band of Brother Monks, Sanctuary collections box, elderly/plague,
  Windemere love/debt, Shocking Damage/Storm Bolt, card-game Higher,
  House of Vengeance, the Sorrows/Bisarane key, Hierophant, Canyon Hill
  Site, Sister Zelda/Order/Mission, and Wencen's new telling.
- Embedded newline counts match and no runtime markers occur. The 15%
  value at 59856 and both 40% values at 59875 match; the digit `4` at 59878
  corresponds to English “four.”
- Pre-edit and post-disposition CSV SHA-256:
  `4d0c818192353a4179a6057e8d0eb4d576d0cbea62faae92a5caf536c99abe72`.
  No bytes changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF
  endings, and 39 pre-existing bare-LF endings remain preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59851/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `4d0c818192353a4179a6057e8d0eb4d576d0cbea62faae92a5caf536c99abe72`).

D-17872 records 15 uncertain findings and D-17873 records the remaining
35 `not an issue` IDs. Direct register totals: 1,741 accepted, 13,514
`not an issue`, and 11,425 uncertain (26,680 dispositions total); next
D-17874.

Resume at `default` ID 59901; 5,234 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
