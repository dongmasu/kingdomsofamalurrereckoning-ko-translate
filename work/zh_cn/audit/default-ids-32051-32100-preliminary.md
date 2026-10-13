# Preliminary Language Scan: `default` IDs 32051-32100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32051-32100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32052 | `학문의 전당` for `house of learning` | Confirm whether this is a named institution and whether the superlative is sufficiently conveyed. | English calls it perhaps the greatest house of learning in the Faelands. Japanese and Chinese also describe a leading academic institution. Korean's `손꼽히는` conveys high standing but not an explicit superlative; institution identity remains unknown. | Medium |
| 32054 | `교수형 사내들(The Hanged Men)` | Standardize the Hanged Men group name against existing Korean variants. | English, Japanese, and Chinese identify the same capitalized group. Active Korean uses `교수형 사내들` here and elsewhere, but also `교수형자들`; the historical log separately flags this name. | High |
| 32055 | `페이트위버 결사`, `국경 통행증`, `라시르 하성` | Confirm the formal Korean name of the Order of Fateweavers and the lower-city military station; standardize the pass name. | English specifies the Order, an official Border Permit from the Alfar Military, and its station in Rathir's lower city. Japanese and Chinese agree on those relations. Korean preserves the itinerary and pass, but the corpus alternates between `페이트위버` and `운명 엮는 자들`, and `하성` needs comparison with the established rendering of “lower city.” | Medium |
| 32058 | `내 배는 이제 자유야... 항로는 자네들이 정하게` | Resolve whether `free` means offered without charge or free to sail, and retain the speaker's friendly register. | English deliberately pairs “my ship is free” with the listeners plotting its course. Japanese makes the fare explicitly free; Chinese says the ship is free and under their direction. Korean naturally supports release/freedom and passage of control, but does not clearly express “free of charge.” | Medium |
| 32064 | `안원 가문` / `양면적인 배신` | Confirm House Anwon as a named house and review the “two-tongued” betrayal image. | English capitalizes House Anwon and describes the group's two-tongued treachery. Japanese and Chinese retain the betrayal idea. Korean preserves both, though the proper-name status and metaphor's intended force need lore context. | Medium |
| 32070 | `동산` for `chattel` | Check whether the legal-sounding term is appropriate in this character's spoken list. | English lists trade goods, debts, livestock, or chattel before allowing someone to leave. Japanese uses household/property wording and Chinese uses movable property. Korean is semantically broad and accurate, but `동산` is notably formal. | Low |
| 32073 | `보석과의 사랑` for `Romancing the Gem` | Determine whether this is a pun, quest/title name, or literal romance before settling the title convention. | All locales identify the same capitalized title. Korean preserves its literal meaning and appends the English title, but the intended wordplay and whether this is a named quest remain uncertain. | Medium |
| 32078 | `로그 저장` for `Save Logs` | Confirm whether this UI action saves log files or opens log-saving settings; keep distinct from login terminology. | English says `Save Logs`; Japanese describes log-save settings. Chinese instead reads as “save login,” but Korean follows English and the Japanese UI context. | Medium |
| 32084 | Three localized `{*1...}` special-attack labels | Preserve wrapper IDs/order and determine the display convention for localized payloads and Japanese quotation marks. | All locales list Riposte, Gut Thrust, and Crushing Blow in the same order and state that the attacks can add damage over time. Korean localizes all three payloads; Japanese adds quotation marks, while the other locales do not. Wrapper identities and order match. | High |
| 32088 | `FAILURE LINE` retained in English | Determine whether this is an internal/debug string or a player-facing label before localizing. | English and Japanese retain the all-caps label; Chinese translates it as “fault line.” Korean preserves the source string. The available row context does not establish its audience or function. | Medium |
| 32093 | `이 신전은 ... 세워졌다` | Preserve the intended construction date while noting the malformed English source. | English is missing a verb in “This temple built five hundred years...”; Japanese and Chinese make the temple's construction explicit. Korean supplies a grammatical passive without changing the stated interval. | High |
| 32095 | `폐하의 몽상은 버티기 힘들고 오래가지 않을 테니` for `His Majesty's reverie is difficult and will not last` | Confirm whether `reverie` is a named/lore state and what “difficult” describes in context. | Chinese reads “daydream,” Japanese transliterates `reverie`, and Korean uses `몽상`. Korean retains the difficulty and short duration, but `버티기 힘들다` may make the subject endure the reverie rather than experience or enter it. | Medium |
| 32097 | `신의 폭풍`, four-line God Storm passage | Verify whether God Storm is a named event and preserve the hail-of-bodies image and poem lineation. | English capitalizes `God Storm`; Japanese marks “God's Storm” as a title-like phrase. Korean retains the collision, storm, and cold/warm bodies falling like hail. Chinese omits the bodies image. All four locales preserve four lines. | Medium |
| 32099 | Localized `{*1[지속 효과]}` passive label | Preserve the marker and passive-damage meaning; review the Korean ability-label convention with similar entries. | All locales localize the payload inside the same marker and state increased damage to bleeding foes. Korean preserves the meaning and one following line break; Chinese adds an explicit “you studied anatomy” notion not stated in English. | High |
| 32100 | `온의 진지(Ohn's Stand)` | Resolve the place-name sense and standardize bilingual display. | English names Ohn's Stand; Japanese interprets it as Ohn's fortress, while Chinese reads it as Ohn's resistance/stand. Korean transliterates the name and retains English, leaving the location-versus-resistance sense open. The historical log groups this with adjacent lore/name questions. | Medium |

Rows 32051, 32053, 32056-32063, 32065-32069, 32071-32072, 32074-32077,
32079-32083, 32085-32087, 32089-32092, 32094, 32096, and 32098 generally
retain the English meaning on this first reading. Proper-name spelling,
character register, and setting terminology remain candidates for the
integrated pass; no separate high-confidence wording correction was
identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32000-32099 flags The Hanged Men,
  the Order of Fateweavers and Border Permit at ID 32055, House Anwon,
  Romancing the Gem, `FAILURE LINE`, the royal reverie, and the God Storm
  poem. These questions were checked against the active Korean and all three
  source locales; they remain open where context is absent.
- Existing active Korean uses both `교수형 사내들` and `교수형자들` for
  The Hanged Men. The current row is therefore a confirmed corpus
  consistency candidate, not a confirmed choice of canonical form.
- The source key for ID 32100 is also present in the historical 32100-32199
  inventory, which flags Ohn's Stand and related lore/name terms.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32051-32100 once and in identical order.
- Embedded line-break counts match throughout the range, including three
  breaks (four lines) in the poem at ID 32097 and one break each at IDs 32099
  and 32100.
- Runtime marker identities and order match at IDs 32084 and 32099. The
  localized payloads differ as expected; no wrapper-order discrepancy was
  found.
- No other structural exception was detected in this batch.
- No CSV text or source file was edited.

## Batch Status

IDs 32051-32100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32101.
