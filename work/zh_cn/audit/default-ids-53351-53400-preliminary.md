# Preliminary Language Scan: `default` IDs 53351-53400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 53351-53400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 53351 | `타는 듯한 산성 용액` | Check whether `Acid Solution` is a named item/effect and whether “burning” describes its corrosiveness or heat. | Korean retains the cleaning possibility and imagery; all references leave the exact item property unclear. | Medium |
| 53352 | Castle Ansilla / General Fynn | Verify the canonical spellings and whether the failed assault's outcome is best expressed as partial success. | Korean retains the partial success and deaths in the dungeons; Japanese describes it as a half-failure, reflecting the source's ambiguity. | Medium |
| 53353 | Alfar / Gnomes and virtues | Preserve the contrast between Alfar idealism, Human pragmatism, and Gnome reason/order. | Korean follows the complete English and Chinese meaning. The Japanese source ends mid-sentence, so it cannot confirm the full clause or voice. | Medium |
| 53355 | `수호자들(Tenders)` | Confirm whether `Tenders` is the formal House of Sorrows role and use the established Korean term consistently. | Earlier audit entries flag the title as unresolved; Japanese reads guardians/attendants and Chinese reads keepers. | Medium |
| 53360 | `쌓인 편지 더미` for “stacks of [bad news]” | Avoid narrowing the unspecified stacks to letters unless context confirms they are correspondence. | English and Japanese leave the object implicit; Chinese also has an ambiguous pronoun. Korean supplies “letters,” which is plausible but unsupported by this line alone. | High |
| 53366 | `이사 지부(Ysa Chapter)` | Verify whether `Chapter` means a religious/faction branch and establish the canonical Korean label. | Korean's `지부` is plausible; Japanese and Chinese use branch/chapter wording but do not settle the institution's identity. | Medium |
| 53368 | `아메신(Amethyn)` / `그녀` | Verify the imprisoned woman's identity and the named place `Amethyn`; do not infer an identity from the Japanese-only name. | English and Chinese use an unnamed woman, while Japanese names TiaNoc. Korean correctly retains the English/Chinese level of specificity. | Medium |
| 53369 | `자유민(Freemen)` | Decide whether this is the named Freemen faction or generic free people and align its Korean form with prior rows. | English capitalization and Japanese's group reading suggest a faction; Chinese is more generic. | Medium |
| 53370 | `플레지실드(Pledgeshields)` / “Sworn to War” | Confirm the rank and whether `Sworn to War` is a formal status/title; preserve the respect and earned-home implications. | Korean retains both ideas. Historical entries repeatedly flag Pledgeshield and Sworn to War as terminology questions; Japanese gives a divergent “second-rank mercenary” reading. | Medium |
| 53371 | `고사머의 끝(Gossamer End)` | Check the canonical place-name form against previous occurrences. | The Korean is a literal rendering; Japanese transliterates and Chinese translates the image. Earlier audit notes treat the name as unresolved. | Medium |
| 53373 | payment to learn which outcome is true | Preserve the oracle's evasive, possibly transactional tone without assuming whether the coin is a fee or wager. | Korean keeps the ambiguity and payment request; English, Japanese, and Chinese do not specify the transaction. | Medium |
| 53375 | four-day stay in Gale Crossing | Preserve the exact four-day duration and onward travel deeper into the mountains; verify the place-name form. | Korean renders four days idiomatically as `나흘` and retains the direction. All locale values agree. | High |
| 53380 | `와이번 가문(Wyvyrns)` | Confirm the family name/spelling and retain that the lineage was respected despite modest wealth. | Korean reads Wyvyrns as a family, consistent with Japanese's explicit family reading; Chinese is less explicit. | Medium |
| 53382 | `그 일` / “it” | Keep the unspecified event unresolved and preserve the ten-year timing and combat earnings. | All references leave the antecedent unstated. Korean preserves the pronoun's ambiguity and renders ten years as `10년 전`. | High |
| 53387 | `듀렉(Durek) 시대` | Verify whether “the Durek” denotes a people, dynasty, or historical era. | Korean preserves the source's temporal relation without inventing a more specific identity. Japanese/Chinese likewise do not settle the referent. | Medium |
| 53390 | `여행자` for `Traveler` | Check whether the capitalized term is the Travelers faction/identity and align with corpus usage. | The speaker's birth/death statement is preserved, but Korean capitalization cannot distinguish the named group from an ordinary traveler. | Medium |
| 53394 | `지팡이와 차크람의 지연 특수 공격` | Preserve the unlock effect and the runtime marker while keeping the localized label readable. | The `{*1[...]}` marker identity and position match; its visible payload is localized in each locale. Staff/Chakrams and the delayed-special-attack effect are retained. | High |
| 53396 | `나와!` for `Step up!` | Recheck the imperative against its interaction context; avoid changing it to “come out” if the source means approach/step forward. | Japanese `どうぞ` and Chinese `上来` suggest an invitation/approach, while Korean `나와!` can mean “come out.” Context is absent from this isolated string. | Medium |
| 53399 | `배를 가른 물고기처럼` | Preserve the gutted-fish simile, severe bleeding, and need to reach shore for help. | Korean conveys the image and causal urgency; the locale references agree on the comparison and shore objective. | High |
| 53400 | `Kollossae Law` / `콜로사이 법` | Verify whether this is a law/code title and align `Kollossae` terminology. | Korean retains the legal concept; Japanese and Chinese also render it as a law, while the title's formal status is unclear. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Recurring names and terms remain provisional, including Tenders,
Freemen, Pledgeshields, Sworn to War, Amethyn, Gossamer End, Gale Crossing,
Wyvyrns, Banshaen, Nyralim, Mithros, Durek, Traveler, Lyria, and Kollossae.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry titled `default` IDs
  53350-53449. It flags the Acid Solution (53351), Castle Ansilla/General
  Fynn (53352), Tenders (53355), the Rathir “stacks” (53360), Tari
  Holstig/Lyenna/Culn, Ysa Chapter (53366), the imprisoned woman/Amethyn
  (53368), Freemen and Pledgeshields (53369-53370), Gossamer End (53371),
  the Oracle payment (53372-53373), Gale Crossing (53375), Wyvyrns (53380),
  the event antecedent and ten years (53382), Durek (53387), and the
  Traveler/quickling terminology (53390-53391).
- The historical log's question about the unnamed woman at 53368 notes that
  Japanese calls her TiaNoc; English and Chinese do not name her. The Korean
  follows the latter evidence and does not add the name.
- The historical log flags `#NAMED_ICON_360_Y#` at 53383 and the `*1`
  marker at 53394; both are retained. The English/Japanese/Chinese/Korean
  marker identity at 53394 is `{*1[...]}`; only the displayed label text is
  localized.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 53351-53400 once
  and in identical ascending order.
- Physical line-break counts and normalized runtime/control-token
  identities match throughout the range. No hidden format/control
  characters were detected.
- The four-day duration at 53375, ten-year interval at 53382, and two-times
  height at 53384 are preserved. Localized text inside the 53394 marker is
  expected and its marker identity/order is unchanged.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 53351-53400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 53401.
