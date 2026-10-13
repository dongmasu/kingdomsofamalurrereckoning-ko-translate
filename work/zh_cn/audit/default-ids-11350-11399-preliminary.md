# Preliminary Language Scan: `default` IDs 11350-11399

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11350-11399.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11350 | Bisarane / Proving Halls / poisoned Fae | Verify the proper names and preserve that the dying Fae may, but is not confirmed to, hold the escape key or more information. | Korean retains the reported poisoning, uncertain escape-key role, and possibility of further information. English and Japanese support this uncertainty; Chinese's construction is less clear. The Bisarane spelling should be aligned with other occurrences. Historical notes already flag the entry. | Medium |
| 11355 | `Flawless Mitharan Damaging Bindings` → `완벽한 미사란 피해 결속구` | Verify the item's category and established Mitharan term; do not infer whether Damaging names an effect or damage type. | Korean preserves quality, Mitharan affiliation, damage, and bindings, but the English item label gives no category details. Historical notes already flag the equipment term. | Medium |
| 11360 | Octienne / Well's core / Laz / resurrection | Confirm the Well's core terminology and preserve uncertainty about whether the assistant could be brought back; retain all three paragraphs. | Korean preserves the assistant's competence, guarded past, trust question, independent attunement, and conditional chance of return. The three-paragraph structure matches. `Laz` and the Well's core remain setting-specific terms. Historical notes already flag these. | Medium |
| 11361 | `There is no ending the winter` | Determine whether this means literal winter cannot end or that the Winter Court persists through reincarnation; preserve the defeated tone. | Korean says winter itself cannot be ended. Japanese says the Winter Court repeatedly returns and cannot decline, while English/Chinese retain a winter-ending image. The lore distinction remains unresolved. | High |
| 11362 | `Scorned to War` → `전쟁을 꺼리는 자` | Confirm whether the epithet means one who disdains war or one reluctant/fearful of fighting. | Korean follows the historical provisional “reluctant to fight” interpretation; English and Japanese frame it as an epithet, while Chinese uses a compressed “war despiser” form. Historical notes already flag the phrase. | Medium |
| 11363 | Sphere of Protection / `{*1[Active - Sustained]}` | Verify the localized ability category/name and preserve the marker wrapper and line break. | Korean retains the active/sustained wrapper and states that the barrier blocks part of each incoming attack's damage while active. The wrapper class/order and line break match across all four locales. Historical notes already flag the ability label. | High |
| 11370 | Kandrian / Acatha / “great keep to the south east” | Preserve the spatial ambiguity: determine whether the keep is southeast of the kingdom or whether the Lords ruled from a southeastern keep. | Korean says the Lords ruled from a great fortress in the southeast. English and Chinese support a southeastern fortress, while Japanese can be read as saying they ruled territory as far as the southeast. Historical notes already flag the source relation. | Medium |
| 11378 | `Appearance of the Fae` → `페이의 외형` | Determine whether this is a character-customization label or a general description; do not read Appearance as “arrival” without context. | Korean and Chinese interpret outward appearance; Japanese can mean the Fae's appearance/manifestation. The isolated label does not establish its menu location. Historical notes already flag it. | Medium |
| 11381 | `Counsel` → `고문` | Reconcile this adviser reading with ID 11090, where Korean uses `평의회(Counsel)`. | English and Japanese/Chinese evidence here favor an adviser/counselor, not a council. This row supports `고문` but leaves the earlier `평의회` rendering inconsistent. Historical notes explicitly ask for this reconciliation. | High |
| 11384 | `Salvation awaits` → `구원이 기다리고 있다` | Follow English/Japanese provisionally; verify whether the line is a promise or says salvation has not yet been attained. | Korean follows the English/Japanese “awaits” construction. Chinese says salvation has not yet been obtained, changing the time/state. Historical notes already flag this conflict. | Medium |
| 11385 | Weapon Attacks / Parry / Faeblades | Verify the official ability/weapon terms and preserve the localized marker plus line break. | Korean retains the `{*1[...]}` wrapper, Parry-triggered special attacks, Daggers, and Faeblades. The line break and marker class/order match all references. Historical notes already flag the UI terms. | High |
| 11386 | `the Unbound` → `언바운드(Unbound)` | Confirm whether Unbound is a named people/faction and what “after those who came before” means. | Korean treats Unbound as a self-chosen group name and says they look to the player for guidance/protection. English and Japanese support a named group; Chinese's “named after predecessors” remains ambiguous. Historical notes already flag it. | Medium |
| 11392 | `{*1junk}` / `{1}` | Verify the official junk-inventory UI term and preserve the button substitution token. | Korean says the item is in the junk container and pressing `{1}` sells all junk. Both the localized marker wrapper and `{1}` token are retained in source order. Historical notes already flag the UI wording. | High |
| 11395 | `Kollossae Slaver M` → `콜로세 노예상(남성)` | Align the Korean people-name with the corpus-wide term and confirm that `M` denotes a male variant. | Korean interprets M as male; Japanese and Chinese explicitly say male. The people-name continues the active `콜로세` form, which varies elsewhere. Historical notes already flag both details. | High |
| 11396 | `FAIL LINE 1` | Determine whether this diagnostic-looking string is visible in the shipped game; retain it provisionally. | Korean, English, and Japanese preserve the exact string; Chinese translates it. No evidence here establishes whether it is player-facing. Historical notes already flag it. | High |
| 11399 | Unbound Path / Order of Mitharu | Verify the group/path names and preserve the source's final fragment and stated punitive motive. | Korean retains that the Order destroyed references to the Unbound Path to punish believers. English/Japanese/Chinese agree on the claim, though the English is a fragment. Historical notes already flag these terms. | Medium |
| 11359 | “all the Fae we could ever hope to meet” | Preserve the speaker's exasperated meaning without making the Korean phrasing redundant or unclear. | Korean says `페이가 페이란 페이는 다 있어`, which repeats the ethnonym and may obscure the source's “all the Fae one could hope to meet” hyperbole. Japanese expresses an overwhelming number of Fae; Chinese differs on whether anything besides Fae is present. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11350, 11355, 11360-11363, 11370,
  11378, 11381-11382, 11384-11386, 11392, and 11395-11399. They remain
  open; historical candidates were not treated as approved.
- Confirmed the `Counsel` mismatch between IDs 11090 and 11381; both remain
  provisional pending a consistent sense decision.
- Confirmed that the letter at ID 11360 retains all three paragraphs, the
  ability rows at IDs 11363 and 11385 retain their wrappers, and ID 11392
  retains both tokens.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and normalized runtime-marker
  class/order signatures match across all four locales in this range.
- IDs 11360's two paragraph separators, 11363/11385's marker wrappers and
  line breaks, and 11392's `{*1...}` plus `{1}` tokens are preserved.
- No structural exception was found. Official Korean manual terminology
  could not be independently searched in this environment. No active CSV
  was edited; checkpoint hashes remain unchanged.

## Batch Status

IDs 11350-11399 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 11400-11449.
