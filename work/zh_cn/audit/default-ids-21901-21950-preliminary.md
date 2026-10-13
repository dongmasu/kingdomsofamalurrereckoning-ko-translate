# Preliminary Language Scan: `default` IDs 21901-21950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 21901-21950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 21904 | Player Housing / linked stash | Preserve all three help headings and the linked storage behavior while avoiding unnecessary English gender repetition. | Korean localizes all ordered headings and explains cross-house access. Its final clause explicitly says items can be taken out, while English says the character can access items; Japanese explicitly describes both storing and retrieving. | Medium |
| 21905 | antelope-racing joke | Retain the deliberately absurd joke without explaining away its accidental-death premise. | Korean keeps the rhetorical question and absurd logic; its “마련” phrasing frames the death as an expected outcome, close to the comic source. | Medium |
| 21909 | Eathe Dunbert / Testament / farm burned | Verify the name and the relation between her death and the farm burning. | English says she was killed two years ago when the Testament burned her farm. Korean follows this sequence; Chinese says she was killed because they burned it. Japanese omits the explicit killing event. | High |
| 21910 | Beckoned / Primos / followers | Align Beckoned and Primos title/rank usage and preserve the urgent paired questions. | Korean retains the title, name, destination question, and reason for the followers' attack. Chinese generalizes Primos to “leader.” | Medium |
| 21911 | `Place for Happy People` | Determine whether this is a location/title or a literal phrase before standardizing it. | Korean uses “행복한 이들의 터전”; Japanese is literal, while Chinese renders it as “happy home.” | Medium |
| 21914 | Pteryx / population reduction | Confirm the species name and whether the guard intends to cull the population. | Korean preserves the population increase and the guard's eagerness to reduce it; Japanese is more explicitly about extermination. | Medium |
| 21918 | Tari Holstig / Quays / Captain Rast Brattigan | Verify name forms, whether Quays is a district or docks, and the captain's title; retain the letter's escort request and signature. | Korean preserves the mute speaker, Dverga slavers, Rathir destination, captain, and signature. It renders the tongue as cut out, an inference not explicit in English. | Medium |
| 21921 | `avoid the ale` | Determine whether the drink should be localized as ale or generic beer and preserve the condescending warning. | Korean uses “맥주” and retains the mortal/other-kind contrast and undesirable effect. | Medium |
| 21922 | Khamazandu / Grian / Heart of Sibun / Warsworn leader | Verify names and the exact rank meant by “the highest of the Warsworn”; preserve the bargain and objective sequence. | Korean retains the offered gift, becoming the Niskaru Lord's agent, the slain leader, and the plan to recover the Heart with Grian's key. Japanese calls the slain person a leader; English leaves “highest” ambiguous. | High |
| 21927 | Missives of Sable / Hierophant / framing | Resolve the English/Japanese difference in the crime to be pinned on the Hierophant. | Korean follows English: frame her for the crime she tried to have the speaker killed for. Japanese instead says to frame her for stealing the Missives. This remains a source/context conflict. | High |
| 21929 | Ommer Vogard / Culn / hands gave out | Preserve the physical loss of function following the Tuatha attack without implying that he surrendered voluntarily. | Korean says his hands lost strength and he can no longer hold a bow steadily, consistent with English and Japanese. The exact injury remains unstated. | Medium |
| 21932 | `III – The Lucky Daughter – An Almain Fable` | Align the Roman numeral, title punctuation, and Almain form with project conventions. | Korean keeps the chapter number and fable identification; punctuation differs but the title's meaning is retained. | Low |
| 21935 | `{1}% Chance {2}` | Preserve both placeholders and their order around the percent sign. | Korean has `{1}% 확률로 {2}`; English, Japanese, Chinese, and Korean retain `{1}` before `{2}`. | High |
| 21938 | Witch Knight Khleran / Ghennig | Verify the character/place spellings and standard Korean title for Witch Knight. | Korean identifies the Witch Knight and hilltop keep; spelling forms vary across locales. | Medium |
| 21943 | Tuatha / Apotyre / dwindling numbers | Align faction/place forms and retain the dismissive aside about Apotyre's own problems. | Korean preserves the contrast between increasingly bold Tuatha and the speaker's shrinking numbers, then the aside. | Medium |
| 21944 | Byrn Elgar / `charges` / Seawatch | Determine whether “charges” means wards, dependents, or subordinates and whether the role is a steward/castellan. | Korean says he lives to serve those entrusted to him at Seawatch, preserving the formal address and self-introduction without fixing the exact office. | Medium |
| 21945 | Hyperian “soars within our city” | Preserve the awe and upward movement; check tense against surrounding events. | Korean says Hyperian is rising within the city. Chinese uses a static “stands,” while English and Japanese describe ascent. | Medium |
| 21947 | captain / blush and a kiss | Preserve the playful, suggestive tone without making the exchange more explicit. | Korean retains the captain address, withheld-tale joke, blushing, and kiss as the sweetest things in Amalur. | Medium |
| 21949 | omens / escape / salvation | Preserve the anxious first-person voice and the two linked ideas after the ellipsis. | Korean retains the omens of destruction, the feeling of being besieged, escape, and salvation. | Medium |
| 21950 | Lorca-Rane | Align the proper-name spelling with recurring usage. | Korean uses “로르카레인(Lorca-Rane)”; other locale renderings vary. | Low |

## Historical Audit Reconciliation

- Rechecked the archived source-keyed questions for IDs 21900, 21904-21905,
  21909-21911, 21914, 21918, 21921-21922, 21927, 21929, 21932, 21938,
  21943-21945, 21947, and 21949 against the active four-locale rows.
- The earlier questions remain open candidates. ID 21927's English/Japanese
  conflict is still unresolved; the Korean draft follows English and was not
  changed.
- Cross-checked Sagecrafting, Testament, Beckoned, Primos, Pteryx, Tari
  Holstig, Quays, Warsworn, Missives of Sable, Hierophant, Scion, Almain,
  Khleran, Ghennig, Tuatha, Apotyre, Seawatch, Hyperian, and Lorca-Rane
  against recurring source usage. Official-manual text search remains
  unavailable, so established-term confirmation is pending integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 21901-21950 exactly
  once and in identical order.
- ID 21918's letter has two embedded line breaks in every locale.
- ID 21904's localized heading wrappers, `{LINE_LEFT}`/`{LINE_SPACE}` order,
  and three heading numbers match. ID 21935 preserves `{1}` then `{2}` and
  the percent sign; ID 21941's named gold-coin icon is identical.
- No key, order, line-break, runtime-token, or numeric-value discrepancy was
  found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 21901-21950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
21951.
