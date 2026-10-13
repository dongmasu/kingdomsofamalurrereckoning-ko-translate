# Preliminary Language Scan: `default` IDs 18350-18399

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 18350-18399.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 18353 | Scion / “our sworn enemy” | Preserve the contrast between loyalty and disapproval; align the Scion title and Maid terminology. | Korean retains the contrast and sworn-enemy sense; `사이온(Scion)` and The Maid forms vary elsewhere. | Medium |
| 18355 | handle toward him / point the other way | Keep the directions literal until context resolves whether this is a weapon-handling instruction or a joke. | Korean preserves the handle-toward-him / point-away directions. The historical audit already flags the line's possible joke or handover meaning. | Medium |
| 18358 | Varani character-selection description | Preserve every localized marker, the Varani name marker, and the “as likely X as Y” balance. | All locales retain three `{LINE_LEFT}` controls, one `{*2...}` localized label, and `{LINE_SPACE}` in the same order. Korean retains the merchant/pirate/mercenary contrast. | High |
| 18361 | peace / occupiers / “borrow what can never be given” | Preserve the English meaning that Fae view mortals as occupiers and that the land is only borrowed. | Korean follows English closely; Japanese reverses/softens the meaning, while Chinese agrees with the English. This source conflict is in the historical log. | High |
| 18363 | `SpawnVol2` | Determine whether this is an internal development identifier and should remain untranslated. | Korean preserves the exact identifier; Chinese translates it as “rebirth level 2,” but the row lacks user-facing context. | Medium |
| 18366 | “It's all one to me” / officer | Preserve the speaker's indifference and the contrast with another person's wish to become an officer. | Korean retains both; Japanese interprets the opening phrase as “there is only one,” so the English/Chinese reading is stronger absent context. | Medium |
| 18368 | Agarth / Blade of Avgrunn / Kollossus priestess | Verify names and whether “Kollossus” is a people, title, or creature; preserve the past-tense boast and declined knighthood. | Korean retains the hero's feats and the offer from the Fae High King; names and title forms remain open in the historical log. | Medium |
| 18371 | “joined Mitharu” / tradition | Preserve the implied death/euphemism and leave the unexplained tradition unresolved. | Korean retains the transition to Mitharu and introduces no specific ritual; the English fragment does not explain the tradition. | Medium |
| 18377 | Southern Passage / masonry | Determine whether Southern Passage is a named location and align its Korean form. | Korean retains the passage and curious masonry; Japanese/Chinese translate the direction literally. | Medium |
| 18383 | fighters / prince courtiers | Preserve the profanity and the contrast between fighters and courtly flattery. | Korean retains the contrast and uses a strong expletive for “for gods' sake”; exact register remains character-dependent. | Medium |
| 18388 | highest note / scale / interrupted explanation | Retain the literal musical sequence and the speaker's self-interruption. | Korean preserves the move from the highest note down the scale and trails off before “wait”; this matches the historical note. | High |
| 18390 | `vs. Niskaru` | Preserve the compact matchup label and standardize the Niskaru name form. | Korean renders it `대 니스카루`; the source is a fragment and other locales use different name forms. | Low |
| 18395 | Headhunter tokens / Warden of Crownhold | Preserve the five-token collection and sizeable reward; verify Warden's role/title. | Korean retains five Headhunters and delivery for a large reward; “Warden” is rendered as `감시관`, while Chinese suggests a prison-warden sense. | Medium |
| 18396 | `<cough>` | Preserve the event tag and its compact speaker-action format. | All four locales retain the angle-bracket action, localizing only the cough text. | High |
| 18399 | “the sun all to myself” / warmth shared | Retain the metaphor without resolving the sun's referent. | Korean preserves the temporary possessive image and the decision to share the warmth; the metaphorical referent remains unstated, as in the historical log. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 18355, 18358, 18361, 18363, 18366,
  18368, 18371, 18388, and 18399 against the active four-locale rows. They
  remain preliminary questions; no historical note authorizes a translation
  edit.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 18350-18399
  in identical order.
- No key, row-count, or line-break difference was found. At ID 18358, marker
  classes and order match across locales; localized label payloads differ.
  The `<cough>` action tag at ID 18396 is retained.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 18350-18399 received one preliminary reading. Findings were candidates
and open questions until the separate working disposition pass, recorded in
`disposition-batch-default-18350-18399-20261009.md`. Continue disposition
work with IDs 18400-18449.
