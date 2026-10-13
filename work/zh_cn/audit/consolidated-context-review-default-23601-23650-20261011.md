# Consolidated Context Review: `default` IDs 23601-23650

- Review date: 2026-10-11.
- Scope: the twelve uncertain keys identified in the prior disposition for
  IDs 23601-23650.
- Result: eleven resolved (three accepted edits, eight `not an issue`);
  ID 23641 remains uncertain pending runtime-marker grammar verification.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18669 | 23611 | De Groot / trained soldier / Special Unit | not an issue | `기습했다` captures English `got the drop on`; the trained-soldier detail and reported special-unit affiliation remain. The name is paired with exact English spelling. |
| D-18670 | 23622 | hiding in a bottle / one last action | accepted | Change literal `술병 속에 틀어박혀` to `술에 빠져`, following the English drinking idiom and Japanese `酒に浸って`; retain the return to action and possible finality. |
| D-18671 | 23626 | Mitharan Ebony Guard | accepted | Add exact source spelling to the translated label: `미타란 흑단 경비대(Mitharan Ebony Guard)`. This preserves source traceability without deciding whether it is a formal unit or faction. |
| D-18672 | 23627 | Mitharan ruins | not an issue | The Korean question preserves the ruins and pairs the disputed ethnonym with exact `Mitharan`; no row-local meaning loss is established. |
| D-18673 | 23631 | Ulliam Toal / spellbinding | not an issue | In the ring-making story, `마법부여술` clearly conveys the art of enchanting. The narrative's eight line breaks and causal progression remain; an isolated mechanic label's terminology uncertainty does not make this prose erroneous. |
| D-18674 | 23637 | Ironfast open to the visitor | not an issue | Korean grants freedom to travel throughout Ironfast, matching English and Chinese. Japanese's welcoming formulation conveys the same positive access in context. |
| D-18675 | 23640 | Ember Eyes / Preordained / smoking | not an issue | The complaint about vegetables being dug up, theft of source-named Ember Eyes by the Preordained, and intended smoking are all retained. |
| D-18676 | 23643 | Hex / winnings | not an issue | Korean retains the draw, `헥스(Hex)`, winnings, and teasing address. Reuse the card-term context accepted at ID 23400 / D-18624. |
| D-18677 | 23644 | Ugnar Odgray / “truly gone” | not an issue | The dagger, instruction to report the speaker dead, and distinct claim that the Ugnar the recipient knew is gone remain separate. The source's death/departure implication is not over-resolved. |
| D-18678 | 23648 | Gardens of Ysa / which side starts war | accepted | Correct the malformed Korean ending and phrase the supported faction reading naturally: `문제는 어느 쪽에서 전쟁이 시작될지야.` English is awkward and Japanese/Chinese differ, so preserve the question rather than inventing a named side or war. |
| D-18679 | 23649 | Church of the Unbound / Lyenna | not an issue | The raid, scattering of members, hidden temple, unanswered questions, and urgent search remain. Both organization and person are paired with exact source spellings. |

ID 23641 remains under its existing D-7502 uncertainty and is not recounted.
All four wrappers remain in English-source order. Japanese and Chinese
localize/reorder marker payloads differently; translating the Korean payloads
without verified runtime substitution grammar could change display meaning.
This is a technical hold, not a reason to defer the other eleven keys.

## Edits and Verification

Only active Korean `Texto` at IDs 23622, 23626, and 23648 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23622 | `...술병 속에 틀어박혀 지내다...` | `...술에 빠져 지내다...` |
| 23626 | `미타란 흑단 경비대` | `미타란 흑단 경비대(Mitharan Ebony Guard)` |
| 23648 | `...문제는 어느 쪽이 전쟁을 일으킬지지.` | `...문제는 어느 쪽에서 전쟁이 시작될지야.` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23601-23650-D18669-D18679/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`cb4114c46edbba074be2850b4387f396ea2d0870aec71ac81dbf7e5e4ec29893`.
Post-edit SHA-256:
`e36796ed1e0beea85968c26edcc603b608be406570f79c09c7c8f912c17d0b61`.
Byte comparison confirms only the three listed physical rows changed. The
UTF-8 BOM, 65,135 data rows, row order, 72,011 CRLF endings, and 73
pre-existing bare-LF endings remain unchanged.

English, Japanese source, Japanese-derived Korean, Chinese, and active Korean
each contain the twelve reviewed IDs exactly once and in the same ascending
order. ID 23631 retains all eight embedded line breaks. The four ID 23641
markers and their original order are unchanged. No other runtime-marker
discrepancy was introduced.

D-18669-D-18679 resolves eleven keys: three accepted and eight `not an
issue`; one uncertainty (ID 23641) remains. Totals are 2,088 accepted,
23,556 `not an issue`, and 12,880 uncertain (38,524 counted). Active default
SHA-256:
`e36796ed1e0beea85968c26edcc603b608be406570f79c09c7c8f912c17d0b61`.
Next D-18680 at ID 23651.
