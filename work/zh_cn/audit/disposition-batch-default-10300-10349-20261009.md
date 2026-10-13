# Disposition and Edit Batch: `default` IDs 10300-10349

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 10300-10349, plus the paired Sagecraft reference at ID 10294.
- English governs meaning; Japanese informs voice/register and structure;
  Chinese is supporting evidence. Historical questions and recurring terms
  were checked against the active rows.
- Fifteen findings received dispositions: four accepted, four `not an issue`,
  and seven uncertain.
- Four supported corrections were applied only to active Korean `Texto`
  cells. This is a working disposition, not independent final approval.

## Decisions

- ID 10300 is accepted: `struck out on my own` means setting out
  independently; the Korean no longer says the speaker moved out to live
  alone. The sword-for-hire context supports `용병 일을 시작했지`.
- ID 10304 is `not an issue`: stubbornness and weakness at haggling are both
  retained, and `아스켈 토린` matches the dominant active rendering.
- ID 10307 is accepted: `작은 무리` preserves the English group's
  unspecified nature instead of adding a military force.
- ID 10309 remains uncertain: the exact target and behavior of `Jump to
  ability` in the UI are not known.
- IDs 10294 and 10315 are `not an issue`: both use the established
  `마법물품 제작` term consistently for Sagecraft and its altar.
- ID 10317 remains uncertain: the Dverga line is clear, but the lore
  ethnonym and Korean plural convention are unsettled.
- ID 10324 is `not an issue`: the implicit antecedent and the lost,
  rediscovered, abandoned sequence are retained.
- ID 10326 is `not an issue`: `잠재우다` keeps the coercive instruction
  ambiguous rather than guessing that the nuisance must be killed.
- ID 10328 remains uncertain: host relationship and quest objective are
  retained, but ceremony and proper-name forms need terminology review.
- ID 10331 remains uncertain: the debate and cultural disagreement are
  preserved, but the exact lore framing remains open.
- ID 10336 is accepted: `양잠업에 종사했어` renders silk farming naturally
  rather than literally saying that silk is grown.
- ID 10340 is accepted: `내 말이 허튼소린지 시험하려 들지 마라` expresses
  the confrontational warning naturally, supported by Japanese.
- ID 10341 remains uncertain: `dove` may be romantic, familial, or teasing;
  the speaker relationship is unknown.
- ID 10342 remains uncertain: the narrator's inclusion in the death threat
  is preserved, but the named-group status of `Sparrows` is unresolved.
- ID 10346 remains uncertain: the prediction is retained, but `Victory
  Games` may be a formal event name or a descriptive phrase.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 10300 | `그래서 혼자 나와 살기 시작했지.` | `그래서 독립해서 용병 일을 시작했지.` | D-2949: restore setting out independently and remove the unsupported literal move-out sense. |
| 10307 | `...어떻게 소수 병력만으로 달렌타스까지 들어왔는지...` | `...어떻게 작은 무리만 데리고 달렌타스까지 들어왔는지...` | D-2951: do not assign a military role absent from English. |
| 10336 | `전성기 때 그들은 비단을 기르는 농부였어.` | `전성기에는 그들이 양잠업에 종사했어.` | D-2959: use a natural Korean occupation term. |
| 10340 | `내 말을 시험하지 마라.` | `내 말이 허튼소린지 시험하려 들지 마라.` | D-2960: preserve the confrontational warning idiomatically. |

## Verification

- The active Korean `default` CSV has 65,135 sequential records (IDs 0-65134),
  a UTF-8 BOM, CRLF record endings, and no bare LF or CR bytes.
- IDs 10300-10349 exist in English, Japanese, Chinese, and active Korean with
  identical keys/order; runtime-marker identities/order and line-break
  counts match. The paired ID 10294 was checked in all four locales as well.
- Only the approved Korean `Texto` cells at IDs 10300, 10307, 10336, and
  10340 changed in this batch.
- Active Korean `default` CSV SHA-256 after the edits:
  `101b0782d7c994b8cfa8dd93d415bc11e715207f4014785773e0591793b5db2f`.
- Before this batch: 451 accepted, 912 `not an issue`, and 1,585 uncertain.
  After this batch: 455 accepted, 916 `not an issue`, and 1,592 uncertain.
- Direct findings and carried historical questions through ID 10349 now have
  dispositions. Resume at ID 10350; 54,785 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
