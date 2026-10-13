# Preliminary Language Scan: `default` IDs 25401-25450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25401-25450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25401-25403 | Fateless / Sagecraft / Odwald Bynothas / The Immortal Fae | Standardize Fate-status and skill terms, verify the author spelling, and determine whether the book title should be treated as a named work. | Korean uses `운명이 없는 자`, `마법물품 제작`, and `오드월드 바이노타스`; Japanese reads Sagecraft as gemcraft and Chinese as enchantment. | High |
| 25405 | “Another pristine day” | Preserve the dry/ironic comment about the city's weather. | Korean reads it as an exceptionally clear day; Chinese instead suggests meeting on another auspicious day. | Medium |
| 25406-25409 | Reddle / Ander’s Bank / Akara-Tor / Tari / House Ansilla | Verify names and resolve whether the opening “Reddle,” is a direct-address fragment; preserve the collapse/survival and Gallows End question. | Korean retains the comma fragment and the survival sequence; Japanese reads Reddle as a direction (“to Reddle”). | High |
| 25410 | “Be careful it you're entering the Mine” | Treat `it` as a likely English typo for `if`; preserve the warning without copying the typo as meaning. | Korean and the other references express a conditional warning. | High |
| 25411 | Sir Airmer / Windemere / the Maid / Champion | Standardize proper names and titles; preserve the two alternative routes to access the Maid's private grounds. | Korean retains defeat-or-dispel choices; Japanese reframes the honor as a “Maid of Windemere” title, while English says “in the Maid's honor.” | High |
| 25414-25419 | chantries / loan label / Borderless Window / Hrindi / Bhaile | Determine whether chantries are generic chapels or named institutions; standardize the UI label and proper names. | Korean uses `예배당` and `테두리 없는 창`, and preserves Hrindi's wedding-gift fragment and the meeting request in Bhaile. | High |
| 25418 | `Fire Armor [DO NOT USE]` | Preserve the warning's meaning and presentation; determine whether the bracketed status should be treated as literal UI text. | EN has `[DO NOT USE]`, ZH has `[不可用]`, KO has `[사용 금지]`; JA renders a parenthetical unavailable label without brackets. This is localized warning text, not a runtime token. | High |
| 25420-25424 | bodies “left in your wake” / pirate / Gask / Telling / Korrinna / Jottun | Preserve the repeated body-burial accusation, fishing-catch context, Telling disruption, and request that Korrinna join the speaker and Jottun. | Korean retains these relations and the ominous Gask image; character names and context-sensitive terms vary. | High |
| 25425-25428 | Lord Ysa / Hallam the White / Fae Cairns / Chaos Portals / Teinir Home | Distinguish the commissioned collection from Hallam's work crafting the Cairns; standardize lore names and preserve the portal/lock-key objectives. | Korean retains both the collection's commission and the Cairn creation and keeps the lost-key joke. | High |
| 25430-25435 | Mithros Giants / Hystis / Gorem Kane / Erathi treasure / King of the Blackened Hall / “queen” | Verify name forms and preserve the guarded treasure's ownership history and quoted “queen” relation. | Korean retains the chain of journal, ring, conversation, and reward; the hall's name and the queen's identity remain contextual. | High |
| 25437 | Belne / Witch Knight Anira / Cann-Rane | Standardize names and preserve that Belne forges a weapon to help defeat Anira and offers repairs as thanks. | Korean retains both the weapon and repair offer; locale transliterations differ. | Medium |
| 25439-25443 | ambition / `Trim` / Thresh / heartvines / Neassa | Determine whether `Trim` is a UI/material label and standardize creature, plant, and character names. | Korean renders Trim as `장식`; Japanese suggests decorative material and Chinese says reduce/cut. Korean retains the roots-before-growth condition and division of tasks. | High |
| 25444-25446 | mortal wisdom / agelessness / armor / Alfar | Preserve the condescending comparison and the speaker's apologetic hedge; standardize Alfar. | Korean retains the apology and contrast, normalizing the source's ungrammatical “Even all greatest...” construction. | Medium |
| 25447-25448 | Lyenna Crosse heirloom / Mithros carvings / sewer cisterns | Verify the family-name form and preserve the necklace's nonmagical calming effect and the report's water-pressure problem. | Korean retains peace/euphoria and the cistern-to-foundation consequence; place/name forms vary. | High |
| 25450 | Houses of Pride / Vengeance | Verify these as formal House names and standardize their Korean rendering. | Korean uses `프라이드 가문` and `벤전스 가문`; English/Japanese/Chinese support named Houses. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 25400-25403, 25406-25409, 25411,
  25414, 25416-25419, 25420-25424, 25425-25428, 25430-25435, 25437,
  25439-25443, and 25447-25450 against the active locale rows. Names,
  speaker/addressee context, institutional terms, the UI warning, House
  collection/Cairn distinction, lore ownership, `Trim`, and the heirloom
  remain preliminary candidates.
- Cross-checked recurring forms for Scholia Arcana, Fateless, Sagecraft,
  Odwald Bynothas, Reddle, Ander’s Bank, Akara-Tor, House Ansilla, the Maid,
  Windemere, chantries, Hrindi, Bhaile, Gask, the Telling, Ysa, Hallam the
  White, Fae Cairns, Chaos Portals, Teinir, Mithros, Erathi, Belne, Anira,
  Cann-Rane, Thresh, heartvines, Neassa, Lyenna Crosse, and the Houses.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25401-25450 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales; no runtime
  variable/control-token mismatch was found.
- ID 25418 has a locale-specific bracket/wording difference in the literal
  `[DO NOT USE]` warning. Korean retains the warning's meaning; Japanese uses
  parentheses instead of brackets. This is a presentation/text exception,
  not a missing runtime token.
- The English source typo at ID 25410 and Chinese meaning shift at ID 25405
  are recorded as reference anomalies; no CSV was edited.
- No other structural exception was found.

## Batch Status

IDs 25401-25450 received one preliminary reading. Its candidates were
re-reviewed in
[`consolidated-context-review-default-25401-25450-20261011.md`](consolidated-context-review-default-25401-25450-20261011.md);
that context review supersedes the earlier uncertain dispositions for this
range. IDs 25406 and 25450 remain specifically held. Continue at
`default` ID 25451.
