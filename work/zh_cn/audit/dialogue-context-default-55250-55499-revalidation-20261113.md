# Sequential `default` Revalidation: IDs `55250`-`55499`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 61 existing ledger fingerprints; all match. Existing rows
  remain unchanged, and the other 189 IDs are appended in ascending order.
- Recorded one new correction candidate and eight new evidence-limited holds.
  The previously recorded question at `55301` is also retained in this report
  without changing its existing ledger row.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidate

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `55313` | Address / naturalness | `Greetings, strange one.` is a light greeting in English, Japanese (`やあ、よそ者`), and Chinese. Korean `반가워, 낯선 이여` combines conversational `반가워` with an archaic, literary vocative. Consider `안녕, 낯선 사람.` | Medium-high |

## Rechecked Existing Candidates

The six pre-existing candidate rows were checked against current source text
and prior evidence. Their ledger records remain byte-preserved.

| ID | Rechecked finding | Current disposition |
| ---: | --- | --- |
| `55264` | Korean repeats `겪다` in `그가 겪은 일을 겪고 돌아왔다면` and shifts the English `what he did` toward an experience he endured. Japanese describes the circumstances of his return; Chinese refers to his actions. Consider `그가 어떤 일을 겪고 돌아왔는지 생각하면, 나라도 별로 할 말은 없었겠지. 다른 건 필요해?` | Candidate remains; keep the exact agent/meaning cautious. |
| `55380` | Korean `티크네리(Ticneri)` conflicts with the established `틱네리(Ticneri)` used in this character's other labels. English and Japanese identify the same name; the asset report does not establish this row's speaker. | Name-consistency candidate remains; do not infer speaker. |
| `55398` | `dealt with the Headsman` means defeating him; Japanese explicitly says `倒してくれた`. Korean `처리해 준` is vague and slightly bureaucratic in this casual reply. Consider `우릴 대신해 형리(Headsman)를 쓰러뜨려 준 뒤로 상황이 조금 진정됐어.` | Candidate remains. |
| `55424` | `선한 영향력을 대변해` is an awkward collocation for representing Akara's good influence. Consider `그녀는 아카라(Akara)의 힘을 구현하고, 이 땅에서 그의 선한 영향력을 보여 줘.` | Candidate remains; retain the source's gendered pronouns. |
| `55470` | The current approved faction form is `벨렌의 성약단(Belen's Testament)`, also present at `55464` and elsewhere. The phrase `죽음의 교단 벨렌의 성약단` lacks a clear appositional link; compare `죽음의 교단인 벨렌의 성약단` at `35865`. Add `인` without reopening the established faction name or the already reviewed character identity. | Sentence-naturalness candidate remains. |
| `55488` | The opening stacks the hammer, Fahrlang, Besin, and the Niskaru Lord into a difficult modifier chain. Separate the journal statement from the explanation of the hammer's history, preserving that it is a remnant and that Eagonn used it to stop Fahrlang from freeing a Niskaru Lord. | Candidate remains; the earlier source-grounded rewrite direction is still supported. |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `55286` | Meaning / context | The English fragment is `with Magic`, Japanese is simply `(魔法)`, and Chinese says `使用魔法攻击`. Korean `(마법 사용 시)` supplies a conditional reading not established by the English or Japanese fragment. Retain pending UI context. |
| `55288` | Meaning / institution | `St. Hadwyn's Mission` is rendered as `선교원`; Japanese says monastery and Chinese says preaching mission. The row does not establish the institution type, so retain the current label pending stronger context. |
| `55291` | Meaning / action | English says the containers cannot be `dispelled`, Japanese says `解呪` (remove a spell), and Chinese says `解封` (unseal). Korean follows the magical interpretation, but the exact obstacle is unresolved. |
| `55298` | Terminology / UI label | English names `Casual` difficulty, while Japanese calls it `Easy`; Korean follows English with `캐주얼`. The canonical displayed tier cannot be established from these source rows alone. |
| `55301` | Meaning / source difference | English and Chinese describe paths through `elemental darkness`; Japanese describes paths through darkness without the elemental qualifier. Korean follows English. The row does not resolve whether the qualifier is essential; the existing ledger row is unchanged. |
| `55346` | Meaning / source difference | English `Recently-Built Fire` and Chinese `新近升起的火` indicate a newly made fire, while Japanese `かがり火の跡` means traces/remains of a bonfire. Korean follows English and Chinese as `새로 지핀 모닥불`; retain pending object/scene context. |
| `55350` | Meaning / entity type | English `Zungars`, Japanese `ズンガー`, and Chinese `尊加尔` provide a name but do not identify a family. Korean adds `가문` in `중가르 가문(Zungars)`. Whether this is a family, people, or group is unresolved; do not remove or reaffirm the added relationship by guess. |
| `55391` | Meaning / source structure | The English entry is fragmentary, with ellipses and missing clauses; Japanese and Chinese preserve different fragments. Korean keeps the interrupted structure, but the relationships among the Burning, Orbocant, and the final prevention clause cannot be reconstructed from these rows. |
| `55407` | Meaning / institution | `the Bursar's` is unexplained. Japanese `会計院` suggests an accounting institution, while Chinese refers to a Bursar's business; Korean `대회계원(Bursar's)` selects an office-like reading. Retain pending stronger context. |

## Rechecked Prior Voice Finding

The older full-voice candidate at `55457` described the goddess sentence as
written-sounding among conversational clauses. On current comparison, the
line remains a spoken utterance; `여신께서 ... 하셨어` is a natural Korean
honorific toward a goddess, not an unsupported switch to formal narration.
The nearby casual endings remain intact. No speaker identity is inferred.

## Source Notes and Structure

- Sixty-four exact-English duplicate groups across the corpus touch this
  range, covering 1,287 rows. Korean wording matches within every group,
  including groups whose Japanese wording differs.
- Three rows contain embedded line breaks: `55360` (3), `55444` (4), and
  `55480` (2). Each language has nine embedded line breaks in total.
- Runtime/display marker identities and order match after ignoring localized
  text inside `{*n...}` markers, except for a source-only layout difference
  at `55251`: Chinese has an extra `{LINE_LEFT}` after the `Blacksmithing`
  heading and lacks the English/Japanese/Korean `{LINE_SPACE}` before
  `Components`. Korean follows English and Japanese. The localized
  `{*1...}` payloads at `55473` retain the same marker identities and order.
- Of 250 IDs, 197 have indexed asset associations, represented by 207 links
  across 132 assets; 53 have no indexed asset. Of the 189 new ledger IDs,
  136 are linked and 53 are unlinked. Asset links do not establish per-key
  speakers or playback order.

## Range Result

- The eight new holds and the new `55313` candidate are recorded on newly
  appended rows. The `55301` follow-up is documented here only; its existing
  ledger row remains unchanged. All 61 pre-existing rows were preserved.
- After adding 189 IDs, the ledger covers 58,037 of 65,135 unique `default`
  IDs (89.10%), leaving 7,098. Sequential coverage reaches `55499`; next is
  `55500`-`55749`.
- Catalog asset-link counts are distinct from the range totals: this range
  has 197 linked IDs and 53 unlinked IDs.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
