# Sequential `default` Revalidation: IDs `55750`-`55999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 68 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 182 IDs in ascending order.
- Reconfirmed three existing correction candidates, found one additional
  format candidate at existing ID `55896`, and rechecked the existing
  candidate at `55832`, whose current wording already reflects the earlier
  proposal. A source-conflict hold at existing ID `55784` remains unresolved.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `55896` | English pairing / format | English is `Report to Ambassador Keen`; Japanese `キーン大使` and Chinese `大使基恩` confirm the title and name. The current `킨 대사(Keen Ambassador)` reverses the English title and omits the established full pairing. Use `킨 대사(Ambassador Keen)에게 보고하기`. This is a quest objective, not a speaker-attribution claim. The pre-existing ledger row is preserved. | High |
| `55900` | Name consistency | The active text says `내 리라(Lyra)`, while Japanese consistently renders this character as `ライラ`; the established contextual form is `라이라(Lyra)`. Consider `내 라이라(Lyra)를 찾게 도와줘.` The existing ledger row is preserved. | High |
| `55961` | Meaning / terminology | `five crews of fresh recruits` is an awkward English construction; Japanese explicitly identifies five new recruits and Chinese also describes five deserters. Korean `신병으로 구성된 다섯 부대` incorrectly makes them five units. Use `신병 다섯 명` and preserve that all five bottles of Bogstaunch have been recovered. The existing ledger candidate remains supported. | High |
| `55981` | Naturalness | `Warsworn` is repeated in adjacent clauses. The second mention is recoverable from `그들 이름으로`; consider `난 워스원(Warsworn)의 서약방패병(Pledgeshield)이야. 그들 이름으로 계약이나 별난 의뢰를 맡지.` The existing ledger row is preserved. | Medium |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition | Confidence |
| ---: | --- | --- | --- |
| `55784` | Meaning / source conflict | English calls the destination `Undersea Fasting`; Japanese describes an undersea passage and Chinese says an undersea passageway. The row does not establish whether the English is a proper place name, a typo, or a distinct location. Keep `언더시 패스팅(Undersea Fasting)` provisional; do not silently replace it with a passage term. The existing ledger row is preserved. | Uncertain |

## Rechecked Existing Findings

- `55832`: The earlier candidate proposed `에틴(Ettin)` rather than a generic two-headed creature label. The current Korean already says `에틴(Ettin)들` and otherwise follows the established proposed wording; no further correction is needed. The historical candidate status remains in its original ledger row.
- `55900`, `55961`, and `55981`: Their earlier source-based findings remain supported by the current four-language rows; their append-only ledger records are unchanged.
- `55886`: Japanese differs from English and Chinese on the description of Herc Adwold's situation. Korean follows the English idiom and Chinese meaning (“facing more than his share of challenges”); no change is supported by the Japanese divergence alone.
- `55780`: English and Korean keep `{1}` before `{2}`, while Japanese and Chinese reverse the argument order. The marker identities are preserved and Korean follows English; retain this language-specific ordering.

## Source Notes and Structure

- One exact-English duplicate group touches the range: `Hello.` at `55783` and
  `55935`. Their Korean text matches.
- Five rows contain embedded line breaks: `55823` (10), `55855` (7),
  `55951` (2), `55953` (55), and `55991` (1). Each language has 75 embedded
  line breaks across these rows.
- Runtime/display markers remain present. At `55878` and `55991`, localized
  display text differs by language inside the same marker positions. The
  `55780` argument order difference is recorded above; no token was removed.
- Of 250 IDs, 200 have indexed asset associations and 50 have none. Of the
  182 newly recorded IDs, 132 are linked and 50 are unlinked. Asset
  associations do not establish per-key speakers or playback order.

## Range Result

- All 68 pre-existing rows were preserved; 182 new IDs were appended.
- The ledger now covers 58,403 of 65,135 unique `default` IDs (89.66%),
  leaving 6,732. Sequential coverage reaches `55999`; next is
  `56000`-`56249`.
- The correction candidates and hold at pre-existing IDs are documented in
  this report without rewriting those ledger rows. The `55832` candidate is
  already reflected in the current Korean text.
- Findings require separate approval before any translation CSV edit. No
  translation CSV was changed.
