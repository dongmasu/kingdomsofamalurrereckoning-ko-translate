# Preliminary Language Scan: `default` IDs 26901-26950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26901-26950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26901-26908, 26910-26929, 26931-26933, 26935-26946, 26948-26950 | Dialogue, lore, quest, and concise UI/item text | Recheck voice, idiom, and recurring names/terms during integrated review. | Korean generally retains English meaning and Japanese tone. Names include Oleander Sinclair, Myfa Rhonwen, Cynoc's Eye, Besin, Gardens of Ysa, Lord Kandrian, Testament, Cipher of Ethene, Orcha Tetran, Kollossae, Maire, Enconeg, Anela, Culn, Savant, and Hierophant. | Medium |
| 26905, 26908 | “Chain Reaction” / `{1}` and `{2}` | Preserve the effect trigger, five-stack maximum, time values, and variable order. | Korean activates the effect on each successful hit and states up to five stacks. The two time placeholders remain in source order at 26908. | High |
| 26909 | Four-part Unbound poem / literal `\"` | Confirm whether the backslash-quote sequences are intentional text or an export/format artifact; preserve all four slash-separated lines in the meantime. | Korean contains two literal `\"` sequences around the poem, whereas the other locales use their own quote style. Historical audit has flagged the same Korean escape pattern at another ID; it is not treated as a structural CSV failure or silently removed. | Medium |
| 26913 | `Cynoc's Eye` / “echanted” | Retain the source's apparent spelling error in the audit while translating its likely intended sense; standardize the relic/tool name. | English says `echanted gem`, apparently a source typo for “enchanted.” Korean conveys a magically imbued gem/relic without reproducing the typo. | Medium |
| 26921-26930, especially 26930 | Testament / Haven / Cipher of Ethene / Orcha Tetran / Kollossae / Hollowlands / Ghennig / card-game exchange | Resolve recurring terms and the intended meaning of “Higher, is it? And the card is ‒ four. So you win.” | Korean asks whether a higher card is wanted, then says the card is four and the addressee wins. The English card-game logic is terse and the historical audit specifically leaves this line open; Japanese also preserves an elliptical exchange. | High |
| 26933-26934 | `The Burn` / “Stick it too far” | Confirm whether The Burn is a named military area and what object/action “stick it” refers to; retain the ambiguity until context is clear. | Korean renders The Burn as `번트` and interprets the warning as pushing something in too deeply. The source can support that literal reading but may also be suggestive; the old question log leaves both terms unresolved. | High |
| 26939-26949, especially 26943 and 26947 | Enconeg / Ettinmere / Nuala Ignas / Anela / Culn / Savant / Seasteel / Tuatha / Lanus Davril / Hierophant / Wolf Pack | Align proper-name spellings and determine whether `Savant` is an established rank rendered as `현자`; clarify whether “your pack” at 26947 is the Wolf Pack or a personal group. | Korean identifies Savants as leaders who obey only the Archsage, matching the stated hierarchy. At 26947, Korean uses `무리`, which preserves the English ambiguity rather than importing the Wolf Pack reading. Historical questions flag both the rank/name inventory and possible Wolf Pack referent. | Medium |
| 26950 | imprisonment / serving a sentence | Preserve that resting on the cot is optional and that the player may serve out the sentence. | Korean retains the optional rest and sentence context without changing the instruction into a mandatory rest. | High |

## Historical Audit Reconciliation

- The historical question log groups IDs 26900-26905 and 26908-26918 for
  Oleander Sinclair, Myfa Rhonwen, Cape Solace, Chain Reaction, its stack
  cap, the Unbound poem, Faer Gorta, Cynoc's Eye, Besin, Gardens of Ysa,
  Kandrian, and Shattered Shrine.
- It separately flags the Testament/Haven/Cipher/name cluster, the card-game
  line at 26930, The Burn and the warning at 26934, and the 26939-26949
  names/ranks. At 26947, it specifically asks whether “pack” means Wolf Pack.
- These entries remain historical issue inventory, not approved findings.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26901-26950 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match across all four locales.
- The five-stack cap at ID 26905 and `{1}`/`{2}` placeholder order at 26908
  are preserved. No unexpected format character was found in this range.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 26901-26950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26951.
