# Preliminary Language Scan: `default` IDs 32351-32400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32351-32400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32351 | `운명의 태피스트리` / `페이트위버` | Standardize the fate-tapestry metaphor and Fateweaver title while preserving all three thread actions. | English, Japanese, and Chinese agree that threads are measured, woven, and cut according to a plan, which Fateweavers read. Korean retains all three actions and the metaphor; corpus forms vary between `운명의 태피스트리` and `운명의 직조`. | Medium |
| 32354 | `아스커의 영약(Asker's Draught)` for a famous family ale | Confirm whether this is the named ale/recipe rather than a potion, and standardize Asker's Draught. | English explicitly calls Asker's Draught the family's famous ale. Korean uses `영약`, which suggests a magical potion; active rows elsewhere use both `아스커의 영약` and `아스커의 약주`. Japanese transliterates the title and Chinese is garbled. | High |
| 32362 | `사이퍼(Cipher)` / `프리모스` / `초대받은 자` | Preserve the entity's claimed purpose and exact instructions; standardize artifact, title, and office names. | Korean follows the English sequence: artifact examined, supernatural contact, journey to Teeth of Naros, “Beckoned” address, Cipher name, and instruction to seek the Primos. Japanese paraphrases the address and uses transliterations; Chinese mistranslates both named terms. | High |
| 32365 | `성주` / `아말도르 스베리 쿠라` for `Castellan` / `Amaldor Sverri Kura` | Confirm whether Castellan is a formal territorial office and standardize the personal name and Klurikon spelling. | English says each territory has a Castellan and names Amaldor Sverri Kura as overseeing “our part” in the war. Korean preserves the hierarchy and role but renders the title generically as `성주`; Japanese and Chinese offer conflicting readings of the role/name. | Medium |
| 32367 | `내 여동생 가문` / `내 가문` for `my sister's house` / `mine` | Determine whether House refers to named Fae factions or family houses, and preserve the contrast with the speaker's own House. | English says mortals caused the collapse of the speaker's sister's house and Gadflow will prevent the speaker's. Korean reads both as family/clan (`가문`). Japanese explicitly names House of Pride for the speaker's group, while Chinese treats both as families; setting context is needed. | Medium |
| 32371 | “only five Bolgan” rusty-knife boast | Preserve the ironic understatement and check the intended subject/number in the quoted song. | English quotes a boast that there were only five Bolgan and the speaker had a rusty knife. Korean retains both facts and the dismissive punch line; Japanese similarly treats the line as a song. The exact humorous implication remains context-dependent. | Medium |
| 32373 | `장인의 자물쇠따개` for `Master's Pick` | Determine whether this is a named lockpick/tool or another artifact and keep the item name consistent with ID 32211. | English capitalizes the item name but gives no type. Korean again interprets `Pick` as a lockpick, as at ID 32211; Japanese preserves the English-like name and Chinese also reads it as a master lockpick. The Hierophant's prediction and returned object contrast are retained. | Medium |
| 32374 | Seven projectiles; `24` Ice Damage, `5` Freezing Damage each; `40` Mana | Preserve projectile count, per-projectile values, and the separate cost line. | All locales retain seven projectiles and the 24/5/40 values. Korean preserves the line break before Mana cost and makes the per-projectile damage relation explicit. | High |
| 32376 | `헥스야. 네가 졌어.` for `The hex. You lose.` | Identify whether Hex is a dice/game result, curse, or named outcome before standardizing. | English, Japanese, and Korean use Hex/`헥스`; Chinese reads it as “six points.” The historical log explicitly leaves open whether this is a dice result or curse. | Medium |
| 32381 | `죄수 교환회` / `보름달이 높이 뜰 때마다` | Clarify whether the “prisoner exchange” is a euphemistic labor/slave market and what calendar term “every high moon” denotes. | English directly calls it a prisoner exchange and describes a market for valuable labor. Korean retains that wording. “Every high moon” is rendered as each full moon when high; Japanese also gives a high-moon schedule, while Chinese says when the bright moon is high. | High |
| 32385 | `바람주머니` / `감시자` | Verify Bag of Winds and Watcher as formal game terms; preserve the puzzle's order and result. | All locales give the same instruction: take/use the item from a nearby guard, open it in the Watcher's room, and extinguish the torches. Korean retains the sequence and outcome; terminology remains provisional. | Medium |
| 32390 | `미타루 교단` for `the order of Mitharu` | Confirm whether this is a formal religious order and standardize “order” against the wider Mitharu terminology. | English names the order's holy symbol on a worn religious text. Korean preserves the symbol/text description but renders “order” as the broader `교단`; Japanese and Chinese likewise use a religious-institution term. | Medium |
| 32396 | `우리가 바로잡지 못한 잘못` / `백성의 미래는 네게 달렸어` | Preserve gratitude for wrongs already righted and the sense that the people owe their future to the addressee, rather than placing responsibility for that future on them. | English says “the wrongs you have righted” and “our people owe their futures to you.” Korean adds that these were wrongs “we could not right” and says the people's future “depends on you,” which can shift gratitude/debt into ongoing responsibility. Japanese and Chinese emphasize that the addressee secured the future. | High |
| 32399 | `미타루 교리` / `팰런 수사의 염주` / `글렌다라의 성소` | Preserve the custom, prayer at each shrine, and transformation into a formidable amulet; standardize Mitharu order/creed and Brother Fallon's name. | The four locales agree that professing adherence to Mitharu's creed results in receiving Fallon's prayer beads, which become a powerful amulet after prayers at Glendara shrines. Korean preserves the sequence; its forms should be checked against the official order name and corpus transliterations. | Medium |

Rows 32352-32353, 32355-32361, 32363-32364, 32366, 32368-32370,
32372, 32375, 32377-32380, 32382-32384, 32386-32389, 32391-32395,
32397-32398, and 32400 generally retain the English meaning on this first
reading. Names, lore terms, and dialogue voice remain candidates for the
integrated pass; no separate high-confidence wording correction was
identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32300-32399 flags Fateweavers,
  Cipher/Primos, Castellan and Houses, the five-Bolgan song, Master's Pick,
  Hex, the prisoner-exchange notice and high moon, Watcher/Bag of Winds,
  the Mitharu order, and prayer beads. These were checked against the four
  locale rows and active Korean occurrences.
- Asker's Draught has an additional active-corpus inconsistency: `영약`
  appears at IDs 32354 and 51764, while ID 59439 uses `약주`. Since the
  English calls it ale, this is recorded for later terminology review.
- ID 32396's gratitude/agency difference is a candidate meaning shift based
  on English and supported by the Japanese/Chinese readings; it is not an
  accepted correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32351-32400 once and in identical order.
- Embedded line-break counts match throughout the range, including one
  break between the damage description and cost at ID 32374, and one break
  between the invitation and schedule at ID 32381.
- Numeric values at ID 32374 are preserved exactly: seven projectiles,
  24 Ice Damage, 5 Freezing Damage, and 40 Mana.
- No runtime-marker identity/order discrepancy was detected in this batch.
- No CSV text or source file was edited.

## Batch Status

IDs 32351-32400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32401.
