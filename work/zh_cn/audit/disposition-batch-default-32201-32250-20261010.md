# Disposition Batch: `default` IDs 32201-32250

- Decision date: 2026-10-10.
- Scope: all 50 rows and preliminary findings for IDs 32201-32250, compared
  across English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring terminology,
  line breaks, and runtime tokens.
- Decisions: five accepted, three `not an issue`, and eleven uncertain.
- CSV changes: IDs 32203, 32212, 32237, 32240, and 32245.

## Findings

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 32203 | `Hospitalis Quarters` / `호스피탈리스 병영`; `when ... clean up their act` / `언제나 철들지` | Accepted: change to `호스피탈리스 구역에서 또 싸움이야? 저 장다리들이 언제 철들지 누가 알겠어.` `병영` adds an unsupported military barracks reading, and `언제나` changes “when” to “always.” The neutral `구역` retains the named place without settling its exact institutional type. |
| 32203 | `longlegs` / `장다리들` | Uncertain: the derogatory species term is intelligible, but the active corpus varies among `롱레그`, `긴다리`, and `장다리`; defer canonical naming. |
| 32207 | `Merchant Circle` / `상인 조합` | Uncertain: the organization meaning is conveyed, but whether `Circle` is part of a formal name and how to render it consistently remain open. |
| 32211 | `Master's Pick` / `장인의 자물쇠따개` | Uncertain: the jewelry-box context makes a master lockpick plausible, but the item/title meaning is not established by the locales. |
| 32212 | Omitted `I should do the same` | Accepted: append `나도 그렇게 해야겠다.` English, Japanese, and Chinese all retain the narrator's intention to return/report after Gwyn; Korean previously stopped after Gwyn's return. |
| 32214 | `the renounced` / `신앙을 버린 자들` | Uncertain: a renounced-faith faction/status is plausible, but its named status and canonical Korean term need context. |
| 32218 | `Dispel 50 wards` / `보호막 50개 해제` | Uncertain: Japanese supports protective magic and Chinese says seals; the precise gameplay object denoted by `ward` is unresolved. |
| 32220 | ASCII `(A)` button prompt versus Chinese fullwidth `（A）` | Not an issue: all locales preserve the A-button instruction; punctuation width differs only in Chinese. |
| 32225 | Scion / Watchers | Uncertain: the safety claim is retained, but Watchers' formal status and Korean name remain unresolved. |
| 32232 | `Isle of Eamonn` / `이몬 섬` | Uncertain: the island identity is retained, but the canonical name spelling and bilingual-display convention remain open. |
| 32237 | `here` / `그곳에서` | Accepted: change `그곳에서` to `이곳에서`, keeping the warmth and opportunity attached to the same refuge identified as `here`. |
| 32238 | Capitalized `The House` / `가문` | Uncertain: Korean preserves the demand to lead the House to war, but the isolated line does not establish which named House is meant. |
| 32240 | `House of Valor` / `용맹의 가문` | Accepted: change to `용맹의 집(House of Valor)`, following the established exact faction rendering accepted at IDs 1196 and 3230 (D-148 and D-650). |
| 32241 | `Verdant Blades` / `푸른 칼날`; `the Seal` / `인장` | Uncertain: the plural named artifact/group is rendered generically, and active Korean has competing `푸른 칼날` and `초록 칼날들` forms. |
| 32244 | `Knave of Coins` / `동전의 시종` | Uncertain: capitalization suggests a formal card/title, but active Korean and locale readings conflict. |
| 32245 | `House of Ballads` / `발라드 가문` | Accepted: change to `발라드의 집`, reusing the established named-faction rendering accepted at ID 31544 (D-10221). |
| 32249 | `Offering` / `봉헌물` | Uncertain: the capitalized term may mean a named rite, an act of sacrifice, or the object offered; the locale references differ. |
| 32201-32250 | Four-locale row order, line breaks, and runtime markers | Not an issue: each locale contains the same 50 IDs in the same order; embedded line breaks and all inspected variable/icon identities are retained. |
| Remaining ordinary text in IDs 32201-32250 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported semantic or Korean-usage defect was identified beyond the accepted corrections and context-sensitive terms above. |

## Verification

- English, Japanese, Chinese, and Korean each contain all 50 IDs exactly once
  and in identical order.
- Embedded line-break counts match throughout the range.
- `$DLC1_LordOfTheKeep.CALUM_DEBT$`, `#NAMED_ICON_GOLD#`, and
  `$SQ94.gold_amount$` remain unchanged and in order. ID 32220 preserves the
  A-button letter in all locales; Chinese alone uses fullwidth parentheses.
- Active default CSV SHA-256 is
  `3847a84eb3effb6800e6513b0a99a66e3b055c3e86c9d1ec936a64520bbb8fde`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- Register totals after this batch: 975 accepted, 3,596 `not an issue`, and
  5,883 uncertain (10,454 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 32251; 32,884 `default` IDs remain.

These working dispositions are not independent linguistic approval.
