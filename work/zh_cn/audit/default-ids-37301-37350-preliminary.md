# Preliminary Language Scan: `default` IDs 37301-37350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 37301-37350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 37301 | Dokkalfar / worship circle | Standardize `Dokkalfar` and Mythany Keen; retain the discreet nighttime meeting without assuming the worship circle is a formal temple. | English calls it a worship circle near the city gates; Japanese says prayer site and Chinese says ritual site. Korean uses `기도 장소`, preserving the meeting location without making it a specific building. | Medium |
| 37304 | Lightning potion recipe | Preserve the two reagent names, quantities, and list structure; verify canonical ingredient terms. | All four locales retain Eel Petal (2) and Scarwood Bark (1). Korean retains both names in parentheses and the two recipe line breaks. | Low |
| 37306 | Traveler / noose | Preserve the quest logic that obtaining the keys can save a Traveler from hanging but requires the speaker to enter jail. | English, Japanese, Chinese, and Korean retain this tradeoff. Korean's `교수대에서 구하다` clearly preserves the execution threat. | Low |
| 37309 | Rathir ruling council / old debts | Preserve that council membership is secret and that its members owe the speaker substantial debts; verify `Rathir` spelling consistency. | Korean retains the secrecy and indebted parties. Japanese instead says those council members previously owed the speaker a large favor, consistent with the underlying leverage. | Medium |
| 37311 | `dog-face` / `개대가리` | Check insult intensity against character voice while preserving the threat and the Whitestone/Snaketail contrast. | Korean renders the direct insult more explicitly than Japanese, which omits it; English and Chinese both retain an insult. The boss-or-Snaketail ultimatum remains intact. | Medium |
| 37313 | `Reverie` / `몽상` | Check whether this is the named lore state `Reverie` or ordinary reverie; preserve the three poetic images. | English capitalizes Reverie and pairs it with deep shadow and far-wind sighs. Korean keeps all three images but uses the ordinary noun `몽상`; Japanese interprets it as meditation. | Medium |
| 37315 | Tuatha have yet to break down the doors | Preserve the cautious reassurance that the Tuatha have not broken in yet, while the speaker considers an attack plausible. | Korean keeps the present status and the warning. Its “they're the sort to do that, so we can't let our guard down” is a natural contextual rendering; the precise future likelihood remains open. | Medium |
| 37316 | Selkie Veil | Standardize the artifact name and verify whether `Selkie Veil` has an established Korean form. | English says the wearer may take any form he wishes; Korean preserves the transformation and stolen-Fae-item history. Japanese renders the name as a seal veil, while Chinese uses a transliteration. | Medium |
| 37318 | `Revival` / `부활` | Determine whether this is a named event, a UI action, or an ordinary revival; do not add “camp” without resource context. | English and Japanese give only `Revival`/`リバイバル`; Chinese expands it to `Revival Camp`; Korean uses `부활`. The resource context is needed to settle the label. | High |
| 37323 | `Dispelling Skill: {*1{1}}` | Preserve the nested runtime marker exactly and standardize the skill name. | All four locales contain the same nested `{*1{1}}` payload. Korean localizes the label as `마법 해제 기술`; the official ability term remains to be checked. | Low |
| 37328 | Hierophant's Den / source phrase “gnomes are creation chaos” | Preserve the apparent intended meaning that the gnomes are causing chaos, but retain the English source error in the audit rather than treating the inferred repair as certain. | The English phrase is ungrammatical. Korean says the gnomes are causing confusion/chaos; Japanese says they are making a disturbance and Chinese explicitly says they are causing chaos. Korean also retains the escape with Argine and leaving Grim to answer for crimes against the Travelers. | High |
| 37333 | royal fortunes / `왕실의 재산` | Preserve the story's claim that Braxis magically hid the royal wealth after Gastyr fell; verify canonical names. | English uses `fortunes`; Korean's `재산` conveys wealth, while Japanese interprets it as family heirlooms. The hidden-by-spell and persistent-adventurer elements remain. | Medium |
| 37337 | “they” / `되찾아야 해` | Confirm the antecedent of `they` from adjacent quest context and preserve the contrast between gentle Fae and crueler beasts. | English leaves the objects implicit. Korean likewise omits the explicit object in the final recovery clause; Chinese supplies a charm name not present in this row's English. | Medium |
| 37338 | Quake values | Preserve +55% damage, 40% chance, 5-second stun, +18 Mana cost, and the two-line label layout. | English, Japanese, Chinese, and Korean retain the same percentages, duration, final-hit condition, and Mana cost. The Korean ability name `지진 강타` should be checked against the established skill glossary. | Low |
| 37340 | `reverie` / `몽상` | Check consistency with the setting term `Reverie` while preserving the centuries-long interruption and the mortal-directed challenge. | Korean retains the elapsed centuries and rhetorical question. The English lowercases `reverie`, so ordinary-dream versus named-lore usage remains contextual. | Medium |
| 37343 | left stockade / `왼쪽 구역` | Preserve that the key opens a door to the left stockade/cell block, not merely an unspecified area. | English specifies the left stockade; Japanese and Chinese describe a prison section. Korean's `왼쪽 구역` retains direction but may lose the enclosure/cell-block specificity. | High |
| 37345 | Flawless Mitharan Rigid Lining | Standardize the item-quality and material terms. | Korean preserves all three item components as `완벽한 미타란 경질 안감`; English and Japanese also treat this as a named item, while the precise glossary forms remain open. | Medium |
| 37350 | Fae Cairns / `페이 케른` | Standardize the recurring Fae Cairns term and preserve the plural/group sense. | Korean transliterates both components. The prior batch flags `케른` as a candidate established form; the Chinese uses a descriptive cairn term. | Medium |

IDs 37302-37303, 37305, 37307-37308, 37310, 37312, 37314, 37317,
37319-37322, 37324-37327, 37329-37332, 37334-37336, 37339, 37341-37342,
37344, and 37346-37349 generally retain the English meaning on this first
reading. Proper names, lore, register, and UI context remain subject to
integrated review.

## Historical Audit Reconciliation

- The historical source-keyed entry for IDs 37300-37399 was checked against
  this batch. Questions at 37301-37316, 37318-37328, 37331-37333, and
  37337-37343 were compared with the four locale rows.
- The nested Dispelling marker at 37323 and Quake values at 37338 were
  checked directly. The English source error at 37328 and the left-stockade
  specificity at 37343 remain preliminary observations.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 37301-37350 once
  and in identical order.
- Embedded line-break counts match across all four locales, including the
  potion recipe at 37304 and Quake description at 37338.
- Detected runtime-marker identities and order match; nested
  `{*1{1}}` at 37323 is unchanged. Quake values at 37338 match.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 37301-37350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 37351.

Subsequent working disposition: see
[`disposition-batch-default-37301-37350-20261010.md`](disposition-batch-default-37301-37350-20261010.md).
The left-stockade correction at ID 37343 was accepted; remaining findings
were dispositioned or left uncertain there. This later working pass is not
independent linguistic approval.
