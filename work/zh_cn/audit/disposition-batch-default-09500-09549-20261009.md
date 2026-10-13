# Disposition and Edit Batch: `default` IDs 9500-9549

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 9500-9549.
- English governs meaning; Japanese informs voice/register and structure;
  Chinese is supporting evidence. Historical audit notes were also checked.
- Nineteen findings received dispositions: three accepted, six `not an
  issue`, and ten uncertain.
- This is an in-progress disposition pass, not independent final linguistic
  approval.

## Decisions

- ID 9500 remains uncertain: `Felltown`'s canonical Korean place-name form
  is not established.
- ID 9501 remains uncertain: `Irion` spelling and English-parenthetical
  display need corpus-wide consistency.
- ID 9503 is `not an issue`: the troll's death, Lou's restored safety, the
  promised reward, and the pond meeting are all retained.
- ID 9504 remains uncertain: the goddess/name forms and localized
  Dokkalfar availability wording need terminology alignment; `{*1...}` is
  preserved.
- ID 9505 is `not an issue`: Korean retains the speaker's wry generalization
  about dangerous things rather than narrowing it to dangerous places.
- ID 9506 remains uncertain: `Creathnach Thintri` and `Skycrown` are
  rendered, but their canonical spellings and the first name's relation to
  the mountain remain open.
- ID 9510 is `not an issue`: Korean retains the abdomen-versus-head/chest
  contrast and the battle-spirit meaning; Japanese supports the bodily image.
- ID 9517 is `not an issue`: the deliberately odd `fleshy friend` address
  and refusal to cause trouble are preserved.
- ID 9526 remains uncertain: `Mission` may be a named religious site, and
  English/Japanese/Chinese differ on its institutional type.
- ID 9529 remains uncertain: English `Corpsman` commonly names a medical
  role, while Japanese and Chinese read “corpse”; game/UI context is needed.
- ID 9530 remains uncertain: the `Scholia Arcana` rendering needs alignment
  with the institution's canonical Korean name.
- ID 9533 remains uncertain: `staff` may mean employees/household staff or
  retainers; Korean `신하들` selects the latter social relation.
- ID 9535 is `not an issue`: the English typo `bee` is evidently `been`;
  Korean conveys the likely intended observation and recent extinguishing.
- ID 9536 is accepted: replace `양날 무기` with `모든 날붙이`. English
  `edged weapons` and Japanese's bladed-weapon wording are broader than
  double-edged weapons. The `{*1...}` marker and two-line layout are
  unchanged.
- ID 9537 remains uncertain: `The Midden` may be a proper place name or a
  common noun; the references do not settle its referent.
- ID 9539 is accepted: revise the calqued metaphor and awkward negative
  clause to `세월에 버려진 곳이지. 패드리그와 친구들이 그렇지 않다고
  설득하게 두지 마.` This preserves both the time-abandoned image and the
  warning not to believe their contrary claim.
- ID 9545 remains uncertain: capitalization and parallel titles suggest
  `The Century Flowers` may be a named quest, item, or species.
- ID 9546 is accepted: replace `그녀의 마지막 말을 전해 들어 마음이
  놓이는구나` with `그녀의 마지막 말을 읽을 수 있어 위로가 되는구나`.
  English and the letter context say the letter contains her final words;
  the prior Korean added second-hand hearing and weakened “comforting.”
- ID 9548 is `not an issue`: the polite register and exactly one remaining
  challenge are preserved.

## Applied Edits

| ID | Previous Korean / affected text | Applied Korean / replacement | Decision |
| ---: | --- | --- | --- |
| 9536 | `양날 무기와 화살촉에 사악한 독을 신중하게 발라 적을 약화할 수 있다.` | `모든 날붙이와 화살촉에 사악한 독을 신중하게 발라 적을 약화할 수 있다.` | D-2674: broaden the weapon category to match `edged weapons`. |
| 9539 | `시간에 버려진 곳이지. 패드리그와 친구들이 아니라고 설득하게 두지 마.` | `세월에 버려진 곳이지. 패드리그와 친구들이 그렇지 않다고 설득하게 두지 마.` | D-2675: preserve the metaphor in natural Korean and clarify the negation. |
| 9546 | `편지를 가져다줘서 고마워. 그녀의 마지막 말을 전해 들어 마음이 놓이는구나.` | `편지를 가져다줘서 고마워. 그녀의 마지막 말을 읽을 수 있어 위로가 되는구나.` | D-2676: avoid adding second-hand hearing and preserve the letter's comfort. |

## Verification

- The nineteen candidate findings were checked against the actual English,
  Japanese, Chinese, and active Korean rows. Historical questions identified
  for this range were checked against the active rows.
- The active `default` CSV parses as 65,135 records with IDs 0-65134 in
  order. Its UTF-8 BOM and CRLF record endings are preserved; there are no
  bare LF endings.
- ID 9536's localized marker and two embedded-line-break layout are
  unchanged. No row key, variant, or runtime marker changed.
- Active Korean `default` CSV SHA-256:
  `2b5a6a0bae02a301bab5f07e0f2ef07f23155fe309800f1898aeeebe22b6259e`.
- Before this batch: 413 accepted, 843 `not an issue`, and 1,417 uncertain.
  After this batch: 416 accepted, 849 `not an issue`, and 1,427 uncertain.
- Resume at ID 9550; 55,585 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
