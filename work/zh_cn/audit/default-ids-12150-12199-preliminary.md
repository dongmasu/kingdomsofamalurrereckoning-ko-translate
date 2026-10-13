# Preliminary Language Scan: `default` IDs 12150-12199

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12150-12199.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12154 | riverbed warning / basement addition | Preserve both claims while clarifying whether they are connected or whether a conjunction/context is missing. | English and Korean move abruptly from watching out for a riverbed to adding a basement for gold. Japanese/Chinese have the same juxtaposition; the line alone does not explain the relation. Historical notes already flag it. | Medium |
| 12155 | `Plain Jane` → `평범한 제인(Plain Jane)` | Determine whether this is the idiom for an ordinary woman or a named person/item/title. | Japanese and Chinese read it generically as an ordinary woman/girl. Korean keeps both the literalized name and English phrase, so the intended reference remains unclear. Historical notes already flag it. | Medium |
| 12161 | `Forum` → `공회당` | Identify whether this is a public hall, open square, or UI/location label before fixing the Korean term. | Japanese reads it as a public hall; Chinese as a square. Korean follows the hall reading. Historical notes already flag the conflict. | Medium |
| 12163 | `Pledgeshield Fenan` → `서약방패병 페난` | Align the rank/title and person's name with the unresolved Pledgeshield terminology elsewhere. | English capitalizes the rank; Japanese calls Fenan a second-class mercenary and Chinese renders Pledgeshield as an oath-shield. Historical notes already flag it. | Medium |
| 12165 | `Are mortals not educated...` → `그 정도로 무지하진 않겠지` | Verify the intended rebuke; the Korean may reverse or soften the English/Chinese accusation about mortals' education and etiquette. | English and Chinese ask whether mortals are uneducated/unlearned in guile and etiquette. Japanese says “are you that ignorant?” Korean says “you wouldn't be that ignorant,” which weakens or reverses the criticism. | High |
| 12166 | `{*1craft}` / `{1}` | Preserve the localized-label wrapper and button marker, translating only the label content. | English, Japanese, Chinese, and Korean each have one localized `{*1...}` marker followed by `{1}`; marker class/order matches. No structural issue was found. | High |
| 12173 | `Missives` → `서신들` | Confirm whether these are ordinary letters/messages or a named document/item. | Korean translates the English plural as letters; Chinese identifies a specific scroll, which English does not name. Historical notes already flag the object. | Medium |
| 12178 | `Orbocant` → `오르보칸트(Orbocant)` | Determine whether this is a person/proper name or a council/institution. | Japanese transliterates a name; Chinese interprets it as a council. Korean preserves the English proper-name form. Historical notes already flag it. | Medium |
| 12179 | `Undersewer` → `언더시어(Undersewer)` | Confirm the proper-name form and whether it is a distinct place beneath the Idylla Sewer. | English defines it as a named network of open-sky fragmented tunnels. Korean retains the name and description; Japanese/Chinese translate it descriptively. Historical notes already flag it. | Medium |
| 12187 | Three localized ability labels and descriptions | Preserve all three ability labels, weapon types, hold/release inputs, and the four embedded line breaks; review bilingual label consistency. | All four locales have three localized `{*1...}` labels in the same order and four line breaks. Korean preserves Comet Strike, Whirlwind, and Minotaur Rush effects and controls; localized marker contents differ by design. | High |
| 12190 | `Of whom? The Arnes?` / Clyeth | Clarify whether Arnes is a family/group and preserve Clyeth as the wanted deserter despite the source's fragmentary syntax. | Korean asks whether the speaker means the Arnes family, then identifies Clyeth as the scoundrel being sought. Japanese/Chinese also restructure the fragment differently. Historical notes already flag it. | Medium |
| 12192 | `Stay dry, captain.` → `술은 적당히 드세요, 선장님` | Determine whether this is a “stay sober” drinking idiom or a literal nautical warning. | Japanese says not to drink, Chinese translates “stay dry” literally, and Korean advises moderate drinking. Historical notes already flag the divergent readings. | Medium |
| 12195 | `Sustained Cost: 30% Mana` → `지속 소모: 마나 30%` | Confirm whether the 30% is based on maximum mana or another gameplay value; do not add “maximum” without evidence from English/context. | English says only `30% Mana`; Japanese explicitly supplies maximum mana, while Chinese and Korean omit that qualifier. Historical notes already flag the difference. | Medium |
| 12199 | `Scholia Arcana` → `스콜리아 아르카나` | Align the institution name with the competing active rendering `아르카나 대학` without global replacement. | Korean uses a phonetic form; other corpus entries use both this and a translated university form. Historical notes already flag the inconsistency. | High |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12154, 12155, 12161, 12163, 12173,
  12178, 12179, 12190, 12192, 12195, and 12199 against the active Korean
  and all three source locales. They remain open.
- ID 12165 is an additional high-confidence candidate from the English,
  Japanese, Chinese, and Korean comparison.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Localized marker classes/order at ID 12166 and the three ability markers
  at ID 12187 match across locales; no runtime-token difference was found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12150-12199 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12200-12249.
