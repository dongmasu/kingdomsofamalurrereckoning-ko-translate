# Disposition Batch: `default` IDs 62501-62550

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- One accepted correction, 30 `not an issue` IDs, and 20 uncertain findings.
  ID 62520 has an accepted wording correction and a separate open lore/poem
  question, so it appears in both categories. These are working dispositions,
  not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

Decision D-18006 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62520 | `흙 위에 세운 신상을 숭배하고,` | `흙바닥에서 숭배하고,` | English says they worship on earthen ground; it does not mention a statue. Remove the unsupported object while retaining the line's worship action. |

The four internal verse separators in the same row were also normalized
from CRLF to LF to match English, Japanese, and Chinese. The five-line verse
layout is unchanged.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18007 | 62505 | Belmaid's history and swordsmanship equality are retained; House of Ballads, Belmaid, and Wencen forms/status need setting context. |
| D-18007 | 62506 | `{1}` and the craft/core action are retained; player-facing UI meaning of `Craft Core` is unverified. |
| D-18007 | 62508 | The moon/sun comparison and apologetic aside are preserved; Orieator's name and social implication need context. |
| D-18007 | 62510 | Korean follows English `Testament`; Japanese and Chinese say Belen Covenant. Preserve the active English-led reading pending source reconciliation. |
| D-18007 | 62512-62513 | The forgiveness and burden, followed by the hesitant decision to accompany the addressee, are retained; their antecedents/context remain open. |
| D-18007 | 62515 | Korean preserves interpreting divine messages/visions; whether `Oracles` is an office, profession, or general class is unresolved. |
| D-18007 | 62517 | Korean reads lowercase `house` as the speaker's home, supported by Japanese/Chinese; Cydan's identity and exact household context remain unknown. |
| D-18007 | 62519 | The boon and resulting large wagers are preserved; `outrageous` is idiomatic and the stakes/context are unavailable. |
| D-18007 | 62520 | The added statue has been removed, but the Ohn theology and the poem's “another name” remain context-dependent. The wording correction is separately accepted under D-18006. |
| D-18007 | 62524-62525 | Sagrell's `grounds` and the threat are retained; the precise domain/property sense and idiomatic force need context. |
| D-18007 | 62528 | The incredulous question is preserved; the implied contrast in calling Telogrus ordinary is not in this row. |
| D-18007 | 62532 | `Chancellor` is rendered as `재상`; the High King's formal office and canonical title remain a terminology question. |
| D-18007 | 62537 | The troll's belief and rampage are retained. The text is verse-like, but all four locales have zero embedded breaks; no line-break change is authorized. |
| D-18007 | 62542 | Korean translates `Oathblade` literally; English does not establish whether it is a rank, weapon, person, or named order. |
| D-18007 | 62544 | The prophecy ties a mortal to the passing of the speaker's kind; `herald` may mean announce or usher in that event. |
| D-18007 | 62546 | The value XXI/21 is retained as 21 in Korean/Japanese; English uses Roman numerals, and the canonical tier/name styling is unverified. |
| D-18007 | 62547 | The firsthand-experience appeal and warning are conveyed; the force of `Take it from one who knows` remains a small voice/idiom question. |
| D-18007 | 62549 | The smith's contentment and refusal to trade places are preserved; the names and exact meaning of `places` need context. |

## Not an Issue

Decision D-18008 records these 30 IDs: 62501-62504, 62507, 62509,
62511, 62514, 62516, 62518, 62521-62523, 62526-62527, 62529-62531,
62533-62536, 62538-62541, 62543, 62545, 62548, and 62550. These rows
preserve available meaning, voice, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean contain IDs 62501-62550 once and in
  identical ascending order.
- ID 62520 retains five lines and four verse breaks. Korean previously used
  CRLF for each embedded separator, while all three references use LF; these
  four internal separators were normalized. No outer CSV record separator
  changed.
- `{1}` at 62506, the five-line poem at 62520, all source values, and the
  single-paragraph troll text at 62537 are preserved.
- Rechecked source-keyed questions for Belmaid/Wencen (62505), Craft Core
  (62506), Orieator (62508), Testament/Belen Covenant (62510), forgiveness
  (62512), “Yes. We” (62513), Oracles (62515), Cydan/house (62517), wagers
  (62519), Ohn poem (62520), Sagrell's grounds (62524), threat (62525),
  Telogrus (62528), Chancellor (62532), troll text (62537), Oathblade
  (62542), prophecy (62544), Chaos Thrall XXI (62546), and Breid/Gwyn (62549).
- Only the `Texto` cell at ID 62520 changed. Pre-edit SHA-256:
  `8e7373bcd130c6bf662834d3f978be3e1c6d6f0ef93e01a630a1928eac8a4605`.
  Post-edit SHA-256:
  `816f3ca27b568db9dbd2437449bd71cacd82368fbf5eb0b8e5dff58f23e36c0c`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62501/locatexts_zh_cn.koalocatext_default.csv`.
- The UTF-8 BOM, 65,135 records, key order, and total 72,084 LF characters
  are preserved. Four embedded-break normalizations change aggregate counts
  from 72,021 CRLF/63 bare LF to 72,017 CRLF/67 bare LF; outer CSV record
  separators remain unchanged.

D-18006 records one accepted correction, D-18007 records 20 uncertain
findings (one overlaps an accepted ID), and D-18008 records 30 `not an issue`
IDs. Direct register totals: 1,782 accepted, 15,447 `not an issue`, and
12,109 uncertain (29,338 dispositions total); next D-18009.

Resume at `default` ID 62551; 2,584 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
