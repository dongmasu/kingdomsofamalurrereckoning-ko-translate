# Preliminary Language Scan: `default` IDs 59101-59150

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 59101-59150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 59101 | Amman's hollow of Syl / `실의 아만의 굴` | Clarify the relationship between Amman and Syl and render the location naturally without changing which person/place is associated with the hollow. | English says “Amman's hollow of Syl”; Japanese and Chinese also leave the relation compact. Korean's stacked genitives are awkward and may imply Syl possesses Amman rather than identifying a place. The historical question asks for the names and context. | Medium |
| 59107 | “The Flowering” ceremony / `개화 의식` | Preserve the formal ceremony name and the consequence that it will not be retold after Osduin's death. | All locales retain Osduin's death and the ceremony's lost retelling. Korean uses a plausible literal form; whether Flowering is a formal rite title remains open. | Medium |
| 59114 | western woods / `서쪽 숲` | Preserve the English direction, but record the direct conflict with Japanese, which says eastern woods. | English, Chinese, and Korean say western; Japanese says eastern. Korean follows the primary English source. The location conflict is source evidence, not an instruction to change the Korean. | High |
| 59115 | newspaper / “not yet implemented” | Retain the explicit developer/UI status wording; verify whether this debug-like row is intended for player display. | English, Japanese, Chinese, and Korean all say the newspaper is not implemented. Korean accurately preserves the status, but the row may be internal or unused. | Medium |
| 59118 | Bull in a China Shop / `난폭한 자` | Determine whether this is an idiomatic label/title requiring the clumsy-bull image, rather than only a generic “violent person.” | English is a recognizable idiom; Japanese and Chinese diverge between rough person and clumsiness, while Korean retains only roughness. The historical audit asks for an equivalent that preserves both title and joke. | High |
| 59129 | Lorestone set bonus / `{*1lorestone}`, `{LINE_SPACE}` | Preserve both localized Lorestone marker identities and the permanent set-completion bonus. | All locales retain two Lorestone markers, the line-space control, and the permanent bonus. Korean's `로어스톤` is consistent with its current glossary direction; established UI terminology remains reviewable. | High |
| 59131 | Beggar's Bluff / `거지의 허세` | Preserve the place name and the beggar/bluff wordplay; check whether Korean can carry both without reducing “Bluff” to boast alone. | English explicitly links the place's name to the beggars. Japanese explains the derogatory naming, Chinese is awkward, and Korean translates Bluff as `허세`, which may lose the cliff/location sense. | High |
| 59132 | wine-and-pleasure halls / `포도주와 향락의 전당` | Preserve the captain's formal/fanciful description of Crownhold's social halls. | English, Japanese, Chinese, and Korean retain the wine/pleasure setting. Korean is close to the source but the institutional/place-name status of the halls is not established. | Medium |
| 59140 | Leechwood / “two-leg name” / strength-eating wood | Preserve the distinction between the tree's name and the name used by two-legged people; retain the explanation that it appears throughout the forest. | All locales keep the wordplay and widespread location. Korean makes the implied people explicit as “those who walk on two legs,” a plausible rendering that keeps the joke. | Medium |
| 59143 | Beyond the Veil / Great Cycle / “permanent rest” | Preserve the contrast between no more sleep in the Great Cycle and the curse of permanent rest; clarify whether “gone” means dead. | All locales retain the three survivors and the rest/death language. Korean's `사라졌어` is less explicit than the permanent-rest curse, while the English itself uses “gone.” | Medium |
| 59144 | “mayor's agenda” / `에스윈 시장의 계획` | Do not assume Eswin is the mayor solely because the quest sentence later says to return to Eswin; clarify the referent and political/quest sense of “agenda.” | English distinguishes “the mayor's agenda” from “return to Eswin.” Korean combines them as “Mayor Eswin's plan,” adding an identity relation not explicit in the row. The historical prompt leaves the agenda's meaning open. | High |
| 59147 | Boggarts and Scavs / `보가트와 스캐브` | Confirm `Scavs` as a named creature/group and keep its form consistent with other occurrences. | English capitalizes both creature/group names; Korean transliterates Scavs. The task meaning is retained, but the creature-name spelling remains a glossary question. | Medium |
| 59150 | Mitharu / `미타루` | Retain the deity reference and its pronoun/gender context; align the Korean form with established terminology. | All locales say Mitharu will free the group and refer to the deity in masculine terms or honorifically. Korean uses the established-looking name with a respectful suffix; canonical spelling remains a terminology check. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional names and terms include Amman, Syl,
Cradle of Summer, Whitestone, Gadflow, Padaxes, Lysander, Osduin, the
Flowering, Rathir, Scholia Arcana, the grove's guardians, Agatha Tor,
Kandrian Keep, Lou Winfreigh, Warlord, Padrig Dower, the Lorestone set,
Beggar's Bluff, Captain Koch, Crownhold Garrison, Castle Yolvan, Webwood,
Brogan Adair, the Pit, Gask, Bareth, Ordo, Adath Skoria, Eswin, Mitharu,
and Red Legion.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `59050-59149`.
  Applicable prompts include Amman/Syl/Cradle of Summer (59101), grove
  guardians (59102), the Flowering ceremony (59107), arrangements and
  second-level construction (59109-59110), Scholia Arcana (59112), the
  direction conflict at 59114, Bull in a China Shop (59118), Lorestone
  markers (59129), Beggar's Bluff (59131), the wine-and-pleasure halls
  (59132), tame Webwood (59134), Beyond the Veil/Great Cycle (59143), and
  the mayor's agenda (59144). These remain open prompts, not accepted
  corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 59101-59150 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Embedded newline counts match throughout the batch. The localized
  Lorestone markers and `{LINE_SPACE}` at 59129 preserve their sequence;
  no other runtime marker or numeric-value discrepancy was found.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 59101-59150 received a subsequent working disposition pass documented
in [`disposition-batch-default-59101-59150-20261011.md`](disposition-batch-default-59101-59150-20261011.md):
one supported correction was accepted at 59144, 11 items remain uncertain,
and 38 were dispositioned as not an issue. The preliminary findings above
remain evidence notes, not independent final linguistic approval. Continue
at `default` ID 59151.
