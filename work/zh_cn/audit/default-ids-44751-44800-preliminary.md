# Preliminary Language Scan: `default` IDs 44751-44800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44751-44800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44753 | seizure notice / `위반자 ... 압수했습니다` | Preserve the legal notice's two seized items and the distinction between Eloren Criet and the publicly denounced Guian Stebic. | Korean identifies one box containing one unknown object and one note addressed to Guian, and retains the Adessa Armory and fine-processing condition. Japanese and Chinese also preserve the two item counts. | Medium |
| 44758 | Gorbellies / `고어밸리` | Confirm whether this is a creature/group name, slang, or source joke, and retain the speaker's unfamiliarity with the term. | English asks “Gorbellies? What are they?” Korean transliterates it as a singular-sounding term and follows with “what is that?” Japanese substitutes a phrase meaning “cloth-bag belly,” and Chinese translates it as “big belly”; the historical log flags the term as unclear. | High |
| 44762 | “Leave us!” / `썩 꺼져!` | Check whether the profanity is justified by the speaker/context or escalates a neutral command to leave. | English and Japanese directly order the listener to leave; Korean adds the forceful/profane `썩`. | Medium |
| 44770 | Mozambique / `모잠비크` | Confirm whether this real-world place-name is intentionally present in the fantasy setting or is a source-data anomaly. | All four locales retain or transliterate Mozambique; the historical log explicitly flags it as anomalous. No context here resolves it. | High |
| 44772 | family arms / `가문의 무기들` | Confirm whether `arms` means weapons or heraldic arms, and standardize the House terminology. | Korean chooses weapons; English is ambiguous without quest context. Japanese also says the clan's weapons, while Chinese says family weapons. | Medium |
| 44773 | Mel Senshir “was the dam” / `멜 센시르가 둑이었는데` | Preserve the source's unusual dam/river comparison pending context; do not silently replace the metaphor with an inferred event. | English says Mel Senshir was the dam and the river is now out of control. Korean follows this literally; Chinese also calls it a dam, while Japanese recasts the image as the city holding back a flood. The historical log leaves the comparison unclear. | High |
| 44777 | rhyming banishment couplet / `그 여인은 증오받아 마땅하나, 추방은 어찌 그리 두려운가?` | Review the archaic rhetorical sense and whether Korean should preserve a verse-like/rhyming quality. | English asks whether the woman deserves hatred and whether her banishment should be so unnerving. Korean retains both ideas but renders a plain question rather than the compact rhyme; Japanese and Chinese also diverge in structure. | Medium |
| 44778 | `THIS IS A BUG` | Preserve the literal debug-like label until it is confirmed whether it is intended runtime text. | Korean retains the exact English label. Chinese treats it as a bug report; Japanese instead reads “bug/vermin.” Historical notes explicitly say not to normalize it without confirmation. | High |
| 44781 | Frost Trap upgrade / `{*1[업그레이드]}` | Retain the localized marker payload and the effect of additional damage plus disorientation. | Korean preserves the Frost Trap, extra damage, and disorientation. The marker identity/order and the following line break match all locales. | Low |
| 44785 | Tome / `책` | Confirm whether the capitalized `Tome` is a named book/item and should use the established title term rather than generic `책`. | English capitalizes `Tome`; Korean uses generic “book.” Japanese and Chinese also differ in whether it sounds like a formal title. | Medium |
| 44787 | Templar / gnome state / `성전기사` / `노움 국가` | Confirm the canonical order/rank and polity terms; preserve the warning's scope. | Korean retains the consequence of hostility making the addressee an enemy of the entire gnome state. Japanese uses a temple-knight term; the source-keyed historical record leaves the order/office sense open. | Medium |
| 44791 | Elund Carth / `엘룬 카스` | Confirm the canonical spelling of the proper name and keep the ships moored until he authorizes otherwise. | English says the ships are moored until Elund Carth says otherwise. Korean preserves the authorization condition; Japanese/Chinese offer different phonetic spellings. | Medium |
| 44798 | Beckoned / `부름받은 자` | Confirm the recurring faction/title rendering and preserve the inclusive welcome. | Korean addresses the player with a collective setting title; Japanese/Chinese use different localizations. The historical log groups this with faction-title consistency questions. | Medium |

IDs 44751-44752, 44754-44757, 44759-44769, 44771, 44774-44776,
44779-44780, 44782-44784, 44786, 44788-44790, 44792-44797, and 44800
generally retain the English meaning on this first reading. Names, setting
terms, and UI labels remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 44750-44799 were checked for
  Captain Brenner, the seizure notice, Thyrdon, Gorbellies, Arrivus Engine,
  family arms, Klurikon's dam/river comparison, Mozambique, the rhyming
  banishment line, `THIS IS A BUG`, Whitestone politics, Frost Traps,
  Templar/gnome state, Child of Dust, Elund Carth, Gorrenet/Hartwen, and
  Beckoned.
- The log preserves both `(1)` counts and `$VMC_NQD.cost$`, and specifically
  flags the uncertain wordplay, heraldic/weapons sense, source comparison,
  possible test string, and several proper names.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44751-44800 once
  and in identical ascending order.
- ID 44752 retains `$VMC_NQD.cost$`; ID 44781 retains the `{*1[...]}` marker
  identity/order and one embedded line break. The item counts at 44753 match.
- Japanese renders one unknown object with an explicit digit at 44753 and
  one source quantity at 44767; these do not indicate a value change.
- No hidden formatting characters or unrecorded line-break differences were
  found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44751-44800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44801.
