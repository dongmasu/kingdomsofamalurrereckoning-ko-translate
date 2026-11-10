# SASQ01 / Idris Theonen Context Revalidation

- Date: 2026-11-10.
- Scope: all 68 `default` keys in `1800351.quest_bxml` (`SASQ01`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SASQ01`, the asset-level symbol
`NPC_POE_DOK_IdrisTheonen`, and 19 serialized `dialog_line_*` handlers. Its
text covers a Scholia Arcana study and examination guided by the Omnibus
Arcana. The keys include NPC dialogue, player choices, book text, objectives,
journal entries, and UI labels. The NPC symbol and handler count do not map
individual localization keys to speakers, callbacks, branches, or playback
order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV. Ledger statuses correspond to the listed
review dimensions.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `4426`, `60012` | format | The English source misspells the name as `Idiris Theonen`. The same asset's NPC symbol is `NPC_POE_DOK_IdrisTheonen`; Japanese, Chinese, and other English rows in this quest use Idris. Standardize the Korean annotation to the supported name `이드리스 테오넨(Idris Theonen)` in both rows without changing the English reference. | High |
| `60037` | format | English `Idris`, Japanese イドリス, and the same-group rows `4426`, `8984`, `14100`, and `60012` support `이드리스(Idris)`. Current `이디리스(Idris)` has an inconsistent vowel. | High |
| `12382`, `13739`, `49642` | naturalness | These are objective labels. `Read the Tome` is currently imperative `고서를 읽어라`, while the same group uses nominal objectives such as `빈 서책(Empty Tome) 읽기`; use `고서 읽기`. Japanese `中庭に向かう` and nearby quest text identify `Grounds` as the chapterhouse courtyard; replace vague `구내 방문` with `지부 안뜰로 가기`. Japanese `文章の指示に従う` identifies `Text` as the book's instructions; prefer `책의 지시 따르기` over `문서의 지시 따르기`. | High |
| `9895`, `15022`, `54422` | terminology | All three English sources use `our order`. Korean varies between `우리 대학` and `우리 교단`, while `46355` translates the same organizational sense as `우리 결사단`. Japanese and Chinese use academy/institution wording, so this is a terminology consistency proposal anchored in the English and established Korean usage, not a claim that the references literally say “order.” Prefer `우리 결사단` in these three rows. At `9895`, also prefer natural `마법서` to `마법서지`. | Medium-high |
| `15784` | naturalness | English and Japanese refer to the Omnibus Arcana's directions, but current `그것이 시키는 대로 하라. 내 지시를 따르듯이.` leaves the comparison awkwardly detached. Prefer `그 책에는 일종의 지성도 깃들어 있다. 내 지시를 따르듯 그 책의 지시도 따르도록 하라.` | Medium-high |
| `22649` | naturalness | English `Prodigious notes are a student's friend` and Japanese `こまめにノートを取った者が勝つ` praise taking plentiful, careful notes. Current `뛰어난 관찰 기록은 학생의 좋은 친구니까` is a literal and unnatural phrase. Prefer `수업의 각 단계를 꼼꼼히 관찰하는 걸 잊지 마. 학생에겐 꼼꼼한 기록이 큰 도움이 되니까.` | High |
| `27213` | format | This is the objective `Go to Rathir Bridge`. The same group uses the complete location form `라시르 다리(Rathir Bridge)` at `54616`; current `라시르(Rathir) 다리` splits the name and omits the English name of the bridge. Prefer `라시르 다리(Rathir Bridge)로 가기`. | High |
| `38326` | meaning | English says the speaker has already administered the written exam; Japanese `筆記試験にはもう目を通してある` clarifies that the written responses have already been reviewed. Current `필기시험은 이미 치렀으니` can mean the player has already taken the exam. Prefer `평가를 받으러 왔나? 필기시험 답안은 이미 살펴봤네. 이제 구술시험을 치러야겠군.` | Medium-high |

## Hold

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `52423` | meaning | The English ending `If I should follow its instructions, as Idris has asked.` is an incomplete or ambiguous clause. Japanese preserves a conditional reading, while Chinese is more affirmative; current Korean `그 지시에 따라야 할지 모르겠어` expresses uncertainty. Leave it unresolved rather than silently choosing a reading. | Uncertain |

## Coverage

All 68 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, and formatting.
Eight correction candidates and one source-ambiguity hold were recorded.
Five exact-English duplicate groups (`1342`/`11863`/`13077`/`47886`/`53725`,
`11680`/`14185`, `14545`/`24606`, `18887`/`21379`, and `57809`/`63170`)
already have identical Korean text. Clear objective, title, status, and
journal rows are marked `not_assigned` in the ledger; the remaining keys keep
unknown speaker attribution. No embedded line breaks, runtime tokens, or
markup were found.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
