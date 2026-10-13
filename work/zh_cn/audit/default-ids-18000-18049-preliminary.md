# Preliminary Language Scan: `default` IDs 18000-18049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 18000-18049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 18000 | Recast & Detour | Determine whether these are feature/proper names; retain the game title and centered-line control. | Korean preserves the full game title and `{LINE_CENTER}` marker, but leaves the feature names untranslated, as do English and Japanese. | Medium |
| 18001 | Prismere / chantry | Verify a consistent Korean rendering for `chantry` and preserve that the building itself may be made of Prismere. | Korean uses `예배당`; English/Japanese/Chinese support a chapel/chantry sense, while established religious-building terminology remains a corpus question. | Medium |
| 18005 | “Find the other remains” | Resolve whether “remains” means bodies or ruins from quest context. | Korean uses `유해` (human remains); Japanese explicitly says corpses, while Chinese says ruins/remains. English is ambiguous in isolation. | Medium |
| 18006 | Bhaile / “geared for war” | Preserve the forceful reproach and standardize the place-name form. | Korean retains the attempted infiltration and rebuke; spelling of Bhaile and its Korean form vary elsewhere. | Medium |
| 18009 | stun enemies when attacked | Preserve the trigger/effect distinction and standardize the status-effect term. | Korean clearly states that being attacked stuns enemies; Japanese says paralyze and Chinese says stun, so exact game-mechanic terminology needs the glossary/context. | Medium |
| 18023 | Savant Reen | Determine whether `Savant` is a rank/title and align its Korean form. | Korean uses `현자`, Japanese identifies a first-rank mage, and Chinese uses a learned-person title; the role cannot be settled from this label alone. | Medium |
| 18025 | “Bugger them” / less competition | Retain the dismissive, mildly profane voice without changing the pragmatic meaning. | Korean preserves the speaker's indifference and the competition joke, but softens the profanity. | Low |
| 18026 | Block / `#NAMED_ICON_360_LB#` | Preserve the named icon token and confirm spacing/rendering in the eventual UI check. | Korean retains the token but inserts a space before it; English/Japanese/Chinese attach the marker directly to the label. | Medium |
| 18032 | Lord Ohn / Lord Ysa / page and Talisman of Fate | Reconcile the object searched for before death: a “page” versus a person/attendant. | English says Lord Ysa ordered the plains searched for “the page and the Talisman”; Japanese says an attendant and the talisman, and Chinese similarly says an assistant. Korean follows the latter reading with `시종`, so this is a material source/reference conflict. The long passage retains its paragraph structure. | High |
| 18032 | Gardens of the Seelie / Gardens of Ysa | Standardize recurring proper-name spellings and check whether the garden renaming is clear. | Korean distinguishes `시일리` and `이사의 정원`; names vary across the locale references and other draft occurrences. | Medium |
| 18038 | White Nil / trained soldier | Preserve the boast and the reference to service under White Nil; note the source punctuation/grammar defect. | Korean keeps the trained-soldier claim and named commander. English has the malformed phrase “a trained, soldier,” which should not be silently corrected as a translation issue. | Low |
| 18039 | Gallows End / Undersea Fasting / Tome of Contrition | Verify the location and artifact terminology, especially the apparent `Fasting`/“Pass” mismatch. | English says the treasure hall of “Undersea Fasting”; Japanese describes an underground passage, while Korean uses `언더시 패스(Undersea Fasting)`. Gallows End also uses a spelling variant elsewhere. | High |
| 18044 | Traveler / Hierophant | Align faction and title forms while preserving the reaction to seeing the Hierophant chained. | Korean retains the surprise and her surveillance ending; capitalization/plural treatment of Traveler and the Korean title forms remain terminology questions. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 18000-18001, 18005-18006, 18014,
  18023, 18026, 18032, 18039, and 18044 against the active four-locale
  rows. They remain preliminary questions; no historical note authorizes a
  translation edit.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 18000-18049
  in identical order.
- No key or row-count difference was found. `{LINE_CENTER}` at ID 18000 and
  `#NAMED_ICON_360_LB#` at ID 18026 are retained. Line-break counts match,
  including the multi-paragraph historical account at ID 18032.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 18000-18049 received one preliminary reading followed by a disposition
pass. See
[`disposition-batch-default-18000-18049-20261009.md`](disposition-batch-default-18000-18049-20261009.md).
The `page`/`attendant` and `Undersea Fasting`/passage conflicts remain open;
no CSV edit was accepted. Continue disposition work with `default` IDs
18050-18099.
