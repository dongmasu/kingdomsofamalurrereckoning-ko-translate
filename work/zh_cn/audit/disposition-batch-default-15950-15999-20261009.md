# Disposition and Edit Batch: `default` IDs 15950-15999

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split into 22 decisions where
  multi-row findings required distinct row-level dispositions; reconciled
  against active Korean, English meaning, Japanese voice/register, Chinese
  supporting evidence, and historical audit questions.
- Decisions: two accepted, seven `not an issue`, and thirteen uncertain.
- Two supported Korean `Texto` corrections were applied. Uncertain candidates
  remain unchanged. These are working dispositions, not independent final
  linguistic approval.

## Decisions

- ID 15950 remains uncertain: English identifies a `Mitt`, Chinese specifies
  a glove, and Japanese transliterates the full item-like name. Whether to
  translate the equipment category or retain a named-item form is unresolved.
- ID 15951 remains uncertain: the defiant meaning is preserved, but the
  canonical form and status of `Travelers` and the plural/group wording need
  broader alignment.
- ID 15952 is `not an issue`: the six-line passage retains the peace,
  meditation, invasion, forest destruction, and stanza break; its names and
  imagery follow the English meaning.
- ID 15953 remains uncertain: English and Chinese support an overgrown thicket,
  while Japanese reads a jungle cave; location context is unavailable.
- IDs 15959-15961 remain uncertain: the quest sequence is retained, but
  House of Valor, Victory Games, Vox Victorium, Rithen, and related forms need
  corpus-wide name alignment.
- IDs 15963-15965 remain uncertain: the challenge, Ragnarr's prospective
  conflict, the Headsman's suicide, and return objective are retained; several
  title/name forms and the reporting phrase need broader context.
- ID 15967 remains uncertain: `High Roll` may be a named game, and the short
  prompt does not establish its Korean UI/title form.
- IDs 15971 and 15974 remain uncertain: the elimination threat is preserved,
  but the object omitted from `Can you do without?` is not present in context.
- ID 15977 is `not an issue`: the exact `#NAMED_ICON_360_LS#` token is
  preserved and the movement instruction remains aligned with the references.
- IDs 15978-15979 are `not an issue`: the staff's burning Chaos vestiges are
  retained, and `Dokkalfar` follows the established Korean form `도크알브`.
- ID 15981 remains uncertain: pass control is clear, but `Dolve Arne` is
  variously presented as a location, castle, or other named post.
- ID 15983 is `not an issue`: the long-running rumor about soldiers attacking
  the Tuatha and the speaker's lack of confirmation are preserved.
- ID 15984 is `not an issue`: the City Watch service greeting is rendered
  naturally without changing its courteous intent.
- ID 15985 remains uncertain: the reluctance to go to the upper realms is
  retained, but the idiom `has no stomach for` may be stronger than simple
  unwillingness and needs voice/context review.
- ID 15988 is `not an issue`: the conditional return to Fate's weave, the
  vanished influence, and comparison with Tirnoch's emergence are retained.
- IDs 15990-15991 remain uncertain: the accusation and requested response are
  preserved, but the canonical forms of Flame of Rhyderk and associated names
  require alignment.
- ID 15992 is accepted: change `마지막 부품` to `마지막 깃털`. English first
  identifies the Alpha Pteryx's vanes; Japanese and Chinese explicitly say
  feathers for the final required pieces. `부품` implies manufactured parts
  and is unnatural for the stated feather-gathering task.
- ID 15994 remains uncertain: the relation of `Delvers`, `our House`, and
  `the Sorrows' location` is lore-dependent; the explicit House of Sorrows
  expansion is not established by the row's references.
- ID 15995 remains uncertain: the grotesque spider image and sarcastic
  leadership question are present, but the sentence's subject and town
  outcome need scene context.
- ID 15996 is accepted: change `회관을 떠난` to `회관에서 도망친`. English
  says Aloren fled the Ysa Chapter House and Japanese explicitly says escaped;
  `떠난` weakens that action to merely leaving.
- ID 15998 is `not an issue`: Bleeding and Poison remain at 55%, and Shadow
  Flare damage remains at 40%.
- ID 15999 remains uncertain: former Court of Summer membership and relative
  importance are retained; the canonical title form for Lord of the Chase
  needs alignment.

## Verification

- The preliminary structural check found all 50 IDs in identical order across
  the four locales, with matching embedded line-break counts and runtime-token
  identities/order. No structural exception was reported. The two edited rows
  contain no runtime tokens or embedded line breaks.
- Only Korean `Texto` values at IDs 15992 and 15996 changed. The active CSV
  retains its UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF
  endings.
- Post-edit SHA-256:
  `590af67de306094fdc27637d954212530fd0224c4a608743409df6fbac22abf9`.
  Reversing only the two approved text changes reproduces the pre-batch
  checkpoint hash `81138eb9348035b7603cf105c0039a9940f762ce135225057cf748b640a5cd2e`.
- Before this batch: 614 accepted, 1,542 `not an issue`, and 2,819 uncertain.
  After this batch: 616 accepted, 1,549 `not an issue`, and 2,832 uncertain
  (4,997 decisions total).
- Resume disposition work at ID 16000; 49,135 `default` rows remain. The
  preliminary report for IDs 16000-16049 already exists.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
