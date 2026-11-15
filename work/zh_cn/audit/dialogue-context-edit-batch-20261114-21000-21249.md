# Dialogue Context Translation Edit Batch: IDs `21000`-`21249`

- Date: 2026-11-14.
- Rechecked the range's correction findings against current English,
  Japanese, Chinese, and Korean. English established meaning, Japanese was
  primary for voice/register, and Chinese was supporting evidence. No
  speaker or playback order was inferred.
- Applied 17 source-supported corrections from the new findings and corrected
  the previously recorded candidate at `21085`, for 18 edited IDs total.
- Preserved existing ledger dispositions and refreshed only the 18 edited
  IDs' source fingerprints.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `21007` | Recast the awkward spatial phrase as the natural promise that the addressee will remain a legend to their people. |
| `21011` | Replaced the unnatural literal `마법의 여주인` with `마법의 주인`, retaining the fate-and-magic metaphor. |
| `21013` | Added the complete source title `The Maid of Windemere`. |
| `21022` | Corrected the object particle after `Tala-Rane`. |
| `21023` | Joined the person and title in the complete label `컵의 여왕 메어(Maire, Queen of Cups)`. |
| `21027` | Changed `막기 후` to `막은 뒤`; retained the user's `base` weapon forms `장검, 대검, 망치`, the localized wrapper, and CRLF line break. |
| `21041` | Kept the scenario consistently in present tense and avoided implying that the boulder rises into the air. |
| `21061` | Corrected `needs you` from “is looking for you” to “needs you,” retaining the conversational address. |
| `21085` | Recast the unnatural `실수로 입을 흘렸다` as `죄수가 있다는 사실을 무심코 흘렸다`; retained the journal-style narration. |
| `21108` | Paired the complete item label `Mitharan Platinum Lightning Guard`. |
| `21114` | Added the complete standalone title `Hunter's Thoughts`. |
| `21131` | Paired `Ratofer's Kerchief` as a complete label and aligned `손수건` to `스카프`, matching `base:3783` and Japanese `スカーフ`. |
| `21152` | Replaced the misleading possessive `권능자` with the established deity name `권능(Authority)`. |
| `21153` | Added the complete faction/item-provenance label `Keloren's Legion`. |
| `21167` | Added English pairings for both `Summer Court` and `Winter Court`. |
| `21173`, `21175` | Paired the arena title `Champion` in both lines without expanding it to `Champion of Valor`. |
| `21185` | Recast the two specialties in parallel, natural Korean phrasing. |

## Retained Or Held

- `21039` remains held: `specimen` may be deliberate objectifying language,
  and the references do not support replacing that meaning with a different
  insult or entity type.
- `21065` and `21075` remain held for the Sorrows identity and unresolved
  riddle unit/wordplay, respectively.
- `21103` remains context-limited; its current `필멸자인 하녀` already
  reflects the supported lexical correction, and no speaker was inferred.
- `21129` remains unresolved. `The Watch` is capitalized, but the accepted
  `도시 경비대(City Watch)` decision is scoped to exact `City Watch` source
  keys and does not establish that this separate `The Watch` reference is
  the same formal label.
- `21147` was retained because its Korean already matches the identical
  English sentence at `18639`; the wording was not redundantly edited.

## Verification

- The review ledger validates all 65,135 IDs against the four current
  language tables.
- The CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLFs, and
  244 LF-only newlines. The wrapped entry at `21027` retains its CRLF break.
- The 11 CSV-preservation tests and nine context-index tests passed (20 total).
- `git -c core.whitespace=cr-at-eol diff --check` passed.
- Current CSV SHA-256:
  `c9516813b67368a00d8c7ead9bfe752250f507c3102bea5d5ad792b8b2c501d6`.

The next sequential candidate range is `21250`-`21499`.
