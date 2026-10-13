# Disposition Batch: `default` IDs 32301-32350

- Decision date: 2026-10-10.
- Scope: all 50 rows and preliminary findings for IDs 32301-32350, compared
  across English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring terminology,
  line breaks, and runtime tokens.
- Decisions: two accepted, ten `not an issue`, and five uncertain.
- CSV changes: IDs 32302 and 32303.

## Findings

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 32302 | Capitalized `the Weave` / `운명의 직조` | Accepted: change to `운명의 태피스트리`, reusing the established setting term accepted at ID 7090 (D-1909). |
| 32303 | `Kollossae` / `콜로사이` | Accepted: change to `콜로세`, following the established people-name form accepted at IDs 30485 and 30676 (D-9868 and D-9942). Keep `lands below` generic because the source does not establish a proper regional name. |
| 32305 | Galataea / wife killed years earlier by a troll | Not an issue: Korean preserves the speaker's emotional correction and the cause/time of his wife's death without importing the Japanese-only troll name Kahn. |
| 32310 | Lever direction-combination puzzle | Not an issue: Korean says the knob must be set to a specific directional combination and does not invent an actual sequence. |
| 32312 | `Erathi` / `에라시족` | Uncertain: the barrier speculation is retained, but the canonical people-name spelling remains open. |
| 32317 | `Abblier` / `애블리어` | Uncertain: active Korean also uses `아블리에`; there is no disposition establishing one canonical name form. |
| 32318 | Official mark of the Dokkalfar Army | Not an issue: Korean uses the glossary-approved `도크알브` and preserves the letter's official mark. |
| 32324 | `On the Founding of the Scholia Arcana` | Not an issue: Korean preserves the named institution, recommended book, and contrast with joining; title brackets are intact. |
| 32325 | `Mudhold Fasting` / `머드홀드 패스팅(Mudhold Fasting)` | Uncertain: English gives this label while Japanese/Chinese read it as a passage; Korean appropriately leaves the source name visible without silently resolving the conflict. |
| 32330 | `A hide belt, meant to be added to gears` / equipment belt | Uncertain: English permits machinery gears or equipment; Japanese and Chinese/Korean differ on the intended item function. |
| 32342 | Nemius Perigums / Crinneus and their book titles | Uncertain: the bibliographic relationship is preserved, but scholar spellings need integrated name review. |
| 32343 | `Gravehal Armory` / `그레이브홀 무기고` | Not an issue: `그레이브홀` follows the established Gravehal place form accepted at ID 8534 (D-2395); `무기고` matches the named Armory. |
| 32345 | `the cycle` / `대순환` | Not an issue: the setting-specific cycle and condemnation of the tower's work are preserved using the established Great Cycle term. |
| 32346 | `ethereal phenomena` / `초자연 현상` | Not an issue: Korean retains the exploratory group, Faelands-and-beyond scope, and source hesitation; `초자연 현상` is a defensible broad rendering here. |
| 32348 | Cradle of Summer and its protective barriers | Not an issue: inhabitants' sleep, homeland energy, sacred-place purpose, and barriers against beasts and humans are retained. |
| 32301-32350 | Four-locale row order, line breaks, and runtime markers | Not an issue: each locale contains the same 50 IDs in order; all inspected line breaks and `#NAMED_ICON_360_LB#`, `{1}`, `{2}`, `{LINE_SPACE}`, and `{3}` tokens are preserved. |
| Remaining ordinary text in IDs 32301-32350 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported semantic or Korean-usage defect was identified beyond the decisions above. |

## Verification

- English, Japanese, Chinese, and Korean each contain all 50 IDs exactly once
  and in identical order.
- Embedded line-break counts match throughout the range, including the poem,
  the named-icon-only row, and the multivariable confirmation prompt.
- Runtime markers retain their identities and order, including
  `#NAMED_ICON_360_LB#` and the `{1}`, `{2}`, `{LINE_SPACE}`, `{3}` sequence.
- Accepted Korean text now reads:
  - ID 32302: `운명의 태피스트리가 정말 풀리고 있는 건가?`
  - ID 32303: `아래 땅의 약탈자들은 경멸받아 마땅하다. 더는 콜로세가 아니니까.`
- Active default CSV SHA-256 is
  `9daeb0cbdf7fc5a9d76a2075125548da805870d2d2fcd9509c07a48266a455c0`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- Register totals after this batch: 978 accepted, 3,612 `not an issue`, and
  5,899 uncertain (10,489 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 32351; 31,784 `default` IDs remain.

These working dispositions are not independent linguistic approval.
