# Disposition and Edit Batch: `default` IDs 30701-30750

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  30701-30750, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, historical notes, and recurring
  terminology.
- Decisions: two accepted, six `not an issue`, and four uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 30708 | `우리에겐 할 일이 정말 많아` | `우리에겐 정말 많은...` | English ends mid-thought at “We have so much,” and Chinese preserves the same unfinished fragment. `할 일` supplies an unsupported object/action. |
| 30738 | `앞날이 어두워` | `그들은 파멸할 운명이야` | English says the newest Crows are doomed, a stronger claim than having bleak prospects. The fourth-member/new-leader search remains intact. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30717 | Chinese-only trailing U+FEFF after `Wystran Nol` | Not an issue for Korean: the active Korean row contains no format character, and the extra character exists only in the immutable Chinese source. Preserve the source as-is. |
| 30719 | Reunion “in the cards” / Tapestry fate image | Not an issue: Korean preserves the card image and links it to the Tapestry's design; Chinese also explicitly retains cards. The reading fits the fate context without changing the outcome. |
| 30737 | Desert Runner and Rattlesnake fable | Not an issue: speaker turns, the borrowed-voice promise, tail placement, and the causal explanation of the rattling sound are retained. |
| 30744 | Chapter 5 poem lineation | Not an issue: Korean follows the English source's eight embedded line breaks. Japanese and Chinese have eleven; keep the source-aligned Korean layout and final repeated `nothing` image. |
| 30748 | Duplicated `is` in English source instruction | Not an issue: the duplicated verb is a source typo. Korean retains the lever location and route past the Faer Gorta rune trap without reproducing the grammatical error. |
| Remaining ordinary dialogue, objectives, labels, and text in IDs 30701-30750 | Ordinary text | Not an issue at this pass: no additional supported meaning or voice error was identified; unresolved names and context questions are tracked separately. |
| 30707 | Four-line Indarian poem | Uncertain: the four-line structure and central images are retained, but canonical forms for the Magus King, Kandrian, Indarian, and Aodh need glossary alignment. |
| 30713 | Hollow of Cathrus / `캐스러스의 움푹한 곳` | Uncertain: this is a key to a named destination; Japanese and Chinese identify a cave/location, but the canonical Korean place-name and treatment of Hollow are unresolved. |
| 30725 | Godstorm / `신들의 폭풍` | Uncertain: it is a named historical event, but Korean forms and spacing vary across the corpus. |
| Other named terms in IDs 30701-30750 | Rond Farm / Dennrit / Cathrus / Hystis / Tapestry / Efyr Dynnwel / Godstorm / Castellan / Tirin's Rest / Tuatha / Crows / Desert Runner / Rattlesnake / Wencen / Sweden / Faer Gorta / Turin / Jedda and related terms | Uncertain: personal names, factions, ranks, places, creatures, and historical-event terminology need integrated glossary/context review. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 30701-30750 once,
  in identical order.
- Runtime-token identities/order match. The four-line poem, fable paragraphs,
  and Chapter 5 poem lineation are retained.
- The Chinese-only U+FEFF at ID 30717 is absent from the Korean row and was
  not edited; no Korean-specific structural exception was found.
- Only the accepted Korean `Texto` cells at IDs 30708 and 30738 changed.
- The UTF-8 BOM and pre-existing record-ending distribution are preserved.
- Active default CSV SHA-256:
  `eed4a243a50e01b348e4a7e26042b439074123660355871f7c89f684b6bead7b`.
- Register totals after this batch: 937 accepted, 3,459 `not an issue`, and
  5,559 uncertain (9,955 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 30751; 34,384 `default` IDs remain.

These working dispositions are not independent linguistic approval.
