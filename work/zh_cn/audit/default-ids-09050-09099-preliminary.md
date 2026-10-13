# Preliminary Language Scan: `default` IDs 9050-9099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9050-9099.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9053 | `Run, fools! Run!` → `바보들아, 도망쳐!` | Preserve the opening escape command and the repeated final `Run!`, or confirm whether deliberate compression is intended for this subtitle. | English has three commands: “Run, fools! Run!” Korean retains only one imperative. Chinese retains both runs; Japanese compresses them, so speaker urgency and subtitle context merit a check. | High |
| 9062 | `Dvergan Raider` → `드베르가 약탈자` | Confirm whether this is a raider/person/enemy label or a ship; retain the English meaning pending asset/context verification. | English and Chinese say Dvergan raider, while Japanese says a Dvergan pirate ship. This source/reference conflict is already noted historically. | Medium |
| 9063 | `dustlings` → `먼지의 자손들` | Verify whether `Dustlings` is a named people or a pejorative for ordinary mortals; preserve the speaker's dismissive tone. | English capitalizes the group-like term; Japanese says “those born from dust,” while Chinese generalizes to mortals. Korean follows the literal lineage image. | Medium |
| 9066 | Fateweaver / Cradle of Summer / Alfar | Standardize the proper names and verify whether `artifact` is a generic artifact or a named relic; preserve that it can shift the war in the Alfar's favor. | Korean preserves the objective and causal relation, but `페이트위버`, `여름의 요람`, and `알파르` need alignment with other occurrences. | Medium |
| 9067 | `gifts we can bring him` → `그분께 바칠 수 있는 선물` | Determine whether `gifts` means offerings to Mitharu or each person's talents/abilities. | Japanese explicitly reads offerings, Chinese reads gifts, and Korean chooses an offering verb. The intended religious sense remains contextual. | Medium |
| 9069 | `Fae maiden` → `페이 처녀` | Check whether `maiden` is a title/young woman or specifically implies virginity; retain the report of an attack without adding sexual detail. | English and Japanese use a maiden/乙女 term, Chinese says a Fae woman, and Korean's `처녀` can imply virginity. | Medium |
| 9071 | `the telling belongs to all of us` → `이야기는 우리 모두의 것` | Align `telling` with the capitalized tradition/concept at ID 8954 rather than automatically treating it as generic story. | The line presents a communal Fae tradition. Korean uses generic `이야기`; Japanese uses “伝承” (tradition), while Chinese says “destiny.” | Medium |
| 9072 | `finally exhumed` → `무덤에서 파헤쳐져 나왔구나` | Confirm whether the speaker is literally exhumed, awakened, or resurrected; retain the distinction from the King of Sorrows summon. | English explicitly says `exhumed`, while Japanese describes opening one's eyes and Chinese says coming into the world. Korean follows the literal grave image; the lore event remains unresolved. | Medium |
| 9079 | `The Wolds` → `월즈(The Wolds)` | Confirm this capitalized region's established Korean name and whether the English spelling should remain in parentheses. | English capitalization and the Japanese transliteration suggest a proper place name. Korean keeps an English cross-reference; this matches the historical open question. | Medium |
| 9081 | `Gallows End` → `교수대의 끝`; Offering ceremony / Cape Solace | Treat `Gallows End` as a place name unless project context supports a literal translation; align it with its many inconsistent Korean forms and preserve the named Offering ceremony. | The Korean literal form conflicts with transliterations such as `갤로스 엔드` elsewhere. The quest route and named village ceremony are retained. | High |
| 9088 | `Hexes` → `헥스` | Confirm whether this is the named card game and use its established Korean title rather than an unexplained transliteration. | Chinese explicitly identifies playing a game; Japanese uses the game name, while Korean leaves `헥스` opaque. | Medium |
| 9094 | `You sound envious of me` → `내가 부러워하는 것처럼 들리는군` | Preserve the direction of envy: the addressee envies the speaker, not the speaker the addressee. | English says “envious of me”; Japanese and Chinese also make the addressee the envious party. Korean's `내가 부러워하는` reverses who envies whom. | High |
| 9095 | `Missives of Sable`, an ancient book → `세이블의 서신` | Verify whether `Missives of Sable` is a named book/collection and align it with the title at ID 8975. | English explicitly calls it an ancient book, while Korean's `서신` reads as letters. Other locales also disagree on whether Missives is a book or document set. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9062, 9064, 9067, 9072, 9079,
  9089-9091 against the active rows.
- Confirmed ID 9062's English/Chinese raider versus Japanese ship difference
  and ID 9072's exhumed/awakened/born interpretation remain unresolved.
- Added current-row meaning and consistency concerns for IDs 9053, 9063,
  9066, 9069, 9071, 9081, 9088, 9094, and 9095.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales. ID 9050
  retains its blank line before the numeric stat.
- Runtime-marker IDs/order and other control tokens match in this range;
  no structural marker or named-icon exception was found.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 9050-9099 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
