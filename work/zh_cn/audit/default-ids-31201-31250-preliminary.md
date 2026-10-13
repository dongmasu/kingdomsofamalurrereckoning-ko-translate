# Preliminary Language Scan: `default` IDs 31201-31250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31201-31250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31201 | `알리센의 오빠` for `Alisen's Brother` | Confirm whether Alisen is known to be female and the sibling older; English only identifies a brother, while Korean `오빠` encodes both speaker/possessor gender and relative age. | Japanese says older brother, but Chinese is broader. This is a title/relationship label without surrounding dialogue to establish the relationship details. | Medium |
| 31207 | Long Armor of Ohn invitation ending `일주일 뒤에...에서 만나자` | Keep the source's unfinished meeting-location fragment and ellipsis; do not invent a location or repair it into a complete invitation. | English ends `at....`; Korean retains an unfinished “at ...” construction. Japanese also truncates the meeting point, while Chinese supplies “come find me within a week” and drops the precise fragment. | High |
| 31217 | `세 등불 여관을 말끔히 정리해 놨어` for `got the Three Lamps ship-shape` | Preserve the idiom/wordplay around `ship-shape` if feasible without asserting an unsupported literal ship. | `Three Lamps` is a tavern name and `ship-shape` means neat/orderly. Korean conveys the tidy-up meaning but loses the English wordplay; historical notes explicitly leave this pun open. | Medium |
| 31220 | `그건 아주 오래된 물건이야` for `They are ancient things` | Keep the referent and number unresolved; Chinese identifies “Blue's boots,” but English does not name the object in this row. | English uses plural `They` then singular `a rare item`; Korean follows the singular “that thing.” Historical notes identify an antecedent/number question. | Medium |
| 31222 | `성 오드윅 수도회 사람들` for `the brothers of St. Odwig's` | Confirm whether this is a religious order, clergy, or another named group; avoid treating `brothers` as an established organization without context. | English says brothers; Japanese says followers and Chinese says monks. Korean selects the named-order interpretation. | Medium |
| 31224 | `뱀의 이야기 주점` for `the Serpent's Tale` | Standardize the tavern name and decide whether it should be translated, transliterated, or bilingual. | English capitalizes it as the business name; Korean translates it literally and adds `주점`, which is supported by the proprietor/supplies context. | Medium |
| 31232 | `참새들` / Raf “a Sparrow of our kind” | Determine whether `Sparrows` is a named group, a poetic identity, or both; preserve the eulogy's affection and contrast. | The speaker addresses Sparrows as a collective and calls Raf one of their kind. Japanese quotes the term, Chinese and English use it as a group identity, while Korean renders it as ordinary “sparrows.” | Medium |
| 31235 | `실패 대사 1` for `FAIL LINE 1` | Confirm whether this is a raw internal/test label or localized player-facing text. | English and Japanese preserve the uppercase diagnostic wording; Chinese and Korean translate it. Historical audits treat comparable `FAIL LINE` labels as likely internal/test strings. | Medium |
| 31239 | `평생 술에 취해 본 적이 없는 사람 같아` for `sober all his life` | Preserve the ambiguity between literal abstinence from alcohol and figurative seriousness/respectability. | English supports both readings. Japanese explicitly says he has never been drunk; Chinese says he is conservative/composed. Korean selects the literal sobriety reading. | Medium |
| 31246 | `필경사` for `Scrivener` | Confirm the canonical role term and whether this is an institutional office/title in the library context. | The source connects killing the Scrivener with gaining library access. Korean uses a precise generic occupation, but the capitalized role may be formal. | Low |
| 31247 | `새 활성 퀘스트` for `New Active Quest` | Check the established Korean UI label and whether this means a newly active quest or a new quest becoming active. | English is a compact system label; Korean is literal but somewhat awkward. The source does not clarify whether it is a notification title or menu category. | Low |
| 31250 | `그 자리를 대신할 순 없어` for `fill those boots` | Preserve the idiom's sense of succeeding a legendary Sergeant, not literal footwear. | Korean correctly renders the metaphor as taking the Sergeant's place; historical wording and comparison with Chinese support this interpretation. | High |

Rows 31202-31206, 31208-31216, 31218-31219, 31221, 31223, 31225-31231,
31233-31234, 31236-31238, 31240-31245, and 31248-31249 generally retain
the English meaning on this first reading. Their names, register, fragments,
and lore terms remain for the integrated pass; no separate high-confidence
wording candidate was identified.

## Historical Audit Reconciliation

- The historical source-keyed entry for IDs 31200-31299 was checked against
  the current rows. It specifically flags the unfinished invitation at
  31207, the `ship-shape` pun at 31217, the unknown referent at 31220,
  St. Odwig's brothers at 31222, the Serpent's Tale at 31224, Sparrows/Raf
  at 31232, and sober/serious ambiguity at 31239.
- The Korean preserves the incomplete end of 31207 without supplying a
  meeting location. The lost pun at 31217 remains a candidate for the later
  integrated review, not a confirmed correction.
- At 31220, Chinese supplies the Blue's Boots antecedent while English and
  Japanese do not; this report does not adopt that added context.
- `FAIL LINE 1` at 31235 remains a possible internal/test label, consistent
  with earlier audit treatment of similar labels.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31201-31250 once and in identical order.
- Embedded line-break counts, detected runtime-marker identities/order, and
  Unicode format-character signatures match across the four locales. The
  long text at 31207 remains one paragraph in each locale.
- Numeric meaning is retained in `Day 3` (31212), `Rank 1` (31215), `Entry
  VI` (31230), and `FAIL LINE 1` (31235).
- No CSV text or other source file was edited.

## Batch Status

IDs 31201-31250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31251.
