# Preliminary Language Scan: `default` IDs 63501-63550

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 63501-63550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 63503 | Preordained / Chaos Essence collection ban | Preserve that the group outlawed all collection of Chaos Essence during the occupation to prevent market cornering. | Korean conveys the blanket ban and motive. Confirm whether `collection` is an in-world gathering activity and use the canonical faction form. | Medium |
| 63507 | narrator's missing role / player as substitute | Clarify that the player must perform the final scene in place of the absent female narrator, with the speaker. | Korean says the player must act instead of the speaker (`내가 아니라 네가`), whereas English says “with me in her stead.” The original role relationships should be checked against the scene before disposition. | High |
| 63508 | Paragon Barghest / Anker Edmure / Shardfall | Preserve the quest sequence: kill the creature, take its heart, and let Anker craft a cold-protection amulet. | Korean retains the crafting purpose and proper names; name forms remain cross-row candidates. | Medium |
| 63509 | two signed forms | Preserve that both required documents must be signed, not just one. | Korean follows English/Japanese. The source's “both signed” is elliptical; the surrounding transaction is unknown. | Medium |
| 63512 | morality poem | Preserve the address to the stranger, death/corpse imagery, the vultures/mortals comparison, the self-justifying lie, moral decay, and final list of evils. | Korean keeps the stanza's sequence and lineation but does not reproduce English rhyme and shifts some clauses. Japanese substantially adapts the poem; compare imagery and voice in a dedicated poetic review. | High |
| 63513 | visitor gifts / reward | Preserve that every visitor receives one item and the speaker accepts whatever reward others deem worthy. | Korean retains the contrast. Verify what “these” are and whether “everyone will get one” means one item each. | Medium |
| 63517 | Hyperian / city on high | Confirm whether Hyperian is a vessel, entity, or structure and preserve its intended ascent with the speaker's power. | Korean follows English's rise/carry image; proper referent is unresolved. | High |
| 63518 | `order` / `단체` | Determine whether this is a religious/military order, university, or other institution. | English says a respected `order`; Japanese says university and Chinese says academy. Korean deliberately stays generic as “organization,” preserving the unresolved source conflict. | High |
| 63519 | Gnarsh / prismere-corrupted trolls | Preserve the matriarch's unification of clans as the first step toward Dalentarth's demise. | Korean retains the causal sequence and female matriarch reference. `Prismere` and `Gnarsh` forms remain candidates. | Medium |
| 63522 | profile variable `$(0)` | Preserve the variable exactly inside the sign-in instruction. | All four locales retain `$(0)` once and in the same position. English and Korean both use escaped quote characters around it; no variable corruption was found. | High |
| 63525 | “nobler looter” / `고결한 약탈자` | Preserve the ironic contrast in the scholar's expectation that a more noble looter may arrive. | Korean renders the oxymoron directly; confirm whether the speaker is sarcastic or genuinely distinguishing looters. | Medium |
| 63528 | Tala-Rane/Ayten/Aster journal | Preserve the worsening ruin, dwindling treasure, rest in Ayten, missing Aster inheritance, and final threat to abandon the place. | Korean retains the diary's first-person account and sequence. English repeats `more more`; Korean normalizes the duplication without changing the apparent meaning. | Medium |
| 63535 | `Let's not draw this out` / `질질 끌지 말자` | Resolve the source disagreement and the intended meaning of “draw.” | Korean follows English's “do not prolong this,” while Japanese says there will be no draw/tie. The match context is needed; retain both readings as an open conflict. | High |
| 63538 | The Unbound / `결박을 벗어난 자들` | Keep the project's established group form and preserve the speaker's changed opinion and hope not to disappoint them. | Korean uses the existing project rendering and follows English/Japanese; Chinese uses a different, more generic “free people” form. | Medium |
| 63543 | Archsage / Dark Empyrean | Preserve the contemptuous comparison that the Archsage would have been a mere servant in the Dark Empyrean. | Korean retains the insult. The Dark Empyrean's proper-name status and Korean canonical form need glossary consistency. | Medium |
| 63544 | `Unlock the Cache` / `보관함 잠금 해제` | Confirm the exact UI action and whether `Cache` is a named container. | Korean is a concise literal label; Japanese specifies unlocking storage, while Chinese uses a cache/storage-point term. | Medium |
| 63545 | Battle Frenzy / 6th consecutive kill / 17 seconds / 30% Mana | Preserve the sixth consecutive kill threshold, +100% Total Damage, 17-second duration reset per kill, and sustained cost. | Korean keeps all values and the reset rule. Japanese explicitly says the 30% is of maximum Mana; English/Korean do not specify maximum versus current Mana. | High |
| 63547 | “Are there still spies about?” | Preserve this as a question about whether spies remain nearby, not whether the addressee still suspects spying. | Korean asks whether spies remain. Japanese likewise asks whether the speaker still thinks they are present; context may distinguish these readings. | Medium |
| 63549 | Tester Barclay / `테스터 바클레이` | Determine whether `Tester` is a role label or part of the person's name. | English capitalizes it in a delivery objective; Korean preserves it as a title/name component. Japanese instead gives `Kester Barclay`, and Chinese renders “tester” as a role. | High |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the farewell, inn task completion, Forge Result Preview, Last
Gastyr, the signed-document exchange, Hugues, the Mana curse, Spanish and
Netherlands Antilles labels, August, Cydan, Forsaken Plain, Khleran/Sagrell,
King Reynor, Uduath, and the no-shield UI state. Findings remain provisional.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical row for IDs 63450-63549, including
  the Preordained ban, Last Gastyr, the morality poem, Hyperian, `order`
  versus university, nobler looter, Tala-Rane journal, “draw this out,”
  The Unbound, Dark Empyrean, cache, Battle Frenzy cost, spies, and Tester
  Barclay.
- The historical note spans IDs 63450-63549; entries outside this batch
  were not counted as reviewed here.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 63501-63550 once
  and in identical ascending order.
- Embedded newline counts match for every row, including the poem at 63512,
  Tala-Rane journal at 63528, and Battle Frenzy effect at 63545.
- Runtime-variable `$(0)` at 63522 is present once in all locales and
  remains in the sign-in instruction.
- Numeric values in Battle Frenzy remain `6`, `+100%`, `17` seconds, and
  `30%`; the maximum/current Mana basis remains unresolved.
- No translation CSV edit was made.

## Batch Status

IDs 63501-63550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 63551.
