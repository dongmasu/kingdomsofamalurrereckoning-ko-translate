# Disposition and Edit Batch: `default` IDs 13600-13649

- Decision date: 2026-10-09.
- Scope: ten direct preliminary candidates plus the carried historical
  question at ID 13636.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Eleven findings received dispositions: one accepted, three `not an issue`,
  and seven uncertain.
- One accepted `Texto` correction was applied at ID 13647.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13600 remains uncertain: the canonical Korean term for unrefined
  prismere and the Alabastra spelling require glossary/manual confirmation.
- ID 13607 remains uncertain: capitalization may signal a formal Warsworn
  address; literal kinship wording is difficult to settle without setting
  context.
- ID 13609 remains uncertain: the isolated proper name's Korean
  pronunciation is not established by the locale phonetic renderings.
- ID 13612 is `not an issue`: `퇴화한` preserves the broad regression
  meaning; no source establishes a narrower in-world interpretation.
- ID 13614 remains uncertain: the isolated `Sign` could mean signboard,
  symbol, or signature; the locale references conflict.
- ID 13618 remains uncertain: the Marches' canonical Korean name is
  unresolved, and Chinese differs semantically from English/Japanese.
- ID 13629 remains uncertain: formal House names and the force of `pass from
  this world` remain unsettled across sources.
- ID 13635 is `not an issue`: `예언자` naturally renders the prophet role
  supported by Japanese and Chinese; no separate character identity is
  established.
- ID 13636 is `not an issue`: `널 장작처럼 만들 거야` preserves the
  kindling threat without a supported narrower interpretation.
- ID 13639 remains uncertain: English/Chinese attribute the copied key's
  making to Fenan, while Japanese says she commissioned it and was captured;
  retain the unresolved source conflict.
- ID 13647 is accepted: replace `네가 그 샘에서 나온 거야?` with
  `그 샘이 뱉어 낸 게 너야?`. English and Japanese preserve the vivid,
  dismissive “spat out” image; Korean and Chinese soften it to emerging from
  a well.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13647 | `네가 그 샘에서 나온 거야? 이보다 더 나쁠 수도 있었겠지.` | `그 샘이 뱉어 낸 게 너야? 이보다 더 나쁠 수도 있었겠지.` | D-4048 |

## Verification

- The four locale files contain IDs 13600-13649 once each and in identical
  ascending order. The preliminary structural audit found matching record
  line-break counts and runtime-token signatures throughout this range.
- Only the accepted Korean `Texto` wording at ID 13647 changed. Its row key
  and surrounding record remain unchanged.
- Before this batch: 548 accepted, 1,305 `not an issue`, and 2,184 uncertain.
  After this batch: 549 accepted, 1,308 `not an issue`, and 2,191 uncertain
  (4,048 dispositions total).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edit is
  `81baa8187537dec4e2a070e7f2bed5665830a2d63f698719ab36d5498a3059b5`.
- Reversing only the approved text substitution must restore the preceding
  batch's CSV SHA-256 before this edit:
  `420157d47104968c318ffec088ef2599752e5b4fa71b96a5318778d296852cd6`.
- A generic standard-library CSV parse is not used because the existing
  corpus contains multiline/quoting forms it rejects; key order in this
  range was checked line-by-line across all four locale files.
- Resume at ID 13650; 51,485 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
