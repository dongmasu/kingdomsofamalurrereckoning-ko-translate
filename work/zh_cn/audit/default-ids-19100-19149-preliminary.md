# Preliminary Language Scan: `default` IDs 19100-19149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 19100-19149.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, names, and lore terminology.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 19100 | “release him back into the wild” | Identify the creature from context but preserve the speaker's grief and judgment that release was right. | Korean retains the masculine reference and emotional contrast; the line itself does not identify the creature. | Medium |
| 19101, 19110, 19113, 19116 | Niahm / Atheof / Anela / Bisarane / Gwyn Anwy | Align recurring character-name forms and retain the source's relationships. | Korean uses consistent draft transliterations, but references vary; ID 19110 also contains the English typo `reall`, which Korean correctly interprets as “really.” | Medium |
| 19103-04 | Mairu / “rules, trappings” | Determine whether Mairu names a people, group, or identity and preserve the rejection of rules/affectation. | Korean keeps both the name and the freedom-from-convention idea; its referent remains context-dependent. | Medium |
| 19105-06 | Ragnall / King Ysa / Lord Ohn / Scion | Verify the epithet and relationships, and whether Scion is a formal title or role. | Korean renders Ragnall's relationship as `이사 왕의 전우`, matching English; the historical note leaves `Scion` terminology open. | Medium |
| 19110 | four-turn dialogue / lineation | Preserve each speaker turn; treat the `reall` spelling as a source typo, not an intentional word. | English/Korean/Chinese have three line breaks separating four turns; Japanese has six, adding blank lines between turns. Korean follows English/Chinese. | High |
| 19111 | waterfall / pillar / tree activation order | Retain the exact sequence and the curse consequence for each stone. | Korean keeps waterfall → pillar → tree and states each stone curses the player. | High |
| 19112 | Captain Canwen / “Not Captain Canwen” | Preserve the contrast: the speaker is confident Canwen will survive and be recognized. | Korean's `캔웬 대위만은 달라` makes the exception explicit; Chinese also reads “not Canwen,” though less clearly. | Medium |
| 19119 | Bristletongue / plant vs seeds | Preserve the distinction between finding the plant and needing its seeds. | Korean explicitly retains the correction that the seeds, not just the plant, are required. | Medium |
| 19121 | “five gold a hand” | Keep the odd price unit unresolved; do not reinterpret `hand` as a standard quantity without context. | Korean says five gold coins per hand; Japanese uses a numeral 5, while all locales preserve the amount. | High |
| 19126 | increase “the flow” / doom of Ysa | Identify the flow only from surrounding context and retain the speaker's plan and warning. | Korean follows the source's unspecified mechanism and does not invent what flow means. | High |
| 19129 | “masterpiece” watching and taunting | Preserve the personification while leaving the masterpiece's referent unidentified. | Korean retains the day-and-night watching/taunting image; historical notes identify the antecedent as absent. | Medium |
| 19130 | `Scourge DoT Duration [DO NOT USE]` | Retain the unused/test status and verify `Scourge` terminology. | Korean translates the status as `[사용 금지]`; Chinese/Japanese use equivalent localized warnings. This is localized UI text, not a missing runtime marker. | Medium |
| 19132 | White Nil / Priestess | Determine whether White Nil is a person, faction, or title before standardizing its proper-name form. | Korean `백색 닐` preserves it as a name; the source gives no entity type. | Medium |
| 19136, 19138 | Mitharans / Tirin's Rest | Align people and settlement forms with established glossary entries. | Korean uses `미타라 사람들` and `티린의 안식처`; both are recurring terminology candidates. | Medium |
| 19140 | “Home of my heart, and grave of my troubles” | Preserve the deliberate home/grave contrast without resolving the unnamed place. | Korean retains both images in a compact poetic fragment; the location is not identified in the row. | Medium |
| 19144 | surveyor / foundations / Pinadike | Preserve the technical purpose of the survey and the contingency to deliver the report if the surveyor is dead. | Korean retains the missing surveyor, foundation-strength report, and conditional delivery. Historical name/location questions remain. | Medium |
| 19147-48 | Eyes of Tirnoch / Hunter's Pit / duel to first blood | Align formal names and make clear that the duel ends at the first wound. | Korean retains the mirror, base, and attack-stopping objective; its duel line correctly states that the first blood ends the match. | Medium |
| 19149 | Kollossae history / Laboratories / Domus Politica | Verify formal names and preserve the knowledge, experimentation, and diplomacy chronology with all paragraph breaks. | Korean retains the three-paragraph structure and the sequence of Laboratory construction followed by Domus Politica; terminology remains a glossary candidate. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 19100-01, 19103, 19105-06, 19110,
  19119, 19121, 19126, 19129-30, 19132, 19140, and 19144, 19147-49 against
  the active four-locale rows. They remain preliminary; no historical note
  authorizes a translation edit.
- Japanese-only additional blank-line breaks at 19110 were confirmed; Korean
  follows English and Chinese.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 19100-19149
  in identical order.
- No key, row-count, brace/bracket/angle-token, or semantic numeric-value
  mismatch was found.
- At 19110, English/Chinese/Korean have three physical line breaks; Japanese
  has six. The long lore passage at 19149 keeps three paragraphs in each
  locale.
- `[DO NOT USE]` at 19130 is translated in Korean/Chinese/Japanese as a
  warning label; it is not a runtime token. Japanese's numeral `5` at 19121
  corresponds to English/Korean/Chinese spelled-out five.

## Batch Status

IDs 19100-19149 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 19150-19199.
