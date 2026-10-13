# Disposition Batch: `default` IDs 2200-2249

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions in
  `default` IDs 2200-2249.
- English is the meaning authority; Japanese supports voice, literary reading,
  and disputed agency; Chinese is a secondary cross-check.
- This is a partial editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2202 | Maid of Windemere poem | Unchanged; title treatment, voice, and verse craft remain unresolved. | D-349: uncertain |
| 2204 | Wyvyrn-Gifre family name | Unchanged; canonical Korean spelling unresolved. | D-350: uncertain |
| 2217 | Viscucius on the boots | Unchanged; Korean reports the inscription without guessing the name's role. | D-351: not an issue |
| 2224 | Bayala Tirin / founding of Gleir Rathwen | Correct the opening's agency; retain the rest of the account and its paragraph layout. | D-352: accepted |
| 2227 | People/race/stylus passage | Unchanged; the current phrasing preserves the argument and writing image. | D-353: not an issue |
| 2237 | Flawless Mitharan Frosted Handle | Unchanged; name and modifier relationship unresolved. | D-354: uncertain |
| 2239 | Warlock/Witch Unarmed Parent | Unchanged; whether this taxonomy label is player-facing is unknown. | D-355: uncertain |
| 2242 | Stranger alert | `낯선 사람이야. 낯선 이가 온다!` | D-356: accepted |
| 2243 | Speaker's group / Shadow Pass | Unchanged; the Korean preserves the group and route without naming a faction. | D-357: not an issue |

The four uncertain decisions authorize no CSV changes. The three `not an
issue` decisions also leave their rows untouched.

## Approved Korean Changes

| ID | Previous Korean | Applied Korean | Basis |
| ---: | --- | --- | --- |
| 2224 | `바얄라 티린(Bayala Tirin)은 ... 절벽 위에 도시를 세웠다.` | `바얄라 티린(Bayala Tirin)은 ... 절벽 위에 자신의 도시가 세워지는 모습을 지켜보았다.` | English says she saw the city built, and Japanese likewise presents it as built under her protection. The previous Korean wrongly made her the builder. Only the opening clause was revised. |
| 2242 | `낯선 이다. 낯선 이가 왔어!` | `낯선 사람이야. 낯선 이가 온다!` | Restore a grammatical startled announcement and the source's present arrival warning. |

Only these two approved `Texto` cells were edited.

## Structural Verification

- English, Japanese, Chinese, and Korean `default` CSVs each parse to 65,135
  rows with identical complete ID order.
- IDs 2200-2249 are present in all four locales. Embedded newline counts and
  localized marker identities/order match across the range.
- The Korean account at ID 2224 retains all five paragraphs; approved Korean
  values at IDs 2224 and 2242 match the register exactly.
- The active `affix`, `base`, and `default` CSVs retain their UTF-8 BOM and
  CRLF record endings; no bare LF bytes remain.
- This targeted structural check does not constitute independent linguistic
  approval of the full translation corpus.

## Checkpoint

- Decisions recorded: D-349-D-357.
- Cumulative dispositions: 114 accepted, 38 `not an issue`, and 205
  uncertain.
- Next range: `default` IDs 2250-2299, using
  [`default-ids-02250-02299-preliminary.md`](default-ids-02250-02299-preliminary.md).
