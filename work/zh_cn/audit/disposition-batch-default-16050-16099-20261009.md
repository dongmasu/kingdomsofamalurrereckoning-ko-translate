# Disposition and Edit Batch: `default` IDs 16050-16099

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split into 25 decisions where
  multi-row findings needed distinct row-level dispositions; compared against
  active Korean, English meaning, Japanese voice/register, Chinese supporting
  evidence, recurring terminology, and historical audit questions.
- Decisions: two accepted, nine `not an issue`, and fourteen uncertain.
- Two supported Korean `Texto` corrections were applied. Uncertain candidates
  remain unchanged. These are working dispositions, not independent final
  linguistic approval.

## Decisions

- ID 16050 is `not an issue`: the English source has a subject-verb agreement
  error; Korean follows the unfinished-task meaning supported by Japanese and
  Chinese. `뭘 도와줄까?` is a natural equivalent in the exchange.
- ID 16052 remains uncertain: the request and attack relationship are
  preserved, but the instructor, institution, destination, and priestess
  names need corpus-wide alignment.
- ID 16053 is `not an issue`: both Greatsword bonus lines and values (`+12`
  physical damage and `+20%` damage) are preserved in separate lines.
- ID 16054 remains uncertain: protection/concealment, the Elemental Cloak,
  personal armor, and the ascetic mages' provenance are conveyed; canonical
  equipment, sea, and mage terminology remain open.
- IDs 16058-16062 remain uncertain: the conversation's greeting, former vow,
  reconsideration, and bandit-related postponement are retained; Dennrit Rond
  and Victory Games need name alignment.
- ID 16063 remains uncertain: route and instruction are preserved, but whether
  Plagueshield is an item or lore/faction term is unresolved.
- ID 16064 remains uncertain: English `wring`, Japanese “kill,” and Chinese's
  twisting wording differ in specificity; Korean's explicit neck-twisting
  method is left unchanged pending context.
- IDs 16065-16068 remain uncertain: ostracism, power, crudok attacks, and
  Jottun kill-label meaning are present; House, creature, name, and UI terms
  need alignment.
- ID 16070 remains uncertain: `Dream Bracer` is transliterated/transcreated
  as `꿈의 완갑`; the canonical item form needs equipment-context review.
- ID 16075 is accepted: replace `쓸모 있는 작은 결과` with
  `쓸모 있는 뜻밖의 결과`. English says the experiments produced a “useful
  little surprise”; the current wording loses the surprise and reads as a
  literal calque. Japanese/Chinese support an unspecified useful outcome, so
  the revised wording does not invent its identity.
- ID 16077 remains uncertain: the freedom/service-cost argument is retained,
  but Hierophant's formal title and the force of acquiescing need lore-wide
  terminology review.
- ID 16078 remains uncertain: `Varani Longship` is rendered as `바라니 장선`;
  ship-category and established Varani terms need consistency review.
- ID 16079 is `not an issue`: `definitive biography` is naturally expressed
  as `결정판 전기`, supported by Japanese and Chinese.
- ID 16082 is `not an issue`: retreat to the keep, refusal to emerge, and
  abandonment of Kandrian people to protect himself and his family name are
  preserved.
- ID 16083 is accepted: change `덩굴로 뒤덮인 짐승` to
  `덩굴로 이루어진 짐승`. English says “a beast of many vines,” and Japanese
  explicitly says a beast composed of numerous vines; “covered by vines”
  changes the creature's composition.
- ID 16087 remains uncertain: the island name's canonical Korean form is not
  established by the locale spellings.
- ID 16088 is `not an issue`: the speaker's relief and ability to sleep more
  easily after learning his wife is safe are retained.
- ID 16089 is `not an issue`: Aurenda's projection dissipates and the
  inadvertently summoned wild Fae disperse from the mine entrance.
- ID 16090 is `not an issue`: the western edge of the Phorian Strait and the
  coast bearing the brunt of the invasion ten years earlier are preserved.
- ID 16091 is `not an issue`: the celebratory mayoral cheer is retained.
- ID 16092 remains uncertain: the guard's promise to stay until replacements
  arrive is clear, but `Crossing` may be a named place or post.
- ID 16094 remains uncertain: `Neophyte` is plausibly `수련생`, but the rank
  and Seon Agdan's canonical spelling need alignment.
- ID 16096 is `not an issue`: the speaker's gratitude, the collective
  agreement, and the unaware thousands are all retained.
- ID 16097 remains uncertain: reagent names, the potion category, and
  established ingredient terms need glossary review; quantities and paragraph
  spacing are preserved.
- ID 16099 remains uncertain: the distinction between lack of Fate and the
  player's whole nature is present, but the final evaluation phrasing depends
  on speaker/lore context.

## Verification

- All four locale files contain the same 50 IDs in this range. The preliminary
  structural check found matching embedded line-break counts and runtime-token
  identities/order. The two Greatsword bonus lines remain separate, ID 16097's
  blank-line recipe layout and quantities remain intact, and no token mismatch
  was reported.
- Only Korean `Texto` values at IDs 16075 and 16083 changed. The active CSV
  retains its UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF
  endings.
- Post-edit SHA-256:
  `f2c6eac2e822c464e309dfc3c81bf8d7f4e8b6c28dd5e28ce555f6a516590d97`.
  Reversing only these two text changes reproduces the preceding checkpoint
  hash `be773a06b5607c8db979c0c803ab60f3e8c9caa1cc086f2c08e795b2c4db353a`.
- Before this batch: 619 accepted, 1,553 `not an issue`, and 2,847 uncertain.
  After this batch: 621 accepted, 1,562 `not an issue`, and 2,861 uncertain
  (5,044 decisions total).
- Resume disposition work at ID 16100; 49,035 `default` rows remain. The
  preliminary report for IDs 16100-16149 already exists.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
