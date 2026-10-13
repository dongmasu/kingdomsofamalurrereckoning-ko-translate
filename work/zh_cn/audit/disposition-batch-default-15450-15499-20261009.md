# Disposition and Edit Batch: `default` IDs 15450-15499

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split by source row when
  findings covered multiple IDs.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, terminology, and historical audit notes.
- Twenty-six source-row decisions: two accepted, six `not an issue`, and
  eighteen uncertain. Uncertain rows remain unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 15450 remains uncertain: English says `Crossing`, Japanese treats it as
  a quoted name, and Chinese uses a generic pass/gate form; place-name status
  and Korean display form are unresolved.
- ID 15457 remains uncertain: shop-name styling is not established, although
  the courteous welcome, merchandise, quality, and patronage invitation are
  preserved.
- ID 15460 remains uncertain: `Bloody Bones` may be a person, creature type,
  or title; the isolated label does not settle whether to translate or
  transliterate it.
- ID 15461 remains uncertain: English itself leaves the creature's desire
  incomplete; Korean preserves the fragment without supplying an object.
- ID 15462 remains uncertain: `Hyperian Guard` may be an affiliation, unit,
  or generic role; the canonical title form is unknown.
- ID 15464 remains uncertain: English names a `Water Lock`, while references
  differ on whether it denotes a lock mechanism or water gate.
- ID 15466 is `not an issue`: `Board The Chimera` is correctly rendered as
  boarding a named ship; Chinese also uses a ship suffix.
- ID 15467 is `not an issue`: the objective preserves exiting Solstice.
- IDs 15468 and 15469 remain uncertain: Yolvan and Aurenda transliterations
  differ across locales and lack confirmed Korean spellings.
- ID 15471 is `not an issue`: the magic critical-strike chance and exact
  `+15%` value are preserved.
- ID 15473 remains uncertain: English `circles` and the recipients of the
  gods' reward are less specific than the Korean magical-circle reading;
  Japanese and Chinese do not resolve the difference.
- ID 15474 is accepted: replace `코렐론 사제장` with `코렐론 여사제`.
  English says `Priestess Corelon`; it does not establish a chief-priest
  office. Japanese uses a generic priest term and Chinese specifies a
  priestess.
- ID 15475 remains uncertain: the temporary farewell is preserved, but
  `친구여` may sound more archaic/formal than the source voice.
- ID 15478 remains uncertain: `results` may mean scores, contest results, or
  another outcome; the UI context is absent.
- ID 15479 remains uncertain: the nymph may be literal or figurative, and
  Korean's “evidence is before you” reading differs from English's
  personified “staring you in the face.”
- ID 15481 remains uncertain: the author's name and Korean book-title form
  are not established across locale spellings.
- ID 15484 remains uncertain: `Remap Failed` does not identify what is being
  remapped; the Korean key-setting interpretation is plausible but
  unconfirmed.
- ID 15485 is `not an issue`: Korean preserves that treachery killed the
  woman and cursed rings turned her comrades against her.
- ID 15487 remains uncertain: Helyc Crosse and Ettinmere spellings vary
  across locales; leadership and camp-location relations are preserved.
- ID 15489 remains uncertain: the Ring of Keozai's institutional status and
  canonical Korean form remain unsettled.
- ID 15491 remains uncertain: `selling his stories` may refer to fabricated
  tales, performances, or written stories; the exact activity is unclear.
- ID 15493 is accepted: replace `넌 여기에 어울리지 않아.` with
  `넌 여기 들어오면 안 돼.` Japanese explicitly says entry is prohibited;
  English context supports exclusion from the space rather than merely
  social incompatibility.
- ID 15496 remains uncertain: quest meaning is preserved, but the spellings
  of Ainmhi, Yolvan, and Wandering Well need terminology alignment.
- ID 15498 is `not an issue`: the skeptical implication that Straton wants
  others to believe every play is his masterpiece is retained.
- ID 15499 is `not an issue`: the tenfold hero praise and the speaker's
  physical inability to continue are both preserved.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 15474 | `코렐론 사제장` | `코렐론 여사제` | D-4759 |
| 15493 | `넌 여기에 어울리지 않아.` | `넌 여기 들어오면 안 돼.` | D-4769 |

Both accepted values were already present in the active CSV when this batch
was resumed. No other translation text was changed in this batch.

## Verification

- The preliminary structural audit reports all 50 IDs in identical order
  across the four locales and matching line-break/runtime-marker signatures;
  no structural exception was found.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF record endings, and 39
  pre-existing bare-LF endings. The two edited records' line endings were
  restored to CRLF.
- The active Korean `default` CSV SHA-256 after line-ending restoration is
  `0dbcd7ae041e4b826ef7cfa36a01fce1cf9dfe0be9cf72a69a757324b73f011f`.
- The preceding report records SHA-256
  `24c5f98bfaa70173c6a09ba60eaa8e7d9c71c1e9e713088412e7b85a5c086c68`.
  Reversing only the two accepted text substitutions in memory, with these
  record endings restored, yields
  `bcd28782340cf72fca6aaa61d678cfc4803f789a68397938e139e1d0c5861ae2`,
  not the recorded checkpoint hash. This checksum/provenance discrepancy is
  unresolved; no additional CSV content was changed to force a match.
- Before this batch: 601 accepted, 1,481 `not an issue`, and 2,664 uncertain.
  After this batch: 603 accepted, 1,487 `not an issue`, and 2,682 uncertain
  (4,772 decisions total).
- Resume at ID 15500; 49,635 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
