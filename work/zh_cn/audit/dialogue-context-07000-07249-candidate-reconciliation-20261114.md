# Candidate Reconciliation: IDs `7000`-`7249`

- Date: 2026-11-14.
- Scope: all 24 current candidate IDs in the range, including candidates
  documented in asset-specific reports.
- English controls meaning; Japanese is the primary voice and register
  reference; Chinese is supporting evidence.
- Six candidate IDs needed corrections, 16 were retained as already resolved
  or adequately supported, and two remain held for insufficient evidence.
- Corrections changed 25 unique Korean rows, including linked exact-source
  copies. Speaker identity and playback order were not inferred.

## Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `7014` | Retained | `키프탈 사부(Master Kiftal)` already matches `17937`, `26577`, `29585`, and `32759`. |
| `7015` | Retained | The literal “traveler friend” address had already been removed; the remaining friendly address and casual question read naturally. |
| `7027` | Corrected | Rephrased the enchantment-pattern claim so it clearly says the garment's magic pattern was modeled on a pattern Artan saw in his fate. |
| `7042` | Retained | Both `Destiny Stone` and `Tapestry of Fate` already have English pairings. |
| `7049` | Held | `Stope` denotes a specific mined-out excavation; the available sources do not establish a preferred Korean mining term. |
| `7079` | Corrected | Standardized the standalone `Maire, Queen of Cups` label as separately paired title and personal name across all 19 identical source rows. |
| `7080` | Corrected | Restored the established book identity `세이블의 서신(Missives of Sable)` and removed the redundant guard/unit wording while retaining the familiar `친구` address. |
| `7090` | Retained | `Weave` is distinct from `Tapestry of Fate`; `운명의 실(Weave)` is supported by the established term. |
| `7104` | Retained | The related journal entry `33659` and Japanese identify `Golden Age Alchemy` as a named shop; the current label is paired. |
| `7106` | Retained | `맥동하는 원` accurately describes the pulsing minimap marker; the objective relationship is clear. |
| `7114` | Held | The English does not establish whether the murderer is behind the devices or behind crimes involving them. |
| `7123` | Corrected | Aligned `peasant clothes` to `농민 옷`, supported by Japanese and Chinese and by the matching occurrence at `39711`. |
| `7129` | Retained | `묵은 곡물 요리` preserves the intentionally absurd fable and its stale-grain joke; all 16 embedded CRLF breaks remain unchanged. |
| `7141` | Retained | The `House of Ballads` English pairing appears only at the first mention in the current journal entry. |
| `7147` | Retained | The current question about joining the Warsworn ranks is conversational and preserves the source meaning. |
| `7155` | Retained | `겨울 상궁정(High Court of Winter)` is the established form for the High Court, distinct from `겨울 궁정(Winter Court)`. |
| `7157` | Retained | The handbook is already named `지점 업무 안내서`, matching the related Motus Mining entries. |
| `7189` | Retained | The effect sentence already omits the redundant English parenthetical and reads naturally. |
| `7190` | Retained | The possessive particle is already present in `콜로사이(Kollossae)의 삶의 모든 면`. |
| `7223` | Retained | The actual UI label is paired as `발라드의 집 도서관(Ballads Library)`. |
| `7239` | Corrected | Recast the literal gratitude clause as a direct, natural expression of thanks, consistent with Japanese. |
| `7245` | Retained | The current `반갑군` uses conversational plain speech rather than the previously flagged 하오체. |
| `7247` | Retained | Kept broad `의약제` for the alchemical-product list: Japanese supports a medicinal/laxative sense, while English `physics` and Chinese `物理` do not justify narrowing it to `하제`. |
| `7249` | Corrected | Recast the challenge in casual Korean and stated plainly that the speaker will believe and respect the addressee. |

## Related Rows

The exact-source `Maire, Queen of Cups` group comprises IDs `1590`, `1791`,
`3885`, `4027`, `5429`, `7079`, `8190`, `10729`, `13041`, `15037`, `21023`,
`22673`, `24172`, `25684`, `25823`, `27984`, `28151`, `30613`, and `32542`.
English, Japanese, and Chinese are identical across the group; all Korean
rows now use `컵의 여왕(Queen of Cups) 메어(Maire)`.

ID `39711` was also aligned with `7123` as `농민 옷`. The previous
7000-7999 batch report was treated as historical evidence only; the active
CSV was checked directly, and rows not yet matching the supported wording
were corrected by exact ID.

## Verification

- Refreshed only the 25 changed rows' `source_fingerprint` fields in the
  append-only review ledger.
- All 65,135 ledger fingerprints validated; index and both catalogs reproduced.
- All 11 CSV-preservation tests and nine context-index tests passed.
- The CSV retains 65,135 ordered IDs and its UTF-8 BOM. The newline inventory
  is unchanged at 71,838 CRLF, 244 LF-only, and zero bare-CR endings.
- CRLF-aware `git diff --check` passed.
- No source CSV or extracted game asset was modified.

Sequential candidate reconciliation now covers 383 of 4,015 candidates
(9.54%), with 3,632 not yet reconciled. The two evidence-limited findings
remain open; this is not completion of the broader candidate review.
