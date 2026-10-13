# Preliminary Language Scan: `base` IDs 2400-2499

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 2400-2499.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked related project terminology and historical audit questions.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2403 | 크루센던트(Cruscendant)의 인장 | Determine whether `Cruscendant` is a proper name or a source error before fixing its spelling. | English and Korean treat it as a name; Japanese reads the phrase as “ultimate seal,” while Chinese preserves `Cruscendant` as a name. The references conflict, so the current transliteration remains provisional. | Low |
| 2413 | 데타이어(Detyre) | Reconcile the Korean place-name spelling with the rest of the active corpus. | The same place appears as `데티어`, `데타이어`, `데티르`, and `디타이어` in `default`; Japanese and Chinese also differ phonetically. Keep the variants as evidence for a corpus-wide decision, not a row-local replacement. | High |
| 2423 | 크라운홀드 대담함(Crownhold Bold) | Determine whether `Bold` is a descriptor, a proper name, or a source-data error. | English is ambiguous; Japanese transliterates `Bold`, while Chinese gives a different interpretation. The Korean literal “boldness” may not identify the intended item/name. | Low |
| 2431 | 가공된 원초 프리즘미어 | Resolve the source's apparent `Prepared`/`Raw` contradiction and verify the item's state. | English says both `Prepared` and `Raw`; Japanese and Chinese preserve a similar contradiction. The Korean follows both adjectives but cannot make the item state coherent without context. | Low |
| 2447 | 크림빌(Crymbil) | Confirm whether `Crymbil` is a name/title or a source typo. | English and Chinese treat it as a name; Japanese phrases it as “about Crymbil.” The current transliteration is plausible, but the title's function is unknown. | Low |
| 2454 | 상급 혼돈 다재다능 | Verify the tier and exact effect represented by `Greater Chaos Versatility`. | English and Chinese indicate a greater/high tier, while Japanese uses its medium-tier marker. Korean follows English; inspect the actual item's tier before treating this as final. | Medium |
| 2472 | 통곡 | Determine whether `The Keening` is a named place/title or the common noun “lament.” | English capitalization and Japanese transliteration suggest a proper name; Chinese renders a place-like “land of lament.” Korean chooses the generic `통곡`, which may erase a name. | Medium |
| 2491 | 메모: 참새 연쇄 살인 | Confirm the intended referent of `Sparrow Murders` and whether `연쇄` is warranted. | English is a compressed note title and does not explicitly say serial murders of sparrows. Japanese also quotes “Sparrow” but does not resolve whether it is a group, culprit, or nickname. | Low |

## Historical Audit Reconciliation

- IDs 2403, 2423, 2431, 2447, 2454, 2456, and 2472 were rechecked against
  their active source rows. Their historical questions remain open; no old
  disposition was treated as approval.
- ID 2456's `Selkie` is preserved as a name in Korean. Japanese gives a
  literal seal reading and Chinese transliterates the folklore-derived term;
  retain the existing question about item/lore context.
- ID 2403's `Cruscendant` remains a source-name/spelling question.

## Other Checks

- ID 2417 `Litany to Lyria` uses a plausible devotional term; confirm it
  against the project's established religious vocabulary during consolidated
  review.
- IDs 2435 (`Rathir`), 2444 (`Traveler's Caravan`), 2477 (`Didenhil
  Lorestone`), and 2497 (`Erathi Gate`) retain their principal named referents.
- The remaining inspected rows preserve their primary English meaning.
  Proper-name parenthetical display remains inconsistent and is not normalized.

## Batch Status

IDs 2400-2499 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
