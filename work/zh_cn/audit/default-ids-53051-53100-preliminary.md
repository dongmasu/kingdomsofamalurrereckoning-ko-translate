# Preliminary Language Scan: `default` IDs 53051-53100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 53051-53100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 53052 | `힘의 시련(Trial of Strength)이 네게 내린` | Preserve that the Trial of Strength imposes a magical curse; standardize the trial title. | Korean retains the magical curse and its source. English/Japanese/Chinese agree on the relation; the Korean title is bilingual but its canonical form remains open. | Medium |
| 53054 | source typo `you're travels` | Treat this as an English possessive typo, not as a Korean meaning defect; retain the wish that the addressee travel far from the Forsaken Plain. | Korean expresses the intended farewell/wish and the speaker's gratitude. Japanese and Chinese also support the intended sense. | High |
| 53056 | `받는 얼음 피해가 75% 감소합니다` | Preserve the exact incoming Ice Damage reduction and percentage. | All four locales specify a 75% reduction in ice damage received. Korean retains the value and direction of effect. | High |
| 53059 | Angharad / incoming storms / beach breakfasts | Preserve the speaker's affection and the list of shared memories without resolving unstated context. | Korean retains the cliffs, approaching storms, beach breakfasts, and regretful recollection. | High |
| 53061 | `불타는 화살(FlamingArrow)` | Confirm whether `FlamingArrow` is a proper item/ability label or a generic “flaming arrow”; preserve its camel-cased source spelling in the audit. | Korean translates the meaning and retains the source form in parentheses; other locales use a localized/transliterated label. | Medium |
| 53065 | `웅장한 회랑` for `grand gallery` | Check whether this was an art/exhibition gallery or a grand hall; avoid narrowing it to a corridor if the building context is a gallery. | Korean uses `회랑`, which often means a corridor/colonnade. Japanese says art museum/gallery and Chinese says gallery. `second floor` as `2층` is equivalent and preserved. | High |
| 53066 | Savant Reen / Great Library of Crownhold | Verify `Savant` as a formal rank and retain that Reen is a mage and Hugues's old friend/collaborator. | Korean preserves the archive purpose, secure location, relationship, and Crownhold library. Proper-name spelling/title consistency remains open. | Medium |
| 53070 | Storyteller / capitalized `House` | Confirm whether Storyteller and House are formal roles/institutions, and whether `our House` means a political Fae House rather than a family. | Korean renders Storyteller as `이야기꾼` and House as `가문`, preserving administration and service to the Court of Enchantments. English capitalization and the Court setting suggest formal lore terms. | Medium |
| 53080 | `앨린 시어도 함께지만` / Alyn Shir | Preserve that Alyn Shir also followed the speaker to the Theater of Fate, and retain the plan with Agarth to defeat the Fae attackers. | Korean says Alyn Shir is also “with” the speaker, then correctly uses her help, but does not state as clearly that she followed the speaker as the English does. Chinese gives a different “lying in wait” reading; context may resolve it. | Medium |
| 53083 | `플레지실드(Pledgeshield)` | Determine whether Pledgeshield is a formal faction/rank/title or a vocative name; standardize it with related mercenary terminology. | Korean retains and transliterates the form. Japanese reads it as a second-class hireling, while Chinese translates an oath-shield term. Ironfast is preserved as a place name. | Medium |
| 53086, 53093 | `교수대의 끝(Gallows End)` | Align the proper-name form with the corpus-wide Gallows End variants and keep the location bilingual where appropriate. | Korean uses a literal translation here; the active corpus also uses `갤로우즈 엔드`, `갤로스 엔드`, `갈로스 엔드`, and related forms. | High |
| 53090 | `티린의 쉼터(Tirin's Rest)` | Standardize the place name with recurring Korean forms and verify the spelling of Tarion. | This row uses `티린의 쉼터`; the active CSV predominantly uses `티린의 안식처`, with other transliteration variants also present. Korean retains the locksmith, location, and request to identify the handiwork. | High |
| 53095 | `대사제(Hierophant)` / guide and provider | Preserve both the guiding and provisioning roles, the seer description, and the decision about what to steal; standardize the title. | Korean renders provider as `먹여 살리는` and retains the powerful seer and theft-selection duties. The formal `Hierophant` title remains a corpus-wide terminology question. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain open for consistency, including Forsaken
Plain, Well of Souls, Brother Wulf, Lorca-Rane, Buru's Boots, Kollossae,
Summer Court, Court of Enchantments, Crystal War, Witchknight Anira,
Theater of Fate, Alyn Shir, Agarth, Pledgeshield, Akara-Tor, Erathi,
Midden, Saturnyn, Tirin's Rest, the Hierophant, and Magnus.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry titled `default` IDs
  53050-53149. Its questions for the Trial of Strength (53052), 75% ice
  reduction (53056), FlamingArrow/Lorca-Rane (53061-53062), gallery (53065),
  Savant Reen (53066), Aisle of Flame/Buru's Boots (53067), Storyteller and
  the Courts (53070), antidote (53072), Witchknight/Itran/Akara-Tor/Erathi/
  Midden/Saturnyn (53074-53087), Tirin's Rest/Tarion (53090), and
  Hierophant (53095) correspond to the active rows.
- The 53050 Cynoc's Eye entry is the preceding batch's boundary row and is
  not counted again. Historical notes for 53104 and later belong to future
  batches.
- The adjacent report notes that `second floor` is rendered `2층`, which
  preserves the ordinal. The possible issue at 53065 is the separate
  `gallery`/`회랑` choice.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 53051-53100 once
  and in identical ascending order.
- Physical line-break counts and detected runtime/control-token identities
  match throughout the range. The 75% value at 53056 is preserved. No hidden
  format/control characters were detected.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 53051-53100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 53101.
