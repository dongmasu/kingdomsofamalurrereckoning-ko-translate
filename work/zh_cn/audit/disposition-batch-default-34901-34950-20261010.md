# Disposition Batch: `default` IDs 34901-34950

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with the active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: five accepted, four `not an issue`, and six uncertain.
- CSV changes: IDs 34908, 34926, 34929, 34938, and 34949 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34901 | Downloadable-content availability notice | Not an issue: Korean conveys that new downloadable content is available and directs the player to the title screen. The duplicated Chinese/English row offers no independent Korean terminology evidence, but no meaning is lost. |
| 34908 | `Scholia Arcana` | Accepted: replace `아르카나 학회` with `스콜리아 아르카나(Scholia Arcana)`, matching accepted decisions D-6297 and D-6368. The current generic label omits `Scholia`. |
| 34916 | Templar Octienne as “the patron” | Uncertain: Chinese supports a patron/sponsor reading, while Japanese strengthens it to mastermind. The source does not establish whether he funds or directs the affair, and Templar remains a broader title question. |
| 34919 | `Plagueshield` | Uncertain: the Korean compound preserves the item/term sense, but whether this is a named craftable item, group, or formal title remains unresolved across locales. |
| 34926 | House of Valor / House of Seasons | Accepted: replace both hybrid `하우스` forms with `용맹의 집(House of Valor)` and `계절의 집`. This follows accepted D-148 for House of Valor and the established active-corpus House of Seasons form, while retaining the fall/desertion contrast. |
| 34928 | `Delvers` | Uncertain: Korean's generic `탐험꾼` matches the role-like Japanese/Chinese readings, but English capitalization and the historical audit leave open whether it names a group. |
| 34929 | `Beckoned` title | Accepted: replace `초대받은 자여` with the established `부름받은 자여`, matching accepted Beckoned decisions including D-3439, D-3443, and D-3456. Keep the egg-hunting question and lack of a clear lead unchanged. |
| 34930 | Potion increasing “all your armor” | Uncertain: `모든 방어구 수치` is plausible, but English does not settle whether this means total armor rating or every equipped piece. Values, ingredients, and layout remain intact. |
| 34934 | Frost Trap effect | Not an issue: additional 25 damage, 35% Stun chance, target, and 4-second duration are all retained. |
| 34936 | Capitalized `the Order` | Uncertain: Korean conveys that the organization has changed for the better, but its formal identity and canonical Korean name remain open. |
| 34938 | `By Mitharu!` | Accepted: change `미타루시여` to `미사루시여`, using the official Korean manual and accepted D-152 form `Mitharu = 미사루`. |
| 34940 | `Windstone` | Uncertain: Korean's `풍음석` is semantically plausible, but the established item name is not settled across the terminology record and locale references. |
| 34942 | Longsword damage stats | Not an issue: `+10` Physical Damage and `+25%` Damage with Longswords remain separate lines with the correct scopes and values. |
| 34949 | `chantries` | Accepted: replace `참사회 예배당` with `예배당들`. English, Japanese, and Chinese identify religious buildings; `참사회` adds an unsupported council/chapter meaning. |
| Remaining ordinary text in IDs 34901-34950 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 36 IDs. |

## Historical Audit Reconciliation

- Prior decisions establish `스콜리아 아르카나(Scholia Arcana)` (D-6297,
  D-6368), `용맹의 집(House of Valor)` (D-148), `계절의 집` in the active
  corpus, `부름받은 자여` for Beckoned (D-3439 and related decisions), and
  `미사루` for Mitharu (D-152).
- The Templar/patron relation, Plagueshield, Delvers, total-armor scope,
  Order, and Windstone remain open; no broader terminology normalization is
  inferred from these rows.
- At ID 34901 the Chinese source duplicates the English notice, so it was
  not treated as independent Chinese-language evidence.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  tables in identical key order. The range has no line-break or
  runtime-marker discrepancy.
- ID 34934 retains 25 damage, 35%, and 4 seconds; ID 34942 retains +10 and
  +25% on separate lines. Potion ingredient quantities/layouts at IDs 34913
  and 34930 are unchanged.
- Accepted corrections are limited to IDs 34908, 34926, 34929, 34938, and
  34949.
- Active default CSV SHA-256:
  `f57e63f5738ff75b5e939ece4b1dc7872f679020616da001fa7a2828a15c0965`.
  UTF-8 BOM, 72,046 CRLF, and 39 pre-existing bare-LF endings are preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34951; 30,184 default IDs remain through ID 65134.
