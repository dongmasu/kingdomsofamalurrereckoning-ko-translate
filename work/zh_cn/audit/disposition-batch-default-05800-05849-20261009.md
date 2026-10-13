# Disposition and Edit Batch: `default` IDs 5800-5849

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 5800-5849.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Seventeen findings were dispositioned: two accepted, eight `not an issue`,
  and seven uncertain. Two accepted `Texto` cells were changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5800 | Idylla cisterns relieving pressure on foundations | Defer water-pressure versus structural-load interpretation; current wording remains broad. | D-1528: uncertain. |
| 5802 | Root Golem of Mithros / petrified wood | Keep the creature and material description. | D-1529: not an issue. |
| 5805 | Prison `high security area` | Add the omitted high-security distinction in the label. | D-1530: accepted. |
| 5806 | Webbing gathered from the wood/forest | Keep the livelihood and spider-attack account without resolving the `Silkfarmer` job title. | D-1531: not an issue. |
| 5808 | Apparition facsimiles and real-world counterparts | Keep the contrast without adding a mechanism for the apparitions. | D-1532: not an issue. |
| 5809 | Loremaster / lorestone / Glianal | Replace `전승석` with the previously accepted `로어스톤`; defer the role and name spellings. | D-1533: accepted. |
| 5811 | Brownie creature's teeth | Keep the creature reading and natural bite implication. | D-1534: not an issue. |
| 5814 | Chaos / Telogrus | Defer whether `Chaos` is a formal gameplay system and standardize the proper name in broader review. | D-1535: uncertain. |
| 5817 | `Microsoft® Points` | Keep the legacy platform currency brand and localized Korean unit. | D-1536: not an issue. |
| 5819 | Destroy Anira / disable barrier | Keep `처치` as the Korean objective verb; the target and directive remain clear. | D-1537: not an issue. |
| 5824 | New Scion / The Offering | Defer title and ritual terminology; do not import the Chinese-only “priest” interpretation. | D-1538: uncertain. |
| 5829 | `your grace` → `각하` | Defer whether the addressee's rank warrants this specific honorific. | D-1539: uncertain. |
| 5836 | House stopped serving death / Court of Winter | Defer the lore meaning of serving “death”; preserve the stated transition. | D-1540: uncertain. |
| 5838 | Nix enchanted to believe he was an ordinary man | Keep the prank, cause/effect, and mortal-village distinction. | D-1541: not an issue. |
| 5842 | `Forum` | Defer whether this names a place, council, or institution. | D-1542: uncertain. |
| 5843 | `None taken` | Defer whether the reply specifically means taking no offense; context is absent. | D-1543: uncertain. |
| 5849 | Summoned Faer Gorta bonuses and cost | Keep both +75% values, 75 Mana, and the two-line layout. | D-1544: not an issue. |

All uncertain rows remain unchanged.

## Applied Corrections

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5805 | `보안 구역은 이 감옥에서 경비가 가장 삼엄한 곳이다.` | `최고 보안 구역은 이 감옥에서 경비가 가장 삼엄한 곳이다.` | D-1530: retain the source's `high security` distinction in the UI label. |
| 5809 | `...네가 찾은 건 평범한 전승석이 아니야.` | `...네가 찾은 건 평범한 로어스톤이 아니야.` | D-1533: apply the established `Lorestone = 로어스톤` decision from D-133; leave `Loremaster` and Glianal open. |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 5800, 5802, 5806,
  5808-5809, 5811, 5814, 5817, 5824, 5829, 5836, 5838, 5842, and 5849
  against active Korean and matching source rows.
- Same-numbered questions for other resource types were kept separate.
- Historical candidate wording remains evidence and does not authorize any
  correction beyond the two accepted edits above.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs; IDs 5800-5849 are present in matching order.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF bytes.
- The edits at IDs 5805 and 5809 preserve row keys, one-record structure,
  runtime markers, and all line breaks. The +75% Health, +75% Total Damage,
  and 75 Mana values at ID 5849 remain unchanged.
- Active Korean `default` CSV SHA-256:
  `b9b2bb9e630ba3c4945ebf8c0032b9c3bf3e986a38e511407d03b27971f0937e`
- Cumulative dispositions: 288 accepted, 420 `not an issue`, and 836
  uncertain. Resume at `default` ID 5850; 59,285 rows remain.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
