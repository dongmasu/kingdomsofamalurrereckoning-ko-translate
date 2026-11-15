# Sequential `default` Revalidation: IDs `7250`-`7499`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `7250`-`7499`; add only IDs without a current review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- All 250 IDs were checked. The 69 existing records had current four-language
  fingerprints and their prior dispositions were retained. The other 181 IDs
  were reviewed and recorded.
- Six new IDs have correction candidates. Five IDs have evidence-limited
  dimensions, including one ID that also has a correction candidate.
- Meaning, Korean naturalness, register where assessable, terminology, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `7339` | Meaning | Japanese reads the first clause as having shown enough self-control for one lifetime, while Korean narrows this to `인내심`. Recheck the referent and consider `자제력` if the preceding dialogue confirms it. | Medium; hold overlaps |
| `7346` | Naturalness | `블러디 본즈가 새롭게 욕망할 대상이 되는 거지` is a stiff literal construction. Smooth it, for example `네가 그들 대신 블러디 본즈(Bloody Bones)의 새로운 욕망의 대상이 될 거야`, without changing what `desire` means in context. | Medium |
| `7398` | Naturalness | `너도 그렇듯` is awkward for `As you are`. Consider `너처럼 우리 중 마지막으로 남은 이들도 머지않아 그렇게 되리라`, preserving the ominous, elevated tone. | High |
| `7402` | Meaning | English, Japanese, and Chinese say the speaker found him; Korean says `만났어`, which can imply merely meeting him. Prefer `그를 찾았어` or `발견했어` while retaining the preceding marooning detail. | High |
| `7406` | Terminology | `Health` is the game's numerical attribute and the established Korean term is `체력`; replace `생명력` in this short condition label with `체력`. | High |
| `7479` | Meaning / modality | English, Japanese, and Chinese state that the speaker believes the lullaby will lead them somewhere important. Korean `이끌어 줄 것 같아` weakens this to a tentative impression; consider `이끌어 줄 거라고 믿어`. | Medium |

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `7257` | The English, Chinese, and Korean poem have three embedded line breaks, while Japanese has two. The Korean follows English and Chinese; available evidence does not establish whether the Japanese line layout is abbreviated or intentionally different. Preserve the existing Korean breaks. |
| `7322` | English capitalizes `Villa`, Japanese specifies `Sandstone Villa`, and Chinese says only an estate. The asset association identifies a quest resource but does not map this key to a speaker or establish the place-name form. Do not expand or rename `빌라(Villa)` without stronger evidence. |
| `7339` | The English pronoun `it` has no explicit antecedent in this row, and the asset link does not map it to a specific dialogue turn. The self-control reading is supported by Japanese but should remain provisional pending context. |
| `7420` | The antecedent of `it` in `And once, not too long ago, it was you` is absent from this row. Korean adds `그 자리`; retain this as unresolved rather than deciding what `it` denotes. |
| `7447` | English `NO MORE!!!` and Korean `이제 그만!!!` can be a direct exclamation, while Japanese renders it as a refusal to repeat the same mistake. Without the surrounding turn, the intended proposition and speaker's tone remain uncertain. |

## Duplicate and Structural Checks

- Sixty-eight exact-English duplicate groups touch the range (1,531 rows
  across the corpus). Sixty-seven groups have matching Korean text. The one
  mismatch is IDs `7332` and `11660`; both already have context-review records.
  The `11660` report already flags `겨울 궁정의 사촌` as a candidate for
  alignment with `겨울 페이인 사촌` at `7332`. The Japanese and Chinese text
  also match across the two IDs, but the asset associations do not prove that
  the same speaker or dialogue turn is involved. No duplicate-text edit was
  made.
- Runtime-variable and layout-control wrappers and their order match across
  the four languages. At `7423`, the localized contents inside the `Health`
  display wrapper vary by locale as expected.
- ID `7257` is the only logical line-break-count difference in the 181 new
  rows; its discrepancy is recorded above.
- Three Korean strings contain 12 existing CRLF embedded breaks: ID `7257`
  (3), `7298` (1), and `7404` (8). They were preserved.
- Of the 181 new IDs, 134 have indexed quest-asset links and 47 have none.
  Asset membership does not establish a speaker, handler mapping, branch,
  or dialogue order.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
