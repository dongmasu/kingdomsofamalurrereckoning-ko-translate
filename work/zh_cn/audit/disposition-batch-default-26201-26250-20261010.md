# Disposition and Edit Batch: `default` IDs 26201-26250

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26201-26250, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, four `not an issue`, and five uncertain.
- Accepted correction at ID 26217 is applied to the active Korean CSV.
  Names, lore terms, and verse-format questions remain unchanged.
- D-8483 at ID 25934 was retrospectively reclassified from `accepted` to
  `not an issue`: the active CSV already contained the accurate `제작 보조`.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26202, 26204-26205, 26210-26216, 26218-26221, 26223, 26225, 26227-26230, 26235-26239, 26242-26245, 26247, 26249-26250 | Dialogue / UI / quest wording | Not an issue: the reviewed lines preserve the source intent, conversational voice, and concise UI meaning. Name consistency is tracked separately. |
| 26207, 26240-26241 | Hammer stats / controller prompt / venom warning | Not an issue: both hammer values, `#NAMED_ICON_360_A#`, and the control instruction are preserved. |
| 26209 | Winter's Embrace | Not an issue: `겨울의 포옹` is accurate. The trailing U+FEFF is in the immutable Chinese source only, not the Korean CSV. |
| 26226 | Business Development Coordinator | Not an issue: `사업 개발 코디네이터` conveys the credit/job title. |
| 26217 | Eldric Orhelm / Bodine Borgue report | Accepted: change the final two sentences to `보르그를 찾았는지도 의문이다. 아마 데티르 황야의 위험에 대비하지 못했을 것이다.` English expresses two separate hedged inferences; `찾기는커녕` made the first sound conclusive and fused both ideas. |
| 26203 | “principles of Adessa” | Uncertain: Japanese supports a “foundation” reading, but the English fragment does not settle whether this means guiding principles or a specific institution/concept. |
| 26201, 26206, 26208, 26215, 26245, 26250 | Alabon / Bareth / Ciara Sydanus / Ayten / Fort Olghorn / Gwyn Anwy | Uncertain: proper-name spellings and established Korean forms need corpus-wide alignment. |
| 26222, 26231-26234, 26248 | Hierophant / Delvers / Togh Farm / mining interest / Leanashe | Uncertain: lore and entity terminology recurs across the corpus; preserve current wording pending integrated review. |
| 26224 | Quoted verse | Uncertain: review poetic imagery and Korean `\\\"` sequences together; runtime visibility of the backslashes is not established. |
| 26246 | Multi-speaker quoted passage | Uncertain: paragraph/stanza structure is retained, but speaker attribution, poetic phrasing, and locale-specific quote glyphs need context. |

## Verification

- English, Japanese, Chinese, and Korean source rows for IDs 26201-26250 were
  compared; the preliminary structural scan confirms matching ID order and
  row occurrence.
- The hammer values and named-icon token at ID 26240 remain intact. The
  Korean verse escape sequences and Chinese-only trailing U+FEFF at ID 26209
  were not modified.
- The only Korean CSV edit in this batch is ID 26217. UTF-8 BOM, 72,046 CRLF
  endings, and 39 pre-existing bare-LF endings are preserved.
- Active default CSV SHA-256:
  `21112ef386c7a65748c74b557ea6a7283b08bb4edfdb90cd5fc8261624625c6c`.
- Register totals after this batch: 831 accepted, 2,898 `not an issue`, and
  4,824 uncertain (8,553 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26251; 38,884 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
