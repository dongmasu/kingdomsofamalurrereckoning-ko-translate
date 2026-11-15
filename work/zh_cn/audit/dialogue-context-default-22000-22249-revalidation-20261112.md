# Sequential `default` Revalidation: IDs `22000`-`22249`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 65 existing ledger records and added 185 previously unrecorded
  IDs. Seven candidate IDs and four new evidence-limited holds were recorded;
  the existing hold at `22080` was retained.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `22042` | Meaning / honorific | `her grace` is an honorific, but `우아하신` describes elegance rather than conveying the title. Consider a title-form rendering such as `암흑의 여사냥꾼 전하`, preserving the introduction's ceremonial tone. | Medium |
| `22072` | Objective style | This `Kill the ...` objective ends in `처치`, while matching objectives use the established `-하기` form. Consider `뿌리 골렘(Root Golem) 처치하기`. | High |
| `22111` | Meaning / naturalness | English `Landed on, really` is rendered `그 사람 위로 넘어졌죠`, which can mean falling over him. Japanese says the speaker got on top of the body and Chinese says they stepped on it. Consider `정확히는 그 위에 떨어졌죠`, retaining the comic correction. | Medium-high |
| `22133` | Title pairing | The book title `Osa's Art of Love, Part I` is translated but not paired with its English title. Consider `오사의 사랑의 기술, 제1부(Osa's Art of Love, Part I)`. | High |
| `22135` | Terminology | Capitalized `Adept` is a Scholia Arcana rank/title, while `숙련자` is left unpaired. Consider `숙련자(Adept)` without changing the first-person description. | Medium-high |
| `22164` | Meaning / format | `대회계원(Bursar's)의 규정` leaves the possessive suffix inside the English parenthesis and reads awkwardly. Consider `대회계원(Bursar)의 규정` or another natural form that retains the office name. | High |
| `22247` | Name consistency | This asset spells the same character `올라프(Olaf)` elsewhere, but this row says `오라프(Olaf)`. Align this occurrence to `올라프(Olaf)`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `22032` | Meaning / text identity | `JAM` is capitalized in English, while Japanese paraphrases it as “keep working” and Chinese omits it. The row alone does not establish whether `JAM` is a name, mode, or wordplay; retain it provisionally. |
| `22055` | Meaning / proper-name status | Capitalized `the House` may be a named faction or a generic house/order. The surrounding title and translations do not establish which; do not substitute a specific House name. |
| `22080` | Speech level | Retain the prior hold: Japanese is casual while Korean is polite, but the asset does not identify the line's speaker or interaction stage. |
| `22181` | Rank terminology | Japanese `兵卒` and Chinese `列兵` do not establish a precise Korean rank equivalent for `Private`; retain `오디(Odi) 일병` provisionally. |
| `22242` | Meaning / proper-name status | `The House` is generic in the Korean and Chinese rows, while Japanese identifies the House of Sorrows. The English alone does not resolve whether this is that faction; retain the generic Korean wording pending context. |

## Rechecked Findings And Structure

- The existing candidates at `22072`, `22111`, and `22247` remain supported.
  The prior hold at `22080` also remains unresolved.
- The range touches 59 exact-English duplicate groups (949 corpus rows);
  Korean wording matches within each group. All four languages have 18
  logical line breaks, with per-row break counts matching.
- Runtime/control tokens are present with matching multiplicities. At
  `22040`, Japanese and Chinese reorder `{1}` and `{2}` relative to English
  and Korean; this language-specific parameter order is preserved rather
  than treated as a missing-token error.
- Asset links and co-occurring NPC/handler symbols were treated only as
  grouping clues. No unsupported individual speaker, branch, or playback
  order was inferred.

The ledger now contains 33,462 of 65,135 IDs (51.37%), leaving 31,673.
Sequential review reaches ID `22249`; the next range is `22250`-`22499`.

## Applied Corrections

On 2026-11-14, the seven candidates below were rechecked against the current
English, Japanese, Chinese, and Korean rows and applied to the Korean CSV:

| ID | Applied correction |
| ---: | --- |
| `22042` | Replaced the mistaken description of the Huntress as elegant with the honorific `전하`; paired the named epithet as `암흑의 여사냥꾼(Dark Huntress)`. |
| `22072` | Changed the action objective to the established `-하기` form: `뿌리 골렘(Root Golem) 처치하기`. |
| `22111` | Corrected `그 사람 위로 넘어졌죠` to `그 사람 위에 떨어졌죠`, preserving the speaker's polite, comic account. |
| `22133` | Paired the translated book title with `Osa's Art of Love, Part I`. |
| `22135` | Added the English pairing to the Scholia Arcana rank: `숙련자(Adept)`. |
| `22164` | Moved the possessive out of the parenthetical: `대회계원(Bursar)의 규정`. |
| `22247` | Aligned `오라프(Olaf)` to the attested `올라프(Olaf)` spelling. |

Only these seven IDs' `source_fingerprint` values were updated in the
append-only review ledger. No speaker or dialogue order was inferred.
