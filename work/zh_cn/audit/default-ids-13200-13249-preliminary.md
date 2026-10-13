# Preliminary Language Scan: `default` IDs 13200-13249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13200-13249.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13200 | `Almain in Ysa` -> `이사의 알마인` | Clarify whether this fragment identifies a person/group in Ysa or names an item before settling the relationship. | Japanese and Chinese both read as Almain associated with Ysa; the English fragment does not supply context. Historical question remains open. | Medium |
| 13201 | `{*1[지속 효과]}` / mighty Hammer | Verify the established ability label and hammer name; retain the passive marker and its line break. | English, Japanese, and Chinese agree on a passive ability and hammer proficiency, though the localized label and weapon term differ. Korean preserves the effect and marker. Historical question remains open. | Low |
| 13204 | Piercing damage / armor / thick hide | Confirm established damage terminology and preserve the distinction between armored enemies and thick-skinned beasts. | English, Japanese, Chinese, and Korean agree on the mechanic and examples. Historical question remains open. | Low |
| 13207 | `Flawless Mitharan Frosted Bindings` | Identify the item type “Bindings” and whether “Frosted” is an affix/material; confirm the item-name construction. | English gives several stacked item modifiers; the other locales do not disambiguate the equipment type. Korean's `결속구` is provisional. Historical question remains open. | Medium |
| 13209 | Kollossae weaponsmith / hands unfilled | Confirm the Kollossae name form and preserve the joke that the people feel uneasy with empty hands and the smith supplies weapons. | English and Chinese explicitly connect their hands to weapons; Japanese compresses the explanation. Korean preserves the joke and meaning. Historical question remains open. | Low |
| 13216 | `Gallows' Bloom` -> `교수대의 꽃` | Confirm the established flower/item name and possessive-title rendering. | English, Japanese, and Chinese identify a named flower; the Korean literal form is understandable but must be checked against recurring `Gallows End` naming. Historical question remains open. | Medium |
| 13220 | `common living` -> `필멸자의 삶` | Check whether “common living” means ordinary life rather than specifically mortal life. | English does not explicitly say “mortal”; Japanese and Chinese support ordinary/common life. Korean narrows the meaning to a mortal life, which may be intended in Fae context but is not explicit in this line. | Medium |
| 13223 | no mortal sense of time / key timing | Preserve the immortal speaker's distinction and mildly humorous recommendation to find the key sooner. | The three source locales and Korean agree on the contrast and recommendation. Historical question remains open. | Low |
| 13226 | castles / grain / desire / two heirs | Review the poem's speaker, “desire but not wish” contrast, and king/father succession image together; retain its four lines. | Korean preserves all four clauses and the three embedded line breaks. “With two heirs” remains an interpretive construction. Historical question remains open. | Medium |
| 13230 | `That moniker` / ageless / immortal | Identify the antecedent of “that moniker” before deciding whether to name or translate it. | English and Chinese leave the referent implicit; Japanese supplies “Eldest/oldest name,” while Korean follows the broader English wording. Historical question remains open. | Medium |
| 13235 | seasons / ruin / Tala-Rane / two sons | Clarify what share the heirs failed to hold and review the parallel between building and destruction. | English says neither held his share complete; Korean says neither fully claimed his share. Chinese instead describes failure to preserve the father's legacy. The two-line-break poem structure is retained. Historical question remains open. | Medium |
| 13237 | Nexus collapse / Telogrus acolytes / Fatesworn countermeasures | Check the conditional logic and official faction/lore names, especially what “if nothing comes of it” contrasts with. | Korean retains the success/failure contrast, collapse prediction, countermeasures, and three expected Fatesworn actions. Eight embedded line breaks are retained. Historical question remains open. | Medium |
| 13238 | 60% / 20 seconds / 40 Mana | Resolve the numeric discrepancy before any translation disposition. | English, Chinese, and Korean state 60% for 20 seconds; Japanese states 45% for 16 seconds. Mana cost agrees at 40. Keep English as the semantic authority for this preliminary record, without treating it as proof of the intended game value. Historical question remains open. | High |
| 13240 | Codex of Fate / Loremaster of Ballads | Confirm established Korean names and whether Loremaster is a title within the House of Ballads. | Korean renders the title as `발라드의 전승지기`; Japanese identifies the House of Ballads explicitly, while English says “of Ballads.” Historical question remains open. | Medium |
| 13243 | bottled magical spring / Fae bewitchments | Verify the spring's name and whether “bewitchments” means charms, illusions, or enchantments. | Korean's `현혹 마법` is plausible but more specific than the source's broad term. Japanese says magic cast by Fae; Chinese also leaves the effect broad. Historical question remains open. | Medium |
| 13246 | `swan song` | Preserve the metaphor of a final performance/work before the end rather than a literal swan song. | Japanese paraphrases it as a final work; Chinese uses “last song”; Korean's `마지막 노래` preserves the metaphor. Historical question remains open. | Low |
| 13248 | `crudok` -> `크루독(crudok)` | Confirm the creature's Korean form and whether singular/plural species naming is standardized. | English, Japanese, and Chinese agree on a dangerous-spitting creature; Korean meaning is clear. Compare the transliteration with other active occurrences. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions at IDs 13200, 13201, 13204, 13207,
  13209, 13216, 13223, 13226, 13230, 13235, 13237, 13238, 13240, 13243,
  13246, and 13248 against active Korean and all three source locales.
  They remain preliminary questions; no historical disposition was treated
  as approval.
- Added ID 13220 as a current-pass candidate because `common living` is
  narrowed to `필멸자의 삶` in Korean; the surrounding Fae context may
  explain that choice, so it remains unresolved.
- ID 13201 has one embedded line break and a localized `{*1[...]}` label.
  The marker class/order is preserved; only its intended Korean display term
  needs terminology confirmation.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range, including
  the poem, lore entry, and ability description.
- Runtime-marker class/order matches. The localized text inside the passive
  marker at ID 13201 differs as expected by locale; no marker exception was
  found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Active Korean CSV hashes match the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 13200-13249 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13250-13299.
