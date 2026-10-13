# Disposition Batch: `default` IDs 34801-34850

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with the active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: two accepted, two `not an issue`, and eleven uncertain.
- CSV changes: IDs 34811 and 34831 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34804 | `the Maid` in the Wencen line | Uncertain: English capitalizes the title, but Japanese substitutes a Windemere epithet and Chinese says “maiden.” Historical Maid entries leave the identity and canonical Korean form unresolved. |
| 34805 | `Seelie` as the resulting collective identity | Uncertain: the sentence describes a people/group formed by joining together. Japanese transliterates the name and Chinese interprets it as Summer Fae; the exact group identity and Korean convention remain open. |
| 34811 | `Mitharu's creed` | Accepted: change `미타루의 교리` to `미사루의 교리`. Decision D-152 and the official Korean manual establish `Mitharu = 미사루`; leave `교리` unchanged because the source supports a religious teaching and no narrower institutional sense is established. |
| 34817 | `holy hollow` | Uncertain: Korean's `성소` may over-resolve a landform or sacred cave. Japanese says sacred cave and Chinese says sacred void; the referent is not settled by this row. |
| 34819 | Firstsworn legacy and capitalized `Oaths` | Uncertain: the legacy and oath-taking are conveyed, but the group and formal-rite status are unresolved in the historical audit. |
| 34820 | `Court of Summer` | Uncertain: the literal Korean preserves the name's components, but its established Korean display and faction status remain open. |
| 34823 | `Lower` call and whether the player won | Uncertain: Korean identifies the low call and card value 3; Japanese explicitly says the player won, while English's “good on you” is congratulatory but less explicit. Leave the current line unchanged pending context. |
| 34825 | Pacetor letter and name spelling | Uncertain: the letter's longing, enforced confinement, and hope of reunion are preserved. Locale spellings and historical notes conflict on Pacetor/Pacet(or) and Idylla; no name normalization is approved. |
| 34826 | Eel Petal/Seaflax recipe | Uncertain: the 75% Shock chance, ingredient quantities 3/2/1/1, and layout are preserved, but isolated material-name translations need the item glossary. |
| 34831 | Allyn over her murdered husband's body | Accepted: change `남편을 살해한 자의 시신 앞에 선` to `살해당한 남편의 시신 앞에 선`. English, Japanese, and Chinese make the husband the murder victim; the existing Korean incorrectly makes him the murderer. |
| 34841 | `The Requiem` ship name | Not an issue: `레퀴엠호` preserves the named vessel reading, supported by the English capitalization and Japanese ship suffix. The following “funeral barge” threat remains intact. |
| 34843 | `The Hierophant` | Uncertain: Korean transliterates the title while Japanese interprets it as a guide and Chinese as a high priest. The canonical office/title meaning remains unresolved. |
| 34844 | `Templar Vinthur` | Uncertain: the addressee and name are preserved, but whether Templar is a formal institutional rank and its Korean display form remain unsettled. |
| 34850 | `EnterRathir2` | Uncertain: it looks identifier-like in English but may be a player-facing label. Do not change it without confirming the runtime context. |
| Remaining ordinary text in IDs 34801-34850 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 36 IDs. |

## Historical Audit Reconciliation

- Historical questions for IDs 34801-34850 were checked against the source
  rows and current draft. D-152 resolves only the deity spelling at 34811;
  it does not resolve the creed's doctrinal nuances or other Mitharu
  occurrences.
- The 34823 win inference, 34825 name spellings, 34826 ingredient terms,
  Maid/Seelie/Firstsworn/Court of Summer/Hierophant/Templar terminology,
  and `EnterRathir2` remain open rather than being normalized speculatively.
- No setting/title question was treated as authority for a global glossary
  change.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  tables in identical key order. The Japanese-derived Korean draft in
  `work/ja_jp/` was not counted as independent Japanese evidence.
- Embedded line-break totals match across the four locales: eight each.
  The letter and recipe layouts at IDs 34825-34826 remain unchanged.
- No runtime-marker discrepancy was found. ID 34826 retains the 75% chance
  and quantities 3, 2, 1, and 1.
- Accepted corrections are limited to IDs 34811 and 34831.
- Active default CSV SHA-256:
  `8547ae581de0332047c650629cffe19a2140b5a6c90e3638cc5d1861c82a5996`.
  UTF-8 BOM, 72,046 CRLF, and 39 pre-existing bare-LF endings are preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34851; 30,284 default IDs remain through ID 65134.
