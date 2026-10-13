# Preliminary Language Scan: `default` IDs 55201-55250

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 55201-55250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and poem formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 55201 | `카도로크` / `시오란 지하묘지` / `익사한 숲` | Verify the spelling and separation of Cadoroc, Sioran Crypt, and Drowned Forest. | Korean preserves the person and both named locations; English/Japanese/Chinese use differing phonetic forms. | Medium |
| 55202 | `언어학 ... 언어와 관련된 연구` | Preserve the inference that Nerenne's experiment is likely verbal/linguistic, while keeping it explicitly tentative. | Korean follows the English “safe to say” inference; Japanese and Chinese also hedge. | Low |
| 55206 | `할머니의 개인 소지품` for `his mother's personal possessions` | Confirm that the referent is the narrator's grandmother (the father's mother), not the narrator's mother. | English ties “his” to the narrator's father; Korean `할머니` makes that family relation explicit. Chinese does the same. | Medium |
| 55208 | Winter heroes poem | Preserve the nine-line verse, stanza break, named heroes, and the sequence from Tuatha dominance to Gadflow/Tirnoch and the Prismere spires. | Korean retains the two-stanza structure and narrative sequence; proper-name spellings remain provisional. | High |
| 55209 | spring / Lyria's blessings | Preserve the analogy that blessings flow as the spring does, widely and without preference. | Korean conveys broad, impartial distribution; Chinese makes the all-people destination explicit. | Medium |
| 55215 | `내 가문을 더럽힐지도` for `taint my house` | Confirm whether “my house” means a family/household, faction, or physical home, and preserve the speaker's reluctant rationale. | Korean reads it as the speaker's family/house, while the English contrasts the house being tainted with mortals being driven away. Japanese says clan and Chinese reads the speaker's home. | High |
| 55216 | `일병 에일리스 일버` for `Private Eilis Ilver` | Confirm the project's military-rank localization and standardize Eilis Ilver's spelling. | Korean uses the equivalent rank `일병`; the Japanese phonetic rendering differs from the English name. | Medium |
| 55222 | `발로르(Balor)의 오른팔` | Determine whether this is a literal body part, an item/title, or a named object label. | English capitalization permits a label/name reading; Korean preserves the literal right-arm phrase. Historical notes flag the label. | Medium |
| 55223 | `힘 계열 능력으로` for the fragment `to Might Abilities` | Preserve the fragmentary UI/category wording and confirm the established `Might Abilities` term. | The English is an incomplete lower-case fragment; Korean interprets it as “to/under Might-category abilities.” Japanese and Chinese also render it as a UI fragment. | Medium |
| 55228 | `사이온(Scion)` | Keep the title sense of Scion distinct from generic descendants and apply established terminology. | English uses the in-world title; Korean retains the English parenthetical name. The historical term inventory flags Scion consistency. | Medium |
| 55229 | `3` card result / `판돈` | Preserve the revealed three, successful guess, and subsequent betting prompt. | Korean includes the three and both game actions. English spells out “three”; the other locales use their normal numeric/card rendering. | Medium |
| 55230 | `예정된 자들(Preordained)` | Confirm whether Preordained is a named faction and align it with established capitalization/translation. | Korean treats it as a named group; Japanese/Chinese also render a plural faction-like term. | Medium |
| 55232 | `$(0)` account prompt and surrounding quotes | Confirm the display quoting and CSV escaping around the runtime substitution. | The `$(0)` token is present, but the Korean CSV stores backslash-quote sequences (`\\\"`) around it; the CSV parser exposes the backslashes as text, unlike the English doubled-quote encoding and the Japanese/Chinese quotation forms. Do not normalize until the runtime/parser expectation is established. | High |
| 55234 | `스패로우(Sparrow)들의 오랜 적` for `an old enemy of theirs` | Resolve the antecedent of `theirs` and verify whether Sparrow is the intended group. | The English row does not name the antecedent; Korean supplies Sparrow, while the Japanese source uses a derogatory “sparrows” label. | High |
| 55235 | `회복을 직접 책임져야 하는 시간` | Preserve the urgent causal relation: delay increases direct responsibility for the creature's recovery. | Korean retains the longer-delay/greater-responsibility relation; Chinese makes the same relation explicit. | Medium |
| 55237 | `트루스워른(Truesworn) 계급` and Warsworn history | Verify Truesworn as an honored rank and preserve the causal sequence of Besin's threat, revived calling, and renewed Niskaru hunt. | Korean retains the main events and states the rank was earned; historical notes flag the terminology and narrative wording. | Medium |
| 55239 | `아카라-토르의 고대 전당을 내려가고` | Confirm whether the character is descending through the halls or will arrive there; preserve the temple's dedication. | English says he will be descending the ancient halls; Korean follows that motion and the honor to the island god. Chinese instead can read as arrival at the halls. | Medium |
| 55242 | `맹세를 저버린 자(Forsworn)` | Determine whether `Forsworn` is a formal faction/name or a descriptive label. | English capitalizes it as a standalone label; Korean translates the sense and retains the English name. | Medium |
| 55245-55246 | `Guardian` / `Foragers` | Reconcile the identity of these labels with their contradictory cross-locale renderings before fixing terminology. | Korean translates Guardian as `수호자` and Foragers as `채집꾼`; Chinese reads “guardians” and “looters,” while Japanese gives `Guardian` and a search-party sense for Foragers. Historical notes explicitly flag both. | High |
| 55250 | `피로를 부르는 마법` for `A Wearying Magic` | Confirm the title's intended nuance: tiring/exhausting magic versus magic that causes weariness. | Korean uses a causal phrase; this ID begins historical range 55250-55349. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Cadoroc, Sioran Crypt, Drowned
Forest, Scholar Nerenne, Rithen, Octienne, Bhaile, Pietra, Hoolgan, Tuatha,
Gadflow, Tirnoch, Prismere, Lyria, Scholia Arcana, Klurikon, Eilis Ilver,
Balor, Scion, Preordained, Aloff, Sons of Laz, Dunn, Quays, Warsworn,
Truesworn, Akara-Tor, Forsworn, Unfer, Guardian, Foragers, and Nyralim.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `55150-55249` and
  `55250-55349`. Relevant prompts include Cadoroc/Sioran Crypt/Drowned
  Forest (55201), the father's mother (55206), the Winter Heroes poem
  (55208), Lyria's spring metaphor (55209), the house/Gadflow contrast
  (55215), Eilis Ilver's rank (55216), Balor Right Arm (55222), the
  `to Might Abilities` fragment (55223), Scion (55228), Preordained
  (55230), `$(0)` (55232), `their` (55234), recovery responsibility
  (55235), Truesworn and its quest summary (55237), Akara-Tor's halls
  (55239), Forsworn (55242), Guardian/Foragers (55245-55246), and the title
  A Wearying Magic (55250).
- ID 55250 is the opening boundary of historical range 55250-55349 and is
  included here once. It will not be repeated in the next active batch.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 55201-55250 once
  and in identical ascending order.
- Physical line-break counts match across all four locales; the Winter
  Heroes poem retains its stanza separator.
- `{1}` at 55184 is outside this batch; `$(0)` at 55232 is present in all
  locales. Korean's surrounding escaped quotes are recorded as a formatting
  candidate. `+6%` at 55214 and the card value three at 55229 are preserved.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 55201-55250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 55251.

## Disposition Cross-Reference

The working disposition pass is recorded in
[`disposition-batch-default-55201-55250-20261010.md`](disposition-batch-default-55201-55250-20261010.md):
15 IDs remain uncertain, 35 are `not an issue`, and no CSV correction was
accepted. The `$(0)` quote/backslash question remains deferred pending
runtime/parser evidence. This is not independent final approval.
