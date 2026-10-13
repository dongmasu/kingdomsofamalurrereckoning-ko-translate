# Preliminary Language Scan: `default` IDs 28451-28500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 28451-28500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 28451-28454, 28456-28458, 28461, 28463, 28465-28468, 28470-28478, 28481-28484, 28486-28494, 28496-28500 | Dialogue, lore, names, item/UI labels, and objectives | Recheck register, established names, and terminology in the integrated pass. | Korean generally conveys the English. Whitestone, Star Camp, Chamber of Trade, Ljosalfar, Alfar, Bone Wall, Apotyre, Travelers, the Burn, Teeth of Naros, Faer Gorta, and Alabastra remain terminology/context candidates. | Medium |
| 28455 | `신에게 용서를 빌어야 하지 않나?` for “make peace with your god?” | Preserve the impending-death admonition while checking whether the intended sense is reconciliation/confession or specifically asking forgiveness. | English uses “make peace with your god”; Japanese explicitly mentions a final confession, and Korean asks forgiveness. Chinese uses a final prayer. The references share the religious warning but nuance it differently. | Medium |
| 28459 | `은밀한 마법 공격과 침입` for subtle magical assaults and invasions | Verify the shield's claimed protection and avoid treating `subtle` as necessarily “secret/stealthy.” | Korean renders the attacks as covert, while English can mean subtle or hard-to-detect magical attacks. Japanese/Chinese use broader formulations. | Low |
| 28460 | `[활성화 - 지속]` ability text | Preserve the marker and all weapon categories/effect; note locale-specific line layout. | English, Chinese, and Korean have two embedded line breaks after the marker; Japanese has one and combines the weapon-cutting and effect text differently. Runtime marker identity/order and all four weapon types match. | High |
| 28462 | `진정한 프리모스(Primos)` | Confirm whether `Primos` is a named people/faction rather than a generic “leader,” and standardize the slogan. | English and Japanese name the true Primos; Chinese renders “true leader.” Korean retains the proper-name spelling. | Medium |
| 28464 | `그건 절대 못 찾을 거야` for “We'll never find that one.” | Resolve whether “that one” refers to a person, object, or target before choosing a Korean pronoun/reference. | English is referentially ambiguous; Korean uses an inanimate `그건`, while Chinese chooses a person-like `他`. | Low |
| 28469 | `본벽(Bone Wall)` / Hera Orhelm | Confirm whether Bone Wall is a named notice/contract board or a literal wall and standardize the keeper's role. | English calls Hera the keeper of the Bone Wall; Korean preserves the name in parentheses. Japanese says a request-board manager, while Chinese also renders a wall, leaving the object uncertain. | Medium |
| 28479 | `여행자들` for `Travelers` | Determine whether the capitalized plural is a formal group name and align it with related Traveler references. | English capitalizes `Travelers`; Korean uses a generic plural, while Japanese/Chinese transliterate or translate the group label. Historical notes flag Travelers as a possible formal group. | Medium |
| 28480 | `영웅 등급 소켓` for “Epic socket” | Check the project's item-quality glossary for `Epic` and preserve the condition that this gem is socketed into rare torso armor. | Korean retains rare armor and the socket/effect relation. The item-quality translation remains a cross-corpus terminology question. | Medium |
| 28485 | `굴착공과 석공 일을 멈추라는 명령` for “stay our diggers, our masons” | Resolve the archaic phrase before deciding whether the order halted the work, restrained the workers, or required them to remain in Naros. | Korean explicitly says to stop their digging/stonework. English is archaic and ambiguous; Japanese reads as an order to leave/retain the workers, while Chinese suggests remaining in those trades. The historical audit already flags this phrase. | Low |
| 28487 | `티끌 같은 자` for `dustling` | Check whether this is a species/race term or a generic insult; retain a consistent form if lore-specific. | English uses a lowercase creature/address term; Korean renders it as “one like a speck of dust.” Japanese treats it as dust-born, and Chinese as “child of dust.” | Medium |
| 28495 | `애송이` for `dreg` | Recheck the insult's force and speaker register; the line frames the addressee as an inferior while urging the group to enter together. | English uses `dreg`; Korean's `애송이` means a novice/greenhorn, while Chinese uses “scum” and Japanese omits the address. The shared-team resolve is retained. | Medium |

## Historical Audit Reconciliation

- Historical notes for IDs 28434-28494 flag the reagent list, Glass,
  Order of the World, setting names, faction terms, and specifically the
  Walen/Daltan joke at 28438 and “stay our diggers” at 28485.
- Related historical entries flag Travelers as a possibly formal group and
  distinguish lore-specific creatures/terms from generic insults. These
  remain unresolved inputs, not approved terminology.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 28451-28500 once,
  in identical order.
- Runtime-token identities and order match. At ID 28460, English/Chinese/
  Korean have two embedded line breaks; Japanese has one. The Korean retains
  the marker, ability effect, four weapon categories, and no numeric values
  were changed.
- No unexpected Unicode format character or additional structural exception
  was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 28451-28500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 28501.
