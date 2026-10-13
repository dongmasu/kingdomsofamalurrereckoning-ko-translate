# Disposition and Edit Batch: `default` IDs 13650-13699

- Decision date: 2026-10-09.
- Scope: all 17 candidate findings in the preliminary report.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Seventeen findings received dispositions: three accepted, two `not an
  issue`, and twelve uncertain.
- Three accepted decisions were applied at IDs 13675, 13690, and 13694; the
  Silent Choir normalization also updates linked occurrence 13562.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13650 remains uncertain: English/Chinese identify a magical Court,
  while Japanese says Hall of Heroes; the canonical place/faction identity is
  unresolved.
- ID 13658 remains uncertain: the drink/substance and whether `sweet sorrow`
  is its proper name are not identified.
- ID 13662 remains uncertain: this may be a named game creature or the common
  will-o'-the-wisp phenomenon; active Korean uses both transliteration and
  `도깨비불`.
- ID 13666 remains uncertain: the isolated `Georgia` label does not
  distinguish the country, U.S. state, or a person/place name.
- ID 13668 remains uncertain: `The Offering` may be a named rite, but
  alignment with ID 13557 and the intended event term remain open.
- ID 13669 remains uncertain: capitalization suggests a title, while
  Japanese and Chinese render recurring conflict; context is absent.
- ID 13670 remains uncertain: the `King of Cups` title's tarot/lore function
  and canonical Korean form remain unsettled across repeated occurrences.
- ID 13672 remains uncertain: the line may refer to death/afterlife,
  immortality, or another fate; locale readings conflict.
- ID 13673 remains uncertain: the epithet/name structure and Corthis
  spelling are not settled by locale phonetics.
- ID 13675 is accepted: replace `메이드 오브 포춘(Maid of Fortune)호` with
  `행운의 시녀호(Maid of Fortune)`. The references identify a ship, and the
  same vessel already uses this accepted Korean name (D-1281).
- ID 13679 remains uncertain: active Korean contains several Alyn Shir
  spellings, and locale phonetics do not establish one canonical form.
- ID 13690 is accepted: replace `투아사가 10년 동안 손대지 않은 곳이라는 건`
  with `투아사가 10년 동안 손대지 않았다는 건`. English leaves `it`'s
  antecedent unstated; Korean adds an unsupported `곳` (“place”).
- ID 13692 is `not an issue`: the localized display label remains inside the
  same single `{*1...}` marker in all locales.
- ID 13694 is accepted: replace `무언의 합창단` with `침묵의 합창단` at
  IDs 13694 and linked occurrence 13562 to align the named faction with the
  predominant active-corpus form. Preserve each row's English-name markup
  and sentence context.
- ID 13695 is `not an issue`: `반사 확률 12%` matches established active
  terminology and preserves the value.
- ID 13696 remains uncertain: the isolated Detyre name and differing locale
  phonetics do not establish a canonical Korean spelling.
- ID 13697 remains uncertain: the quest sequence is preserved, but related
  proper-name spellings require cross-entry terminology review.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13562 (linked) | `무언의 합창단` | `침묵의 합창단` | D-4062 |
| 13675 | `메이드 오브 포춘(Maid of Fortune)호` | `행운의 시녀호(Maid of Fortune)` | D-4058 |
| 13690 | `투아사가 10년 동안 손대지 않은 곳이라는 건` | `투아사가 10년 동안 손대지 않았다는 건` | D-4060 |
| 13694 | `무언의 합창단` | `침묵의 합창단` | D-4062 |

## Verification

- The four locale files contain IDs 13650-13699 once each and in identical
  ascending order. The preliminary structural audit found matching record
  line-break counts and runtime-token signatures throughout this range.
- Three accepted decisions changed four Korean `Texto` cells at IDs 13562
  (linked), 13675, 13690, and 13694. Their row keys and surrounding records
  remain unchanged.
- Before this batch: 549 accepted, 1,308 `not an issue`, and 2,191 uncertain.
  After this batch: 552 accepted, 1,310 `not an issue`, and 2,203 uncertain
  (4,065 dispositions total).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edits is
  `729ae161df77b3a8aa7761a7f8f3e6c38cb27d2a5970c1293814c7389a597377`.
- Reversing only the four approved text-cell changes must restore the
  preceding batch's CSV SHA-256:
  `81baa8187537dec4e2a070e7f2bed5665830a2d63f698719ab36d5498a3059b5`.
- A generic standard-library CSV parse is not used because the existing
  corpus contains multiline/quoting forms it rejects; key order in this
  range was checked line-by-line across all four locale files.
- Resume at ID 13700; 51,435 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
