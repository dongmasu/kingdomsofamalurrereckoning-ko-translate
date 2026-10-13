# Disposition and Edit Batch: `default` IDs 26851-26900

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26851-26900, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and three uncertain.
- Accepted correction at ID 26896 is applied to the active Korean CSV.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26896 | Wolf Pack unit type | Accepted: change `정예 사살 부대` to `정예 암살 부대`. English identifies an elite death squad operating behind Tuatha lines; Japanese explicitly calls it an elite assassination unit. The revision is more idiomatic and fits the covert military context. |
| 26851-26855, 26857-26868, 26870-26877, 26880-26888, 26900 | Dialogue, quest, and concise UI/item wording | Not an issue: the reviewed wording generally retains English meaning and Japanese-supported voice. Separate name and context questions remain open. |
| 26865, 26869-26870, 26893 | Named-icon token / Stun value / gem-removal markers | Not an issue: `#NAMED_ICON_BLOCK#`, +15% Stun Duration, and `{LINE_SPACE}{LINE_LEFT}` are retained in the expected positions. The U+FEFF at ID 26870 occurs only in Chinese and is not present in the Korean draft. |
| 26856, 26858-26860, 26862-26863, 26870, 26872, 26874, 26877, 26880, 26883-26885, 26889-26899 | House of Ballads / place, person, faction, and item names / Wolf Pack | Uncertain: canonical name forms and the Wolf Pack's institutional status need corpus-wide or lore-context alignment. The accepted unit-type wording at ID 26896 does not settle its proper names or organization convention. |
| 26878 | Courteous request to ready weapons | Uncertain: `친절을 베풀어` preserves the request but may sound overly literal; the speaker's intended degree of formality needs surrounding voice context. |
| 26879 | “It has been taken” / candle ritual | Uncertain: English leaves the passive referent implicit, Japanese says the candle is absent, and Korean says someone took an unspecified item. Preserve pending scene context. |

## Verification

- Four-locale key/order and runtime-token checks from the preliminary report
  were retained. The Chinese-only U+FEFF at ID 26870 remains untouched.
- Only ID 26896's `Texto` wording was edited. No IDs, variants, or row order
  were changed.
- The active default CSV preserves its UTF-8 BOM and pre-existing newline
  counts (72,046 CRLF endings and 39 bare-LF endings).
- Active default CSV SHA-256:
  `7c29102be8e79b384079c17872c5d15de980db654bfb72954dbdd8d3f10ca4d0`.
- Register totals after this batch: 844 accepted, 2,926 `not an issue`, and
  4,858 uncertain (8,628 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26901; 38,234 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

The 26 unique prior uncertainties in D-8630-D-8632 were resolved: three
accepted corrections and twenty-three `not an issue`. ID 26896's accepted
unit description at D-8633 was linked without recounting. Totals are 2,215
accepted / 24,608 `not an issue` / 11,701 uncertain (38,524). See
[`consolidated review 26851-26900`](consolidated-context-review-default-26851-26900-20261011.md).
