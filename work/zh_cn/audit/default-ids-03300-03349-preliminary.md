# Preliminary Language Scan: `default` IDs 3300-3349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3300-3349.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked UI markup, speaker
  relations, lore terms, name consistency, and long-form text.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3312 | 우리 팀은 벌써 검투장에 와서 기다리고 있어. | Preserve the source's `your team` unless speaker/scene context establishes that they are part of the player's team; also check the destination wording for `gladiator pit`. | English explicitly says “your team”; Japanese calls it the team's waiting area, and Chinese refers to the player's team. Korean changes the possessor to “our team,” which may alter who the team belongs to. | Medium |
| 3314 | 완벽한 미사란(Mitharan)의 회복 손잡이 | Confirm whether `Grip` is a weapon/crafting component and whether `Restoring` names its effect; keep `Mitharan` consistent with the corpus. | English names a flawless Mitharan Restoring Grip; Japanese transliterates the crafting name and Chinese calls it a restoring grip. Korean's literal “recovery handle” is plausible but may not identify the game component or modifier correctly. This repeats the historical question. | Medium |
| 3320 | 난이도: `{*3Very Hard}` | Localize the difficulty label inside the indexed markup span while preserving `{*3...}`; verify the exact Korean UI term for “Very Hard.” | English, Japanese, and Chinese all place a localized difficulty value inside the marker; Korean leaves `Very Hard` in English. | High |
| 3325 | ... 루미너리 리프(Luminary Leaf)에 온 걸 환영하네. | Confirm whether `Luminary Leaf` is the bookstore's proper name and whether `Bookseller, extraordinaire` describes the speaker (an extraordinary bookseller), not the shop. | English addresses the visitor and follows the place name with the fragment “Bookseller, extraordinaire.” Korean instead says “there's no bookstore better than this,” turning the likely self-description into praise of the shop. Japanese/Chinese are also ambiguous, so context is needed. | Medium |
| 3330 | ... 에테네(Ethene)를 실망시켰다. ... 하늘로 강제 소환된 하이페리언(Hyperian)을 찾아내 우리의 인정을 받으려 했다. | Keep the source's uncertain relation between the Hyperian, being forced to the sky, and Arkes's attempt; do not claim a clearer mechanism than the text supports. | The English passage is grammatically fragmented and unclear. Japanese says the Hyperian was raised/floated, while Chinese says it was forced upward. Korean retains the forced-summoning reading, but the source does not explain the mechanism. This repeats the historical question. | Medium |
| 3334 | ... 전쟁의 장로라는 이름까지 주고 교단의 관리자로 삼았어. | Confirm whether `Ancient of War` is a formal rank/title and whether `the order` is a named organization; distinguish being named to a title from being given an ordinary name. | English says they “named me Ancient of War, steward of the order.” Korean translates Ancient literally as “elder” and retains the steward role, but the formal rank is unresolved. This repeats the historical question. | Medium |
| 3337 | 우린... 여기서 끝장이야. | Confirm whether `finished, here` means the group is doomed/defeated or that the conversation/work is over; retain the broken delivery. | English is ambiguous. Japanese says the conversation is over, Chinese says “we will die here,” and Korean means the group is finished/doomed. This repeats the historical question. | Medium |
| 3341 | 거대한 순환 | Align the rendering with other `Great Cycle` occurrences, including the earlier `위대한 순환` candidate, after deciding whether this is a named cosmological concept. | English capitalizes the term, Japanese and Chinese render a great/large cycle, and Korean has multiple literal forms across the draft. This repeats the historical question. | Medium |
| 3345 | ... 그는 타락해 여름 궁정(Court of Summer)에서 쫓겨난 자야. | Confirm whether `fallen` means morally corrupted, disgraced, or formally expelled; Korean currently combines corruption with expulsion. | English says “fallen member”; Japanese explicitly says expelled, while Chinese says fallen/corrupt. Korean includes both `타락해` and `쫓겨난`, potentially adding a causal claim. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3306-3307, 3314, 3318,
  3322, 3328-3329, 3330, 3332, 3334, 3337, 3340-3341, and 3345 against the
  active Korean and source rows.
- Same-numbered historical questions for Phasewalk (3307), Gossamer End
  (3325), Benign Amulet (3328), and crafting components (other 3324/3347
  entries) belong to `base` and were kept separate from these `default` rows.
- IDs 3330 and 3268 preserve their source paragraph/poem breaks. ID 3320's
  `{*3...}` token shape is intact even though its inner label remains English.
- No historical disposition was treated as approval.

## Other Checks

- ID 3303 preserves the comparison of how long the sisters had been dead
  versus alive. ID 3330 retains the confession's sequence of mission,
  failure, attempt, and eruption.
- Proper-name Korean/English marking remains inconsistent across neighboring
  rows and is tracked as a corpus-wide consolidated-review issue.
- No structural changes were made.

## Batch Status

IDs 3300-3349 received one preliminary reading against the stated references.
At the time of this read-only scan, findings were candidates/questions only.
They were subsequently dispositioned in
[`disposition-batch-default-03300-03349-20261009.md`](disposition-batch-default-03300-03349-20261009.md):
three supported corrections were applied, one finding was marked
`not an issue`, and thirteen remain uncertain and unchanged. This does not
constitute independent final linguistic approval.
