# Disposition and Edit Batch: `default` IDs 16500-16549

- Decision date: 2026-10-09.
- Scope: preliminary findings and carried historical questions in the range,
  recorded as 15 decisions; compared active Korean with English meaning,
  Japanese voice/register, Chinese supporting evidence, and recurring terms.
- Decisions: one accepted, six `not an issue`, and eight uncertain.
- One supported Korean `Texto` correction was applied. Uncertain candidates
  remain unchanged. These are working dispositions, not independent final
  linguistic approval.

## Decisions

- IDs 16503 and 16507 remain uncertain: English `regulars` supports Korean
  `단골`, while Japanese/Chinese describe a subordinate or soldier. Mitharu
  and Mithros also need canonical-form alignment.
- ID 16504 remains uncertain: `Rathir Chapter` is rendered `라시르 지부`;
  branch/institution terminology and the Rathir name need corpus alignment.
- ID 16508 remains uncertain: the restrained implication of paranoia is
  preserved, but Scholar Hugues' name and the Allestar incident terminology
  remain unverified.
- ID 16516 remains uncertain: the tutorial meaning is retained, but the
  canonical Korean category for Fist weapons needs gameplay-glossary review.
- ID 16518 is accepted: change `부적을 제자리에 꺼내는 자` to
  `부적을 제자리에서 꺼내는 자`. English and Japanese say the amulet is
  removed from its resting place; Korean's old `제자리에` uses the wrong
  spatial particle.
- ID 16523 remains uncertain: flawless quality and divine-rivet components
  are retained, but the item compound and Mitharan spelling need terminology
  alignment.
- ID 16530 remains uncertain: the delivery, title, and value of the ballad
  are retained; whether Fae Cairns is a collection/location and the title's
  canonical form need context.
- ID 16534 is `not an issue`: the active Korean explicitly says
  `꽃 3송이 중 {1}송이`, so the denominator is already present. The
  preliminary candidate alleging its omission does not match the current row.
- ID 16535 is `not an issue`: Mitharu's gift of nature to mortals and Fae, the
  memory/confession contrast, and the source-matched line layout are retained.
- ID 16539 is `not an issue`: discovering and translating the old unknown-
  language book, its effect on concentration, and the narrator's sanity are
  conveyed.
- ID 16540 is `not an issue`: the `[Upgrade]` text is localized as
  `[강화]` and the `{*1...}` wrapper is retained.
- ID 16541 remains uncertain: Tuven's theft accusation and gemstone motive
  are retained, but `Augur` and `chief scoundrel` may denote an institution
  and rank or merely emphatic description.
- ID 16543 is `not an issue`: `시약` and `조제법` convey reagents and recipes;
  both `{*1...}` wrappers and `{LINE_SPACE}` remain in order.
- ID 16545 remains uncertain: the memorial's formal register and Lieutenant
  Gancha's deeds are preserved, but Alfar/Tywili name forms need alignment.
- ID 16549 is `not an issue`: the informal closing matches English and
  Japanese; the Chinese formality difference alone does not establish a Korean
  register error.

## Verification

- All four locale files contain 50 rows with IDs 16500-16549. The preliminary
  structural check recorded matching embedded line-break counts and normalized
  runtime-token identities/order, including the `{1}` flower variable,
  localized `{*1...}` wrappers, and `{LINE_SPACE}`.
- Only Korean `Texto` at ID 16518 changed. The active CSV retains its UTF-8
  BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings.
- Post-edit SHA-256:
  `d914bc837527cdab04f1ac6d609853c3769b48d6a23ffea4a9215782baac775e`.
  Reversing only this text change reproduces the preceding checkpoint hash
  `6617c8882d910bfa544de86fab567184ed0acf1c83dd20c73bee47197baebdef`.
- Before this batch: 630 accepted, 1,604 `not an issue`, and 2,952 uncertain.
  After this batch: 631 accepted, 1,610 `not an issue`, and 2,960 uncertain
  (5,201 decisions total).
- Resume disposition work at ID 16550; 48,585 `default` rows remain. The
  preliminary report for IDs 16550-16599 should be checked before proceeding.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
