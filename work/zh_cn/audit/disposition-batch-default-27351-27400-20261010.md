# Disposition and Edit Batch: `default` IDs 27351-27400

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27351-27400, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and seven uncertain.
- Accepted correction at ID 27351 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27351 | Grim's escape from Ohn's Stand | Accepted: change `나는 탈옥을 돕기로 했다` to `나는 그의 탈옥을 도왔다`. English says the narrator helped orchestrate the escape as a completed action; the old Korean described only a decision/promise, following Japanese rather than the English semantic anchor. |
| 27352 | `wenches` -> `여자` | Uncertain: English and Japanese use a derogatory/sexualized register, while Korean is comparatively neutral. Preserve pending a voice-sensitive decision on how much of the source insult to retain. |
| 27358, 27369, 27375, 27377-27378, 27383-27384, 27396-27399 | Weave / benevolence / Aster Inheritance / Darkvari / Deireadh / Rond Farm / Lykeios / blessings and other setting terms | Uncertain: metaphysical concepts, factions, race/place names, and blessing/UI terminology require corpus-wide alignment. Preserve current forms. |
| 27373 | `winkle the honor` / Dirge Gwyngud | Uncertain: the English verb is unusual; Japanese reads as damaging the Justicar's honor, Chinese as winning it. Korean's damage reading is plausible but cannot be confirmed from this line. |
| 27374 | `Stages` -> `무대` | Uncertain: a stage, game level, and progress phase are all possible for this isolated UI label. |
| 27381 | `Lyria, what is more` -> `리리아여, 게다가…` | Uncertain: locale references differ on whether Lyria is an invocation or exclamation. Preserve the current direct-address reading pending scene context. |
| 27387 | `Well Progress Log` -> `샘 진행 기록` | Uncertain: `Well` may be a named in-world Well rather than a natural spring or generic system category. Confirm the game's UI/lore usage before changing the label. |
| 27391 | Ancestry `charter` -> `가문 특허장` | Uncertain: the document proves ancestry, but English does not establish a patent/grant as its legal form. Preserve pending terminology context. |
| 27355, 27361 | Might Ability value / Adessa upgrade-price variable | Not an issue: `+1` and `$NQD_City_Adessa.upgrade_price$` are preserved in the expected strings and order. |
| 27353-27354, 27356-27357, 27359-27360, 27362-27368, 27370-27372, 27376, 27379-27380, 27382, 27385-27386, 27388-27390, 27392-27395 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: reviewed wording generally retains the English meaning and Japanese-supported voice. Proper-name spellings remain subject to the project-wide terminology pass. |

## Verification

- The four-locale key/order, line-break, and runtime-token checks from the
  preliminary report remain valid.
- The narrator's completed assistance at ID 27351 is now explicit. The
  `+1` Might value at 27355 and upgrade-price variable at 27361 remain intact.
- Only the Korean `Texto` at ID 27351 changed; keys, variants, and row order
  were not changed.
- Active default CSV SHA-256:
  `69ebe30f84352d98e221df0d4ead9ce87a32e71acf1ad9364c93e6fa5d6f0fd3`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Register totals after this batch: 850 accepted, 2,949 `not an issue`, and
  4,904 uncertain (8,703 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27401; 37,734 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-12)

D-19360 resolves twelve prior uncertainty IDs as `not an issue`; D-19361
retains 27352, 27373-27374, 27387, and 27391 for insult, source, UI, and
document context. ID 27351's prior accepted correction is linked. Totals:
2,227 accepted / 24,706 `not an issue` / 11,591 uncertain (38,524). See
[`consolidated context review`](consolidated-context-review-default-27351-27400-20261012.md).
