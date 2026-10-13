# Preliminary Language Scan: `default` IDs 32251-32300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32251-32300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32251 | `보석 장착 불가 아이템` for `Unsocketable Items` | Determine whether this label means items that cannot accept gems or items from which a socketed gem cannot be removed. | English is a standalone equipment/UI label. Korean specifies gem installation; Japanese says impossible to equip, and Chinese says impossible to socket. The gameplay distinction remains unresolved. | Medium |
| 32252 | `발라드 가문` for `the House of Ballads` | Standardize House of Ballads as a named faction and keep its established display convention. | English and Chinese identify the named House; Japanese uses a transliteration. Active Korean varies among `발라드 가문`, `하우스 오브 발라드`, and `발라드의 집`. | High |
| 32256 | Six-line Great Cycle and Arcane Veil history | Preserve all six source lines and the causal/lore sequence; clarify `Lord Ohn culled his strength` and the referent of `its destruction`. | English, Japanese, Chinese, and Korean retain six lines. Korean interprets the destruction as the end of King Ysa's reign and renders Ohn as having “withdrawn” his strength. Historical notes flag this clause because the supporting locales disagree on whether Ohn gained, culled, or reduced his strength. | High |
| 32259 | `온의 진지로 가는 열쇠` for `The Key to Ohn's Stand` | Confirm whether Ohn's Stand is a place/fortress or a “stand/resistance,” and standardize its name. | Japanese retains Ohn's Stand; Chinese reads it as Ohn's resistance. Korean follows the fortress interpretation, consistent with the nearby ID 32100 Japanese reading, but the English title alone does not resolve the sense. | Medium |
| 32265 | Two-paragraph Night of Fire and Blood history | Preserve both paragraphs and the historical sequence; review the compressed English syntax and the viewpoint of the fires visible across the water. | All four locales preserve the two-paragraph structure, the fall of Mel Senshir, fires seen from Rathir, the Tuatha advance at dawn, and nearly three years of defeat. Korean is coherent and follows the Japanese/Chinese reading of the Rathir-height image; the English sentence is compressed and should remain open to context. | Medium |
| 32269 | `프라이데리를 지나가` for `head left through the Pryderi` | Identify Pryderi as a place, district, or business and confirm the route instruction. | English uses the capitalized name with a definite article but gives no type. Japanese calls it the Pryderi merchant association; Chinese and Korean leave it as a transliterated name. Korean retains the direction and name, but “pass through” may be underspecified. | Medium |
| 32276 | `Global Associate Product Manager` retained in English | Determine whether this is a development credit/test string or player-facing title before localizing. | English and Japanese leave the job title in English; Chinese translates it. Korean also leaves it unchanged. The historical log flags the product-title status as unresolved. | Medium |
| 32277 | `왼쪽 메뉴` for `LMENU` | Confirm whether this is an internal control identifier or a visible left-menu instruction. | English uses the compact all-caps identifier; Japanese expands it as “MENU (left),” and Chinese as “left menu key.” Korean localizes the meaning. The source does not establish whether the literal identifier should be retained. | Medium |
| 32282 | Localized `{*1[지속 효과]}` Faeblades passive | Preserve the passive marker and standardize Faeblades as the Summer Court Fae's primary weapon. | All locales identify the Faeblades as the Summer Court Fae's chief weapon and preserve the passive-label wrapper. Korean expresses mastery and the faction relation; established item/weapon naming remains open. | High |
| 32283 | `신을 만나러 갔다` / `저승에 보내다` for `sent to his maker` | Preserve the rumor and the speaker's regret while clarifying the euphemistic implication of killing Castor. | English's idiom suggests death but does not spell out the cause. Japanese and Chinese likewise say he was sent to God/the gods. Korean preserves the rumor and uses `저승에 보내다` for the speaker's wish to have killed him personally. | Medium |
| 32285 | `북해의 선장들은 ... 아주 적은 양을 쓰지` | Identify what `it` refers to and preserve why captains use it in small doses. | English refers to an antecedent outside this isolated row. Japanese/Chinese describe captains taking a small amount to stay awake at the helm; Korean says they “use” a small amount and retains the sleepless watch and floating-ice danger. The substance and exact use remain context-dependent. | Medium |
| 32287 | `펠레윈은 마음의 현을 울리고` / `새벽의 미다라 안개` | Standardize Pellewyn and Mydara's Mists at Dawn and preserve the paired artistic metaphors. | English and Japanese use “heart's strings” and “takes my breath away”; Korean renders the first as heartstrings and the second as breathlessness. The imagery is retained; proper-name forms need glossary comparison. | Medium |
| 32294 | `고대 바라니어 문서` for `Ancient Varani Text` | Confirm whether this is a text written in Ancient Varani or a named document/title. | English is a capitalized standalone label. Korean specifies a document in the ancient Varani language; the historical log flags it as a named text. The row alone does not distinguish title from descriptive label. | Medium |
| 32295 | `혈의 의식` / `레드 리전 도적단` for `Blood Rite` / `Red Legion bandits` | Standardize the named rite and faction while preserving that helping Delf severs his ties to the bandits. | The locales agree on Brother Delf, the Blood Rite, and his separation from the Red Legion. Active Korean uses both `피의 의식` and `혈의 의식`; this row's relation and completed-action meaning are retained. | Medium |
| 32297 | `문다운 캠프` for `Camp Moondown` | Standardize the place name without conflating it with Moon Camp. | English explicitly says Camp Moondown. Korean uses `문다운 캠프`, and active rows include both `문다운 캠프` and `문다운 캠프(Camp Moondown)`. Keep it distinct from the different Moon Camp name. | Medium |
| 32300 | `문 캠프` for `Moon Camp` | Standardize Moon Camp separately from Camp Moondown and from the Korean `달 야영지` variants. | English, Japanese, and Chinese identify the Travelers' Moon Camp. Active Korean uses `문 캠프`, `달 야영지`, `달의 야영지`, and `달빛 야영지` for Moon Camp. This row's dice-cheating anecdote otherwise retains the source meaning. | High |

Rows 32253-32255, 32257-32258, 32260-32264, 32266-32268,
32271-32275, 32278-32281, 32284, 32286, 32288-32293, 32296, and
32298-32299 generally retain the English meaning on this first reading.
Lore names, equipment terms, and source-context questions remain candidates
for the integrated pass; no separate high-confidence wording correction was
identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32200-32299 flags unsocketable
  items, House of Ballads, the Great Cycle/Arcane Veil poem, Ohn, Pryderi,
  the product credit and `LMENU`, Faeblades, “sent him to his maker,”
  north-sea captains, Ancient Varani Text, Blood Rite, and Camp Moondown.
  These issues were checked against all four locale rows and active Korean
  occurrences.
- The active Korean corpus uses multiple forms for House of Ballads,
  Moon Camp, Blood Rite, and Ohn's Stand. Camp Moondown and Moon Camp are
  separate source names and should not be normalized to the same Korean
  rendering.
- The ambiguity in `Lord Ohn culled his strength` remains open; the Korean
  follows one plausible reading without treating it as confirmed lore.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32251-32300 once and in identical order.
- Embedded line-break counts match throughout the range, including five
  breaks in the six-line poem at ID 32256, two breaks in the two-paragraph
  entry at ID 32265, and one break between the stat lines at ID 32270.
- The `{*1...}` passive wrapper and localized payload at ID 32282 are
  structurally preserved. No runtime-token identity/order discrepancy was
  detected.
- Numeric values `24-42` and `14` at ID 32270 are preserved.
- No CSV text or source file was edited.

## Batch Status

IDs 32251-32300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32301.
