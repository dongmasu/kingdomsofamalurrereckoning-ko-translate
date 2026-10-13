# Preliminary Language Scan: `default` IDs 42401-42450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42401-42450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42402 | Hospitalis Quarters / `호스피탈리스 구역` | Confirm whether this facility has an established Korean name or should retain the English place name consistently. | English names the location; Japanese and Chinese use generic hospital-area descriptions. Historical notes already flag this setting-specific location. | Medium |
| 42405 | Domus Politica / Grand Bursar's / `대회계관의...` | Preserve the source's deliberately or accidentally unfinished possessive; confirm the institution/title forms without supplying an implied noun. | English ends at “the Grand Bursar's.” Korean preserves the fragment with an ellipsis, while Japanese completes the thought as a chapter about the Grand Bursar and Chinese says “the Grand Bursar's home.” | High |
| 42408 | woodland Fae appropriated / `숲의 페이 무리를 끌어들였다` | Check whether `appropriated` should convey taking/commandeering the Fae rather than simply attracting or bringing them in. | English has a coercive acquisition verb; Japanese says they obtained a group and Chinese says they tamed one. Korean's `끌어들였다` is less explicit about force. | Medium |
| 42410 | Gordan Lot / `고든 롯` | Verify canonical spelling and Korean transliteration of `Gordan`, distinct from a possible `Gordon` reading. | English spells the first name `Gordan`; Korean's `고든` may be read as Gordon. Japanese and Chinese are phonetic references, not decisive spelling authorities. | Medium |
| 42414 | Trigger Kobolds 1 / `코볼트 유발 1` | Determine whether this is a debug/trigger label, an objective, or a named encounter; avoid treating the literal Korean as settled UI terminology. | All sources render a terse label without context. The historical question log explicitly flags its function. | Medium |
| 42420 | Augur / `오거` | Confirm whether `Augur` is this character's proper name or title, and guard against confusion with the Korean rendering commonly associated with “ogre.” | English capitalizes `Augur` and uses a masculine pronoun; Japanese and Chinese translate it as “prophet/diviner,” while Korean transliterates it. Historical notes leave the identity open. | Medium |
| 42421 | Galin / `Galin` | Retain or localize the name consistently with its earlier appearance at ID 42312. | Korean preserves the English spelling exactly; the source-keyed historical note calls out both occurrences. | High |
| 42423 | Primos / `프리모스` | Clarify whether `Primos` is a person, title, or office, and maintain the distinction from the generic “leader” used in Chinese. | English names `the Primos`; Chinese renders a leader, while Japanese transliterates the name. Korean follows the named form. | Medium |
| 42431 | The House / `하우스`; Eldest / `장로들` | Confirm whether `The House` specifically means the House of Sorrows and whether `Eldest` is a formal group/rank. | English capitals both terms and says the Eldest were butchered; Japanese makes the House of Sorrows explicit, while Korean uses the generic `하우스`. | Medium |
| 42433 | banshaen / `밴샤엔` | Check the canonical creature/name form and whether it should remain a transliteration rather than be translated by creature description. | Korean and Japanese retain a phonetic name; Chinese calls it a snake-fish monster. The exact in-world creature identity is not resolved by this row. | Medium |
| 42438 | `Speak with me a moment...` / `잠깐 이야기하세` | Check the archaic/elderly force of `-하세` against the speaker's established voice. | English is informal but does not identify age; Japanese uses a plain invitation (`話そう`). Korean's `-하세` adds a marked older-speaker register. | Low |
| 42440 | `broken ways` / `뒤틀린 삶의 방식`; Great Cycle / `대순환` | Resolve the source divergence in `broken ways` before fixing its Korean interpretation. | English says `broken ways`; Japanese interprets this as deviating from destiny, whereas Chinese and Korean describe bad/distorted ways. Korean follows the latter sense. Great Cycle and Summer Court terms should also remain consistent. | Medium |
| 42441 | The Hyperian Rises / `하이페리온의 부상` | Verify the named subject and whether `Rises` is a title/event verb or a statement of increase. | English and Chinese use a rise/uprising reading; Japanese says “increase.” Korean follows English/Chinese, but the proper-name form should align with other Hyperian entries. | Medium |
| 42447 | Iconoclast / `성상 파괴자` | Retain the English-based candidate provisionally and confirm whether this is a title, role, or standalone label. | English and Korean align on icon-breaking; Japanese gives an unrelated “one who cuts cause and effect” reading and Chinese resembles “icon fragments.” | Medium |
| 42449 | `whorin' myself and scavenging for coin` / `몸을 팔고 동전을 찾아 뒤지는 생활` | Confirm the coarse voice and whether `scavenging for coin` means searching/scraping for money rather than literal scavenging. | Korean preserves the sex-work reference and hardship; Japanese uses “rummaging through garbage,” while the English idiom is less specific. | Medium |

IDs 42401, 42403-42404, 42406-42407, 42409, 42411-42413, 42415-42419,
42422, 42424, 42425-42430, 42432, 42434-42437, 42439, 42442-42446, and
42448 generally retain the English meaning on this first reading. Proper
names, titles, register, and recurring terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 42350-42449 were checked.
  Relevant open items include Hospitalis Quarters (42402), the incomplete
  Domus Politica/Grand Bursar phrase (42405), Trigger Kobolds (42414),
  Augur and Primos (42420, 42423), Guenfear/Banshaen and Eldest terminology,
  `broken ways` and The Hyperian Rises (42440-42441), Iconoclast (42447),
  and the colloquial sex-work/scavenging line (42449).
- Historical notes confirm `Galin` appears at both 42312 and 42421 and
  should be checked for consistent treatment.
- ID 42405 remains a source fragment; no missing noun was inferred.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42401-42450 once
  and in identical ascending order.
- Embedded line-break counts match across all four locales.
- Runtime marker IDs and order match. ID 42403 keeps marker ID `1` in all
  three localized labels (`mana`, restoration potion); visible label wording
  varies by locale as expected.
- The Japanese source uses explicit Arabic numerals in the `no one` idiom at
  42446 and writes the 42450 material quantities as `3/2/3`; English spells
  those quantities out and Korean uses Korean number words. The meanings and
  all three quantities are preserved.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42401-42450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 42451.
