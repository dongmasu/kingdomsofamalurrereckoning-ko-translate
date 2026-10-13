# Preliminary Language Scan: `default` IDs 41001-41050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 41001-41050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 41002 | House of Ballads / `발라드의 가문` | Standardize the faction name and preserve the threat that the House and king would retaliate fiercely if a mortal killed one of their own. | Korean retains the condition and threat to Gorhart but softens `fierce vengeance` to ruthless retaliation. Proper-name form remains open. | Medium |
| 41003 | lightning-damage modifier | Preserve +10 flat Lightning Damage and +25% Lightning Damage as distinct values. | All locales retain the two effects and blank-line layout; Korean preserves both values. | High |
| 41005 | `true maker` / `진정한 창조주` | Confirm whether this is a deity/creator reference and preserve the speaker's contrast between building as a mason and neglecting the true maker. | Korean follows the source's religious wording. Japanese explicitly says God; English capitalizes neither “maker” nor “one,” so the reference remains a lore question. | Medium |
| 41006 | `Prompt` / `안내` | Determine whether this is a UI label, instruction, or dialogue-tone marker and choose its intended sense. | Korean means guidance/prompting; Japanese reads it as encouragement and Chinese as a prompt. The isolated one-word row is ambiguous. | Medium |
| 41008 | Shroud of Omission / stealth armor | Standardize the named armor and preserve that it helps the wearer avoid nearby observers' notice. | Korean retains the stealth effect and scraps/material origin. The armor name is translated; historical notes flag it as a named item. | Medium |
| 41011 | `Dear Sir or Madam,` / `귀하께,` | Confirm the salutation's document context and retain an appropriately formal, gender-neutral address. | Korean uses a concise formal addressee. Japanese instead addresses citizens, while Chinese matches the English salutation; the source context is needed. | Medium |
| 41016 | `Sprite Soldier` / `스프라이트 병사` | Confirm Sprite as a species/name rather than a generic sprite creature and standardize the compound. | Korean transliterates Sprite and preserves the soldier role; Japanese also transliterates, while Chinese translates it as a fairy soldier. | Medium |
| 41017 | staff transfer / `거기서 지팡이를 넘겨줄게` | Correctly identify giver and recipient: the source says the addressee can give the staff to the speaker at the safe exit, but Korean says the speaker will hand it over. | English `you can give me the staff` and Japanese `渡してもらう` both make the addressee the giver and the speaker the recipient. Korean `넘겨줄게` reverses those roles. High-confidence preliminary agency reversal. | High |
| 41021 | `Mortals are wicked and undeserving` / `버림받아 마땅해` | Confirm the omitted object of “undeserving” while preserving the speaker's condemnation and self-reliance claim. | Korean says mortals deserve to be abandoned, an inference not explicit in the English fragment. Chinese supplies “undeserving of them leaving,” while Japanese diverges further. | Medium |
| 41022 | Grilricas / `그릴리카스 가문` | Standardize the family name and preserve the contemptuous rejection. | Korean retains the insult and command; the name spelling varies slightly across references. | Medium |
| 41025 | jade `band` / `옥 반지` | Confirm whether this is a ring or bracelet/band, and standardize the item category. | Korean says jade ring, supported by Japanese and Chinese; the English noun `band` is broader. Gold/ruby setting and enhanced targeting vision are retained. | Low |
| 41026 | `raise his army` / `군대를 일으키도록` | Determine whether Faitir raises, summons, recruits, or resurrects the army; preserve the ritual completion, protection of Tala-Rane, and reward. | Korean says he raised an army. Japanese reads as assembling/recruiting troops, while Chinese says reviving an army. English alone does not settle the mechanism. | High |
| 41031 | ice/piercing damage, duration, mana cost | Preserve 25 Ice and 20 Piercing damage per second, 15-second duration, and 210 Mana cost. | Korean retains all three values and the damage types. Chinese has a punctuation/layout issue, but English/Japanese/Korean line counts align. | High |
| 41033 | Brother Egan / `youngest charge` / `막내 제자` | Confirm whether `charge` means ward/person under Father Dynwel's care, subordinate, or disciple rather than his youngest student. | Korean chooses youngest disciple. Japanese calls him the youngest monk and Chinese the youngest apprentice; English `charge` is broader, so the exact relationship remains open. | Medium |
| 41040 | `As Winter Looms` / `겨울이 다가올 때` | Confirm whether this is a formal title and standardize it with the other Winter-related names. | Korean translates the title as winter approaching; Japanese shortens it to “Winter's Shadow,” while Chinese also says approaching winter. | Medium |
| 41041 | Faelands / `패란즈` | Standardize the realm name and check that this rendering is recognizable and consistent across the corpus. | Korean phonetic spelling differs from the Japanese and Chinese semantic forms for the Fae lands. The family separation during the Crystal War is retained. | Medium |
| 41042 | malformed English `Well you're army` / `그럼 군인이겠네` | Keep the Korean's apparent intended reading (“then you're with/in the army”) provisional and flag the English typo rather than treating it as authoritative source syntax. | Korean infers military affiliation from breaking the siege. Historical notes identify the source as malformed; Chinese/Japanese make a similar inference. | High |
| 41044 | Belmaid/Wencen poem; House of Ballads heroine | Verify names, queen/throne relationship, and parallel contrast in the closing couplet; preserve lineation and stanza break. | Korean preserves the eight verse lines and blank stanza boundary. It renders her as a queen seated on Wencen's throne and maintains the contrast between women's strength and where men fail. | Medium |
| 41045 | Destiny help text / `{LINE_SPACE}{LINE_LEFT}` | Preserve the title term and exact markup identity/order while retaining the explanation that Destiny is changeable and unlocks with greater glory. | Korean retains both markers in source order, all explanatory clauses, and the new-Destinies progression. No markup exception was detected. | High |
| 41047 | Smoke Bomb combat effects | Preserve 14 physical damage, 4-second stun, 6-second stealth, and 50 Mana. | Korean retains all four values and their separate effects. | High |
| 41048 | burial of `our men` / `우리 병사들` | Confirm whether “our men” means soldiers or companions and preserve the second purpose of the mission. | Korean says their soldiers' bodies should receive a proper burial. Japanese/Chinese also use a soldier/kin reading; the precise group is contextual. | Medium |
| 41050 | Kandrian / Mel Aglir | Standardize regional name spellings while preserving the hypothetical fall of both places and the family's keep standing firm. | Korean retains both place names and the conditional contrast. This is the first row in the historical log's next source-checked range. | Medium |

IDs 41001, 41004, 41007, 41009-41010, 41012-41015, 41018-41020,
41023-41024, 41027-41030, 41032, 41034-41039, 41043, 41046, 41049
generally retain the English meaning on this first reading. Proper names,
established terms, register, and plot references remain subject to integrated
review.

## Historical Audit Reconciliation

- The source-keyed historical log contains an entry spanning IDs
  41050-41149. This batch overlaps its term/name set at ID 41050 and a
  separate entry for IDs 40950-41049 covering the formal salutation, Sprite
  Soldier, Grilricas, jade band, Faitir's army, Brother Egan/youngest charge,
  Winter title, Belmaid/Wencen verse, Destiny markup, Smoke Bomb values, and
  burial purpose.
- Those questions were checked against the active rows. Unresolved source
  wording and terminology remain open; no correction is authorized.
- The official Korean manual could not be text-searched in this environment;
  no new manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 41001-41050 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match across all four locales. ID 41044 retains its poem lineation and
  stanza break; ID 41045 preserves `{LINE_SPACE}{LINE_LEFT}` in order; ID
  41047 preserves all combat values.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 41001-41050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 41051.
