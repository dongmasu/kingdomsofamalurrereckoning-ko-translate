# Preliminary Language Scan: `default` IDs 19650-19699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 19650-19699.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 19651, 19653 | `Hex`; `scuttle` across Gallows End | Confirm whether Hex is a named card/rank or number, and whether `scuttle` means a container rather than discarded material. | Chinese reads Hex as six while Japanese retains the name; English capitalizes it. Japanese/Chinese read `scuttle` as a bucket/container, while Korean says trash pile. | High |
| 19655, 19675 | `Sorcerer Unarmed Parent`; `Map Ability To UI` | Determine whether these are internal/template labels or player-facing UI text. | English uses developer-like labels; Korean localizes both. No evidence here confirms runtime visibility. | Medium |
| 19659, 19662 | condition/blacksmith/repair-kit markers; ranged-target tutorial | Preserve marker wrappers, order, line-space token, variable, and controller icon; verify Korean UI labels and instruction. | Korean localizes `{*1...}` payloads and keeps wrappers in order, plus `{1}`, `{LINE_SPACE}`, and `#NAMED_ICON_360_RS#`. | Low |
| 19665-66, 19670-71, 19677, 19682, 19685, 19691, 19694, 19697, 19699 | Kollossae/Jottun; sealed place; Hierophant; Bristletongue/Font; Tapestry of Fate; Primos; Sandstone Villa; Child of Dust; Sojourn/amphora; Fellfire Pit | Verify recurring lore names, title/entity types, and whether the rites and locations are proper names. | Korean follows English broadly, but references differ on Hierophant, shrine/Font terms, and the type of Primos/Sojourn; these remain glossary/context candidates. | Medium |
| 19612, 19619, 19623-24, 19629, 19631-32, 19636, 19643, 19647-49 | implied spear; Tree; man within god; table joke; Esharra; released Sorrows; tongues; Sword of Ire; Codex/High King | Preserve implied referents, dry humor, and cosmological/faction distinctions without inventing context. | Korean adds “spear” where English says `This`; it otherwise retains the table joke, body-part reference, and lore relationships, with named-object terms still needing standardization. | Medium |
| 19635, 19638, 19641 | `barghest-tipping`; mission; shrine | Resolve opaque event wording and institution/site terminology against context. | Japanese calls the mission a monastery, Chinese a missionary group, and Korean a mission; the source does not settle the institutional type. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 19603, 19605, 19612, 19619, 19624,
  19627, 19629, 19631, 19635-36, 19638, 19641, 19647, 19649, 19651,
  19653, 19655, 19657, 19659, 19662, 19665-66, 19670-71, 19675, 19677,
  19682-83, 19685, 19688, 19691, 19694, 19697, and 19699. They remain
  preliminary; no historical note authorizes a translation edit.
- The historical questions for `Hex`, `scuttle`, and the developer-like
  labels were checked against all four active locale rows.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 19650-19699
  in identical order.
- No row-count, key, physical line-break, or runtime-token identity
  difference was found. ID 19659 retains all five marker occurrences and
  `{LINE_SPACE}` in order; ID 19662 retains `{1}`, `{LINE_SPACE}`, and the
  right-stick icon in order.
- Numeric gameplay values in ID 19606/19617 were checked in the preceding
  batch; no new numeric effect values occur in this range.
- Korean wording and the source CSVs were not edited.

## Batch Status

IDs 19650-19699 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 19700-19749.
