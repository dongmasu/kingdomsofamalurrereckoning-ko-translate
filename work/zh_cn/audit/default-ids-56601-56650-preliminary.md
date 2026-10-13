# Preliminary Language Scan: `default` IDs 56601-56650

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56601-56650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56605 | “Head down into the pit” / `구덩이 아래로 내려와` | Confirm whether this is a literal pit or the arena waiting area and preserve the partner-selection instruction. | English, Chinese, and Korean say to go down into a pit; Japanese says to go to a waiting area. All retain choosing a partner before entering the Arena. | Medium |
| 56607 | Ethene's intent / `의도가 여기 있다는` | Preserve that Ethene's purpose is evident in the situation, not merely “located here,” and keep the parallel with the player's purpose. | Korean's phrase can mean Ethene's intention is physically “here”; English asks whether the addressee sees her intent “in this.” Japanese/Chinese phrase it as her purpose/role in events. | Medium |
| 56613 | `The Midden` / `미든`; `sullied` / `더럽혀졌습니다` | Confirm whether Midden is a named place/group and whether `sullied` implies ritual desecration rather than general contamination. | Korean preserves the hesitation and recent assaults but uses a general “soiled/defiled” verb. The proper referent and ritual context are absent from this row. | Medium |
| 56618 | Reckoning-mode control markers | Preserve the button, full Fate meter condition, and mode label in the correct localized order. | English/Korean place `{1}` then Reckoning mode then Fate meter; Japanese/Chinese place the Fate-meter marker first, followed by the button and mode. Marker identities and meaning are retained; order follows each locale's sentence structure. | Medium |
| 56619 | Almain women / Varani crossbow metaphor | Retain the source's deliberately sexist, tightly-wound crossbow comparison while checking that Korean has not shifted its implication. | Korean renders the women as tightly wound like a Varani crossbow. Japanese calls them difficult to handle and Chinese reframes the crossbow as a weapon with high lethality; the historical audit explicitly says not to erase the gendered register. | Medium |
| 56621 | “Bite your tongue!” and jail/prisoner threat | Preserve the rebuke and the speaker's darkly comic threat while noting the Japanese source divergence. | Korean follows English and Chinese: be quiet, then the speaker could jail the addressee and thereby have a prisoner. Japanese instead asks where the addressee heard the rumor and says such people would not be there. | Medium |
| 56626 | `I can pay you` / `돈으로 갚을게` | Check whether Korean should offer payment rather than repayment, and preserve the bribe-value variable. | English offers to pay; Korean says “I'll repay you,” which can imply an existing debt. `$SQ151.bribe_value$` and the Gold label are retained. | High |
| 56630 | `Root Resistance [DO NOT USE]` | Preserve the annotation's warning meaning while recording the locale-specific wrapper format. | English, Chinese, and Korean use square-bracket annotations; Japanese uses parentheses. Korean retains both the Root Resistance label and “do not use” warning. | Medium |
| 56635 | `humeral precepts` / `상완골 계율` | Preserve the academic malapropism/joke about re-categorizing humeral rules. | Korean translates the phrase literally as “humeral precepts”; Japanese and Chinese also retain the humerus/commandment absurdity. The humor depends on surrounding lecture context. | Medium |
| 56638 | new Scion / `새 후계자` | Confirm whether Scion is the formal office/title and align the Korean form with established corpus usage. | Korean translates the title as successor; previous reports note variation between generic successor/descendant senses and the Cape Solace office. | Medium |
| 56640 | Trellis / `트렐리스` | Determine whether Trellis is a named location or a generic structure/meeting place. | Korean transliterates the capitalized English proper name; Japanese interprets it as an assembly hall, while Chinese reads it literally as a trellis. | Medium |
| 56642 | `circle` / `원` | Clarify whether the circle is a magical boundary, ritual, or other prison mechanism and preserve that only the priestess knows the breaking words. | Korean calls it a circle and retains the word-only condition; Japanese also uses “circle,” while Chinese interprets it as a cycle and a spell. | Medium |
| 56649 | Aloffa Rime-Kiss / weapon description | Verify the canonical title/name and preserve that a Varani smith forged the item for the legendary explorer/raider. | Korean adds “weapon,” which is supported by the item-description context but not stated in this isolated English sentence. The source itself has the grammatical error `an Varani`. | Medium |

Other reviewed rows generally preserve the first-read English meaning. Names
and terms remain provisional, including Orsinian Paige, Ethene, Luminitsa,
Midden, Darkvari Mine, Jottun, Myfa, Maire Ganan, Giran, Culn, Bloodbane,
Logan Darrow, Trellis, the Priestess, Cora Banick, Travelers Rank, and
Aloffa Rime-Kiss.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56550-56649`.
  Relevant prompts in this active range include Ethene's intent (56607),
  Midden/sullied (56613), Reckoning input markers (56618), the gendered
  crossbow metaphor (56619), humeral precepts (56635), Trellis (56640),
  the priestess' circle (56642), and Aloffa Rime-Kiss (56649). These remain
  prompts, not accepted corrections.
- ID 56650 opens the next historical range (`56650-56749`) and is reviewed
  once here as the active batch's final row. IDs 56601-56649 fall within
  the preceding historical range; no active row is skipped or duplicated.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56601-56650 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts match throughout the batch.
- At 56618, the `{1}` control and both localized marker identities are
  preserved; marker order follows each locale's sentence structure.
- At 56626, `$SQ151.bribe_value$` appears once and in the same position in
  all four locales. At 56630, the warning annotation is preserved with
  locale-specific parentheses/brackets.
- No cross-locale numeric-value discrepancy was identified.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56601-56650 received one preliminary reading and were dispositioned in
[`disposition-batch-default-56601-56650-20261011.md`](disposition-batch-default-56601-56650-20261011.md):
two accepted corrections, six uncertain findings, and 42 `not an issue`
IDs. These are working dispositions, not independent final linguistic
approval. Continue at `default` ID 56651.
