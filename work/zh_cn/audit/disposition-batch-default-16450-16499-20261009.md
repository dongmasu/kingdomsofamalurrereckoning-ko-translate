# Disposition and Edit Batch: `default` IDs 16450-16499

- Decision date: 2026-10-09.
- Scope: the preliminary findings in the range, recorded as nine decisions;
  compared active Korean with English meaning, Japanese voice/register,
  Chinese supporting evidence, historical audit questions, and recurring
  terminology.
- Decisions: two accepted, two `not an issue`, and five uncertain.
- Two supported Korean `Texto` corrections were applied. Uncertain candidates
  remain unchanged. These are working dispositions, not independent final
  linguistic approval.

## Decisions

- ID 16453 is accepted: change `하룻밤 만에 만들어 냈다` to
  `새벽까지 완성했다`. English says the Carver made it “by the morning” and
  Japanese says “by dawn”; the revision states the deadline directly without
  changing the contrast with the Cycle's centuries of shaping.
- ID 16459 remains uncertain: Eventide is likely a place name, but the locale
  versions vary between transliteration and literal translation; retain the
  Korean form pending corpus-wide place-name alignment.
- ID 16474 remains uncertain: `Good luck with that` may be sarcastic or a
  straightforward well-wish. Korean `행운을 빌어` does not itself settle the
  tone, and the surrounding exchange is insufficient.
- ID 16477 is `not an issue`: the four-paragraph dream passage preserves the
  fantasy, desired partners, guilt, fulfillment, loneliness, and nights; the
  Korean follows English's broad meaning rather than Japanese's narrower
  pain-oriented interpretation.
- ID 16478 remains uncertain: `fastings` is unclear and may be a typo or an
  in-world structure. Japanese and Chinese interpret it differently; keep the
  transliteration unchanged.
- ID 16484 is `not an issue`: the preliminary report said Korean narrowed the
  driving force to a “purpose,” but the active Korean actually says
  `그들을 이 전쟁으로 내몬 무언가`, preserving English's unspecified
  “whatever has driven them to this war.” No edit is warranted.
- ID 16494 is accepted: change `친숙도 업그레이드 레벨 7` to
  `사역마 업그레이드 레벨 7`. Japanese explicitly uses `使い魔` (familiar
  spirit), and English labels a `Familiar Upgrade`; the current Korean instead
  means an upgrade to familiarity.
- ID 16497 remains uncertain: `crude village` is rendered `미개한 마을`,
  which may preserve the insult but could overstate the source; terse context
  and register do not support a safer definitive alternative.
- ID 16499 remains uncertain: the King/Queen of Cups and Grim sequence is
  retained, but English syntax does not establish the subject of “goes
  unseen.”

## Verification

- All four locale files contain 50 rows with IDs 16450-16499. The preliminary
  structural check recorded matching embedded line-break counts and normalized
  brace/bracket-token sequences; the four-paragraph layout at ID 16477 remains
  intact.
- Only Korean `Texto` values at IDs 16453 and 16494 changed. The active CSV
  retains its UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF
  endings.
- Post-edit SHA-256:
  `6617c8882d910bfa544de86fab567184ed0acf1c83dd20c73bee47197baebdef`.
  Reversing only these two text changes reproduces the preceding checkpoint
  hash `54568419043835f2e691782157edcdb48411a837354749d32828cd318adf0462`.
- Before this batch: 628 accepted, 1,602 `not an issue`, and 2,947 uncertain.
  After this batch: 630 accepted, 1,604 `not an issue`, and 2,952 uncertain
  (5,186 decisions total).
- Resume disposition work at ID 16500; 48,635 `default` rows remain. The
  preliminary report for IDs 16500-16549 should be checked before proceeding.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
