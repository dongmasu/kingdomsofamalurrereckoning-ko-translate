# Preliminary Language Scan: `default` IDs 25001-25050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25001-25050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25002 | High King / attribution of heresy | Preserve that the text describes impossible events and that attributing it to the High King is treason. | Korean retains the listed Fate/death claims and accusation; standardize the High King title with established forms. | Medium |
| 25006 | “Affix the Charm” | Determine whether this is an inventory action, crafting step, or UI command; retain the imperative. | Korean renders a concise “attach charm” command; the exact interface context is not available in the row. | Medium |
| 25009, 25013 | Nyralim / Titarion / Summer Court / Scions / Erathi | Standardize proper names and preserve the respective wisdom and amulet-lore claims. | Korean retains the ancient-rune and Akara-blessing details; locale spellings and the Chinese reading of Scions as descendants differ. | Medium |
| 25012 | Aurochs | Confirm the established Korean creature name rather than relying only on transliteration. | Korean uses `오록스`, Japanese transliterates the English name, and Chinese uses a generic wild-ox term. | Medium |
| 25017 | energy nexuses / barrier | Verify the established term for energy nexuses and preserve the required order: destroy them to reach Bisarane. | Korean retains the causal relation and objective; the Japanese source calls them concentrations of magical energy rather than using a borrowed term. | Medium |
| 25019-25020 | Mitharu / Souldeep Fasting / Bridgette Malloi | Standardize the deity and place names, and establish whether “Souldeep Fasting” is a named location or an ordinary fasting place. | Korean says `금식처`; Japanese describes arrival at underground passages and omits the named Fasting wording, while Chinese uses a passage term. The guardian betrayal and Fate-magic trail remain intact. | High |
| 25023-25024 | order / library / Intellect | Confirm what institution “the order” denotes and retain its well-stocked library; treat the Japanese `治世` (“governance/reign”) at ID 25024 as a source conflict, not support for changing Korean `지능`. | English, Chinese, and Korean give “Intellect”; Japanese gives a semantically different label. At ID 25023, Japanese says university and Chinese says academy, unlike English “order” and Korean `교단`. | High |
| 25025 | relic used to “draw” valuable minerals | Verify the mining mechanism and preserve that the narrator lent the relic because Edgar seemed worthy of friendship. | Korean retains the relationship and purpose but uses an ordinary mining/extraction reading; the means implied by “draw” is unclear without lore context. | Medium |
| 25027 | Tarrick Smith / smithing pun | Preserve the challenger introduction and the joke that the blacksmith might pound the player too. | Korean retains the repeated “pound” joke; avoid reading “Smith” only as the occupation when standardizing the name. | Medium |
| 25028 | “house of evils” / crooked shadows and wending path / hideous tree | Preserve the full quoted passage's images and the speaker's shift from being lost and beguiled to resilient forward motion. | Korean keeps the prose sequence and quoted voice. The English “house,” “wending path,” and “their ... tree” remain context-dependent; no line breaks are present in any locale. | High |
| 25029-25030 | Camp Moondown / the Beckoned / Cipher | Standardize the camp, chosen-person, and Cipher terms while retaining the speaker's change of mind upon seeing the Cipher. | Korean preserves the contrast between the expected kin and the player's role; proper-term forms vary among locales. | Medium |
| 25031, 25037, 25045 | Mitharan / Kollossae / Kollossae Citizen | Reconcile established spellings and demonym/title forms across equipment, people, and UI labels. | Korean uses `미타란` and `콜로세`; Japanese and Chinese use distinct localized forms. | Medium |
| 25033 | grand master of Ysa / High King's Guide | Verify whether “grand master” is a formal rank and preserve the appositive presentation of the Guide. | Korean calls the person `대현자`; English/Japanese use grand-master wording, and Chinese is less specific. | Medium |
| 25034-25035 | house and homeland / social superiority | Preserve the oath to protect family/house and homeland, and the speaker's dismissive stance toward someone considered beneath them. | Korean retains the duty and condescension; “house” may mean family or a named House depending on context. | Medium |
| 25038 | `{LINE_CENTER}` | Preserve the exact localized-line control token and URL. | All four locales retain the same token and URL in the same order. | High |
| 25040 | elder foreman / Skoria Mine / Motus Mining | Confirm whether “elder” denotes seniority or age, and standardize mining-company and character/place names. | Korean uses `선임 작업반장` and retains the cousin's recruitment and ironic outcome; locale name forms vary. | Medium |
| 25041 | Codex / forgery | Identify whether “Codex” is a named book or a generic document and preserve the question about forgery. | Korean uses the generic `문서`; Japanese says book, while Chinese uses a legal-code term. | Medium |
| 25042 | Hallowed Tree poem | Preserve all four verse lines, graveyard/western-forest contrast, and the appeal for the dying to rest. | All locales retain three line breaks. Korean preserves the verse structure; “graveyard be” and “Do the dying have this rest” are compressed poetic syntax. | High |
| 25046-25047 | Reddle / Valor Arena / Grand Champion | Standardize the place and arena/title forms; preserve the guard's threat and the earned championship. | Korean retains the access threat and victory; the English source has the grammar issue “No one get,” but the intended prohibition is clear. | Medium |
| 25049-25050 | Children of Dust / first dawn / deserted-island joke | Standardize the lore group name and retain both the prewritten-story claim and the appearance-related joke. | Korean preserves the fate claim and the dry humor; the latter's “presentable” remains context-sensitive. | Medium |

## Historical Audit Reconciliation

- No prior open-question entries were found for IDs 25001-25050. Rechecked the
  active four-locale rows and recurring terms for Nyralim, Titarion, Summer
  Court, Scions, Akara, Lyria, Souldeep, Fasting, Fate, Intellect, Idylla,
  Kollossae, Ysa, Mitharu, Motus Mining, Skoria Mine, the Hallowed Tree, and
  Children of Dust. Interpretive and naming questions above remain open.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25001-25050 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales. ID 25042 has
  three breaks in each locale; no other row in the range has a line break.
- Runtime-token signatures match; `{LINE_CENTER}` at ID 25038 is preserved
  exactly. No other runtime marker was found in this range.
- Counts and event order are retained. No structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25001-25050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25051.
