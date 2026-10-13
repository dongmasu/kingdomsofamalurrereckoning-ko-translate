# Disposition and Edit Batch: `default` IDs 29051-29100

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  29051-29100, checked against English, Japanese, Chinese, active Korean,
  recurring project terminology, and the historical audit.
- Decisions: two accepted, nine `not an issue`, and seven uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 29053 | `핏빛돌 획득하기` | `블러드스톤(Bloodstone) 획득하기` | English capitalizes the named item, and ID 2 already renders the same Bloodstone as `블러드스톤(Bloodstone)`. The literal `핏빛돌` is inconsistent with the established item name. |
| 29081 | `이 성채의 성주이자 전쟁의 고대 원로지.` | `이 성채의 성주이자 전쟁의 장로지.` | `Ancient of War` is a formal Warsworn title. ID 3334 has the accepted title form `전쟁의 장로` and explicitly treats it as a title. This aligns the recurring title while retaining the distinct Castellan role. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29052 | `{1}` skill and `{2}` points | Not an issue: both variables, their order, and the skill-buff relationship are preserved. |
| 29062 | `+1` bonus to the first two Might tiers | Not an issue: the bonus and its scope over the first two unlocked tiers are retained. |
| 29067 | Cove beyond the eastern cliffs | Not an issue: Korean identifies the inlet beyond the cliffs and preserves the wreckage, search priority, and urgency; the Chinese-only cave reading is unsupported by English. |
| 29076 | Heart of Sibun history | Not an issue: the Niskaru/Dalentarth relation, Warsworn custody and provenance, expected Ancient Vault storage, and concern over its prior possession are retained. Names remain subject to global terminology alignment. |
| 29077 | Nested `{*6...}` level/rank requirement | Not an issue: wrapper and variable identities are preserved; Korean follows English and Chinese variable order. The Japanese-only `{2}`/`{1}` reversal remains documented as a locale structural exception. |
| 29097 | Scholia's study of magic | Not an issue: Korean preserves magic's power, its potential for abuse, and the reference to observed past abuse without importing the Japanese-only “again” implication. |
| 29098 | Three thousand years undone by one year | Not an issue: the numerical contrast, ancestral reaction, and Telogrus-related loss are retained. |
| 29100 | `{*1...}` special-attack labels | Not an issue: both wrappers remain in the same order and their payloads are localized; the additional damage-over-time effect is retained. |
| IDs 29051-29100 structural and remaining ordinary text | Keys/order, breaks, runtime markers, and unflagged wording | Not an issue: all four locales contain the same 50 IDs in order; embedded line-break counts and normalized runtime-token identities/order match. The Japanese-only variable reversal at 29077 is excluded from the Korean mismatch finding. |
| 29051 | “our two empires” | Uncertain: English and Chinese leave the powers unspecified, while Japanese identifies the Summer and Winter Courts. Keep Korean generic until context resolves the discrepancy. |
| 29054 | Fragment `St. Hadwyn's` | Uncertain: the source is a possessive fragment with no following noun. Preserve the incomplete form rather than supplying an establishment or location. |
| 29060 | `ettin war party` | Uncertain: the possible organized enemy force and the wish to deal with the shamans first are conveyed, but exact group status depends on context. |
| 29079 | `I Was Impeded` | Uncertain: literal Korean preserves the first-person passive wording, but the capitalized phrase may be a named quest/status/debug label. |
| 29092 | `another Sparrow` | Uncertain: capitalization and Japanese's quoted group rendering support a named Sparrow, but English/Chinese do not settle faction versus bird/person. |
| 29094 | `Beckoned` form of address | Uncertain: the sales offer and respectful address are retained; the canonical Korean form of this player title remains open for corpus-wide alignment. |
| Other named terms in IDs 29051-29100 | Maxen, Summer/Winter Court, St. Hadwyn, Titarion, Orella Axl, Ettin, Waterfall/Stone of Valor, Hyperian, Fomorous Hugues, Sibun/Niskaru, Dalentarth, Warsworn/Ancient Vault, Ram Leodwald, Castellan, Blood Rite, Elbin, City Watch, Hrindi Zungar, Telogrus, and related UI terms | Uncertain: defer spelling, faction, rank, artifact, and UI terminology to integrated glossary review. IDs 29053 and 29081 are excluded because their recurring Korean forms were dispositioned above. |

## Verification

- Only the approved `Texto` cells at IDs 29053 and 29081 changed.
- IDs, row order/count, delimiter, quoting, BOM, and newline distribution
  were preserved. Embedded variables, wrappers, and line breaks remain intact.
- Active default CSV SHA-256 and direct structural counts are recorded in
  `TRANSLATION_PROGRESS.md` and `NEXT-SESSION.md`.
- Register totals after this batch: 892 accepted, 3,076 `not an issue`, and
  5,136 uncertain (9,104 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 29101; 36,034 `default` IDs remain.

These working dispositions do not constitute independent final linguistic
approval.
