# Preliminary Language Scan: `default` IDs 12900-12949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12900-12949.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12900 | Anokatos / `back here` | Verify the name and what “back here” refers to in the current location/quest. | Korean preserves the uncertainty but interprets `back here` as behind/in the back; the spatial referent is not clear in the isolated row. Historical question remains open. | Medium |
| 12903 | `Illusory Man` → `환영 속 남자` | Determine whether this is a person, illusion, creature name, or quest/UI label. | Korean reads it as a man appearing in an illusion; the capitalized English label could be a specific entity/category. Historical question remains open. | Medium |
| 12905 | `dove` / `making myself scarce` | Confirm whether `dove` is an affectionate/teasing address and retain the coy promise to return. | Korean uses `아가씨`, omitting the bird/endearment metaphor, and keeps the temporary departure and return assurance. Historical question remains open. | Medium |
| 12906 | `{*1persuasion skill}` / `{LINE_SPACE}` | Verify the official Korean UI term for Persuasion and retain both emphasis markers and the line-space token. | Korean preserves the two localized emphasis wrappers and `{LINE_SPACE}` in order, rendering the skill as `설득 기술`. Historical question remains open. | Medium |
| 12907 | `little fish` / `deeper waters` | Preserve the metaphor about lesser concerns and deeper secrets without making the fish literal. | Korean keeps the aquatic imagery and trailing pause; Japanese is more direct about dismissing “small fry.” Historical question remains open. | Medium |
| 12913 | Eleanor Brea / empty hand / coming darkness | Identify the described statue/receptacle and what specific item its palm is designed to hold. | Korean retains the sentinel-like posture and empty hand, including the implication of a particular missing object. Historical question remains open. | Medium |
| 12914 | `Plagueshield` → `역병 방호` | Align with other current forms (`역병 방호제`, `역병 방패`, `역병 방호막`, `플라그실드`) and establish whether this is a medicine or item name. | Korean uses a fifth form in the recurring terminology set. Historical question remains open. | High |
| 12915 | `killed my fair share` / `band of rag-men` | Preserve that the speaker killed many Tuatha and clarify whether rag-men means poverty, poor equipment, or a group identity. | Korean renders `fair share` literally as “my share” and rag-men as a ragged group; both readings need context. Historical question remains open. | Medium |
| 12917 | Testament / poison / cistern | Confirm the faction's formal name and whether the speaker intends to poison people, contaminate the reservoir, or both. | Korean preserves the plan to poison followers, put their bodies in the cistern, and contaminate the cult's water. Historical question remains open. | Medium |
| 12918 | Poison shard / Sagecraft altar / socketable Gems | Use the established Korean Sagecraft term and standardize shard, gem, and socket terminology. | Korean calls the altar `마법물품 제작 제단`; the English names Sagecraft and the item types, while other locales use different craft/altar terms. Historical question remains open. | Medium |
| 12922 | Dverga / keep / lost age | Verify the race spelling and whether `keep` means castle, fortress, or a named stronghold. | Korean retains Dverga as a name and translates keep as `요새`; the source describes island-wide prominence and ancient Dverga rule. Historical question remains open. | Medium |
| 12926 | `Hierophant` → `대사제` | Confirm the title's canonical Korean form and align it with its recurring uses. | Korean uses the corpus's common `대사제`, while Japanese favors “guide/leader”; the formal religious title remains a terminology decision. Historical question remains open. | Medium |
| 12929 | `key to the Sorrows` → `비탄의 집으로 가는 열쇠` | Determine whether Sorrows means the House/faction or the power of sorrow. | Korean names the House of Sorrows; Japanese instead says a key to “the power of sorrow,” and Chinese also leaves the referent unclear. Historical question remains open. | High |
| 12931 | Belen's will / `kept the Testament` | Clarify whether the speaker followed Belen, guarded the Testament, or fulfilled a religious obligation. | Korean preserves both claims but leaves `kept` broad. The faction/name forms vary in the active draft. Historical question remains open. | Medium |
| 12936 | Wyvyrn-Gifre | Verify the family/House spelling and standard hyphenation. | Korean retains the family name parenthetically but omits the source hyphen in the Korean form. Historical question remains open. | Low |
| 12938 | `Vox Victorium` | Identify whether this is an office, title, or institutional name before choosing translation or transliteration. | Korean transliterates the phrase and retains its English form. Historical question remains open. | Medium |
| 12942 | `Odd? ... a four` | Confirm the odd/even card-wager context and why drawing a four makes the answer “no.” | Korean interprets `Odd?` as asking for an odd number and retains the four-card correction; the exact wager context is not given. Historical question remains open. | Medium |
| 12943 | unnatural heat / fading strength | Determine whether this is poison, a curse, or another combat effect triggered by a grazing blade. | Korean preserves the glancing wound, spreading heat, fading strength, and increasingly heavy weapon. Historical question remains open. | Medium |
| 12944 | Titarion / Great Cycle / balance | Align `Great Cycle` with established lore terminology and verify the balance/season imagery. | Korean renders it as `대순환` and keeps the predecessor/long-season relationship. Historical question remains open. | Medium |
| 12948 | Fallon / `work a shard` | Clarify whether this means crafting/processing a crystal shard and why it would help the worried person. | Korean preserves the concern about Fallon and interprets `work a shard` as handling a crystal shard skillfully. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12900, 12903, 12905-12907, 12913-12915,
  12917-12918, 12922, 12926, 12929, 12931, 12936, 12938, 12942-12944, and
  12948 against the active Korean and all three source locales. They remain
  open.
- ID 12906 retains both localized `{*1...}` markers and `{LINE_SPACE}` in
  order; ID 12945 retains `$M0_SQ06.hankie_cost$`.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Runtime-token signatures match; no structural or marker-order exception
  was found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12900-12949 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12950-12999.
