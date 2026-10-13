# Disposition Batch: `default` IDs 31851-31900

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  31851-31900, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, historical notes, and recurring
  terminology.
- Decisions: one accepted, five `not an issue`, and seventeen uncertain.
- CSV changes: ID 31858 only.

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 31853 | Crossing flow / annihilation warning | Uncertain: danger is preserved, but the lore meaning of the Crossing flow remains open. |
| 31855-31857 | Grave Thresh / Gale Crossing / Alchemist Virtuoso | Uncertain: target/place/class-like status and canonical forms need glossary alignment. |
| 31858 | English `potion` payload in `{*1potion}`; `{1}` button token | Accepted: localize as `{*1물약}` based on Japanese/Chinese; preserve both `{*1}` and `{1}` tokens and order. |
| 31861 | `the Quays` / `부두` | Uncertain: capitalization may mark a named district, while Japanese/Chinese support a dock/wharf reading. |
| 31865 | Malformed `reward of us` / wife as reward contact | Not an issue: Korean directs the listener to the wife if the reward has not been received, preserving the supported intent without adding who provides it. |
| 31866 | `brother` / `오빠`; Scholia Arcana chapterhouse | Uncertain: older-brother reading is supported by Japanese/Chinese, but context and chapterhouse terminology need review. |
| 31872 | `gnomes' pet project` / `개인 연구 과제`; side income | Uncertain: contrast and side-income purpose are preserved; idiom force needs context. |
| 31875 | Incomplete `of Lightning Shield` continuation | Not an issue: Korean keeps the dependent fragment and invents neither a head phrase nor a completion. |
| 31878 | `Sr. Development Director` / `선임 개발 총괄` | Uncertain: locales differ on retaining versus translating the title; audience/status is unknown. |
| 31883 | Camp Moondown / `문 캠프`; original defenders | Uncertain: repeated place and defender fact are preserved, but name equivalence with Moon Camp is unresolved. |
| 31884 | Urul-Tusk / Piercing Light / General Tilera | Uncertain: quest goal and purpose are retained; names and item/ability terminology need alignment. |
| 31885 | `The House` / `하우스 오브 소로우즈` | Uncertain: English leaves the House unnamed; Japanese identifies House of Sorrows while Chinese is generic. |
| 31886 | Boy/body as instrument to cross into this world | Uncertain: metaphor is retained, but the speaker/entity and possession context are unidentified. |
| 31887 | Rathir chapterhouse letter / Adept promotion | Uncertain: facts, signature, and six line breaks are preserved; rank and mountain/peak forms differ across locales. |
| 31889 | Four-line Shaper poem | Uncertain: core landscape imagery and line count remain; literary imagery needs integrated review. |
| 31892 | `Master Mitharan Energizing Grip` / `명품 미타란 활력의 손잡이` | Uncertain: `Master` may indicate an item tier; component/ability terms need alignment. |
| 31893 | Ficon / `speaker of renown` / Court of Enchantments | Uncertain: storyteller identity remains, but `speaker` nuance and the formal Court name need review. |
| 31896 | `Shine and Shadow` / `샤인 앤드 섀도` | Uncertain: likely a named item/relic, but Chinese interprets it descriptively; canonical form is unresolved. |
| 31898 | House of Accolades / `영예의 전당` | Uncertain: likely a named institution/location; Korean rendering and House-name consistency need review. |
| 31900 | Learning to serve one's people by dying for them | Not an issue: all locales agree on the self-sacrifice conclusion and direct address to the Beckoned. |
| 31851-31900 | Four-locale order, line breaks, runtime tokens, and multi-line letter/poem | Not an issue: IDs/order, `{*1potion}`/`{1}`, `$STR0 $STR1`, six letter breaks, and four poem lines are preserved. |
| Remaining ordinary text in IDs 31851-31900 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported wording defect was identified beyond the accepted token localization and context-sensitive findings. |
| Other named terms in IDs 31851-31900 | Crossing / Grave Thresh / Gale Crossing / Alchemist Virtuoso / Quays / Scholia Arcana / Camp Moondown / Urul-Tusk / Piercing Light / House of Sorrows / Rathir / Shine and Shadow / House of Accolades and related terms | Uncertain: names, ranks, items, factions, and lore terminology need integrated glossary/context alignment. |

## Verification

- English, Japanese, Chinese, and Korean source rows for the findings above
  were directly compared and reconciled with historical open questions.
- The active historical heading starts its following range at ID 31900;
  source-key inspection confirms that 31900 belongs to this reviewed batch.
- ID 31858 now reads:
  `치유 {*1물약}을 선택하고 {1}을 눌러 체력을 회복하세요.`
- `{*1potion}` is localized without changing the `{*1}` wrapper identity or
  the following `{1}` button token. UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings remain intact.
- Active default CSV SHA-256 is
  `8206602429f430baea840fa6042399e2a8ea57ed8529a26e8f134eadc63d6660`.
- Register totals after this batch: 964 accepted, 3,566 `not an issue`, and
  5,814 uncertain (10,344 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 31901; 33,234 `default` IDs remain.

These working dispositions are not independent linguistic approval.
