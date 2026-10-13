# Disposition and Edit Batch: `default` IDs 10100-10149

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 10100-10149.
- English governs meaning; actual Japanese informs voice/register and
  structure; Chinese is supporting evidence. Historical questions and
  recurring corpus terminology were checked.
- Eight findings received dispositions: three accepted, two `not an issue`,
  and three uncertain.
- Three accepted corrections were applied only to the active Korean `Texto`
  cells. This is working disposition, not independent final approval.

## Decisions

- ID 10101 is accepted: `I pull your strings now` is rendered as `이제 내가
  널 조종하고 있지`, preserving the claim of manipulation in natural Korean.
- ID 10109 remains uncertain: replacement Keepers prepare at the Crossing,
  but their formal role and the Crossing's place/destination status are open.
- ID 10130 is `not an issue`: `The Scion` matches the recurring title form
  `사이온`; distinct generic Scion senses elsewhere are not being normalized
  together.
- ID 10133 remains uncertain: the Freemen faction is identifiable, but the
  corpus mixes translated and transliterated display forms.
- ID 10140 is accepted: `scullions` is given a contemptuous Korean form, and
  the named collection is aligned to the established `세이블의 서신(Missives
  of Sable)` form.
- ID 10143 is `not an issue`: the inferred return-to-war object is supported
  by the surrounding refusal and Japanese context.
- ID 10145 remains uncertain: the Weave's destruction is preserved, but
  canonical Korean terminology varies in the corpus.
- ID 10146 is accepted: `never leave an impression` is rendered as being
  forgettable, not as leaving a physical trace.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 10101 | `지금은 내가 네 줄을 쥐고 있지.` | `이제 내가 널 조종하고 있지.` | D-2902: render the control idiom naturally. |
| 10140 | `저주받은 하인들이 서신을 얼마나 귀하게 여기는지가...` | `저주받은 하인 놈들이 세이블의 서신(Missives of Sable)을 얼마나 귀하게 여기는지가...` | D-2906: retain contempt and align the named book. |
| 10146 | `결코 흔적을 남기지 않는 자들이지.` | `기억에 남지 않는 자들이지.` | D-2909: restore the figurative “leave an impression” meaning. |

## Verification

- All 50 IDs exist in English, Japanese, Chinese, and active Korean in the
  same order. The active CSV has 65,135 records with IDs 0-65134 sequential,
  a UTF-8 BOM, CRLF record endings, and no bare LF or CR bytes.
- Runtime-marker IDs/order, brace tokens, and embedded line-break counts
  match throughout this range.
- Active Korean `default` CSV SHA-256 after the three accepted edits:
  `8bf6f87adacf92486556f6aa48ba935eb070431f3c15d9442f0d132556f2a13d`.
- Before this batch: 442 accepted, 902 `not an issue`, and 1,557 uncertain.
  After this batch: 445 accepted, 904 `not an issue`, and 1,560 uncertain.
- Direct findings and carried historical questions through ID 10149 now have
  dispositions. Resume at ID 10150; 54,985 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
