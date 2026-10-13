# Preliminary Language Scan: `default` IDs 1800-1849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1800-1849.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked voice, names, terms,
  and long-text structure.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1817 | 아무도 안 보여? 과부다! 과부가 우리를 잡으러 오고 있어. 새끼들도 함께 몰려오고 있다고! | Determine whether `The Widow` is a named creature and whether `brood` means offspring or followers. | English capitalizes `The Widow`; Japanese/Chinese also describe a group following her. Korean's `새끼들` chooses literal offspring and may sound more specific than the source establishes. This remains a historical open question. | Medium |
| 1822 | 스케이스(Scaith)의 저주 | Establish whether `Scaith` is a proper name, creature, or curse type. | English/Japanese/Chinese retain variants of the name but do not identify its referent. The bilingual Korean form preserves traceability without resolving the lore. | Medium |
| 1820 | ... 현자의 세공 제단에서 다른 파편과 합쳐 ... | Verify the official Korean term for `Sagecraft altar` and align it with the manual and related UI. | English names a Sagecraft altar; Japanese says a gemcraft worktable, Chinese says an enchantment altar, and the official manual uses `마법물품 제작` for Sagecraft. Current `현자의 세공 제단` risks reading `Sage` as “wise person” rather than the skill. | High |
| 1824 | 이제 당신은 사이온(Scion)이며 ... | Align `Scion` with the project's established role/title translation and proper-name display rule. | English/Japanese use `Scion` as a role; Chinese interprets it as a priest, and other resources use forms such as `계승자`. The transliteration may be intentional, but the role is inconsistent across the corpus. | Medium |
| 1827 | 이 근처 동굴을 탐험해 봐. 뭔가 발견할지도 몰라. | Reconcile the speaker's tentative advice with the Korean imperative. | English says “I'd explore ... and you might ...”; Japanese is a past-tense statement followed by a possibility. Korean turns the first clause into a direct instruction, shifting stance and voice. | High |
| 1828 | 대성당(The Basilica)은 ... 외곽 실험에 자금을 대고 있어 ... | Determine whether `The Basilica` is a named institution and whether `remote` means distant or external. | English says it funds remote experiments and questions work done externally; Japanese/Chinese also imply outside-city experiments. The Korean keeps both `외곽` and `외부` without resolving the term, and the institution-name question remains historical/open. | Medium |
| 1830 | ... 그는 ... 알파르 군대에 합류한 뒤 마지막으로 목격되었다. | Check the timeline/attachment of “last seen joining the Alfar army” and polish the long quest-journal sentence. | English says he was last seen joining the army in hopes of returning to Caeled Coast. The Korean is broadly faithful but “마지막으로 목격되었다” can attach awkwardly after the preceding name/role clause. Japanese and Chinese preserve the same basic sequence. | Medium |
| 1833 | 봄의 왕자는 ... 툴리안(Thulian) 황혼의 온(Ohn)을 ... | Review the lore poem's cosmology, name spellings, imagery, and line breaks together. | The historical audit already flags ambiguous `Ohn of the Thulian dusk` syntax. Japanese and Chinese also differ in the poem's construction and imagery. Korean preserves five source lines, but `불러내렸다` and `툴리안 황혼의 온` need contextual review rather than row-local rewriting. | High |
| 1844 | 야자수 두 그루 위쪽 고지에서 만나! | Confirm whether `two palms` names a recognizable landmark or two palm trees. | English, Japanese, and all checked sibling locales refer to two palms; Chinese alone reads “two palms” as hands. Korean's “야자수 두 그루” is well supported, while the precise landmark remains a historical context question. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical `default` questions for IDs 1817, 1822, 1828,
  1833, and 1844 against the active Korean and all three primary references.
  They remain open as summarized above.
- The historical audit also contains same-numbered questions for `base`
  entries in this interval; those were not applied to these `default` rows.

## Other Checks

- ID 1815's unusual-sceptre description preserves the Varani-material
  relationship, though the Korean agent/creation phrasing merits later
  readability review.
- ID 1842 retains six verse lines; the poem and other multiline entries
  preserve their paragraph/line structure in the active row.
- No variable, markup, numeric value, or source line break was changed.

## Batch Status

IDs 1800-1849 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
