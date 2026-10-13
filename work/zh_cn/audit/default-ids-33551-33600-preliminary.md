# Preliminary Language Scan: `default` IDs 33551-33600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33551-33600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33555 | `바실리카 그노스트라` for `Basilica Gnostra` | Keep the English proper-name basis and confirm the canonical Korean form; do not adopt Japanese's church-building interpretation without lore evidence. | English and Chinese identify the proper-named Basilica Gnostra, while Japanese calls it a church. The Korean retains the name and the uncertainty is already recorded historically. | Medium |
| 33560 | four-line creation poem / `대순환`, `공허의 땅` | Preserve all four lines and clarify the compressed first line: the Carver made by morning what the Cycle takes centuries to shape. Retain that the Hollowlands were left barren, not merely excavated. Standardize Carver/Cycle and place names. | Historical audit explicitly calls out this cosmological poem. Korean retains four lines and the main images, but `아침이 되기 전에` can mean before morning rather than by morning, and the final `황무지` is conveyed as a state without a direct equivalent of “barren.” Japanese and Chinese also diverge on parts of the first line. | Medium |
| 33568 | `쓰레시` for `thresh` | Confirm whether `thresh` is a creature/species name and standardize the Korean spelling; preserve Arhaus's inference from the woman's ravings. | English uses lower-case `thresh` and ellipsis; Japanese transliterates it, Chinese uses a descriptive creature name, and Korean transliterates the term. The historical log explicitly leaves its creature identity open. | Medium |
| 33569 | `레코닝 아기들` for `Reckoning Babies` | Determine whether this is a proper title, a joke, or an ordinary plural label; standardize `Reckoning` and preserve any intended comic effect. | English capitalization and the untranslated Japanese suggest a title/name, while Chinese translates it literally. The row alone does not establish the joke or referent. | Medium |
| 33575 | `R. 레와니` for `R. Rhewani` | Keep the source's initial unless independently verified; do not expand the name based only on Japanese. Confirm the spelling and role terms. | English and Chinese retain `R.`, while Japanese expands it to `Rudrin`. Korean follows the primary English source and the historical audit records this conflict. | Medium |
| 33580 | `완벽한 미타란 감염 그립` for `Flawless Mitharan Infected Grip` | Verify the item-category and modifier grouping, and standardize `Mitharan` and `Grip` terminology without changing the apparent quality/status. | Korean follows the source sequence literally. The English item name is compressed and its exact category/modifier scope needs the surrounding item context; the historical log flags `grip` as an item-type term. | Medium |
| 33582 | `인공물과 자연이 빚어낸` for `artifice and nature wrought` | Check whether `artifice` means craftsmanship/ingenuity rather than physical artificial objects; preserve the contrast and the warning that adventurers seek and die at the citadel. | Korean renders `artifice` as `인공물`, which can denote artifacts/objects; the English may instead personify artifice and nature as forces that shaped the citadel. Japanese and Chinese also use broad craft/artificial readings. | Low |
| 33589 | `론드 농장의 광기` for `the madness at the Rond Farm` | Determine whether `madness` means a disease, abnormal behavior, or a magical affliction; preserve both stopping the farm crisis and preventing tainted grain from reaching Mel Senshir. | English is ambiguous and the supporting locales characterize it as a sickness/plague. Korean retains the literal `광기`; the historical audit explicitly leaves the quest context open. | Medium |
| 33597 | `여름 궁정` for `Court of Summer` | Confirm and standardize the named Fae court; do not replace it with the Japanese “Summer Fae palace” reading without evidence. | English names a Court and Chinese uses a court/royal-court term; Japanese interprets it as a palace. The historical audit identifies this exact disagreement. | Medium |
| 33598 | `구세대 서약방패병` for `old line of Pledgeshields` | Confirm whether `Pledgeshield` is a formal order/title and standardize the Korean form; preserve the speaker's membership in the old line and the three people's proven standing. | English and Chinese treat Pledgeshield as a named group/role. Japanese instead reads it as a “second-rank mercenary,” while Korean uses a compound title; the historical log rejects silently importing that unsupported Japanese interpretation. | Medium |

IDs 33551-33554, 33556-33567, 33570-33574, 33576-33579, 33581,
33583-33588, 33590-33596, 33599, and 33600 generally retain the English
meaning on this first reading. Proper names, lore, register, and display
conventions remain integrated-pass candidates; no additional distinct
wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33500-33599 was checked against
  this range. It explicitly flags `thresh` (33568), `Reckoning Babies`
  (33569), the `R.`/expanded-name conflict (33575), `Grip` (33580), the
  Rond Farm “madness” (33589), Agnur Farhal (33594), the malformed English
  at 33596, `Court of Summer` (33597), and `Pledgeshield` (33598). It also
  requires preservation of the four-line poem at 33560 and checks its
  cosmological names. These were reconciled against the active Korean and
  all locale references.
- ID 33555's Basilica Gnostra naming conflict is also explicitly recorded
  in that historical range.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33551-33600 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 33560 retains
  its three newline characters and four-line poem in every locale.
- No runtime-marker mismatch was detected.
- No gameplay-value discrepancy was detected. Japanese writes “one of the
  last” at ID 33598 with digit `1`; the other locales express the same
  quantity in words.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33551-33600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33601.
