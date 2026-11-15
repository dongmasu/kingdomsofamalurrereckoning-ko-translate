# Sequential `default` Revalidation: IDs `11250`-`11499`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-one existing ledger records were retained after their four-language
  fingerprints were verified. The other 189 IDs were compared and added.
- Four newly recorded IDs have correction candidates. Eight retain
  evidence-limited findings; no candidate and hold overlap.
- Of the 189 new IDs, 130 have indexed quest-asset links and 59 do not.
  Eleven IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `11315` | Honorifics / naturalness | English says `his excellency the High King`, but Japanese and Chinese render the title as the High King with the normal royal honorific. Korean `고귀하신 지고왕(High King) 폐하` stacks `고귀하신` and `폐하`; consider keeping the established title and one honorific, such as `지고왕(High King) 폐하`. | High |
| `11360` | Meaning | The letter says the writer attuned the assistant to the Well's core so they might bring him back if the worst happens. Japanese explicitly says resurrect him, and Chinese also says bring him back. Korean `다시 연구에 쓸 수 있도록` and `돌아온다 해도` leave the revival meaning implicit; make the possible resurrection clear while retaining the writer's joke about the Laz. | Medium-high |
| `11382` | Meaning | English says clearing the Kobold lair removes the threat to future caravans coming down the mountain path. Korean broadens this to merchants traveling along the path and drops the future/downhill details. Consider restoring the future caravan and downhill direction without changing the report's first-person journal voice. | Medium |
| `11476` | Naturalness / meaning | In the warning, `it must be scattered, hidden, and forgotten` is rendered `흩어 숨기고 잊히게 해야 한다`, an awkward sequence with an unclear object. Consider making the relic's pieces the explicit object and separating scattering from hiding, while preserving the warning and paragraph structure. | High |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `11276` | Meaning / context | `the movement` is not identified in this row. Japanese can mean movement or motion, while Chinese and Korean read more like a movement or cause; do not guess a specific faction or replace it with a presumed “flow of fate.” |
| `11299` | Meaning / lore | English says the Winter Fae “feed and tend” the bodies at the Midden. Japanese describes bringing bodies in and caring for them, while Chinese preserves “feed.” The unusual practice is not explained by the aligned sources; retain the Korean provisionally rather than inventing a ritual. |
| `11406` | Title / referent | The isolated title `Hoarders in the Sewer` does not establish whether `Hoarders` names a group or describes people who hoard. Retain the existing Korean title pending context. |
| `11407` | Title / referent | The sources do not settle whether `The Eldest` is a title/name or a generic eldest/elder. Retain the current paired form. |
| `11412` | Meaning / composition | The standalone fragment `of Ice Shield` is postposed, and the assembled Korean item-name order is not established. This preserves the earlier hold for this exact key; do not reorder or rewrite the fragment in isolation. |
| `11418` | Meaning / imagery | The journal preserves its seven paragraph breaks, but the references do not settle the “cultivated mystery” and truth/light imagery. The earlier uncertainty remains; no line-level paraphrase is justified. |
| `11421` | Title / referent | `Oathblade Kirby` may identify Kirby's title/rank or a named blade. The Japanese and Chinese references differ, so keep the existing wording without choosing one interpretation. |
| `11424` | Place / meaning | `Mudhold Fasting` is presented as a named location, but Japanese and Chinese describe different kinds of place. Retain the source spelling and current Korean form pending contextual identification. |

Prior findings already in the ledger, including IDs `11326`, `11359`,
`11365`, `11366`, and `11438`, were retained by their current fingerprints
and are not recounted here. The prior disposition for `11425`'s
`hermit-merchant` description is supported by Japanese and Chinese; no new
meaning issue was found. The direct statements `I am Jakasen` (`11254`) and
`I am Templar Tancese` (`11256`) support those speaker attributions. The
signature on `11271` identifies the author as Grund Darkvari, not a spoken
speaker, so it is not used as dialogue-speaker evidence.

## Duplicate and Structural Checks

- Forty-three exact-English duplicate groups touch the 189 new IDs, comprising
  405 rows across the corpus. Korean text matches in every group.
- Runtime placeholders, named variables, layout tokens, display-wrapper
  identifiers, brace balance, and logical line-break counts match across all
  four languages for all 189 new IDs.
- Seven Korean strings contain 23 existing embedded CRLF breaks:
  `11271` (2), `11299` (4), `11360` (4), `11363` (1), `11385` (1),
  `11418` (7), and `11476` (4). Their logical line-break counts match the
  language references; the existing bytes were preserved.
- Except for the two direct textual self-identifications above, no individual
  speaker was assigned. Playback order remains unknown.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
