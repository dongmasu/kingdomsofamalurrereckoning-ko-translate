# Consolidated Context Review: `default` IDs 25751-25800

- Date: 2026-10-11.
- Scope: re-review prior uncertainty findings from IDs 25751-25800, aligned
  by ID across English, Japanese source and Japanese-derived draft, Chinese,
  active Korean, prior decisions, and recurring terms.
- Result: resolve 25 of 26 prior uncertain keys (four accepted corrections
  and 21 `not an issue`); retain a specific Plagueshield-identity hold at
  ID 25755. IDs 25751, 25777, 25783, and 25800 link to existing decisions
  without recounting.
- English is the semantic authority; Japanese informs voice/register and
  provides supporting terminology evidence; Chinese is a secondary check.

## Decisions D-19233-D-19238

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19233 | 25752-25758 | mixed | IDs 25752-25754 and 25756-25758 preserve the adjective, daylight reading, keep invitation, Wulf fragment, Peace Edict loophole, and Augur doctrine. Keep ID 25755 uncertain: `Plagueshield` could be a medicine, shield, or named item; “I found this” does not settle its identity. |
| D-19234 | 25775-25776 | not an issue | English `in the sticks` means the countryside, and the Hireling-to-Pledgeshield advancement is explicit. `시골`, `고용병`, and `서약방패` preserve the rural setting and progression without inventing a rank tier; the formal glossary remains separate. |
| D-19235 | 25778 | not an issue | `History of Aodh` is rendered as a source-traceable title/name; locale phonetic variation does not establish a Korean meaning error. |
| D-19236 | 25784-25787 | mixed | Bugs-collected UI wording, the question, and the attack marker remain. Accept 25785: the contemptuous `dustling` address should use accepted `먼지나부랭이` from D-335/D-18327, not neutral `먼지 인간`. |
| D-19237 | 25788-25790 | not an issue | The new-Templar context, uncertainty about Niskaru/Chaos, and waking-day/dreaming-stone metaphor follow English; proper-name phonetics do not alter the events. |
| D-19238 | 25791-25799 | mixed | IDs 25791-25793 and 25797-25799 preserve the potion exchange, greeting, Wencen's Love label, thief call, Hierophant's fall, and Fort Olghorn advice. Accept 25794 and 25796 as `용맹의 집(House of Valor)` per D-148/D-650; accept 25795's plural insult as `먼지나부랭이들` per D-335 while retaining the established `발라드의 집` (D-711). |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25785 | `건방진 먼지 인간, 죽을 때다.` | `건방진 먼지나부랭이, 죽을 때다.` | Reuse the accepted belittling `dustling` rendering at D-335/D-18327. |
| 25794 | `용맹의 전당` | `용맹의 집(House of Valor)` | Reuse the accepted faction name at D-148/D-650. |
| 25795 | `...우리 종족은 너희 먼지 인간만큼 쉽게 변하지 않으니까.` | `...우리 종족은 너희 먼지나부랭이들만큼 쉽게 변하지 않으니까.` | Keep the plural address contemptuous, matching accepted `dustling` usage. |
| 25796 | `...용맹의 전당에서 연례 팀 대회를 준비 중이다...` | `...용맹의 집(House of Valor)에서 연례 팀 대회를 준비 중이다...` | Reuse the accepted House of Valor name at D-148/D-650. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  and active Korean each contain 65,135 unique ascending IDs. IDs
  25751-25800 occur exactly once and in identical order in every file.
- Per-row embedded line-break counts and detected runtime-marker signatures
  match English. Existing ability values, `{1}`/`{2}`, `{LINE_BULLET}`, and
  `#NAMED_ICON_ATTACK#` remain unchanged and in order.
- Only active Korean `Texto` at IDs 25785, 25794, 25795, and 25796 changed.
  Reversing those exact substitutions reproduces the pre-edit backup
  byte-for-byte. UTF-8 BOM, row order, 72,011 CRLF endings, and 73 existing
  bare-LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25751-25800-D19233/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `04e76ed8a6647ed1bd1594c9f6b8dc8376c870217b395a713d706642c20dfca4`.
- Post-edit SHA-256:
  `5e8e39450e3254c1cf3c50413bdd1683624f772234256372798a956e5e33dac1`.
- Totals: 2,180 accepted / 24,281 `not an issue` / 12,063 uncertain
  (38,524 counted keys). Resume at D-19239, ID 25801; the contiguous
  interval 25801-65134 remains, as do earlier specific holds and the
  D-18422-D-18452 register reconciliation.
