# Sequential `default` Revalidation: IDs `26000`-`26099`

- Date: 2026-11-12.
- Compared all 100 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 23 existing ledger records and added 77 previously unrecorded
  IDs. Six new correction candidates and three evidence-limited holds were
  recorded. Four existing candidates remain pending.
- This is a partial continuation of the `26000`-`26249` batch. No translation
  CSV, source, extracted asset, or localization binary was changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26022` | Naturalness | The first two attack descriptions end in the noun fragments `피해 150` and `피해 210`, while the third uses a complete `-시킵니다` sentence. Consider complete, consistently styled descriptions such as `범위 내에 피해 150을 줍니다` and `범위 내 적을 불태워 피해 210을 줍니다`; retain numbers, costs, and line breaks. | High |
| `26059` | Meaning | The final `We sing Meropis!` is reduced to `메로피스(Meropis)여!`, dropping the repeated action of singing. Restore the refrain, e.g. `만세! 메로피스(Meropis)를 노래하세!`. | High |
| `26071` | Name / format | The standalone English label `Venomspitter` is rendered `베놈스피터` without English pairing. Consider `베놈스피터(Venomspitter)` after confirming whether the label is a distinct named type or ordinary description. | Medium |
| `26088` | Naturalness / register | `다시 뵙는군, 존귀한 분. 이야기 나눌 수 있어 기쁘오` uses stiff, inconsistent respectful phrasing. Japanese is a friendly, respectful greeting; consider `다시 뵙네요, 존귀하신 분. 이야기 나눌 수 있어 기뻐요.` The different Japanese text here does not justify mechanically adopting another ID's address. | Medium-high |
| `26089` | Name / format | The standalone name `Spell von Binderson` is rendered without its English form. Consider `스펠 폰 바인더슨(Spell von Binderson)` after checking the label's context. | Medium |
| `26093` | Meaning | English `As a token` and Japanese `その証として` describe a gesture or sign; Korean `답례로` adds a return favor not established here. Consider `그 표시로` while retaining the rest of the sentence. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `26007` | Meaning / setting | English `hollow` can mean a hollow or valley, Japanese says cave, and Chinese says valley. Do not replace Korean `골짜기` with `동굴` without location evidence. |
| `26028` | Register | Japanese `お前は誰だ？` is plain, while Korean `누구시죠?` is polite. This short shared English question has no established speaker, addressee, or scene; hold a register change until the dialogue context is independently established. |
| `26076` | Meaning | The English phrase `jest at her behalf` is ambiguous, Japanese refers to the father's good mood, and Chinese reads it as mockery. Korean says he jokes for her sake. The source conflict does not establish a safe replacement without further evidence. |

## Rechecked Existing Findings

- `26008`: retain the candidate about adding a causal connection to the
  Beckoned's nature, as documented in the DLC2 MQ06 report.
- `26042`: retain the Ebsol pairing, spelling, and stealing candidate in the
  TRSQ02 report.
- `26068`: retain the `Hillared the Blade` complete-name pairing candidate.
- `26070`: retain the source-count ambiguity candidate; do not resolve the
  number of groups from asset association alone.

## Duplicate And Structural Checks

- The range touches 18 exact-English duplicate groups comprising 650 corpus
  rows; Korean is identical within each group. This alone does not establish
  identical speaker, tone, or context.
- All four languages have matching embedded line-break counts in the range.
  No brace-delimited runtime markers occur in these 100 entries.
- Asset links and numeric ID order do not establish individual speaker or
  playback order. Unproven attribution and order remain unassigned/unknown.

After recording this range, the ledger contains 36,319 of 65,135 IDs
(55.76%), leaving 28,816. Sequential coverage reaches ID `26099`; the next
range is `26100`-`26249`.
