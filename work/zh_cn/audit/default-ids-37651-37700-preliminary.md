# Preliminary Language Scan: `default` IDs 37651-37700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 37651-37700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 37651 | save-data repair prompt | Preserve the two distinct choices: delete corrupted files to attempt repair, or continue with saving disabled; make the destructive scope unmistakable. | Korean retains both options and their consequences. Japanese/Chinese phrase the repair step similarly. This is a consequential system prompt and should receive UI-context review. | Medium |
| 37652 | Champion / opposing team agreement | Preserve that the Champion made an agreement with the other team's leader; avoid adding the agreement's terms. | Korean retains the brief aside and does not invent details. | Low |
| 37658 | Revival / discouraging living conditions | Standardize Revival and preserve the speaker's twitchiness and hesitation. | Korean says life at Revival is not encouraging, matching the source's interrupted phrasing and tone. | Medium |
| 37662 | localized `[Passive]` marker | Preserve the `{*1[...]}` wrapper and localized display label; retain all listed effects. | All locales retain the same marker wrapper with a localized label (`Passive`, Japanese, Chinese, Korean). Korean preserves poison/bleeding duration and Shadow Flare damage. | Low |
| 37664 | mystical occurrences / drunken fever-dreams | Preserve the skeptical characterization that reports are usually exaggerated intoxication-fueled dreams. | Korean retains the quoted report label and the inebriated fever-dream explanation. | Low |
| 37665 | `old boy` / `늙은 양반` | Determine whether this is an age description, familiar address, or both; preserve the conditional possibility of meeting there. | Korean uses an explicitly age-marked `늙은 양반`. Chinese says old friend and Japanese interprets the term as king; context does not settle the English idiom. | Medium |
| 37666 | Champion's Manor / Den | Standardize the manor and determine whether the Den is a named gambling venue or generic den; preserve the rest-and-return sequence. | Korean translates Den as a gambling hall; Japanese and Chinese make the same contextual inference. English capitalizes Den, so proper-name status remains open. | Medium |
| 37670 | Labor of Love / `사랑으로 이룬 일` | Determine whether this is a quest/title and standardize the Korean form. | English capitalizes the phrase; Japanese calls it service activity, Chinese renders it from-the-heart work, and Korean gives an idiomatic phrase. | Medium |
| 37671 | four-part verse | Preserve all four slash-separated segments and the invocation/protection relationship. | Korean keeps all four segments in the same order and preserves the Sun-protection request against winter night. | Low |
| 37675 | Preordained / `운명에 정해진 자들` | Standardize the named group and preserve the pass requirement and threat of consequences. | Korean renders the group descriptively and retains the warning. English capitalization indicates a possible formal faction. | Medium |
| 37677 | Hero of Mel Senshir / “nobody accounted for” | Preserve the English sense that the Hero was not factored into expectations; note the Japanese source-reading difference. | Korean says nobody expected the Hero, consistent with English. Japanese instead says no one could defeat the Hero, a materially different reading; Chinese also shifts toward the Hero's unmatched status. | High |
| 37678 | Executive Creator of Worlds / `세계 창조 총괄` | Determine whether this is an internal/developer credit or player-facing title before treating the literal corporate rendering as final. | English and Japanese retain the title in English; Korean and Chinese translate it differently. | Medium |
| 37679 | Chaos-defense potion recipe | Preserve Chaos Essence (2), Ysa's Breath (1), and the defensive effect against Chaos creatures. | Korean retains the effect and both ingredient names/quantities; the two-line recipe structure is preserved. | Low |
| 37682 | Offering / Scion | Standardize both religious/lore terms and preserve the chronology: the ceremony occurred when young, and the speaker has been Scion ever since. | Korean retains the chronology and uses `봉헌 의식` and `사이온`; the exact formal rite/title forms remain open. | Medium |
| 37686 | Zungars / Darkvaris | Standardize both group/species names and preserve the speaker's wish to see them spill blood for the gold. | Korean retains the speaker's bloodshed-for-gold image but calls them hungry, while English only says eager. The proper group forms remain unsettled. | Medium |
| 37691 | Wolf Pack affair / Wilma Scrivens | Preserve the choice to side with Wilma for village-wide justice, the mercenaries' excesses, and regret about the bloody outcome. | Korean retains all three parts and the first-person decision. Proper name consistency remains open. | Low |
| 37692 | `conclusion` / `내 결론` | Determine from combat/story context whether this is a final argument, pronouncement, or finishing move. | Korean chooses the ordinary “my conclusion” sense; the English capitalized-style imperative is ambiguous without context. Japanese and Chinese choose a conclusion/verdict reading. | High |
| 37693 | Emperor Morus / Sophia / Bloodbringer / five-century civil conflict | Preserve the two-paragraph account, stray-arrow cause, and five-hundred-year chronology; check whether Sophia's age relation is known. | Korean retains the paragraph break, arrow-to-eye event, and five-century civil conflict. English says only “his sister,” but Korean specifies `여동생`; Japanese is age-neutral, while Chinese also infers younger sister. | High |
| 37697 | Askers / “nearly ten years” | Standardize Askers and retain the approximate duration since the father was killed in the war. | Korean says the Askers took the speaker in after the father's death and that nearly ten years have passed. The group name remains a proper-name candidate. | Medium |
| 37698 | the House / Cydan | Determine whether House is a formal faction and preserve the crow/storm simile and Cydan's distinct liberation goal. | Korean calls it a family/house and retains the simile and contrast; the capitalized faction sense remains contextual. | Medium |
| 37699 | `-{1} {2}` marker order | Preserve both positional values, the minus sign, and the source/Korean order; document the Japanese-localized order exception rather than normalizing locales. | English, Chinese, and Korean order tokens as `{1}`, then `{2}`; Japanese uses `{2}-{1}`. The Korean matches the English order and spacing. | High |

IDs 37653-37657, 37659-37661, 37663, 37667-37669, 37672-37674,
37676, 37680-37685, 37687-37690, 37694-37696, and 37700 generally retain
the English meaning on this first reading. Proper names, lore, register,
and UI context remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 37654-37699 was checked against
  this batch. Questions at 37654-37699 were compared with all four locales,
  including the passive marker, Den, Preordained, the Hero, Offering/Scion,
  the Morus history, and the final positional variables.
- The marker wrapper at 37662 is structurally retained with localized label
  text. At 37699, Japanese reorders the same two positional values; Korean
  follows English source order. The historical request to retain source
  order is met in Korean.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 37651-37700 once
  and in identical order.
- Embedded line-break counts match across all four locales, including the
  potion recipe at 37679 and two-paragraph artifact history at 37693.
- The `{*1[...]}` marker wrapper at 37662 and both positional values at
  37699 are present. Japanese alone reorders `{1}` and `{2}` at 37699;
  Korean preserves source order. The Ysa title-cost variable at 37690 is
  unchanged in all locales.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 37651-37700 received one preliminary reading. Findings were subsequently
dispositioned as working decisions, not independent linguistic approval; see
[`disposition-batch-default-37651-37700-20261010.md`](disposition-batch-default-37651-37700-20261010.md).
The accepted correction at ID 37686 is applied; eleven terminology/context
findings remain uncertain. Continue at `default` ID 37701.
