# Preliminary Language Scan: `default` IDs 40001-40050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 40001-40050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 40002 | `뭔가 찾았어?` for “Did you find any?” | Retain the unresolved referent of `any`; do not insert an object without context. | English is elliptical, Chinese supplies “doll,” and Japanese/Korean use a generic question. The historical entry explicitly leaves the little sister's discovery open. | Medium |
| 40005 | `2층 미술관` for `a second floor, an art Gallery` | Confirm whether Gallery is a named Keep upgrade and preserve the two-step construction/materials objective. | Korean retains the second-floor gallery and the need to search the island for materials. Capitalization suggests a named upgrade, but the locale references vary between art gallery/museum descriptions. | Medium |
| 40014 | `페이블레이드 공격` from stealth | Confirm the formal name/description of this stealth attack and preserve that it targets unaware enemies. | English describes a Faeblade attack usable from stealth on unaware enemies. Korean retains the conditions but does not identify a distinct attack name; the exact mechanic/display term needs UI context. | Low |
| 40019-40020 | Card ranks `5`, `3`, `4`, `5`, `헥스` | Standardize named card ranks and preserve the six-card set and even/odd guessing rules. | English spells out rank names and distinguishes an ace, deuce, numbered cards, and a hex. Korean localizes some ranks as numerals and transliterates `deuce`/`hex`; earlier notes flag the card game's formal rank names. | Medium |
| 40025 | `후계자` for `scion`; `재산을 함부로 써 온` | Confirm whether scion denotes a descendant or formal successor and retain the boastful lineage/ill-spent-fortune meaning. | English presents Niahm as a scion of the Rathir Kents and master of vast, ill-spent fortunes. Korean chooses “successor,” potentially implying succession to an office; prior terminology notes leave Scion open. | Medium |
| 40028 | `현재와 ... 바꿀 수 있는 것` for `what is` / `what can truly change it` | Preserve the contrast between understanding what exists and what can truly change it, without recasting it as knowing the present and means of change. | The English pronouns are abstract but distinguish the two objects of wisdom. Korean interprets them as the present and means to change it; Japanese and Chinese diverge, so the intended philosophical referents remain uncertain. | Medium |
| 40029 | `잠든 자들` for capitalized `the Slumber` | Confirm whether Slumber is a named entity/event or ordinary sleep, and align it with the project's lore/UI terminology. | English capitalizes Slumber; Korean pluralizes it as sleeping people. Japanese transliterates Deep Slumber, while Chinese uses ordinary “sleep.” | Medium |
| 40030 | `대사제의 은신처`; `검은 서신` | Standardize Hierophant's Den and Missives of Sable, while preserving Argine's offer, the planted evidence, the Sanctum key, and the later choice of allegiance. | Korean preserves the quest sequence and the sense of framing Grim, but its named-location/document forms differ from earlier candidates. The historical log flags both terms and the betrayal decision. | Medium |
| 40036 | `놋쇠에 은을 입힌` for source “brass silver key” | Keep the source's material contradiction visible; confirm whether the key is brass, silver-plated brass, or malformed English before treating the compound as settled. | English is internally contradictory. Korean follows the plausible silver-plated-brass reading, supported by Chinese; Japanese says brass only. This is a source/reference ambiguity, not a confirmed Korean error. | High |
| 40038 | `화환` for `wreath` | Confirm the object's exact form and preserve that its value lies in the difficulty of assembling it, not its appearance. | Korean retains the effort/value relationship. Chinese suggests a feathered crown, while English/Japanese use a wreath-like object; the item form remains context-dependent. | Medium |
| 40039 | +80%, fifth consecutive kill, 13 seconds, 30% Mana | Preserve the precise unlock condition, damage increase, duration-reset behavior, and sustained Mana cost. | Korean retains the fifth consecutive kill, +80%, 13-second duration/reset, and 30% Mana cost over three lines. | High |
| 40041 | `포르텐마르 요툰`; `하마 팟헬름` | Standardize Fortenmar, Jottun, Hama Pot-Helm, and Almain spellings; preserve that the heirloom was brought here during the early Crystal War. | Korean preserves the relationship and chronology. Proper-name forms vary across locale references and active rows; prior notes leave the family/name reading open. | Medium |
| 40046 | `알마도르 리더` for `Almador Rydder` | Confirm whether `Rydder` is the person's surname or a role, and use a name rendering rather than the English word “leader” if it is a proper name. | English capitalizes both words as a name; Korean's `리더` reads as “leader.” Japanese treats the second element as a raiding-captain role and Chinese transliterates it as a title/name, so context is needed. | Medium |
| 40049 | `NUMPAD 9` | Confirm the exact displayed key-label convention and whether to localize the key name. | English gives a raw control label, Japanese translates it as numeric keypad 9, Chinese specifies the keypad key, and Korean leaves the English label unchanged. | Medium |

IDs 40001, 40003-40004, 40006-40013, 40015-40018, 40021-40024,
40026-40027, 40031-40035, 40037, 40040, 40042-40045, 40047-40048, and
40050 generally retain the English meaning on this first reading. Proper
names, game-specific labels, and voice remain subject to integrated review.

## Historical Audit Reconciliation

- `work/zh_cn/audit/from-ja_jp/open-questions.md` contains source-keyed
  questions for this range within the 39950-40049 entry. These include the
  ambiguous `any`, Gallery, Faeblade action, card ranks, Niahm Kent/Scion,
  Lyria's doctrine, Slumber, Hierophant's Den/Missives, Maisie's Luck,
  Chaos King, brass-silver key, Rhose variable, wreath, Fortenmar heirloom,
  Almador Rydder, and `NUMPAD 9`.
- Related preliminary reports were checked for Missives of Sable, Beckoned,
  Kollossae, Telling, and other recurring terms. No global terminology
  change is authorized.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 40001-40050 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker signatures match.
  ID 40037 preserves `$TR_Shell.rhose_wager$`; ID 40039 retains three lines
  and its numeric/stat values.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 40001-40050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 40051.
