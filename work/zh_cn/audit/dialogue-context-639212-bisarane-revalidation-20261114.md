# Dialogue Context Revalidation: `639212.quest_bxml`

- Date: 2026-11-14.
- Scope: all 111 `default` IDs linked by the current asset index; 108 have
  matching asset links in the append-only review ledger.
- The asset has no recognized `QUEST_ID`; it contains
  `NPC_DET_SEE_Bisarane` and 36 dialog-line handlers. These are asset-level
  clues only and do not map any localization ID to an individual speaker or
  establish playback order.
- Ledger-link gaps `47835`, `47960`, and `47963` are recorded here without
  rewriting existing ledger rows.

## Rechecked Findings

| ID(s) | Result |
| --- | --- |
| `1002` | Added the missing source pairing to the named force: `비탄의 힘(Sorrows)`. |
| `9336` | Added `Sorrows` to the existing term pairing. The meaning of `deathblow is still his` and whether `may be dead` is concessive remain unresolved; the sentence itself was not rewritten. |
| `20937` | Added the `Sorrows` pairing. The line's prior meaning/term uncertainty remains open; no speaker or register was inferred. |
| `27378` | Retained. `before the mortal armies follow you` does not establish whether the armies pursue the addressee or follow in death. |
| `28097`, `42431`, `43693`, `44189`, `62882`, `64093` | The current translations already reflect source-supported meaning and terminology; no additional edit was needed. |
| `33482` | Corrected `슬픔의 가문` to a place where the force resides: `제가 통곡하는 왕(Weeping King)으로서 우리를 제때 비탄의 힘(Sorrows)이 있는 곳으로 데려가 비사라네(Bisarane)를 막을 수 있을 것 같아요.` This follows Japanese's “place where the power of sorrow is” and Chinese's “where the Sorrows are,” without identifying it as the House of Sorrows. |
| `40984` | Retained `비탄의 나무`; the English apposition, Japanese, and Chinese do not settle whether `Sorrows` is the tree's proper name or the force near it. |
| `41492` | Added the `Sorrows` pairing to `비탄의 힘`. Whether the source refers to a force, entities, or a container remains unresolved. |
| `61728` | Retained the current Korean without completing the interrupted `Weeping K‒` title or changing `the Sorrows` interpretation. English and Japanese trail off; Chinese supplies a fuller title, which is not sufficient to overwrite the ambiguity. |
| `63817` | Retained the current question and `비탄의 힘(Sorrows)` wording; whether this is a proper name or generic power remains unresolved. |

Five IDs (`1002`, `9336`, `20937`, `33482`, and `41492`) were edited in
this asset pass. Existing review dispositions were preserved; only those
IDs' `source_fingerprint` fields were updated.

## Validation

Across all 111 linked rows, the four language tables were checked for
logical line-break counts and brace-token signatures; no mismatches were
found. Exact-English duplicate groups among the three assets' 471 linked IDs
also have matching Korean wording.
