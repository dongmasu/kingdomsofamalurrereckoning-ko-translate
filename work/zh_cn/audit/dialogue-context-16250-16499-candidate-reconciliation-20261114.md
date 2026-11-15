# Candidate Reconciliation: IDs `16250`-`16499`

- Date: 2026-11-14.
- Scope: all eleven current ledger candidates, compared across English,
  Japanese, Chinese, and the active Korean translation.
- Ten existing corrections were confirmed. ID `16389` was refined for
  sentence structure and meaning clarity.
- Asset associations support grouping only; no unsupported speaker or
  playback-order assignments were made.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `16250` | Previously applied, confirmed | English `Ambassador Mandolph` and Japanese `マンドルフ大使` support the complete label `맨돌프 대사(Ambassador Mandolph)`. |
| `16283` | Previously applied, confirmed | English's broken, accusatory clauses and Japanese's plain speech support the direct ending `너희가 죽였어`; it avoids the unnatural passive-agent fragment. |
| `16301` | Previously applied, confirmed | English and Japanese place the posted guards before the Watch, not at the market itself. `도시 경비대(City Watch) 앞에는 ... 경비병이 서 있어` preserves the navigation distinction. |
| `16368` | Previously applied, confirmed | English `time and resources` and Japanese `時間と手段` describe the means to help. `시간과 여건` is natural in the offer and does not imply literal supplies. |
| `16389` | Refined | English and Chinese describe the armor's stone and steel plates as blood-painted for six months; Japanese explicitly says blood was applied to the plates. The prior Korean left the armor as the apparent subject of `피를 발랐다`. The revised text makes the plates the subject of the passive clause and explicitly keeps the armor as the subject of `greedily drinks`. |
| `16391` | Previously applied, confirmed | The consoling line preserves the thought that people can make a difference and not everything rests with gods or madmen. Its plain Korean register matches Japanese. |
| `16404` | Previously applied, confirmed | `fight fire with fire` is naturally rendered as `불에는 불로 맞서야 해`; the Japanese idiom differs literally but does not contradict the English. |
| `16443` | Previously applied, confirmed | English `alone in the wilderness`, Japanese `荒野に突き立って`, and Chinese `独自矗立` support the solitary standing stone. `홀로 선` is concise and natural. |
| `16452` | Previously applied, confirmed | English `Notices of Duty` and Japanese `召集通知` identify military call-up notices. `복무 소집 통지서` follows the established term used by the related item label and SQ122 entries. |
| `16461` | Previously applied, confirmed | The English describes a projection of the Fae maiden while she dreams; Japanese and Chinese likewise identify a dream-related apparition/projection. `꿈꾸는 그녀의 투영체` preserves that relation without assigning a speaker. |
| `16478` | Previously applied, confirmed | The sentence refers to the Dverga tunnel/bunker network. English ID `54487` defines the Fastings, and IDs `5728`, `6372`, `6650`, and `13930` corroborate the same network. `패스팅(Fastings)` follows the established bilingual term. |

## Related Checks

- The related SQ122 review confirms the `Notices of Duty` term at
  `16452` and the Watch-location distinction at `16301`; it does not assign
  individual speakers or playback order.
- The SQ84 review confirms the offer wording at `16368`; its multi-NPC asset
  does not establish a speaker for that specific row.
- Two other apparent candidates in the range, `16276` and `16414`, were
  already dispositioned as `not-issue` in their asset-specific reviews and
  are not part of the eleven current ledger candidates.
- No unrelated rows, source CSVs, or extracted assets were changed.

## Verification

- All eleven current candidates are reconciled. Cumulative reconciliation is
  914 / 4,015 (22.77%), with 3,101 remaining.
- Only `default:16389` was changed in this range. Its four-language
  `source_fingerprint` was refreshed; other ledger fields were preserved.
- The row has no embedded line breaks or runtime/layout markers. The
  preservation tool retained the CSV's encoding, row order, and line-ending
  bytes.
- The complete ledger, generated index/catalog checks, relevant regression
  tests, CSV structure/newline inventory, and CRLF-aware diff check are
  recorded as verified after this edit.
