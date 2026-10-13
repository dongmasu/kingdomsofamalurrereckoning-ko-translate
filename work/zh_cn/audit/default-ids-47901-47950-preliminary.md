# Preliminary Language Scan: `default` IDs 47901-47950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47901-47950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47902 | `방호 부적` / “quality wards” | Clarify whether `wards` means magical protections, protective charms, or products/wards offered for sale. | English's fragment joins “quality wards” with locksmithing. Japanese describes high-quality keys and locks; Korean instead interprets wards as protective charms, while Chinese uses “seals.” Context does not resolve the inventory/meaning. | Medium |
| 47903 | Relentless Assault / `무자비한 강습` | Preserve the active-effect condition, +20% chance, and 30 Health; confirm established ability name. | Korean retains the condition and both values. The Chinese source alone contains an embedded U+FEFF immediately after its localized ability name; it is not present in English, Japanese, or Korean. | High |
| 47905 | “one so talented as myself” / `나처럼 재능 있는 사람` | Check whether the self-praise and requirement of proper training are both retained. | English says the speaker is uniquely talented and has the proper training to craft the gem. Korean preserves the boast and crafting ability but compresses the training qualification; Japanese also condenses this qualification. Retain as a preliminary possible nuance omission. | Medium |
| 47914-47917 | Lorca-Rane, Niskaru, Motus, Apotyre, Ettin, Savant Hadrus Llewellyn | Confirm canonical Korean spellings and rank/creature terminology. | The narrative and references to the cave, samples, settlement, frost magic, and Savant are conveyed. The historical log identifies these names and lore terms for corpus-wide consistency checks. | Medium |
| 47922 | “It's almost showtime” / `이제 곧 공연 시작` | Retain the performance context and the sober-status joke. | Korean preserves the checked instruments, Sero's sobriety, and imminent show. The Chinese supporting text runs “instruments checked” and “Sero is sober” together without punctuation or spacing; English/Japanese/Korean do not. | High |
| 47929 | Gastyr / heir and heartlessness | Preserve the contrast between inheriting the status and inheriting his cruelty; confirm name spelling. | Korean retains the letter as proof of heirship, the inherited heartlessness, the mother's unfulfilled wish for love, and her death. The proper name remains open for the corpus glossary. | Medium |
| 47930 | Grave Thresh / two threshes / Gorguath | Confirm the creature name and preserve the story-to-current-objective transition. | Korean keeps the twist that the Grave Thresh was not the only villain and states that two threshes must now be fought to escape. Existing forms remain candidates for consistency review. | Medium |
| 47933 | Elemental-damage potion ingredients | Confirm established Korean names for Star Thistle, Ysa's Breath, Seaflax, and Essence of Fate; retain the recipe quantities. | Korean preserves the alchemy workbench and the ordered quantities 3/3/2/1. The five embedded line breaks match the other locales. | Medium |
| 47934 | “Higher” / “four” card exchange | Preserve the card-game reading and the speaker's teasing correction. | Korean renders “higher” comparatively and “four” as the revealed card, then clearly states the loss. Japanese makes the same card reading; the English fragment remains context-dependent. | Medium |
| 47936 | Health/Mana percentages | Preserve 20%/40%/10% restoration and 30%/up to 20% Mana costs. | Korean retains all five values and the charging sequence. The English source contains the typo `upto`; the Korean correctly conveys an upper limit rather than treating it as an additional fixed cost. | High |
| 47939 | Skoria Mine / illusite ore | Preserve the legal transfer to the document holder and verify the mineral/company names. | Korean retains the signed and notarized instrument, mine and ore ownership, holder, and Motus Mining authorization. Chinese says “disposal rights” for the ore where English says ownership; English remains primary. | Medium |
| 47945 | Northern riddle / “soft feet, sharp knives” | Clarify the referents and syntax before deciding whether the Korean clue has shifted agency or location. | The English is fragmentary and cryptic: stealth-associated “soft feet, sharp knives,” a resting place, vines, and light. Korean preserves the elements but recasts the final relation as vines blocking the way; Japanese differs substantially, so do not treat either rendering as decisive. | Medium |
| 47949 | “Murder will do that to a body” | Preserve the dark joke and the follow-up claim that the addressee is made of the same stuff as the group. | Korean retains the murder/appearance joke and the implied kinship, though the English wording is itself intentionally odd. Keep as a tone candidate, not a confirmed error. | Medium |

Other names and recurring terms in this range, including Tarion, Ametair,
Didenhil, Dolan Hardy, Straton, Farraglen, Acyone, Creth, Valdur Skulsson,
Kiftal, Skoria, and the sewer-race label at boundary ID 47950, remain subject
to corpus-wide terminology review. Existing Korean forms were preserved.

IDs 47901, 47904, 47906-47913, 47918-47921, 47923-47928,
47931-47932, 47935, 47937-47938, 47940-47944, and 47946-47948 generally
retain the English meaning on this first reading. Names, idioms, and lore
terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47850-47949, including
  Tarion's `wards`, Savant Hadrus Llewellyn, the two-thresh encounter,
  ingredient names, the `higher`/`four` exchange, the northern clue, and the
  murder joke.
- Checked boundary ID 47950 against the following historical entry for
  IDs 47950-48049, which records the sewer-race label. The boundary was not
  skipped or counted twice.
- Historical notes are issue inventory, not approval of any current wording.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47901-47950 once
  and in identical ascending order.
- Embedded line breaks occur at IDs 47903 (one), 47933 (five), and 47936
  (one); all four locales retain the same counts at each ID.
- Values at 47903, all four recipe quantities at 47933, and all restoration
  and Mana-cost values at 47936 are preserved.
- The Chinese source at ID 47903 alone contains U+FEFF (ZERO WIDTH NO-BREAK
  SPACE) after the localized Relentless Assault label. This is recorded as a
  source-format exception; no source or working CSV was changed.
- No other hidden format/control characters or token-structure exceptions
  were found in the batch.
- No translation CSV edit was made.

## Batch Status

IDs 47901-47950 received one preliminary reading. Working dispositions are
recorded in
[`disposition-batch-default-47901-47950-20261010.md`](disposition-batch-default-47901-47950-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 47951.
