# Preliminary Language Scan: `default` IDs 13700-13749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13700-13749.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13702 | `Father Etair` / Order -> `에테어 신부님` / `교단` | Confirm the clerical title and whether `Order` names a specific institution. | English, Japanese, and Chinese identify Etair as a priest and the rites as those of the Order; Korean follows this reading, but the formal organization name is not supplied. Historical question remains open. | Medium |
| 13711 | `Murghan killed` -> `머건 처치` | Determine whether this is a creature-kill counter, a completion label, or a UI heading; verify Murghan's Korean form. | The source is a fragment with no article or context. Korean preserves a compact UI-like label. Historical question remains open. | Medium |
| 13712 | Cecil Tearscotter diary / hiding place | Check the hiding-place direction and preserve the narrator's darkly comic voice. | English says ruins “west and north of town”; Korean condenses this to `마을 북서쪽`, matching Chinese but not the more literal English wording. All four locales retain the same 12 embedded line breaks. Historical question remains open. | Medium |
| 13715 | `special attacks from Dodge` -> `회피 특수 공격` | Clarify that these are special attacks performed/triggered from Dodge, not a separate “dodge special attack” category. | English says “from Dodge”; Japanese says moves launched from evasion and Chinese says dodge-triggered. Korean's compressed modifier can be read either way. The localized `{*1}` marker and following line break are preserved. | Medium |
| 13717 | `Cach Cranwyn` -> `카슈 크랜윈` | Verify this isolated proper-name spelling against contextual or official Korean evidence. | Japanese and Chinese offer different phonetic renderings; neither establishes a Korean pronunciation. Historical question remains open. | Medium |
| 13724 | Ost Ordura / Brigand Hall Caverns / Niskaru | Verify the character and place names and whether the mages' responsibility is direct or indirect. | English says the same mages responsible for the Niskaru killed Ost; Korean preserves that link and the plan to enter the caverns for revenge and to stop the source. Historical question remains open. | Medium |
| 13727 | `She spends ... by young Mallion's sick-bed` -> `말리온이 ... 대부분의 시간을 보내` | Review a likely subject reversal: the source says *she* spends time beside Mallion's sick-bed, not that Mallion spends time there. | English `She`, Japanese's omitted but contextually feminine subject, and Chinese `她` agree; Korean marks `말리온이` as the subject of `보내`. | High |
| 13730 | Mine ledger: Overman Mallen / Forewoman Adele / Almain Hewers | Verify office and workforce terms while preserving all quantities, shipment status, dates, and line layout. | Korean retains the three entries, counts, dates, and cargo lists. The 54 embedded line breaks match English, Japanese, and Chinese. Historical terminology questions remain open. | Medium |
| 13731 | Hallam the White / Storyteller / `his telling` | Clarify whether `telling` means Hallam's performance/recitation rather than his story in general. | English distinguishes the Storyteller and Hallam's secret telling; Korean renders the latter as `그의 이야기`. The source context is insufficient to settle the nuance. Historical question remains open. | Medium |
| 13739 | `Visit the Grounds` -> `구내 방문` | Identify the named Grounds and whether this is an arena/courtyard destination or a generic site. | Japanese says to head to a courtyard, Chinese says to go to an academy, and English uses a capitalized plural place label. Korean retains a generic “grounds/premises” sense. Historical question remains open. | High |
| 13748 | Alfar family exile custom | Preserve whether the speaker must self-exile and distinguish that from the general custom of banishing a family/clan member. | English and Japanese support self-exile followed by a general description; Korean retains both clauses and the distinction, though the lore phrasing remains context-sensitive. Historical question remains open. | Medium |
| 13749 | `staff` -> `식솔` | Determine whether `staff` means household servants, retainers, or household members; retain the “all but one returned” count. | English says one staff member has not returned; Japanese uses a retainer/subject term, while Chinese says employee. Korean `식솔` can include dependants beyond staff. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 13702, 13708, 13711-13712, 13715,
  13717, 13724, 13727, 13730-13731, 13739, and 13748-13749 against the active
  Korean and all three source locales. They remain preliminary questions;
  no historical disposition was treated as approval.
- ID 13727 is an additional high-confidence candidate based on the explicit
  subject contrast across the source locales and active Korean.
- The source's long diary at ID 13712, the UI marker at ID 13715, and the
  ledger at ID 13730 retain their line breaks and marker placement.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Embedded line-break counts match throughout the range: ID 13712 has 12,
  ID 13715 has one, and ID 13730 has 54 in each locale.
- Brace, dollar, and hash-token signatures match after normalizing localized
  `{*1...}` contents. No marker-order or structural exception was found.
- Active Korean CSV hashes match the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 13700-13749 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13750-13799.
