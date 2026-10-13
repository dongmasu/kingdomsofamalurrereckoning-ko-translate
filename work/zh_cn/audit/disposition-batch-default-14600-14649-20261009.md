# Disposition and Edit Batch: `default` IDs 14600-14649

- Decision date: 2026-10-09.
- Scope: all preliminary findings and carried historical questions in the
  range.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Sixteen findings received dispositions: three accepted, seven
  `not an issue`, and six uncertain.
- Three accepted corrections were applied at IDs 14630, 14639, and 14640.
  Uncertain entries remain unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 14600 is `not an issue`: the Korean reading of `your take on the Hero`
  as a performance/portrayal is supported by Japanese and Chinese.
- ID 14601 is `not an issue`: Korean preserves the delayed Faeblades attack
  and its launch effect.
- ID 14605 remains uncertain: isolated `Enemy Focus` may name a UI state,
  target lock, or combat statistic.
- ID 14607 remains uncertain: Belen's Testament may be a group, doctrine, or
  literal testament; `결사` is not confirmed.
- ID 14611 remains uncertain: the compressed phrase about the Teeth's
  troubles needs regional context.
- ID 14620 remains uncertain: locale references disagree on the terrain and
  canonical Korean form of Gloamthicket.
- ID 14623 is `not an issue`: the Reckoning/fateshifting/unraveling condition,
  localized markers, `{LINE_SPACE}`, and `{1}` placeholder are preserved in
  the checked sequence.
- ID 14627 is `not an issue`: `술에 빠져 살았다` naturally conveys
  `drowned yourself in drink` as an idiom rather than a literal drowning.
- ID 14630 is accepted: replace `동전의 시종 크릴가린` with
  `동전의 잭, 크릴가린(Crilgarin)`. The English title matches ID 14181,
  where the active Korean already uses `동전의 잭`; the change aligns this
  occurrence with that established rendering.
- ID 14634 remains uncertain: the sequence of Garvin Dulac's rise and
  achievement is retained, but his Korean name spelling needs alignment.
- ID 14637 remains uncertain: the temporary +3 dispelling effect is clear,
  but the official Korean skill term is not established.
- ID 14639 is accepted: replace `전쟁의 맹세자여` with `워스원`. The English
  directly addresses a member of the Warsworn, and the active Korean
  consistently uses `워스원`, including ID 14583.
- ID 14640 is accepted: replace `비사레인` with `비사라네(Bisarane)`. The
  latter is the recurring Korean form across multiple active entries and
  preserves the source spelling for this proper name.
- ID 14641 is `not an issue`: Korean's `대열이 무너졌지` is a supported
  military-formation reading of the broken line.
- ID 14645 is `not an issue`: Korean loses the Fae/foe sound-play but clearly
  preserves the indiscriminate attacks and inability to distinguish allies
  from enemies.
- ID 14649 is `not an issue`: the Korean sea-cruise line retains the source's
  sarcastic tone.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 14630 | `동전의 시종 크릴가린` | `동전의 잭, 크릴가린(Crilgarin)` | D-4435 |
| 14639 | `더 알고 싶은 게 있나, 전쟁의 맹세자여? 편하게 물어보게.` | `더 알고 싶은 게 있나, 워스원? 편하게 물어보게.` | D-4438 |
| 14640 | `...비사레인을 찾아 이곳에 무슨 일이 있었는지...` | `...비사라네(Bisarane)를 찾아 이곳에 무슨 일이 있었는지...` | D-4439 |

## Verification

- IDs 14600-14649 were present in the preliminary structural comparison in
  all four locales in identical order. Runtime-marker signatures and embedded
  line-break counts matched there; ID 14623's localized markers,
  `{LINE_SPACE}`, and `{1}` remain unchanged.
- Only the three accepted Korean `Texto` values above were changed. No keys,
  variants, order, row count, or sidecars were edited.
- The active Korean `default` CSV retains its UTF-8 BOM and existing
  record/embedded-line-break conventions.
- Its post-edit SHA-256 is
  `9988ba955f29eaf4d9e922d6fb07fd77fa83faa0af58d31e084b7c7cf6c79385`.
- Reversing only these three approved substitutions reproduces the preceding
  checkpoint SHA-256 exactly:
  `aacc2830e3e9684a6fbc4035306259ebb6ac351a0cc8a15b947bf9d9ceae6961`.
- Before this batch: 570 accepted, 1,396 `not an issue`, and 2,460 uncertain.
  After this batch: 573 accepted, 1,403 `not an issue`, and 2,466 uncertain
  (4,442 dispositions total).
- Resume at ID 14650; 50,485 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
