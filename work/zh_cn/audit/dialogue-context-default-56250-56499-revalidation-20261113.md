# Sequential `default` Revalidation: IDs `56250`-`56499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 66 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 184 IDs in ascending order.
- Recorded five correction candidates on new ledger rows and six new
  evidence-limited holds. New questions at existing IDs `56266` and `56431`
  are documented below without rewriting their ledger rows. Rechecked the
  nine existing candidates in this range; eight remain supported and the
  current wording at `56416` already matches the earlier proposal. Existing
  ledger rows were not rewritten.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `56269` | Meaning / naturalness | `poultice` is a specific topical treatment, while `바를 약` is generic and slightly awkward in this joking sales pitch. Consider `그런 상처엔 찜질약이 있지!` or another natural term for an applied poultice. | Medium-high |
| `56333` | Meaning / terminology | `Gemstone Tavern` is called a `술집` in Japanese and Chinese, but Korean calls it a `여관`, which suggests lodging. Distinguish this venue from `Gemstone Inn` at `61956`; consider `젬스톤 술집(Gemstone Tavern)`. | High |
| `56380` | Terminology consistency | The named rite `Giving` is transliterated as `기빙`, while related entries use `봉헌` (`56202`, `55727`, `61225`). Consider `체류(Sojourn), 봉사(Service), 봉헌(The Giving)` and apply the same approved term wherever this rite appears. | High |
| `56431` | English pairing / format | This existing `not-issue` row was rechecked and a new candidate identified: `Aloff the Hunter` is rendered `사냥꾼 알로프(Aloff)`, omitting the epithet from the English pairing. Related Aloff entries at `8627`, `53754`, and `55233` also need a scoped consistency decision. Consider `사냥꾼 알로프(Aloff the Hunter)`. The ledger row remains unchanged. | High |
| `56471` | Meaning / terminology | `great priestess` is translated as `대사제`, while the same Korean corpus uses `대여사제` for the explicitly female religious title at `60525`. Consider `대여사제 코리나 그라프(Corina Graf)`. | Medium-high |
| `56482` | Meaning / naturalness | `picked up my business and headed west` suggests taking or moving the business west; `장사를 접고` can imply that the speaker quit business altogether. Chinese supports packing up the business and going west. Consider `장사를 챙겨 서쪽으로 향했어` or a similarly clear phrasing. | Medium |

## Rechecked Existing Candidates

All nine existing rows retain their original append-only ledger entries.

| ID | Current finding and disposition |
| ---: | --- |
| `56253` | `저수조에 독 타기` remains a format candidate for the action objective `Poison the Cistern`; consider the established action form `저수조에 독 풀기`. |
| `56303` | The context-index review identifies `The Glass` as the magical mirror, so `글라스(Glass)` remains a terminology candidate; consider `거울(Glass)`. Keep the vocative `dove` separate from that terminology decision. |
| `56318` | `our quarry` is a singular target, but Korean uses plural `찾는 자들은`; the line also shifts from `-군` to `-읍시다`. Recast it around one target and keep one speech level. |
| `56355` | The same English address `honored one` is translated as `존귀하신 분` here and `고귀한 분` at `50014`. The current address remains a consistency candidate; use one natural Korean form with sentence-appropriate inflection. |
| `56375` | `다시는 말썽 피우지 마` omits the speaker's warning not to be caught causing trouble again. Preserve that warning, for example `다음에 또 말썽을 피우다 걸리면 가만 안 둬.` |
| `56395` | The conditional joke says that having a drink would put the speaker in a tavern; Korean changes this to feeling as if already in one. Preserve the condition and the existing polite tone. |
| `56405` | In the Idylla sewer topic, `I ran the sewer` refers to completing the masons' Sewer Run race; Korean reads as running through the sewer. Consider `석공들의 하수도 경주를 완주했어.` |
| `56416` | The earlier proposal to use `마스터 벨른(Master Belne)` is already reflected in the current text. No further correction is indicated; retain the historical ledger row unchanged. |
| `56433` | The current `지팡이의 여왕 아르진(Argine)` omits `Queen of Staves` from the English pairing and places the name after the title. Consider `지팡이의 여왕 아르진(Argine, Queen of Staves)`. |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `56266` | Meaning / entity | This pre-existing ledger row was previously `not-issue`. `Mitharu's children` could mean literal children or followers: Japanese retains `children`, while Chinese uses a people/subjects sense. Keep `자손` provisional rather than silently deciding the relationship; the original ledger row remains unchanged. |
| `56275` | Meaning / context | `Some` depends on dialogue preceding this row. The row alone does not establish what subset it refers to; Korean's `일부는` remains plausible. |
| `56293` | Meaning / name | `mission` is rendered as a mission institution in Korean, a monastery in Japanese, and a preaching station in Chinese. The English spelling `St. Hadwin` also differs from the recurring `St. Hadwyn`; retain the current wording pending stronger source context. |
| `56321` | Name / entity | English capitalizes `The Walls` and Japanese phoneticizes it, while Korean uses `장벽(The Walls)`. The row does not establish whether this is a named place or a generic reference. |
| `56329` | Meaning / title | The English `Presenting he, the wisest Imperator, the Guardian of Arms` is malformed, and Japanese and Chinese differ on the senses of both titles. Do not impose a rank or equipment-related meaning without context. |
| `56344` | Name / entity | `Revival` is transliterated in Japanese and Korean, while Chinese identifies a revival camp. This row alone does not establish whether it names a place, event, or concept. |
| `56453` | Meaning / source conflict | English and Chinese say they are out in large numbers; Japanese says their numbers have dwindled. Korean follows English and Chinese. Keep the line unchanged pending stronger evidence. |

## Repeated English and Structure

- Sixty exact-English duplicate groups across the corpus touch this range and
  cover 911 rows. Korean wording matches within all of them.
- Four rows contain embedded line breaks: `56251` (5), `56262` (4),
  `56418` (1), and `56450` (8). Each language has 18 embedded line breaks
  across these rows.
- Runtime and layout marker identities and order match across the four
  languages. Localized display text inside markers differs as expected; no
  marker was removed or reordered.
- Of 250 IDs, 191 have indexed asset associations (198 ID-to-asset links
  across 129 assets), and 59 have none. Of the 184 newly recorded IDs, 125
  are linked and 59 are unlinked. Asset associations do not establish
  per-key speakers or playback order.

## Range Result

- All 66 pre-existing ledger rows remain unchanged; 184 new IDs were appended
  in ascending order.
- The ledger covers 58,776 of 65,135 unique `default` IDs (90.24%), leaving
  6,359 unrecorded IDs. Sequential coverage reaches `56499`; next is
  `56500`-`56749`.
- Five candidates and six holds are on new ledger rows; the findings at
  existing IDs `56266` and `56431` are documented here without changing
  their append-only rows. Findings require separate approval before any
  translation CSV edit. No
  translation CSV was changed.
