# Preliminary Language Scan: `default` IDs 62501-62550

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 62501-62550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 62505 | Belmaid / Wencen | Confirm the canonical names and the sense of Belmaid being Wencen's equal with the sword. | Korean says their swordsmanship is equal, matching the English; Japanese leaves the final clause fragmentary. The active wording is plausible, but the character relationship and title remain context questions. | Medium |
| 62506 | `{1} Craft Core` / `핵심 부품 제작` | Verify whether `Craft Core` is a player-facing crafting label and whether “core” is an item/category name. | Korean preserves `{1}` and expresses a core component craft action; Chinese reads “manufacture core.” UI context is needed to settle the label. | Medium |
| 62508 | Orieator / moon analogy | Preserve the comparison and the speaker's acknowledgement that some may take offense; check the name form and intended social implication. | Korean retains both beats and the claim that the comparison is true. Japanese/Chinese also preserve the apologetic aside. | Medium |
| 62510 | Testament / `테스타먼트` | Resolve the English `Testament` versus Japanese/Chinese `Belen Covenant` source conflict in context. | Korean follows English and says the speaker saw the player face the Testament. The prior audit flags the faction-name mismatch; do not silently substitute the other locales. | High |
| 62512 | Forgiveness / `그 일은 용서하겠어` | Identify what “this” refers to and retain that the choice was difficult and burdensome. | Korean preserves the forgiveness and burden without inventing an antecedent. Japanese describes forgiving “that”; Chinese instead calls it an offense. | Medium |
| 62513 | “Yes. We.” / `그래. 우리 말이야.` | Preserve the hesitant self-correction and the decision to accompany the listener. | Korean retains the two short opening beats, the speaker's limited combat skill, and the dream-based direction. Japanese omits the explicit “Yes. We” restart. | Medium |
| 62515 | Oracles / `신탁자` | Confirm whether `Oracles` names a profession, office, or general class, and whether “divine” means interpret rather than predict. | Korean uses a singular generic title and “interpret”; Japanese also defines the role as revealing meaning, while Chinese leans toward prediction. The English line supports interpretation. | Medium |
| 62517 | Cydan / “within my house” | Verify Cydan's identity and whether lowercase `house` means the speaker's home or a formal House. | Korean says “my home” and preserves the no-lies threat. English uses lowercase, while Japanese/Chinese likewise convey the speaker's household; no faction reading is established. | Medium |
| 62519 | “outrageous wagers” / `터무니없이 큰 판돈` | Check whether the boon leads to unusually large stakes or otherwise reckless bets. | Korean preserves the causal link and high stakes. Japanese says the discovery gave the speaker an idea for a large wager; the exact scale remains idiomatic. | Medium |
| 62520 | Ohn poem / `흙 위에 세운 신상` | Review the theology and poetic wording, especially whether “earthen sod” means earth/ground rather than a statue erected on it. | Korean preserves the five-line layout and the bowed heads/prayer/nod sequence, but adds “statue” where English says worship on earthen ground. Japanese and Chinese also construe the phrase differently; avoid treating any locale's paraphrase as decisive. | High |
| 62524 | Sagrell / `이곳은 그대의 땅` | Determine whether “your grounds” means Sagrell's estate/domain or simply the land now under his control. | Korean uses “your land,” retaining the formal greeting. The specific property/authority sense needs setting context. | Medium |
| 62525 | Threat / pig and flames | Check the idiom and threat intensity while retaining both the skin-burning comparison and the repeated sensation of flame. | Korean preserves the threat and its two images. English's “every lick of the flames” is vivid idiom; Japanese and Chinese use comparable burning imagery. | Medium |
| 62528 | Telogrus / “ordinary man” | Identify the implied contrast behind the incredulous question. | Korean retains the question without adding an explanation; Japanese and Chinese align. The referent depends on surrounding dialogue. | Medium |
| 62532 | Chancellor / `재상` | Confirm the High King's formal office and preferred Korean title. | Korean uses the natural office term `재상` and preserves the polite introduction and welcome. Japanese says minister; Chinese uses a kinship/clan-chief term, so the title merits terminology review. | Medium |
| 62537 | Maid's spell / troll verse | Preserve the source's verse-like cadence and the Japanese-template prose layout; do not invent line breaks. | The English wording has four verse-like clauses, but the CSV contains no embedded newlines in English, Japanese, Chinese, or Korean. Korean follows the Japanese single-paragraph layout and retains the troll's belief and rampage. | Medium |
| 62542 | Oathblade / `서약검` | Determine whether `Oathblade` is a rank, person, weapon, or named order before settling a literal Korean form. | Korean translates the compound literally as “oath blade”; Japanese interprets it as a first-class mercenary rank. English alone does not resolve the referent. | High |
| 62544 | Prophecy / `종말을 알릴` | Clarify whether the mortal heralds, announces, or causes the passing of the speaker's kind. | Korean preserves a mortal tied to the species' passing. English `herald` can imply announcing or ushering in the event; Japanese and Chinese similarly describe a harbinger. | High |
| 62546 | Chaos Thrall XXI / `혼돈의 노예 21` | Check whether the Roman numeral is a canonical enemy tier/name or only a number-format choice. | Korean and Chinese use Arabic `21`, Japanese uses `21`, while English has `XXI`. The value is retained, but the source's Roman-numeral styling is not. | Medium |
| 62547 | “Take it from one who knows” / `잘 아는 사람이 하는 말이야` | Preserve the speaker's appeal to personal experience and the warning about exploitation. | Korean conveys informed advice, but the English idiom more directly asks the listener to trust someone with firsthand knowledge. A more explicit experience-based phrasing is a candidate for review, not an approved correction. | Medium |
| 62549 | Breid / Gwyn / blacksmith's bench | Verify name forms and retain the speaker's contentment with the smithy rather than trading places with either person. | Korean preserves the contrast and casual voice. The exact intended referent of “places” and the names' canonical Korean forms remain open. | Low |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the quest/lobby labels, Skoria Mine, Akara, Dareios, the prison
exchange, Oda's comrades, the drink refusal, House of Pride, Gravehal Keep,
Detyre mining, Geoff, the Monument label, combat barks, the city seal,
orders, the Niskaru account, Olaana, and the request to stay in town.
Proper-name spellings and bilingual parenthetical formatting remain
provisional; this pass does not impose a global display convention.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical row for IDs 62505-62549, including
  Belmaid/Wencen, `{1} Craft Core`, Orieator, the Testament/Belen Covenant
  mismatch, forgiveness, “Yes. We,” Oracles, Cydan, wagers, the Ohn poem,
  Sagrell's grounds, the threat, Telogrus, Chancellor, the troll verse,
  Oathblade, the prophecy, Chaos Thrall XXI, and Breid/Gwyn.
- The historical source note says the English at 62537 is four poetic lines.
  Direct inspection of all four CSVs shows zero embedded newlines in each;
  the wording is verse-like, but no CSV line-break exception is present.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 62501-62550 once
  and in identical ascending order.
- Embedded newline counts match for every row. ID 62520 has four embedded
  newlines in all four locales, preserving its five-line layout.
- Runtime-marker identities and order match. ID 62506 retains `{1}` in all
  four locales.
- `XXI` at 62546 is represented as `21` in Japanese, Chinese, and Korean;
  the numeric value is unchanged, while the numeral style differs from
  English.
- No translation CSV edit was made.

## Batch Status

IDs 62501-62550 received a separate working disposition in
[`disposition-batch-default-62501-62550-20261011.md`](disposition-batch-default-62501-62550-20261011.md).
That report records one accepted correction, 30 `not an issue` IDs, and
20 uncertain findings (one overlaps an accepted ID); it is not independent
final linguistic approval. Continue at `default` ID 62551.
