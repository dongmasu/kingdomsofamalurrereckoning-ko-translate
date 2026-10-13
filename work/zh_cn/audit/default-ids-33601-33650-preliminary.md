# Preliminary Language Scan: `default` IDs 33601-33650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33601-33650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33608 | `나로스의 이빨을 순찰하는 이들` for `the patrols of the Teeth of Naros` | Confirm whether Teeth of Naros is a named region and whether the patrols are its faction/guards; preserve that the shrine is being restored for their use. | Korean treats the Teeth of Naros as the territory being patrolled. The English phrase and locale references allow a named-faction reading; the historical audit lists the term for glossary review. | Medium |
| 33611 | `화염 방패의` for the fragment `of Fire Shield` | Keep this as a dependent fragment and verify how it combines with adjacent resource text; do not complete the phrase in isolation. | The source is a sentence fragment and all locale rows are fragments. Korean's genitive ending likewise signals continuation; surrounding-string context is required. | Low |
| 33617 | `메르 센시르, 전선까지 갈 배삯` for `passage to Mel Senshir ‒ to the war-front` | Preserve the plan to pay for passage to Mel Senshir/the front, but verify whether a ship is explicit in context before retaining `배삯`. | English says `passage` without specifying a ship; Korean supplies a boat fare. Japanese leaves the travel mode unstated and Chinese says a ticket. The destination/front relationship is retained. | Low |
| 33619 | `푸른 칼날` / `인장` for `Verdant Blades` / `the Seal` | Confirm and standardize the named weapon/set and the Seal's role; retain the choice to rule without fear and fire. | Korean translates both capitalized terms. English, Japanese, and Chinese differ on the Verdant Blades item reading, and `Seal` may be a proper object/title; historical terminology review remains open. | Medium |
| 33621 | `내 여동생 나메리아` for `my sister, Nameria` | Do not specify younger-sister status unless context establishes it; retain that Nameria stays nearby to watch over the speaker. | English says only `sister`. Japanese specifies elder sister, Chinese uses a non-age-specific sibling term, and Korean selects younger sister, adding an unsupported age relation. | Medium |
| 33627 | `우리가 끝내 찾지 못한 건 그것들뿐` for `They were the only things we never found` | Preserve the English claim provisionally, but reconcile the subject and polarity against scene context because the locale references disagree materially. | Korean follows English: those were the only things not found. Japanese says reality was filled with other things, and Chinese says none of them were found during the war. The historical batch lists the row but the source context does not resolve the conflict. | High |
| 33628 | Dokkalfar history / appearance / society entry | Preserve the three sections and all nine embedded line breaks; standardize Dokkalfar/Ljosalfar, Glen Suthain, Rathir, Lyria, and book titles. Keep the English measurement `160-170 lbs` rather than silently adopting Japanese's approximate 75 kg conversion. | Korean retains the complete three-section entry, 2 m and 160-170 lb measurements, and source layout. The Japanese converts the weight to about 75 kg; the Korean follows the English source as required. Proper-name forms remain corpus-wide candidates. | Medium |
| 33631 | `꼬리를 꿈틀거리지 않게 하려면 ... 어떻게 배치` for `not to tug their writhing tails` | Verify whether “a right group of snakes” and “tug their writhing tails” are a linked insult/idiom; preserve the speaker's teasing tone without changing the physical image into a different action. | Korean keeps the snake image but interprets the final clause as arranging them so their tails do not wriggle. English asks how to present them without tugging their tails; Japanese omits the tail image and Chinese retains it more literally. The historical audit flags this exact idiom as context-dependent. | Medium |
| 33638 | `안식처 동굴` for `Sanctuary Grotto` | Determine whether `Sanctuary` is a named site or a descriptive sacred refuge, and standardize the location name. | Korean renders the two components semantically; the English capitalization and locale differences leave the proper-name treatment open. | Low |
| 33639 | `중형 착암기` for `heavy drill` | Verify the equipment category and render `heavy` as weight/duty class rather than medium size; confirm the established material terms while preserving the quantities and memo layout. | `중형` ordinarily means medium-sized, whereas English says `heavy drill`. The Japanese/Chinese likewise describe a heavy drill. The two drill quantities, three building materials, and all six newline characters are retained. | High |
| 33642 | `항복` for `Yield` | Identify the UI/action context before choosing among surrender, produce/output, or profit; do not resolve the polysemy from this isolated label. | English is a single ambiguous word. Japanese selects surrender, Chinese selects profit/yield, and Korean follows the surrender reading. The historical audit explicitly leaves this label context-dependent. | High |

IDs 33601-33607, 33609-33610, 33612-33616, 33618, 33620, 33622-33626,
33629-33630, 33632-33637, 33640-33641, 33643-33650 generally retain the
English meaning on this first reading. Proper names, lore, voice, and
display conventions remain integrated-pass candidates; no additional
distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33600-33799 was checked against
  this range. It explicitly includes the Dokkalfar account (33628), the
  “group of snakes” wording (33631), the `Yield` label (33642), and multiple
  names and lore terms. It also specifies that the English weight
  `160-170 lbs` governs over Japanese's approximate 75 kg conversion; the
  Korean preserves the English measurement.
- ID 33611 is recorded as a sentence fragment; its Korean ending remains
  dependent on neighboring text.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33601-33650 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 33628 retains
  nine newline characters and ID 33639 retains six in every locale.
- No runtime-marker mismatch was detected.
- ID 33626 preserves `20`, `15`, `15 seconds`, and `200 Mana`; Korean also
  retains the per-second qualifier and three-line layout.
- At ID 33628, English and Korean preserve `2 m` and `160-170 lbs`; Japanese
  converts the latter to approximately `75 kg`. This is a documented
  reference discrepancy, not a Korean value change.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33601-33650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33651.
