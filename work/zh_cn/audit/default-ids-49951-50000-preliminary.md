# Preliminary Language Scan: `default` IDs 49951-50000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 49951-50000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 49962 | Convict's Cavern / `죄수의 동굴` | Confirm the canonical place name and whether the English cave is the same location as the White Stone Prison mentioned by Japanese. | Korean follows the English name; Japanese says White Stone Prison, while Chinese says Convict's Cavern. Historical notes explicitly record the source conflict. | Medium |
| 49966 | “You don't smell rich. You smell scared.” / `돈 냄새는 안 나는군. 겁먹은 냄새가 나.` | Preserve the smell/wealth metaphor, the intimidation, and the condition that promises of wealth should be made only when the speaker has actual money. | Korean retains the parallel smell statements and coin-jingle condition. The final clause can read as promising that someone will become rich rather than promising wealth/payment. Historical notes flag this metaphor. | Medium |
| 49975 | Loresage / `로어세이지` | Confirm whether Loresage is a formal title, person, or group label and use its established Korean form. | Korean transliterates the compound; English capitalization suggests a name/title. Historical notes explicitly flag the term. | Medium |
| 49976 | Commissary / `물품 담당자` | Determine whether this label denotes a person responsible for supplies or a shop/store, then use the contextually correct Korean noun. | Korean identifies a supply officer/person, while Japanese and Chinese describe a shop. The isolated label does not resolve the role. | Medium |
| 49980 | The Champions / `챔피언들` | Confirm the canonical title of the ballad and preserve the warning to approach/undertake it cautiously. | Korean follows English; Japanese calls the ballad “Protectors,” and Chinese agrees with “Champions.” Historical notes record this title conflict. | Medium |
| 49984 | Lords of Valor / `용맹의 군주들` | Confirm whether this is a formal group/team name and standardize its Korean form. | Korean translates the title semantically; Japanese transliterates it and Chinese also translates it. | Medium |
| 49990 | Vraekor / `브레이코르`; “they” / `그들은` | Confirm Vraekor's canonical spelling and identify the group that frequents Vraekor-blessed places and rejects trespassers. | Korean preserves the belief and exclusion but the isolated row does not identify “they.” Historical notes flag both the name and referent. | Medium |
| 49993 | Garrison / `주둔지`; captain / `대장` | Confirm whether Garrison names a fort, its command, or the stationed unit; preserve the speaker's training responsibility and peacekeeping instruction. | Korean describes a garrison/base and its captain; Chinese says garrison fortress and captain. Historical notes flag the place/command distinction. | Medium |
| 49994 | “Then you're a bit short of that door. Good day.” / `그 문은 통과하지 못하겠군. 다음에 보세.` | Preserve the implied refusal of passage and the dismissive farewell without making “short” sound like physical distance or height. | Korean interprets the idiom as not being allowed through the door, supported by Japanese, which explicitly refuses entry. Chinese is more literal and ambiguous. Historical notes flag the idiom. | Medium |
| 49996 | Dwynian ballad; “a dozen sharpened spears” / `뾰족한 창 수십 개` | Correctly retain the exact count of twelve sharpened spears, while preserving the ballad's imagery and the surrounding age/army counts. | English says “a dozen”; Korean says `수십 개` (“dozens/tens”), which changes the amount. Japanese is vague and Chinese also says dozens, but English is the primary meaning source. This conflicts with the historical audit's summary that the numeric values were retained. | High |
| 49996 | Dwynian / Anathon / Ranu / Ailoc / Tywil; thresh / boggart / laenashe | Confirm canonical name and creature spellings, and preserve the 10-paragraph story's relationships, sequence, and folkloric register. | Korean retains the full narrative and all 18 source line breaks. Names and creature terms have varying forms across locales; historical notes explicitly list them for review. | Medium |
| 49997 | “Anokatos has done something” / `아노카토스가 무슨 짓을 했어` | Preserve the alarm without adding a stronger negative judgment than the source establishes. | Korean's `무슨 짓` can imply wrongdoing. The speaker's urgency supports concern, but English itself does not specify what Anokatos did. | Low |
| 49998 | head surgeon / `수석 외과의` | Confirm the established Korean professional title while retaining Corialia's role as Mel Senshir's lead surgeon. | Korean conveys the senior surgical role; Japanese uses a chief doctor and Chinese a chief/attending physician. | Medium |

Other names and recurring terms in this range, including Skald, Fateweaver,
Red Marches, Alard, Convict's Cavern, Tilera, Maura Chalin, Ordo, Hild
Earan, Loresage, Beckoned, Kurn, The Champions, Gorhart, Lords of Valor,
Fahrlang, Vraekor, Garrison, Sagrell, and Corialia Scathe, remain subject to
corpus-wide terminology and bilingual-name consistency review. Existing
Korean forms were preserved.

IDs 49951-49961, 49963-49965, 49967-49974, 49977-49979, 49981-49983,
49985-49989, 49991-49992, 49995, and 49999-50000 generally retain the
English meaning on this first reading. Names, idioms, UI labels, and lore
terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 49950-50049. This
  batch's relevant questions concern Convict's Cavern (49962), the
  smell/wealth metaphor (49966), Loresage (49975), The Champions (49980),
  Vraekor and the unspecified group (49990), Garrison (49993), and the
  Dwynian/Rathir ballad (49996).
- The historical audit says the ballad's 18 source line breaks and numeric
  values are retained. The line-break check is confirmed, as are the ages
  and guard counts; however, the Korean `수십 개` at ID 49996 does not
  preserve English `a dozen` (12). Treat that historical numeric summary as
  needing reconciliation, not as an approval.
- The same historical range covers IDs 50001 and above, which are outside
  this batch. ID 50000 is included once as the endpoint/boundary row.
  Historical questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 49951-50000 once
  and in identical ascending order.
- ID 49996 preserves the five-day, five-year, ten-year, and fifteen-year
  ages and the 100/1,000 guard counts; the “a dozen” quantity is the
  exception noted above.
- ID 49996 has 18 line breaks in all four locales, preserving its
  10-paragraph layout. No other line-break differences, runtime-token
  discrepancies, or hidden format/control characters were found.
- No translation CSV edit was made.

## Batch Status

IDs 49951-50000 received an initial preliminary reading and subsequent
working disposition in
[`disposition-batch-default-49951-50000-20261010.md`](disposition-batch-default-49951-50000-20261010.md).
The numeric summary for the sharpened spears was reconciled and corrected
from `수십 개` to `열두 자루`; ballad names and creature terminology remain
provisional. Continue at `default` ID 50001.
