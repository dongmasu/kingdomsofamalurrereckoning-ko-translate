# Preliminary Language Scan: `default` IDs 40651-40700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 40651-40700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 40652 | `Mysterious Case` / `기묘한 사건` | Determine whether `case` means an incident/mystery or a physical case/container. | Korean chooses “mysterious incident”; Chinese says mysterious box and Japanese retains a case-like loanword. The isolated title lacks context. | Medium |
| 40658 | Ethene / rebirth / goddess of wisdom | Confirm Ethene's canonical Korean form and retain the link between the character's rebirth and the goddess's favor. | Korean preserves the star, rebirth day, and inferred favor. Japanese omits the explicit rebirth wording, while Chinese agrees with English; the name is not standardized by this row alone. | Medium |
| 40659 | Lykeios / Kollossae | Confirm whether Lykeios is a place, object, or cultural symbol and standardize Kollossae. | Korean calls Lykeios a place and says it displays the essence of Kollossae culture/belief. English says it epitomizes that core without naming its category; Japanese/Chinese use differing name forms. | Medium |
| 40660 | `Champion` / `투사` | Confirm the established Korean title for this arena/faction role. | Korean translates it as fighter/champion. English capitalizes the address; terminology should align with House/arena title usage elsewhere. | Medium |
| 40661 | `Knave of Coins` / `동전의 잭` | Confirm the card/title convention for `Knave` and whether `잭` is the established rendering. | Korean uses a literal coin-plus-Jack form; Japanese calls the title “Master of Coins,” and Chinese renders a rogue/knave. The name/title category is unresolved. | High |
| 40664 | Longsword damage values | Preserve the separate +5 flat physical-damage and +10% damage modifiers. | All four locales retain both lines and values; Korean distinguishes the flat and percentage effects. | High |
| 40666 | Eyes of Tirnoch / two giant mirrors | Preserve the plural object, two-mirror appearance, and the causal claim that breaking them stops the Tuatha pursuit. | Korean retains all three pieces of information and the two count; lore-name consistency remains open. | Medium |
| 40667 | `SpellAmmoVeryFast` / `주문 탄약(초고속)` | Confirm whether this concatenated string is an internal/test label or a visible localized speed label. | English/Japanese concatenate the label, while Chinese/Korean localize it as a spell-ammunition speed. Historical notes describe its UI-like meaning but do not establish runtime visibility. | Medium |
| 40674 | `tell enough futures` / `미래를 너무 많이 점치다` | Preserve the divination meaning and the pointed warning that predicting futures leaves the speaker friendless. | Korean uses a natural fortune-telling idiom; Japanese and Chinese also read this as prophecy/divination. It follows the English meaning on this pass. | Low |
| 40677 | Cathrus / Widow / guardian spiders | Standardize names and retain that the spiders were summoned to block the speaker's path. | Korean preserves the pursuit, forced confrontation, and summoned guardians. Japanese shortens the summoning detail; Chinese calls them spider guardians. | Medium |
| 40689 | Caelrod / Alarane / Winter Realm / House | Verify the names and the exact relation between the ancient Fae, Winter Realm, and the House. | Korean retains that they predate the House itself. English's `the House` is context-dependent; Japanese identifies House of Sorrows, while Chinese says family history. | Medium |
| 40692 | `Telogrus is gone` / `텔로그루스가 사라졌다` | Determine whether “gone” means dead, absent, or otherwise lost in context. | Korean retains the ambiguity as disappearance. Japanese explicitly says dead; Chinese also asks whether Telogrus is gone. | Medium |
| 40697 | `House of Sorrows` / `비탄의 가문` | Align the faction/place name with established House of Sorrows terminology and capitalization conventions. | Korean translates the name, Japanese transliterates it, and Chinese also translates it as a sorrowful family. | Medium |
| 40698 | `Promise things she'll never give` / `결코 지켜주지 않을 약속` | Check whether the intended accusation is that she makes promises she will not fulfill, or promises to give things she will never provide. | Korean reads the promise as one she will not keep; English emphasizes things she will never give. The distinction may be rhetorical rather than material. | Medium |
| 40700 | `Bear (5 Fish)` / `곰 (물고기 5마리)` | Confirm whether this is a quest/task label, creature name, or literal feeding requirement; preserve the quantity. | Korean retains the bear and five fish, but the isolated label does not reveal whether it is an instruction or entity label. | Medium |

IDs 40651, 40653-40657, 40662-40663, 40665, 40668-40673, 40675-40676,
40678-40688, 40690-40691, 40693-40696, and 40699 generally retain the
English meaning on this first reading. Proper names, established terms,
register, and plot references remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical log contains a source-checked entry for IDs
  40650-40749. Its overlapping questions at 40658-40662, 40664-40667,
  40674-40675, 40677, 40681, 40689-40690, 40692, and 40695-40698 were
  checked against the four active locale rows.
- The log flags Ethene, Lykeios, Kollossae, Knave of Coins, Hierophant,
  future-telling, Longsword values, Eyes of Tirnoch, `SpellAmmoVeryFast`,
  Cathrus/Widow/guardian spiders, Caelrod/Alarane, Winter Realm, and House
  of Sorrows. These remain open candidates; no global terminology change is
  authorized.
- The official Korean manual could not be text-searched in this environment;
  no new manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 40651-40700 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match across all four locales. ID 40664 preserves both combat values.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 40651-40700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 40701.
