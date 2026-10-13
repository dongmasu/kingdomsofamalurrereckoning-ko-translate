# Disposition and Edit Batch: `default` IDs 16350-16399

- Decision date: 2026-10-09.
- Scope: preliminary findings in the range, split into 21 decisions where
  separate rows warranted distinct dispositions; compared active Korean with
  English meaning, Japanese voice/register, Chinese supporting evidence,
  historical audit questions, and recurring terminology.
- Decisions: three accepted, seven `not an issue`, and eleven uncertain.
- Three supported Korean `Texto` corrections were applied. Uncertain
  candidates remain unchanged. These are working dispositions, not independent
  final linguistic approval.

## Decisions

- ID 16350 remains uncertain: the Faer Gorta summon and ability-upgrade
  sequence are retained, but the ability names and whether Masterful
  Construction is a skill or mastery need terminology alignment.
- ID 16354 remains uncertain: `Livrarium` is transliterated, but its
  institutional identity and canonical Korean name are unknown.
- ID 16356 is accepted: change `정남서쪽` to `남서쪽`. English says “due south
  and west,” while Japanese and Chinese explicitly say southwest; `정남서쪽`
  is awkward and obscures the natural direction.
- ID 16358 is `not an issue`: survival of two night raids, loss of healer and
  weaponsmith, and the dismissive aside about mercenaries are preserved.
- ID 16361 is `not an issue`: the hesitant offer to follow behind at a safe
  distance retains the comic tone.
- ID 16364 is `not an issue`: resting and selling findings between excursions
  are both conveyed.
- ID 16365 remains uncertain: `Equip Spell 2` is clearly rendered as
  `주문 2 장착`, but the game's preferred equipment-menu wording is unknown.
- IDs 16366-16368 remain uncertain: the assassination request, Mel Senshir's
  long siege, and conditional gold reward are retained; proper names and
  terminology need alignment.
- IDs 16371-16374 remain uncertain: Travelers, disobedience and failed hunt,
  crudok, and the Mystic Hammer objective are preserved; faction, creature,
  and ability names need consistency review.
- ID 16376 remains uncertain: `Mana Steal` is rendered as `마나 흡수`; the
  canonical stat/ability term needs glossary verification.
- IDs 16377-16380 are `not an issue`: resuming experiments, the blocked second
  mine, the bad-fortune aside, and the 20% enemy-Armor reduction are retained.
- ID 16381 is `not an issue`: the Fate-based contrast, chance to succeed, and
  assurance of help are preserved.
- ID 16382 is accepted: change `그를 쓰러뜨려야 한다` to
  `그녀를 쓰러뜨려야 한다`. English explicitly refers to Mayor Flanagan as
  `her`, and Chinese agrees; the existing Korean uses a masculine pronoun.
- ID 16383 is `not an issue`: the latest cry for help, direction to Emaire,
  and quoted “Shardfall has come alive” question are retained.
- ID 16384 remains uncertain: anthology and nested chronicle titles are
  preserved, but title formatting and canonical Korean forms need alignment.
- ID 16387 remains uncertain: seasons spent learning to serve the Summer
  Court and resentment that Titarion does not care are present; Sidhe/Court
  terminology needs corpus review.
- ID 16389 remains uncertain: armor construction, six months of nightly blood
  painting, worn Fae spirals, and blood-drinking effect are retained; epithet
  and lore-name forms remain open.
- IDs 16391-16394 are `not an issue`: the blessing, refugee question, greeting,
  and violent ear-collecting line preserve the source meaning and register.
- ID 16395 is accepted: replace `지식을 갈망하는 사람이라면 누구든 내 집에서
  환영하오` with `지식을 갈망하는 사람이라면 누구에게든 기꺼이 말벗이 되어
  주겠소`. English `my company` means companionship here, supported by
  Japanese and Chinese; the old Korean adds a house/location absent from the
  source.
- ID 16396 remains uncertain: `어쩔 건데?` adds a confrontational “what will
  you do?” to “What if I choose you?”; without scene context, the intended
  challenge or threat cannot be settled.
- ID 16399 remains uncertain: Chinese supports literal pillars while Japanese
  reads a canopy/crown; the isolated label does not identify the referent.

## Verification

- All four locale files contain 50 rows with IDs 16350-16399. The preliminary
  structural check recorded matching embedded line-break counts and normalized
  runtime-token identities/order.
- Only Korean `Texto` values at IDs 16356, 16382, and 16395 changed. The
  active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing
  bare-LF endings.
- Post-edit SHA-256:
  `54568419043835f2e691782157edcdb48411a837354749d32828cd318adf0462`.
  Reversing only these three text changes reproduces the preceding checkpoint
  hash `a5ce0584d3ef2ca3fada20df6a3679a462d9bd935919674a7deae56087d5d725`.
- Before this batch: 625 accepted, 1,591 `not an issue`, and 2,924 uncertain.
  After this batch: 628 accepted, 1,598 `not an issue`, and 2,935 uncertain
  (5,161 decisions total).
- Resume disposition work at ID 16400; 48,735 `default` rows remain. The
  preliminary report for IDs 16400-16449 should be checked before proceeding.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
