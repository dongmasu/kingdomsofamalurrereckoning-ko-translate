# Sequential `default` Revalidation: IDs `13250`-`13499`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-seven existing ledger records were fingerprint-verified. Sixty-six
  dispositions were retained. ID `61836` was reopened from `not-issue` to
  evidence-limited `uncertain` after its exact-English duplicate with `13258`
  exposed conflicting Japanese and Chinese readings.
- The other 183 IDs were compared and added. Three newly recorded IDs have
  correction candidates; four retain evidence-limited findings.
- Of the 183 new records, 134 have indexed quest-asset links and 49 do not.
  Two IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `13422` | Naturalness / nuance | `Mother must have been devastated` is rendered `어머니는 절망했을 거야`, and `my sisters` becomes the stiff `내 자매들`. Japanese and Chinese both describe the mother's grief and inability to speak. Consider a smoother, age-neutral phrasing such as `어머니는 큰 충격을 받았을 거야. 자매들이 전쟁에서 죽은 뒤로 며칠 동안 말도 못 했어.` Keep the conversational register and do not infer the speaker's gender or the sisters' relative ages. | Medium |
| `13446` | Terminology | `Parry 100 times` is translated `무기로 막아내기 100회`, while the same combat mechanic is called `패링` in Korean at `20640` and in other Parry descriptions. Align the action term, for example `패링 100회`. | High |
| `13494` | Meaning / terminology | Capitalized `the Missives` refers to the book `Missives of Sable`, not generic correspondence. The related quest review documents the established title `세이블의 서신(Missives of Sable)` and permits the unambiguous short form `서신`. Use that title when planting the book on Argine; preserve the rest of the plan and its informal register. | High |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `13258`, `61836` | Meaning / context | Both English rows are exactly `Go on then.` and their Korean translations match as `그럼 잘 가.` Japanese `それじゃまたな` supports a farewell, while Chinese `继续` means continue. English permits either a farewell or an instruction to proceed, and asset-level links do not map either key to a speaker or turn. Keep the Korean wording pending stronger context; reopen `61836` rather than treating the older `not-issue` disposition as settled. |
| `13306` | Format / source layout | The long Wulf Godfrey diary has the same `LINE_INDENT` and `LINE_NEXT_PAGE` token sequence across all four locales, but raw embedded line-break counts differ: English 0, Japanese 1, Chinese 5, Korean 0. Korean matches English's raw count; preserve it and keep the Japanese-template layout question on hold rather than inserting or removing breaks heuristically. |
| `13466` | Meaning / context | `There it goes.` may refer to something departing or function as a farewell. Japanese reads it as farewell and Korean follows that reading, while Chinese is less specific. The linked asset has multiple quest/NPC clues and does not identify the line's referent. Retain the broad current wording pending context. |
| `13493` | Meaning / role | `Walen's Second` is rendered `웨일런(Walen)의 2인자`. Japanese reads `Second` as an attendant/second, while Chinese reads it as a reserve contestant. The isolated key does not establish whether it means a second-in-command, a dueling second, or a substitute. Do not choose a more specific role without evidence. |

## Source / Reference Anomaly

At `13259`, English and Chinese say the siege has gone on too long, while
Japanese says it has finally been lifted. Korean follows the primary English
meaning. This is recorded as a source-reference divergence, not a Korean
correction candidate.

## Duplicate and Structural Checks

- One exact-English duplicate group touches the new IDs: `Go on then.` at
  `13258` and `61836`. Their Korean translations match.
- Brace-token, named-variable, layout-wrapper, and named-icon signatures
  match across English, Japanese, Chinese, and Korean for all 183 new IDs.
- Logical line-break counts match across all four locales for 182 new IDs.
  The raw line-break divergence at `13306` is documented above.
- Three Korean strings contain six existing embedded CRLF breaks: `13256`
  (1), `13370` (1), and `13411` (4). Their existing bytes were preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
