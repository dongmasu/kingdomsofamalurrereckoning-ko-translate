# Preliminary Language Scan: `default` IDs 62001-62050

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 62001-62050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 62001 | Brother Egan / `이건 이건(Egan) 수사님` | Check for a duplicated/misparsed name and verify Egan's Korean name form. | The English asks whether the addressee is Brother Egan. Korean's initial `이건` can read as “this is,” followed by the transliterated name `이건(Egan)`, making the question awkward and apparently duplicative. Japanese/Chinese both identify Egan as the addressee. | High |
| 62003 | Bear Witness / `증언` | Determine whether this is an imperative, a quest/event title, or a UI label; retain the intended “bear witness” action if imperative. | Korean uses the noun “testimony.” Japanese treats it as a poetic imperative/title, while Chinese says “testify.” Context is needed to decide the UI function. | Medium |
| 62005 | “I am in debt to you” / `진 빚은 갚지 못할 거요` | Preserve the speaker's lasting gratitude/obligation for as long as the ballad is sung; check whether “cannot repay” overstates the source. | Korean explicitly says the debt cannot be repaid while the ballad remains sung. Japanese supports owing a debt; Chinese diverges toward doubt, as recorded in the historical audit. | Medium |
| 62011 | Scourge Resistance / `역병 저항 [사용 금지]` | Keep the `[DO NOT USE]` warning and verify whether `Scourge` is a formal status/category rather than generic plague. | Korean retains the prohibition clearly but renders Scourge as plague. English/Japanese/Chinese differ on the sense of the label, and the historical audit leaves the formal term open. | Medium |
| 62013 | Circle of Engard / Champion of Valor | Verify the group/title names and preserve that Engard, a Fae, is the Champion meant, not the mortal pretender. | Korean retains the distinction and the speaker's leadership. The proper name and whether Circle/Champion are formal institutional titles remain terminology questions. | Medium |
| 62015 | Sparrows / `참새들(Sparrows)` | Determine whether Sparrows is a formal faction/group name or literal birds; preserve the question's stance toward them. | Korean preserves the source spelling in parentheses but translates the name literally. The capitalization and historical log leave group status unresolved. | Medium |
| 62017 | Hospitalis Quarters note / Reddle Mane | Preserve the two-line note and attribution while confirming the facility name and the monitor/watcher wording. | Korean retains the office location, instruction to come if the addressee wants to identify the watcher, blank-line separator, dash, and signature. Historical terminology questions remain open. | Medium |
| 62018 | Urchin and being taken in | Preserve that the speaker was taken in after trying to pick one of their pockets, while treating the malformed English punctuation as a source defect. | Korean supplies a coherent sentence break and retains the attempted theft, acceptance into the group, and lessons learned. The English has a missing separator before “They taught me”; no Korean omission is apparent. | Medium |
| 62031 | Hex / `헥스(Hex)의 성미` | Determine whether Hex is a named person/witch or a generic hex/curse; retain the food's fiery quality and playful sales copy. | Korean treats Hex as a name with a temper, while Chinese uses a generic witch/curse reading and Japanese leaves the name transliterated. The source-keyed question remains open. | Medium |
| 62038 | Four-line combat effect | Preserve all thresholds, percentages, duration, cooldown, bullet markers, and line breaks. | Korean retains 50% trigger chance below 25% Health, 20% Health restored, +50% damage for 10 seconds, and 300-second cooldown. `{LINE_BULLET}` identity/order match. | High |
| 62039 | Niskaru trail / malformed “brought ... the roadway” | Preserve that Ost leads the group along the route/trail associated with the Niskaru reaching the roadway in Lorca-Rane; clarify the malformed source relation. | Korean says the group follows traces left by the Niskaru up to the road, a plausible reading, but the English syntax is compressed and does not clearly say whether the trail led the Niskaru to the road or is the route now followed. | Medium |
| 62041 | Trigger Kobolds / `코볼트 발동` | Determine whether this is a technical/debug identifier or a player-facing label and whether Trigger should remain a modifier rather than a verb. | Korean keeps Kobolds and Trigger's activation sense but reads awkwardly as “kobold activation.” English/Japanese retain the technical compound; Chinese translates it. | Medium |
| 62042 | military `brass` / `윗선` | Preserve the speaker's satisfaction at leaving the fortress and impatience for senior command to deploy the troops against the Tuatha. | Korean renders brass generically as “higher-ups,” matching the military sense in Japanese/Chinese without identifying a specific rank. | Medium |
| 62045 | `{1} Inventory Limit: {2} / {3}` | Preserve placeholder identity/order and verify exact in-game spacing/layout. | Korean keeps `{1}`, `{2}`, `{3}` in order with the numeric separator; Japanese/Chinese differ slightly in spaces, so display layout remains a runtime check. | High |
| 62046 | Tirnoch inference / `뭔가 특별한 점` | Preserve the inference that the defeated High King and acquired power suggest there is something significant about Tirnoch, the victor's god. | Korean retains the cause and cautious inference without making a stronger claim about Tirnoch's nature. Locale wording varies, and the source-keyed question remains open. | Medium |

Other reviewed rows generally preserve first-read meaning and voice/register,
including Winter Kingdom, Crownhold, Carasta, Culn, Emaire, The Best
Defense, the father/Etair account, getting caught, Southern Passage, mine
payment, Cyrus Erlin, threat, thanks, shady dealings, the trap plan, Dead
Kel, stipend and troop orders, cloth, altar, Saltwell notes, Mel Senshir,
Tirnoch's prison, Loch Diden, the title fragment, the Niskaru attack,
siblings, siege title, Afan, +3 Fate, Gwyn Anwy, reputation stakes, and
the offer to help. Proper names and terms remain provisional, including
Egan, Fae, Winter Kingdom, Bear Witness, Mitharan, Crownhold, Scourge,
Circle of Engard, Champion of Valor, Apotyre, Etair, Sparrows, Hospitalis
Quarters, Reddle Mane, Southern Passage, Culn, Cyrus Erlin, Alfar, Hex,
Saltwell, Mel Senshir, Tirnoch, Tuatha, Loch Diden, Lorca-Rane, Niskaru,
Trigger Kobolds, Gwyn Anwy, and Fate. Existing Korean bilingual-name
formatting is retained; this pass does not impose a global
parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked source-keyed prompts for Bear Witness (62003), the ballad debt
  (62005), Scourge Resistance and its warning (62011), Circle of Engard/
  Champion of Valor (62013), Sparrows (62015), the malformed urchin
  sentence (62018), profiteering (62024), Hex (62031), combat markers
  (62038), the Niskaru trail (62039), Trigger Kobolds (62041), military
  `brass` (62042), inventory placeholders (62045), and the Tirnoch
  inference (62046).
- Preserved the historical open questions as unresolved; no prior note was
  treated as approval.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 62001-62050 once
  and in identical ascending order.
- Embedded newline counts match, including the attribution separator at
  ID 62017 and all four effect lines at ID 62038.
- Runtime-marker identities/order match. `{LINE_BULLET}` appears four
  times and in the same order at ID 62038; `{1}`, `{2}`, `{3}` are retained
  in order at ID 62045.
- The +3 Fate weapon value at ID 62047 is retained.
- No translation CSV edit was made.

## Batch Status

IDs 62001-62050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 62051.
