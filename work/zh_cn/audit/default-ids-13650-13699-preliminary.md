# Preliminary Language Scan: `default` IDs 13650-13699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13650-13699.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13650 | `Court of Enchantments` -> `마법의 궁정` | Verify the proper location/faction name and whether a Korean glossary form exists. | English names a Court of Enchantments, while Japanese instead says “Hall of Heroes”; Chinese says “magic court.” The active Korean's direct rendering follows English/Chinese, but the cross-locale conflict remains. Historical question remains open. | Medium |
| 13658 | `its sweet sorrow` -> `그 달콤한 비애` | Determine what drink or substance is meant and whether the phrase is a named beverage. | English speaks of tasting it and asks for a bottle; the identity is absent. Japanese and Chinese retain the bittersweet phrasing. Historical question remains open. | Medium |
| 13662 | `Will'o'th'Wisp` -> `윌 오 더 위스프` | Confirm whether this is a named creature to transliterate or the common phenomenon “will-o'-the-wisp” (often rendered `도깨비불`). | This resource uses the transliteration, while another active row, ID 24503, uses `도깨비불`; capitalization and game-creature context may explain the difference. Historical question remains open. | Medium |
| 13666 | `Georgia` -> `조지아` | Determine whether the isolated label refers to the country, the U.S. state, or a character/place name. | English provides no context; Japanese transliterates the label and Chinese/Korean use the same ambiguous form. Historical question remains open. | Medium |
| 13668 | `The Offering` -> `봉헌식` | Align the named-rite wording with ID 13557 (`봉헌 의식`) and determine whether both refer to the same event. | The source says the Offering is approaching; Korean uses a shorter ritual form. Historical question remains open. | Medium |
| 13669 | `Circles Of Strife` -> `분쟁의 순환` | Confirm whether this capitalized phrase is a named quest/location or a poetic description of recurring conflict. | English title capitalization is suggestive but not decisive; Japanese and Chinese also translate it as recurring conflict. Historical question remains open. | Medium |
| 13670 | `Irion, King of Cups` -> `컵의 왕 이리온` | Confirm the in-world title and use one Korean form consistently. | The active corpus uses `컵의 왕`, `성배의 왕`, and `술잔의 왕` for King of Cups. Japanese/Chinese also vary in their word choice. | High |
| 13672 | `Ready for eternity?` -> `영원을 맞이할 준비는 됐나?` | Check whether this is a taunt about death/afterlife, immortality, or an explicitly named fate. | Japanese reads it as entering the afterlife (`常世`); Chinese reads immortality; English leaves the sense open. Historical question remains open. | Medium |
| 13673 | `Corthis Unbroken` -> `불굴의 코르시스(Corthis)` | Verify the character spelling and whether `Unbroken` is an epithet or part of the formal name. | Korean conveys the epithet as `불굴의` but omits its English form in parentheses. Japanese says “undefeated,” while Chinese gives a different phonetic rendering. Historical question remains open. | Medium |
| 13675 | `Maid of Fortune` -> `메이드 오브 포춘(Maid of Fortune)호` | Standardize the ship name's Korean form across quest references. | This row and ID 17546 use transliteration, while IDs 1151 and 27645 use `행운의 시녀호`; the references identify the Maid of Fortune as a ship. | High |
| 13679 | `Alyn Shir` -> `에일린 시어` | Reconcile this character's Korean spelling across the active corpus before choosing a form. | The active rows use many forms, including `앨린 시어`, `앨린 시르`, `앨린 셔`, `알린 시어`, and `에린 시어`. Japanese `エリン・シアー` and Chinese `阿琳·希尔` do not establish one Korean pronunciation. Historical question remains open. | High |
| 13690 | `It went ten years untouched` | Preserve the decade-long contrast without assigning an unsupported antecedent to `It`. | The isolated English string omits its antecedent. Korean supplies `곳` (“place”) and reframes the two ten-year periods; Japanese also leaves the antecedent implicit. Historical question remains open. | Medium |
| 13692 | localized `{*1hidden}` marker | Preserve marker class/order and localize only the marker label as supported by the other locales. | The English, Japanese, Chinese, and Korean rows each contain one localized `{*1...}` marker in the same position; no structural issue was found. | Low |
| 13694 | `Silent Choir` -> `무언의 합창단` | Align the faction name with the predominant active form `침묵의 합창단` unless context requires a different sense. | ID 13562 also uses `무언의 합창단`; most other active occurrences use `침묵의 합창단`. The source is a simile but names the same faction. | High |
| 13695 | `12% chance for Reflection` -> `반사 확률 12%` | Retain the value and confirm the exact game mechanic during context review. | The active corpus generally uses `반사 확률`; ID 61306 expands this to `반사(Reflection) 발동 확률`, supporting the current terminology. The row itself does not identify what triggers the effect. | Low |
| 13696 | `Detyre` -> `데티어(Detyre)` | Verify the region-name spelling against recurring active occurrences and the Korean glossary. | The isolated label supplies no pronunciation evidence; Japanese and Chinese use differing phonetic forms. Historical question remains open. | Medium |
| 13697 | Thorir / Asa Arding / Dead Kel / Brattigan | Check proper-name spellings against related quest entries and preserve the quest-journal chronology. | Korean retains all four names and the sequence “rescue survivors, encounter Dead Kel, return and speak with Captain Brattigan.” Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 13650, 13658, 13662, 13666, 13668-13669,
  13672-13673, 13679, 13690, 13695-13697 against the active Korean and all
  three source locales. They remain preliminary questions; no historical
  disposition was treated as approval.
- Cross-checked IDs 13662, 13670, 13675, 13679, 13694, and 13695 against
  recurring active Korean forms. The will-o'-the-wisp form, King of Cups
  title, Maid of Fortune ship name, Alyn Shir spelling, Silent Choir name,
  and Reflection label have documented corpus variation.
- ID 13692's localized marker is preserved in the same structural position.
  No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- No embedded line breaks occur in this range; parsed CSV-record line-break
  counts match.
- Brace, dollar, and hash-token signatures match after normalizing localized
  `{*1...}` contents. No marker-order or structural exception was found.
- Active Korean CSV hashes match the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 13650-13699 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13700-13749.
