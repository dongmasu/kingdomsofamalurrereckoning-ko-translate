# Preliminary Language Scan: `default` IDs 27351-27400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27351-27400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27351, 27353-27372, 27375-27376, 27378-27386, 27389-27390, 27392-27395, 27397-27400 | Dialogue, lore, quest, and concise UI/item text | Recheck tone, idiom, names, and established gameplay terms during integrated review. | Korean generally retains English meaning and Japanese tone. The `+1` Might Ability value and Adessa upgrade-price variable are intact. | Medium |
| 27351 | Grim's escape from Ohn's Stand | Preserve whether the narrator actually helped orchestrate Grim's escape or only agreed to help. | English says “I helped to orchestrate his escape,” while Korean says `탈옥을 돕기로 했다` (“decided/promised to help”); Japanese also reads as promising to help. This is a source-locale tense/aspect distinction for integrated context review. | High |
| 27352 | “wenches” -> `여자` | Check whether the Korean loses the English speaker's demeaning/sexualized register. | English uses a derogatory gendered noun; Korean is comparatively neutral. Japanese also uses a sexually dismissive term. Keep tone as a candidate without endorsing the source's insult. | Medium |
| 27358, 27369, 27373, 27375, 27377-27378, 27383-27384, 27387-27389, 27391, 27396-27399 | Weave / benevolence / Dirge Gwyngud / Aster Inheritance / Darkvari / Deireadh / Rond Farm / Lykeios / Well Progress Log / ancestry charter / Forsaken Plains / blessings | Standardize metaphysical, faction, race, place, office, and UI terms and preserve uncertain references. | The historical log groups these terms and leaves forms/context open. Korean's `샘 진행 기록` at 27387 may read as a natural spring rather than a system log for a named Well. | Medium |
| 27373 | `winkle the honor` -> `명예를 더럽히려다` | Resolve the source's unusual verb and preserve whether Dirge sought to obtain, win, or damage the Justicar's honor. | English says “winkle the honor”; Korean follows the Japanese “stain/damage honor” reading, while Chinese says “win the honor.” The historical audit explicitly records conflicting locale interpretations. | High |
| 27374 | `Stages` -> `무대` | Determine whether this is a theater stage, a game level, or a progress/phase label. | Korean chooses “stage/platform”; Japanese also says stage, while Chinese uses “level.” Historical review leaves the UI/context unknown. | Medium |
| 27381 | `Lyria, what is more` -> `리리아여, 게다가…` | Check whether `Lyria` is an invocation/name or an exclamation, and preserve the alarming disclosure about selling the vial. | Korean treats Lyria as a direct address. Japanese omits the invocation; Chinese renders it as “Lyria above,” and the historical log flags this line as an invocation/source-context question. | Medium |
| 27391 | `charter` / ancestry proof | Preserve that the document establishes lineage and is located at Corgan Hold; confirm its legal/document category. | Korean says `가문 특허장`, which can imply a patent/grant charter; the English identifies a charter showing ancestry without specifying the legal form. | Medium |

## Historical Audit Reconciliation

- The historical log covers IDs 27347, 27351-27352, 27358-27359, 27361,
  27367, 27373-27374, 27377-27378, 27381, 27383-27384, 27387, 27391, and
  27396-27398. It flags the “wenches” tone, the `winkle the honor` conflict,
  `Stages`, the Well Progress Log, Lyria's invocation, and the ancestry
  charter.
- Proper names include Crilgarin, Grim Onwig, Hierophant, Gadflow, Teers,
  Ashmoor, Dokkalfar/Ljosalfar, Dirge Gwyngud, Deireadh, Hrindi, Rond Farm,
  Lykeios, Lyria, Mitharu, and Dydyn. Their spellings remain glossary
  candidates, not approved forms.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27351-27400 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match.
- The `+1` value at 27355 and `$NQD_City_Adessa.upgrade_price$` variable at
  27361 are preserved. No unexpected Unicode format character was found.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27351-27400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27401.
