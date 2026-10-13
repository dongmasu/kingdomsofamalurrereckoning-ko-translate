# Disposition and Edit Batch: `default` IDs 15550-15599

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split by source row.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and historical audit notes.
- Twenty-four source-row decisions: two accepted, four `not an issue`, and
  eighteen uncertain. Uncertain rows remain unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 15551 remains uncertain: Korean follows English `Chapter VI`, while
  Japanese says Chapter 4 and Chinese interprets Arcadium as an arena; venue
  identity and the source conflict remain open.
- IDs 15553 and 15572 remain uncertain: the threats and Ynadon references are
  preserved, but the idiom at 15572 and the broader name/lore context are not
  settled.
- ID 15555 remains uncertain: the rescue attempt and missing charm are
  preserved; `murghan` creature terminology and names need context.
- ID 15561 is accepted: replace `생명` with `성장` and express the source
  sequence as `여름에서 겨울로, 성장에서 부패로`. English says `growth`,
  not life; season/Court personification remains unresolved.
- ID 15562 remains uncertain: `Remains` may identify a corpse, object remains,
  or a quest item; Japanese specifies a corpse, but English does not.
- ID 15563 is `not an issue`: the general base Physical-damage mechanic and
  its effectiveness against every enemy type are both preserved.
- ID 15566 remains uncertain: `the scarecrow` may be a literal image or
  title/nickname; context is absent.
- ID 15568 is `not an issue`: `효과 보기` concisely preserves the view action;
  Japanese supports a status-effects interpretation.
- ID 15570 remains uncertain: the dismissive comment is retained, but Cape
  Solace has inconsistent Korean place-name forms.
- ID 15571 is accepted: move the URL to the end of the sentence and introduce
  it as an address, keeping the exact URL and `{LINE_CENTER}` marker. This
  prevents the following Korean particle from appearing to be part of the
  URL.
- ID 15579 remains uncertain: Alyn Shir and Arden's Hut spellings and the
  message's source need corpus/context review.
- ID 15580 remains uncertain: Gravehal and Akara spellings are provisional;
  `aura` may be a bounded protective region, but the canonical term is open.
- ID 15582 remains uncertain: the Greater Niskaru/Balor apposition and
  canonical enemy/name forms need alignment.
- ID 15583 is `not an issue`: the objective preserves finding the Court
  Sanctums; English and Chinese support the literal court-sanctum reading.
- IDs 15584 and 15585 remain uncertain: the religious sense of
  `sanctification`, Kollossae, and Primal Magic terminology need context and
  corpus alignment.
- ID 15587 remains uncertain: the unusual lowercase source `awesomea` may be
  a joke, placeholder, or intentional name; do not normalize it without
  evidence.
- ID 15589 is `not an issue`: the silent vigil, battlefield comparison,
  reunion, and shared claim to happiness are preserved.
- ID 15590 remains uncertain: the item category and canonical Mitharan,
  quality-tier, and armor-modifier terms are not established.
- ID 15591 remains uncertain: `It burns` does not state where or how; Korean
  adds a mouth location, while the exact Star Thistle name and joke need
  context.
- ID 15593 remains uncertain: capitalized `Winter` may be a Court/personified
  power or the season; preserve the vow pending lore context.
- IDs 15598 and 15599 remain uncertain: King of Cups, Irion, and Castle
  Windemere need canonical title/name forms.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 15561 | `...여름은 겨울로, 생명은 썩음으로...` | `...여름에서 겨울로, 성장에서 부패로...` | D-4796 |
| 15571 | `...자세한 내용은 http://code.google.com/p/recastnavigation/을 참조하세요.` | `...자세한 내용은 다음 주소에서 확인하세요: http://code.google.com/p/recastnavigation/` | D-4802 |

## Verification

- The preliminary structural audit reports all 50 IDs in identical order
  across the four locales, matching line-break/runtime-marker signatures.
  `{LINE_CENTER}` remains present and in place; the URL text is unchanged.
- Only the two accepted Korean `Texto` values changed. The active CSV
  retains its UTF-8 BOM, 72,046 CRLF record endings, and 39 pre-existing
  bare-LF endings.
- The active Korean `default` CSV SHA-256 is
  `1946a16de9449e0864eb1655a15590ec4dde88449f780293b9e4a4b327a5b53f`.
- Before this batch: 605 accepted, 1,493 `not an issue`, and 2,694 uncertain.
  After this batch: 607 accepted, 1,497 `not an issue`, and 2,712 uncertain
  (4,816 decisions total).
- Resume at ID 15600; 49,535 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
