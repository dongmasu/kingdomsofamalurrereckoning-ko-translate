# Candidate Reconciliation: IDs `17000`-`17249`

- Date: 2026-11-14.
- Scope: all ten current ledger candidates in the range, compared across
  English, Japanese, Chinese, and active Korean.
- All ten corrections were already present in the active Korean translation;
  no CSV edit or fingerprint refresh was needed.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `17011` | Previously applied, confirmed | The named Fate card is paired as `수호자(The Guardian)`, and the full explanatory sentence keeps its card-description style. |
| `17028` | Previously applied, confirmed | English says the Beckoned must see something the speaker cannot see. `내가 보지 못하는 무언가를 볼 수 있겠지` preserves the visual meaning rather than changing it to knowing. |
| `17030` | Previously applied, confirmed | `like to think` has the cynical “want to believe” nuance; `믿고 싶어 하지만` preserves it while the rest remains conversational. |
| `17123` | Previously applied, confirmed | `무슨 말을 하는지 아주, 아주 신중히 생각해 봐` retains the repeated emphasis and warning in natural Korean. |
| `17133` | Previously applied, confirmed | English identifies the great chamber as Maura's home. `자기 집인 대전당에 갇혀 있어` expresses that relation clearly and preserves the sentence's informal register. |
| `17145` | Previously applied, confirmed | The line now naturally conveys that no news or visible activity has come from the Fae stronghold for a long time, without the awkward passive narrative ending. |
| `17151` | Previously applied, confirmed | The letter salutation pairs the named addressee as `고(故) 개스티어 경(Lord Gastyr)께`, retaining the respectful address. |
| `17189` | Previously applied, confirmed | The capitalized `the House` is the House of Sorrows; `비탄의 집(House of Sorrows)` is present in the journal sentence. |
| `17234` | Previously applied, confirmed | English `green apprentice` and Japanese `青二才の弟子` describe inexperience, naturally rendered as `풋내기 제자`. |
| `17238` | Previously applied, confirmed | The dialogue pairs the title as `위대한 장군(The Great General)`. Its two exact-English narrative copies at `473` and `2163` use the same paired title and identical Korean text. |

## Related Checks

- The Great General title was checked across `473`, `2163`, and `17238`;
  English, Japanese, Chinese, and Korean confirm the same title while
  preserving each row's distinct sentence context.
- The SQ87 asset links at `17030` and other IDs are grouping evidence only.
  They do not establish a single speaker or justify normalizing other
  prison-related lines to this row's voice.
- The four-language readings support the existing translations and their
  register; no unsupported speaker or playback order was inferred.

## Verification

- All ten current in-range candidates are reconciled. Cumulative
  reconciliation is 946 / 4,015 (23.56%), with 3,069 remaining.
- The active translation CSV and ledger fingerprints did not change in this
  range.
- The reviewed range's existing line breaks and runtime/layout markers remain
  unchanged. The complete ledger, generated index/catalog checks, regression
  suites, CSV structure/newline inventory, and CRLF-aware diff check are
  recorded as verified.
- Source CSVs and extracted game assets were not changed.
