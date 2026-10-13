# Preliminary Language Scan: `default` IDs 45251-45300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45251-45300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45252 | Callor's lorestone / `칼러의 운명의 돌` | Confirm the canonical Korean form for Callor and whether `lorestone` should use a distinct established term rather than `운명의 돌`. | English names a lorestone, while the Korean wording can be read as a destiny/fate stone; Japanese transliterates the item class and Chinese calls it a wisdom stone. Check the project glossary and other lorestone rows before standardizing. | Medium |
| 45255 | Gardens of Ysa / `이사의 정원` | Standardize the Korean rendering of Ysa and the named location. | The sentence is an isolated location label. Other active rows vary between translated and transliterated forms for Gardens of Ysa/Ysa, so this row cannot establish the canonical form. | Medium |
| 45262 | The Ariad / `아리아드` | Confirm whether the English label names a people/group and whether Korean should signal the collective sense. | Japanese adds `隊` (“unit/group”), while English uses the capitalized singular form and Chinese transliterates it. The isolated label does not settle the intended morphology. | Medium |
| 45268 | Moon Camp verse / `그림이 앞장선다` | Verify the proper-name reading of `Grim` and standardize Moon Camp; retain the verse's contrast between the ruler's fall, Grim's rise, and changed life/conduct. | English, Japanese, and Chinese treat Grim as a name. Korean phonetic `그림` is also the common word “picture,” and Moon Camp has several Korean forms elsewhere. The one line break is preserved. | Medium |
| 45277 | Vagabonds / `방랑자들이라는 도적 떼` | Confirm whether Vagabonds is a formal named bandit group and apply its established Korean form. | English capitalizes the group's name; Korean retains the bandit threat but renders the name descriptively. Japanese and Chinese likewise use phonetic/descriptive forms that do not settle a project-wide convention. | Medium |
| 45285 | `FAIL LINE` | Determine whether this is an internal/test string and whether the Chinese-only translation is intentional. | English, Japanese, and active Korean preserve the literal label; the Chinese reference renders it as “failed dialogue.” The source-keyed historical audit flags this label family as potentially non-player-facing. | Medium |
| 45288 | Ethene hymn / `위대함의 샘` | Review the poetic register and the `font of greatness` image; verify Ethene and Kollossae terminology without changing the source layout. | Korean uses “spring/fountain” for `font`, consistent with the source's image, while Japanese and Chinese also describe a source/fountain. The heading, blank line, and 16 hymn lines are retained. | Medium |
| 45289 | singlehanded Jottun joke / `그 한 사람은 너였지만` | Preserve the joke that the speaker claims to have acted with one hand, then reveals that the “single hand” was the player. | Korean conveys that the player did the work but changes the source's hand pun to “that one person”; Japanese preserves the hand reference explicitly. | High |
| 45297 | “all finished with the translation” / `번역을 모두 마쳤어` | Determine whether this is intentional in-world dialogue or a translator/test metadata string. | English, Japanese, Chinese, and Korean all explicitly mention completing a translation, which is unusual in the game corpus; no context is available in this row. | Medium |
| 45299 | `Trigger Belens` / `벨렌 트리거` | Determine whether this is an internal trigger/debug label or a player-facing name; confirm the Belens/Belen spelling. | English, Japanese, and Korean retain the trigger wording, while Chinese renders it as an imperative to trigger Belen. The source-keyed historical audit specifically flags it as a possible internal label. | Medium |

IDs 45251, 45253-45254, 45256-45261, 45263-45267, 45269-45276,
45278-45284, 45286-45287, 45290-45296, 45298, and 45300 generally retain
the English meaning on this first reading. Names, setting terms, and UI
labels remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 45250-45349 against
  the active rows in this batch. It flags Callor, The Ariad, Primos, the
  Mitharan/Almain passage, the Moon Camp verse, Vagabonds, `FAIL LINE`,
  Ethene's hymn, the one-hand joke, Adath Skoria, and `Trigger Belens`.
- The historical notes identify `FAIL LINE` and `Trigger Belens` as possible
  internal/test labels and request review of the `2:3` hymn, its greatness
  image, and the Moon Camp verse. No historical note authorizes changing
  the Korean CSV.
- Cross-row audit notes already document inconsistent Korean renderings for
  Moon Camp and other named locations; this batch adds no global name
  decision.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45251-45300 once
  and in identical ascending order.
- All four locales preserve the same line-break counts throughout this
  range. ID 45284 retains 12/23/23 damage values; ID 45288 retains its
  `2:3` heading, blank line, all 16 hymn lines, and 17 line breaks; ID 45291
  retains +5%.
- No runtime-marker, numeric-value, or hidden-formatting discrepancy was
  found by the structural scan.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45251-45300 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45251-45300-20261010.md`](disposition-batch-default-45251-45300-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45301.
