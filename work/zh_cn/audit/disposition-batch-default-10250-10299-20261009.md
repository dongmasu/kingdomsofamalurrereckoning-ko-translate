# Disposition and Edit Batch: `default` IDs 10250-10299

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 10250-10299.
- English governs meaning; Japanese informs voice/register and structure;
  Chinese is supporting evidence. Historical questions were checked against
  active rows and recurring corpus terms.
- Thirteen findings received dispositions: three accepted, three `not an
  issue`, and seven uncertain.
- Three supported corrections were applied only to active Korean `Texto`
  cells. This is a working disposition, not independent final approval.

## Decisions

- ID 10254 is accepted: `a skin of water` is naturally rendered as
  `물주머니 하나`, retaining the waterskin meaning without the literal
  `물 한 가죽부대`.
- ID 10260 is accepted: the active `base` item corpus identifies Shan Gethen
  as `섄 게센(Shan Gethen)`; the prior `섀넌 게던` added syllables and
  conflicted with that same-character rendering.
- ID 10262 is `not an issue`: parentheses identify Anira as a name, and the
  active corpus repeatedly uses the same Witchknight title/name form.
- ID 10266 remains uncertain: the four-line verse is preserved, but its
  compressed geography, image relations, and proper names need literary
  review.
- ID 10270 remains uncertain: whether the retained `Unibox Combat Quest
  Giver` label is player-visible is unknown.
- ID 10278 remains uncertain: polite gentleness is preserved, but the
  possible innuendo and speaker context are unresolved.
- ID 10279 is accepted: the addressed person is Tine; `타인(Tine)` prevents
  the Korean from being read as the common noun `타인`.
- ID 10283 remains uncertain: English does not resolve whether returning
  means resurrection, recurrence, or recovery from imbalance.
- ID 10287 remains uncertain: `Arcane Carrack` may be a vessel/category name;
  canonical terminology is unverified.
- ID 10292 remains uncertain: the maxim's warning, joke, or prophetic force
  and its compact rhyme need literary review.
- ID 10296 is `not an issue`: Korean leaves the possessor of `its magic`
  implicit, as English does, and retains the temple's collapse.
- ID 10297 is `not an issue`: both the Erathi and their trained elite band
  accompanying them are retained; the `에라티` root matches active usage.
- ID 10298 remains uncertain: the Travelers faction is identifiable, but
  translated and transliterated Korean display forms coexist in the corpus.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 10254 | `...물 한 가죽부대도...` | `...물주머니 하나도...` | D-2936: render the waterskin naturally. |
| 10260 | `...섀넌 게던 중위...` | `...섄 게센(Shan Gethen) 중위...` | D-2937: align with the same character's established active-corpus form. |
| 10279 | `...사랑해요, 타인.` | `...사랑해요, 타인(Tine).` | D-2942: distinguish the addressee's name from the common noun. |

## Verification

- The active Korean `default` CSV has 65,135 sequential records (IDs 0-65134),
  a UTF-8 BOM, CRLF record endings, and no bare LF or CR bytes.
- IDs 10250-10299 exist in English, Japanese, Chinese, and active Korean with
  identical keys and order. Runtime-marker identity/order and embedded
  line-break counts match; IDs 10266 and 10279 retain their source lineation.
- Only the three approved Korean `Texto` cells at IDs 10254, 10260, and
  10279 changed in this batch.
- Active Korean `default` CSV SHA-256 after the edits:
  `66c944ad76598d90dfec1752af3427364c1ff0aea312bd196cf00fb05ba12c49`.
- Before this batch: 448 accepted, 909 `not an issue`, and 1,578 uncertain.
  After this batch: 451 accepted, 912 `not an issue`, and 1,585 uncertain.
- Direct findings and carried historical questions through ID 10299 now have
  dispositions. Resume at ID 10300; 54,835 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
