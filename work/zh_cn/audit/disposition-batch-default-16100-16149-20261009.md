# Disposition and Edit Batch: `default` IDs 16100-16149

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split into 28 decisions where
  multi-row findings needed distinct row-level dispositions; compared against
  active Korean, English meaning, Japanese voice/register, Chinese supporting
  evidence, recurring terminology, and historical audit questions.
- Decisions: two accepted, ten `not an issue`, and sixteen uncertain.
- Two supported Korean `Texto` corrections were applied. Uncertain candidates
  remain unchanged. These are working dispositions, not independent final
  linguistic approval.

## Decisions

- IDs 16100-16101 remain uncertain: the arrival at the Dark Maze entrance,
  search for Missives, and Keepers' maintenance of the Crossing are retained;
  proper-name forms and the document/object sense of Missives remain open.
- ID 16102 is `not an issue`: `{*1}` and `{LINE_SPACE}` are preserved in order,
  and the deity-specific temporary-bonus explanation is intact.
- ID 16103 is `not an issue`: the +35% Damage Resistance While Dodging value
  and condition are preserved.
- ID 16104 remains uncertain: `MiniMerchant` may be a player-facing label or
  concatenated internal key; Korean spacing cannot be settled without UI context.
- ID 16107 is `not an issue`: black coral reaching skyward and threatening the
  island, plus permanent +1 Mana Regeneration, are retained.
- ID 16108 remains uncertain: Korean follows English's “second step,” while
  Chinese calls it the second stop; route context may distinguish stage from
  location.
- ID 16110 remains uncertain: `Knave of Coins` may be a formal title/rank or
  an insult; locale readings diverge.
- IDs 16111-16114 remain uncertain: Caeled Coast stories, the Blood and Steel
  label, the definitive Godstorm work, and petition to Primos are retained;
  names/title and Primos' rank or group status need context.
- ID 16115 is `not an issue`: the Star Camp welcome, Traveler address, and
  invitation to trade, rest, and enjoy oneself are preserved.
- ID 16116 remains uncertain: `KandrianCoveSwimEntrance` may be an internal
  location key or player-facing text; its translated, concatenated source
  status is unresolved.
- ID 16118 is accepted: change `서문` to `서장` in “Tyr Magnus's Memoirs:
  Prologue.” English `Prologue` and Japanese `序章` denote a narrative
  prologue, not a foreword/preface.
- ID 16119 is `not an issue`: the account that the Erathi imprisoned
  Khamazandu in the mountain after it proved too clever to kill is retained.
- ID 16120 is accepted: replace the statement that the dagger failed to bring
  the speaker luck with `내게 준 것보다 더 큰 행운을 네게 안겨 주길 바라`.
  English, Japanese, and Chinese compare the fortune it brought the speaker
  with what it may bring the listener; the current Korean adds failure/zero
  fortune not stated by the source.
- ID 16121 remains uncertain: `Bastion of Rock` is rendered as `바위 요새`,
  but the title's status and canonical place form are unknown.
- ID 16122 is `not an issue`: Quake's +20% damage, 25% chance of a 3-second
  Stun on the final hit, +12 Mana cost, and separate line are preserved.
- IDs 16124-16126 remain uncertain: transfer to Allestar, continued research
  producing monsters, thanks on behalf of Culn's villagers, and Besin
  following Fahrlang's path are retained; names and research context need
  alignment.
- ID 16128 remains uncertain: the collective hunt for traitors and blood/land
  growth image are preserved; whether land growth is literal, cultural, or
  restorative remains unclear.
- ID 16134 remains uncertain: human blood, recent passage, and likely short
  remaining life are retained; how the blood's layout supports the inference
  needs scene context.
- IDs 16135-16136 remain uncertain: Korean follows English's `Alley's` reading
  for Asker's Alley, but Japanese and Chinese describe a tavern and valley;
  Zungar Shaft's proper-name form also needs alignment.
- ID 16138 remains uncertain: `Prodigy` may denote a gifted person, ability,
  or UI category; `신동` assumes the person is a child, but the isolated label
  does not establish the referent.
- IDs 16139-16140 remain uncertain: the Winter Court's corruption by talk of
  a new god and the Tuatha's rise are preserved; the lore's causal/figurative
  force and Court terminology need context.
- ID 16143 is `not an issue`: the speaker's threat to rough up the addressee
  while keeping them alive for vivisection retains both violence and purpose.
- ID 16144 remains uncertain: `Druinkard` may be a proper name/title or a
  drunkenness insult; references differ.
- ID 16145 remains uncertain: `Quarters` may mean a poor district, residence,
  or institutional area; the English wordplay and Korean `빈민가` need context.
- ID 16146 is `not an issue`: the merchant's trickery and the speaker's shame
  are retained.
- ID 16147 is `not an issue`: the `Sell` UI label is translated concisely.
- ID 16148 is `not an issue`: `The World of Amalur` is rendered naturally as
  `아말루르의 세계`.
- ID 16149 remains uncertain: `good silver`, salvaging “it,” and the generic
  coin payment depend on missing antecedent/context; Korean's silver/gold
  interpretation remains provisional.

## Verification

- All four locale files contain the same 50 IDs in this range. The preliminary
  structural check found matching embedded line-break counts and runtime-token
  identities/order. ID 16102 retains `{*1}` and `{LINE_SPACE}`; ID 16122
  retains its separate two-line effect and all values.
- Only Korean `Texto` values at IDs 16118 and 16120 changed. The active CSV
  retains its UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF
  endings.
- Post-edit SHA-256:
  `6036385652845304bd41314250168b87fe16ef2ffe25e67a88d66232bacf5c50`.
  Reversing only these two text changes reproduces the preceding checkpoint
  hash `f2c6eac2e822c464e309dfc3c81bf8d7f4e8b6c28dd5e28ce555f6a516590d97`.
- Before this batch: 621 accepted, 1,562 `not an issue`, and 2,861 uncertain.
  After this batch: 623 accepted, 1,572 `not an issue`, and 2,877 uncertain
  (5,072 decisions total).
- Resume disposition work at ID 16150; 48,985 `default` rows remain. The
  preliminary report for IDs 16150-16199 already exists.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
