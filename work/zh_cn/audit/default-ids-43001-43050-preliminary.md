# Preliminary Language Scan: `default` IDs 43001-43050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43001-43050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43001 | `My Anela` / `우리 아넬라` | Preserve the worried, affectionate address without assuming a family relationship. | Korean's `우리` is a natural Korean possessive/endearment; the row does not state who Anela is to the speaker. | Low |
| 43004 | Apparel / `의상` | Confirm this is the general equipment/category label and standardize it with adjacent inventory UI. | English and Chinese say apparel/clothing; Japanese unusually says armor. Korean uses a broad clothing category. | Medium |
| 43011 | Cipher / `암호 장치` | Determine whether Cipher is a device/artifact or a code/message; retain the broken-state note accordingly. | English capitalizes Cipher and says it was found and is broken; Japanese transliterates it while Chinese reads “secret order/code.” | Medium |
| 43012 | Seelie Fae / `실리 페이` | Standardize the Seelie faction name and its capitalization/loanword form. | All versions state the Fae bond with their land and reflect its nature; locale names vary. | Medium |
| 43015 | let the rest of the world rot / `나머지 세상은 망하든 말든` | Preserve the speaker's harshly isolationist attitude and avoid softening the contempt. | Korean retains the dismissal of the rest of the world; Japanese/Chinese use similarly broad rejection. | Medium |
| 43016 | `{1} Chantries Destroyed` / `{1}곳의 예배당 파괴` | Confirm what `Chantries` denotes in the game and retain the count variable. | Korean interprets it as chapels; English/Chinese/Japanese use chapel/church-like terms. `{1}` remains in place. | Medium |
| 43017 | “That Fae, his face it pierced my eyes... into my head!” / `얼굴이 내 눈을 꿰뚫고 ... 머릿속까지` | Preserve the intentionally fragmented, possibly magical/psychic image rather than regularizing its agency. | Korean keeps the eye-to-head progression; source grammar is broken and the exact literal/figurative sense remains unclear. | Medium |
| 43021 | hold and release Faeblades / `누르고 있다가 놓아` | Confirm control terminology and standardize `Faeblades` as the weapon/attack label. | Korean preserves the hold-release input and spinning movement through enemies. Japanese says hold the attack button; the user-facing input remains a terminology check. | Medium |
| 43025 | the Primos walks again / `프리모스가 다시 걷는다` | Determine whether Primos is a person/title or office, and preserve the surprised report. | English/ Japanese treat the Primos as an individual; Chinese generalizes to a leader appearing again. | Medium |
| 43031 | Grand Champion / `대챔피언` | Verify the official arena rank/title and whether a more established Korean form exists. | English capitalizes the title; Korean's compound is understandable but may not match other Champion ranks. | Medium |
| 43032 | `LINE_CENTER` ability tutorial | Preserve all runtime placeholders and labels; investigate the Japanese-only omitted alignment token. | English, Chinese, and Korean contain `{LINE_CENTER}`; Japanese omits it. All retain `{1}`, `{2}`, `{LINE_SPACE}`, and marker ID `1` labels in the same remaining order. | High |
| 43034 | Aryllia / Dokkalfar / marker `{*1...}` / `아릴리아`, `도크알브` | Standardize the deity/faction spellings and preserve the availability marker. | The marker ID/order and localized availability text match; phonetic and faction forms vary. | Medium |
| 43038 | Scholia Arcana history / Evren / Siren / Fruntbert-Frunbert | Review the long entry for name consistency, source wording, paragraph breaks, and the intentionally comic final anecdote. | Korean retains the English source's line-break layout; Japanese and Chinese each have two fewer breaks. Korean also preserves the English Fruntbert/Frunbert spelling distinction through differing Korean forms. | Medium |
| 43042 | Saina poem / English `S\nhe` split | Correct the apparent split-word typo without changing the five-line poem or Saina's action. | English has `S` at the end of one line and `he` at the next; Korean joins these as “She” and keeps five lines. Chinese combines them but has one fewer line break than English/Japanese/Korean. | High |
| 43043 | “I have had chances to speak of Arkes before” / `예전에도 ... 기회가 있었지` | Keep the opening fragment and determine whether “had chances” means opportunities previously existed or were missed. | Korean preserves the hesitant fragment and says there was an earlier chance; Chinese reverses this as “never had a chance.” | Medium |
| 43047 | Alchemy/Reagents/Recipes/Workbench tutorial markup | Standardize crafting terminology and preserve every control marker and help-label boundary. | Korean retains the instructional sequence and all source markers; reagent/item/UI glossary consistency remains open. | Medium |
| 43049 | Gallows Tree / `교수대 나무` | Standardize the named place/tree rendering with the earlier `교수형 나무` at ID 42701. | English is the same capitalized name; the two Korean rows currently use different literal compounds. | High |

IDs 43002-43003, 43005-43010, 43013-43014, 43018-43020, 43022-43024,
43026-43030, 43033, 43035-43037, 43039-43041, 43044-43046, and 43048
generally retain the English meaning on this first reading. Proper names,
register, and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 43011-43049 were checked.
  They specifically flag Cipher, Seelie, Leanashe, Chantries, Primos,
  Dynnwel, Dokkalfar, the Scholia Arcana history/names, the Saina poem,
  Alchemy/Reagents/Recipes terminology, and Gallows Tree.
- Historical notes say the Saina poem contains the apparent `S\nhe` typo
  and should retain five lines; Korean repairs the split while preserving
  the line count.
- The historical note claims the Scholia history's source line breaks are
  retained. Direct four-locale comparison refines that claim: English/Korean
  have 12 embedded breaks, while Japanese/Chinese have 10. Korean follows
  English's 12-break layout.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43001-43050 once
  and in identical ascending order.
- ID 43032 has a Japanese-only runtime-marker omission: `{LINE_CENTER}` is
  absent there but present in English, Chinese, and Korean. Other marker IDs
  and order in the row match.
- ID 43038 has 12 embedded breaks in English/Korean and 10 in Japanese/
  Chinese. Korean follows the English layout.
- ID 43042 has four embedded breaks (five lines) in English, Japanese, and
  Korean, versus three in Chinese. Korean joins the split English `S\nhe`
  typo while preserving five lines.
- ID 43047's help markers and their order match across all four locales.
- ID 43044 retains the count 25; ID 43016 retains `{1}`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43001-43050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43051.
