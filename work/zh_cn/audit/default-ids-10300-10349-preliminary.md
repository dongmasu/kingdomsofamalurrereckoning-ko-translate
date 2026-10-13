# Preliminary Language Scan: `default` IDs 10300-10349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10300-10349.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10300 | `struck out on my own` → `혼자 나와 살기 시작했지` | Preserve the speaker's independent start as a mercenary; check whether the Korean adds a literal “living alone” not stated by the source. | The rest of the line explains earning coin by guarding farms with one's sword. Japanese and Chinese also describe setting out independently rather than explicitly moving out to live alone. | Medium |
| 10304 | Askel Thorin / weakness at haggling | Confirm the name and preserve that he is stubborn but poor at bargaining, not simply unable to negotiate. | Korean retains both traits and the instruction to see how much can be obtained from him. Proper-name spelling remains provisional. | Medium |
| 10307 | `small group` → `소수 병력` | Keep the group-size information without assigning a military role unless context confirms that it is a troop. | English says only “a small group”; Korean calls it a small military force. The omitted `they` antecedent and group's identity remain unresolved. | Medium |
| 10309 | `Jump to ability` → `능력으로 이동` | Confirm whether this UI command opens an ability node/tree or moves focus to an ability. | Korean retains the navigation action but `능력으로 이동` is broad; Japanese specifies displaying the ability tree. | Medium |
| 10315, 10294 | Sagecraft / `마법물품 제작` | Align the crafting-system term across tutorial and dialogue uses with the established project/game label. | Korean describes socketing a gem and enchanting equipment accurately, but renders Sagecraft as `마법물품 제작`; ID 10294 uses the same term for sagecrafting. The canonical UI term remains unverified. | Medium |
| 10317 | Dverga → `드베르가들` | Align the people/species name with its recurring form and distinguish singular/plural usage. | The active corpus uses `드베르가(Dverga)` and `드베르가(Dvergan)` elsewhere. This row's plural Korean form is understandable; the exact ethnonym and plural convention remain open. | Medium |
| 10324 | `it` / lost, rediscovered, abandoned knowledge | Preserve the missing antecedent; do not assign what was lost or rediscovered without adjacent context. | Korean keeps the source's implicit subject and the contrast between mortals unable to bear the knowledge and immortals not caring. | High |
| 10326 | `silence the nuisance` → `골칫거리를 잠재워 줘` | Confirm whether the demand means kill, threaten, or otherwise stop the person; retain the coercive condition tied to the new partnership. | Korean's `잠재우다` can mean suppress or put to sleep and avoids specifying a method, which suits the source ambiguity. | Medium |
| 10328 | Whispering Witch / Offering / Blessing of Akara | Confirm the ceremony and proper-name terms; retain Bridgette's role as host and the witch's objective. | Korean keeps the possession/host relationship and the requirement to defeat the witch before she interferes with the ceremony and obtains Akara's blessing. | Medium |
| 10336 | `silk farmers` → `비단을 기르는 농부` | Align the occupation with the project's recurring silk-gatherer/farmer term and use a natural Korean description. | The Korean is understandable but literally says they grew silk. Earlier rows use both `비단을 거두는 사람` and `비단 재배자`, and one retains `실크파머(Silkfarmer)`. | High |
| 10340 | `Do not test my word` → `내 말을 시험하지 마라` | Preserve the threat meaning—do not challenge/test the speaker—rather than a literal test of the statement. | Korean follows the English words closely, but Japanese expresses “don't get fresh with me” and Chinese is similarly literal. The intended force is confrontational. | Medium |
| 10341 | `dove` → `자기야` | Confirm the relationship/register behind the affectionate address; preserve the contrast with the blunt warning about gnomes' priorities. | Korean chooses a romantic endearment. The English can also be patronizing or teasing, and the speaker relationship is not apparent in this isolated row. | Medium |
| 10342 | Captain of the Watch / the Sparrows | Confirm `Sparrows` as a named group and preserve that the narrator is included among the people threatened with death. | Korean renders the group as `참새단` and retains the captain's sword threat, the last survivors, and “and I.” | Medium |
| 10346 | Victory Games / “destined for great things” | Confirm the event name and retain the predictive encouragement without overcommitting the Fate terminology. | Korean preserves the friend address and prediction of success; `승리의 경기` may be a proper event name or a descriptive phrase. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 10304, 10307, 10317, 10324,
  10326, 10328, 10331, 10341, and 10342 against the active rows.
- Added active-row checks for IDs 10300, 10309, 10315, 10336, 10340, and
  10346, including recurring Dverga and silk-farmer terminology.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts, brace-token sequences, and runtime
  markers match across all four locales throughout this range.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat name and term questions above as settled.

## Batch Status

IDs 10300-10349 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
