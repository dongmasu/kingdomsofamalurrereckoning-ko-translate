# Preliminary Language Scan: `default` IDs 31551-31600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31551-31600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31551 | `$M0_SQ06.silverware_cost$` | Preserve the runtime variable and clarify whether `silver` here means silverware, as the Korean item wording implies. | English says “the silver,” but the shared variable names a silverware cost. Japanese explicitly says silverware, whereas Chinese says silver. Korean translates it as silverware and retains the exact variable. | Medium |
| 31555 | `익사한 숲` / `보급 작전` for `Drowned Forest` / `logistical nightmare` | Standardize Drowned Forest and review the military-logistics phrasing against the established term. | The source describes scattered units entering from Drowned Forest, not a cohesive front, with terrain and foliage creating a logistical problem. Korean preserves the operational point; faction/place names remain glossary candidates. | Medium |
| 31562 | `낮은 패를 고르는 거야?` for `Lower, then?` | Verify whether `Lower` is a High/Low prediction or another card-game choice; do not assume it means selecting a lower-valued card without UI context. | Japanese uses the loanword “Low,” Chinese says “small,” and English immediately reveals an ace and declares a win. Korean makes the implied choice explicit, but the game rule is not established by this row. | Medium |
| 31563 | `웬센` for `Wencen` | Confirm the identity and canonical spelling of Wencen; retain the distinction between following someone and having misguided faith. | English says the speaker followed “him” but he was never the true Wencen. Other locales transliterate the name differently and do not identify the referent. | Medium |
| 31571 | `스스로를 봉헌` for `consecrate themselves` | Preserve the religious/self-dedication sense as provisional; establish whether the people are dedicating, purifying, or blessing themselves in the surrounding theology. | English says the speaker can die so the people may consecrate themselves. Japanese interprets the result as purification through the speaker's death; Chinese says the people may receive blessings. Korean follows the religious “consecrate” reading. | Medium |
| 31574 | `+15%` duration-based spells | Preserve the 15% value and confirm the canonical Korean ability-stat label. | All locales state a 15% increase to the duration of duration-based spells. Korean preserves both the scope and amount. | High |
| 31577 | `부적` / `불쾌한 놀라움` | Verify the established term for `talisman` and review whether “ugly surprise” is best retained as an unpleasant surprise or an implied combat setback. | The source is an item description with awkward grammar (“more powerful than appear at first glance”). Korean smooths the comparison and retains the overconfident-duellist warning. | Medium |
| 31583 | `대사의 추천과 서면 허가` / `추첨` | Preserve that endorsement and written authorization only qualify someone for the lottery, not direct entry to the secret city; confirm the exact force of `endorsement`. | English states the lottery is only the next gate. Japanese recasts entry as exceptionally unlikely, while Chinese and Korean retain the authorization-then-lottery sequence. | Medium |
| 31584 | `그녀` | Keep both feminine references unresolved until the preceding context establishes who Grian appoints and whose favorite sites these are. | English has two instances of “her/she” without local antecedents. Japanese and Chinese also leave the identity unclear. Korean preserves the ambiguity. | Medium |
| 31585 | `도구` / `페이 유물` for `implement` / `Fae relic` | Clarify the miners' `affliction` and retain the appositional relation that the required implement is a Fae relic given to Edgar Aron. | English has a broken dash construction around “a Fae relic”; Japanese and Chinese independently connect the relic/tool to restoring the miners. Korean resolves the construction into short sentences but leaves the exact affliction unspecified. | Medium |
| 31587 | `물리 피해 115` / `소모 마나: 60` | Preserve both values and the source line break. | English, Japanese, Chinese, and Korean all retain 115 Physical Damage followed by a separate 60 Mana cost line. | High |
| 31591 | `잡화점` / `창고에 거래 계정` | Confirm `sundry` as the specific shop category and whether opening a warehouse account is a formal service. | Japanese and Chinese interpret `sundry` as a general-goods shop, supporting the Korean rendering. The line distinguishes buying goods from setting up a warehouse account. | Medium |
| 31593 | `비비피케이션 학자` / `프라임 서클` | Confirm canonical Korean forms and the rank syntax for `Scholar of Vivification, Prime Circle`. | The source gives Fomorous Hugues a discipline and institutional affiliation/title. Japanese describes research in Prime Circle; Chinese uses a different discipline rendering. Korean transliterates Vivification and Prime Circle pending glossary review. | Medium |

Rows 31552-31554, 31556-31561, 31564-31570, 31572-31573, 31575-31576,
31578-31582, 31586, 31588-31590, 31592, and 31594-31600 generally retain
the English meaning on this first reading. Names, register, and setting
terminology remain candidates for the integrated pass; no separate
high-confidence wording correction was identified.

## Historical Audit Reconciliation

- The source-keyed historical entries for IDs 31500-31599 were checked.
  Relevant items include the cost variable and silverware, Crows, Drowned
  Forest logistics, `Unbound`, the card/ace, Wencen, self-consecration,
  +15% duration, the talisman, secret-city lottery, ambiguous “she,” the
  Fae implement, 115/60 combat values, sundry/warehouse wording, and the
  Vivification/Prime Circle title.
- IDs 31551 and 31586 preserve their exact cost variables. ID 31587
  preserves 115 damage, 60 Mana, and the embedded line break.
- The differences in interpretation at IDs 31562, 31571, 31584, and 31585
  remain explicitly open; none is treated as a confirmed correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31551-31600 once and in identical order.
- Embedded line-break counts match throughout this range.
- Runtime-variable identities and order match, including
  `$M0_SQ06.silverware_cost$` at ID 31551 and
  `$SQ02.bettergem_cost$` at ID 31586.
- Numeric meaning is retained at IDs 31518 (+10% Mana), 31574 (+15%
  duration), and 31587 (115 damage, 60 Mana).
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 31551-31600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31601.
