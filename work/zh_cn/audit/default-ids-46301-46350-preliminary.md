# Preliminary Language Scan: `default` IDs 46301-46350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46301-46350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46302 | 29/22/22 damage-block values | Preserve all three values, damage types, and the separate stat lines. | Korean retains 29 Magic, 22 Melee, and 22 Ranged damage in three lines, matching the English data. | High |
| 46307 | Lord of the Chase amulet / `목걸이` | Verify the item's exact equipment subtype and standard item-name terminology. | English says amulet; Korean uses the broader necklace term, while Japanese/Chinese use amulet/amulet-like terms. | Medium |
| 46311 | `mission` / `선교단` | Determine whether `mission` means a religious order, expedition, or undertaking before standardizing the Korean group name. | Korean specifies a missionary group; Japanese says monastery, while English and Chinese remain less specific. The speaker's newly-arrived status and volunteering are retained. | Medium |
| 46314 | Forum / Templar Jorielle / Adessa | Standardize the proper-name renderings and verify whether Forum has an established Korean form. | Korean preserves the gnome's identity, surveillance, location, and reason for seeking Jorielle; several names vary from other locales. | Medium |
| 46317 | unique skin/body metaphor | Preserve the warning's wry tone and the idea that the listener has only one body. | Korean renders the source's skin reference as the listener's one-and-only body, preserving the pragmatic meaning while softening the literal image. | Medium |
| 46319 | “reap and sow” / `거두고 뿌리는` | Retain the farming image as a contrast with the strategic Winter Fae conflict. | Korean keeps the paired harvest/sowing image and the need for both intellect and a blade. | Medium |
| 46322 | “I'll have your back” / `뒤를 봐 줄게` | Preserve the promise of support/protection without narrowing it to watching someone's physical rear. | Korean can mean covering someone's back, matching the idiom; scene context may clarify whether the line refers to combat support. | Medium |
| 46330-46331 | houses, Bhaile, Motus, Apotyre | Confirm whether “houses” means families/noble houses and standardize the place/entity names. | Korean renders houses as `가문`, Bhaile as `바일`, and retains the Motus return and Apotyre's chance to resist. | Medium |
| 46332 | Sworn Assembly / `맹세자들의 회합` | Verify whether this names a formal organization or venue; retain the command to enter and stand before it. | Korean follows the “sworn” and “assembly” meanings; Chinese renders it as a hall, so the referent is unresolved. | Medium |
| 46334 | Ohn poem | Preserve the five-line structure, parallel Ysa/Ohn imagery, and the contrast between cultivated landscapes and choking weeds. | All locales retain the five-line layout. Korean preserves death/decay/violence, the hollow armor, choking weeds, land-devouring reach, and approach of Winter; exact poetic imagery remains review-sensitive. | Medium |
| 46343 | Bayala Tirin account; Lyria, Lunala, Fieriol, Durek | Preserve the four-paragraph progression, kinship losses, night travel, and three-springs prophecy; verify canonical names and imagery. | Korean retains all four paragraphs, three springs, and the backward/inward/Fate sequence. Japanese/Chinese/Korean differ in some kinship and landscape phrasing; these remain literary candidates. | Medium |
| 46344 | `first mate` / `일등 항해사`; Tari | Confirm the intended maritime rank and canonical name forms. | Korean preserves the first-mate role, Tari address, death-at-sea inference, and affectionate “silent little scalawag” tone. | Medium |
| 46346 | Sceptre attack control and status effects | Preserve hold/release behavior, increased damage, and status-effect application. | Korean retains the control action and both effects; verify whether “any” means a defined set of effects in this UI context. | Medium |

IDs 46301, 46303-46306, 46308-46310, 46312-46313, 46315-46316,
46318, 46320-46321, 46323-46326, 46328-46329, 46333, 46335-46342,
46345, and 46347-46350 generally retain the English meaning on this first
reading. Names and game terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 46250-46349. It
  specifically flags whether `mission` at 46311 is a religious order or
  undertaking, whether `first mate` at 46344 is a formal rank, whether the
  Sworn Assembly is a formal body, and the Ohn poem and Bayala Tirin account.
- ID 46327 localizes the payload inside `{*1[Passive]}` in each locale; the
  marker identity is present in all four. ID 46332's `{LINE_SPACE}` and
  `{1}` tutorial tokens are outside this batch and are not part of its rows.
- The historical audit's concerns remain unresolved candidates, not
  accepted dispositions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46301-46350 once
  and in identical ascending order.
- All four locales preserve matching line-break counts, including four
  breaks (five lines) at ID 46334 and six breaks at ID 46343.
- Runtime-token identities match after treating the localized payload of
  `{*1[...]}` as locale-specific; no special whitespace discrepancy was
  found.
- ID 46302 retains 29/22/22, ID 46343 retains three springs, and all other
  numeric details are preserved.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 46301-46350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 46351.
