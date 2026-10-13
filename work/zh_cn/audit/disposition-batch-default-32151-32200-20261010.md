# Disposition Batch: `default` IDs 32151-32200

- Decision date: 2026-10-10.
- Scope: all 50 rows and preliminary findings for IDs 32151-32200, compared
  across English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring terminology,
  line breaks, and runtime tokens.
- Decisions: two accepted, six `not an issue`, and six uncertain.
- CSV changes: IDs 32163 and 32187.

## Findings

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 32156 | `Replace {1} with {2}` / placeholder order | Not an issue: English, Japanese, and Korean preserve `{1}` as the replaced value and `{2}` as its replacement. Only Chinese reverses surface order to fit its syntax; Korean identities and order are correct. |
| 32161 | `St. Odwig's Reliquary` / `성 오드윅의 성유물 보관소` | Uncertain: the Korean names a plausible relic repository, but the English may denote a reliquary object or a place, and the corpus uses both `성유물함` and `성유물 보관소`. |
| 32163 | `good for nothing louse` / `쓸모없는 이` | Accepted: change to `이런 쓸모없는 놈 같으니!`. This restores a natural, forceful Korean insult and familiar spoken register without importing the stronger Chinese “slave/annoying” interpretation. |
| 32170 | `MendellerBirt` / `멘델러 버트` | Uncertain: Korean separates the fused source spelling, but the isolated row and other locale spellings do not establish whether the English contains a missing space or where the name boundary belongs. |
| 32171 | Two staff-damage stat lines | Not an issue: both values and the distinction between physical damage and total damage with staves are retained, along with the one-line break. |
| 32172 | `{*6{1}}` | Not an issue: the nested marker and `{1}` placeholder are preserved exactly in all four locales. |
| 32181 | Fate Magic / “Reckoning” magic | Uncertain: Korean distinguishes `운명 마법` from `레코닝 마법`, but the formal status and canonical Korean treatment of Fate Magic remain unresolved. |
| 32182 | `the mission's crystals` / `선교원의 수정` | Uncertain: English and locale references do not establish whether `mission` is a named religious institution, a settlement, or a task. Retain the provisional wording without canonizing it. |
| 32187 | `wings of the Hierophant's Court` / `대사제 궁정의 날개` | Accepted: change to `이건 대사제 궁정의 별관, 즉 내 성소로 통하는 열쇠예요.` English uses the architectural sense of a building wing; Japanese `棟` and Chinese `厢房` support a building section rather than literal wings. |
| 32196 | Lykeios, Theater, and office of Primos; unfinished em-dash source | Uncertain: Korean retains the unfinished thought and public-support claim, but the names, Primos hierarchy, and source-fragment punctuation need wider context. |
| 32198 | `servant` / `시종` | Not an issue: Korean preserves the English/Japanese attendant or subordinate sense; the Chinese “slave” reading is stronger than the English supports. |
| 32151-32200 | Four-locale row order, line breaks, and runtime markers | Not an issue: all four locales contain the same 50 IDs in the same order; the ID 32171 break and ID 32172 nested marker are preserved. |
| Remaining ordinary text in IDs 32151-32200 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported semantic or Korean-usage defect was identified in the other rows. |
| Other names and lore terms in IDs 32151-32200 | Harriset Donnel / Ratofer / Vilsar / Khleran / Arena names / Maeve Arigal / Esklad / Fate Magic / Lykeios / Secandra / Primos and related terms | Uncertain: canonical spellings, institutions, and lore terminology remain subject to integrated glossary and context review. |

## Verification

- English, Japanese, Chinese, and Korean each contain all 50 IDs exactly once
  and in identical order.
- Embedded line-break counts match for the range. ID 32171 retains its break
  between the two staff-stat lines.
- Placeholder and runtime-marker identities are preserved, including the
  nested `{*6{1}}` at ID 32172. ID 32156's Chinese-only surface-order change
  does not alter Korean argument mapping.
- Accepted Korean text now reads:
  - ID 32163: `이런 쓸모없는 놈 같으니! 고맙네, 친구. 어떻게 처리할지 이제 알겠어.`
  - ID 32187: `맹세를 기억하고, 이걸 받으세요. 이건 대사제 궁정의 별관, 즉 내 성소로 통하는 열쇠예요. 그곳에서 그림을 만날 거예요.`
- Active default CSV SHA-256 is
  `36b0df49e002071afd0101dbffd1e078226d96e4aae4275a5f7da6f0c74a9786`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- Register totals after this batch: 970 accepted, 3,593 `not an issue`, and
  5,872 uncertain (10,435 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 32201; 32,934 `default` IDs remain.

These working dispositions are not independent linguistic approval.
