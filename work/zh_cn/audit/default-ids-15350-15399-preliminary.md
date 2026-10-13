# Preliminary Language Scan: `default` IDs 15350-15399

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 15350-15399.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 15351 | `Missives` -> `서한` | Verify whether capitalized `Missives` is a named collectible/document type and align it with established terminology. | Korean renders the item as generic letters; the source capitalizes it, while Chinese specifies the Sable Missives. The escape/bargaining sequence is otherwise retained. | Medium |
| 15352 | `Hyperian raised` -> `하이페리언이 떠오르는` | Clarify whether the Hyperian was raised, launched, or rose into the air, without resolving the source's phrasing from Chinese alone. | English says “raised,” Japanese uses a floating/rising verb, and Chinese says it rose into the air; Korean follows the latter broad image. | Medium |
| 15356 | village `Sanctuary` / `collections box` -> `마을 성소` / `헌금함` | Confirm whether `Sanctuary` is a named institution and whether the box collects donations or other objects. | Korean treats the box as an offering box; Japanese explicitly says donation box and Chinese says a box near the sanctuary. | Medium |
| 15358-15359 | `Bulwark`; `Male Quest Giver` | Determine whether these isolated strings are player-facing names, category labels, or internal/editor labels. | Korean translates them as `방벽` and `남성 퀘스트 제공자`; the rows provide no display context. | Medium |
| 15361 | `third mayor ... in two years` | Preserve the claim that Whitestone has had three mayors within two years, rather than implying the speaker personally held the office three times. | English and Chinese describe the third mayor in that period; Japanese explicitly says the third person. Korean `시장을 세 번이나 맡게 됐어` can imply repeated terms by the same speaker. | High |
| 15366 | `The Mission` -> `선교회` | Verify whether this is a named religious institution or a generic mission/assignment. | Korean chooses an organization reading; Japanese says monastery and Chinese says preaching place, while the capitalized English label is context-free. | Medium |
| 15368 | `sustain both magical and physical damage` -> `마법 및 물리 피해를 모두 견디며` | Check whether the Destiny grants damage tolerance or the ability to keep dealing both damage types; retain the retaliatory-energy relation. | Korean follows the English “sustain damage” as withstand/endure. Chinese interprets it as dealing both types continuously; Japanese instead describes resistance and converting received attacks to mana, materially differing from English. | High |
| 15369 | `Gallows End` -> `교수대 끝` | Align this place-name form with the many phonetic and literal Korean variants elsewhere in the active draft. | The Korean literal form is intelligible but differs from recurring `갤로스 엔드`-type forms. This is a corpus-wide consistency candidate, not a settled canonical choice. | High |
| 15371 | six-line poem / reciprocity and warmth imagery | Review the poem's reciprocal “take/are taken” logic and closing chill/warmth image while preserving its lineation. | Korean retains all six lines and the mutual borrowing/embrace sequence. The English's compressed fifth and sixth lines remain figurative; no source resolves a single exact reading. | Medium |
| 15376 | `Preordained` -> `예정자들` | Confirm the faction/title rendering and whether “encounter” implies a fight or any meeting. | Korean preserves the renewed injury and probable encounter, but uses a generic-sounding plural for a capitalized faction. | Medium |
| 15380 | Sandstone Villa guest / peruse the speaker's wares -> `샌드스톤 저택의 손님` / `물건을 ... 둘러보세요` | Keep this row separate from the historical Maid-of-Windemere question incorrectly keyed to it; clarify the speaker's role only if contextual evidence becomes available. | English is a bookseller's invitation to a guest at Sandstone Villa, and all locale rows concern browsing goods/books. This is not a Maid reference. Korean's polite register follows the Japanese customer-facing tone. | High |
| 15382 | `Fae` -> `페이` | Align the people/faction term with established Korean treatment of Fae and distinguish it from transliteration variants. | Korean transliterates the capitalized term; Japanese and Chinese use localized generic/fantasy-race terms. | Medium |
| 15385 | `Alserund` -> `알세룬드` | Verify the place-name spelling and cross-corpus consistency. | English preserves the Latin name; Japanese and Chinese use different phonetic forms. The isolated label supplies no pronunciation evidence. | Medium |
| 15387 | `And so I was named` -> `그렇게 내 이름이 정해졌고` | Clarify whether the speaker was named, selected, or appointed as the public face of submission. | English is ambiguous; Japanese explicitly reads appointment and Chinese reads nomination. Korean specifies that the speaker's name was decided, which may narrow the event. | High |
| 15389 | `using it to stash their prisoners` -> `이곳에 ... 죄수들을 숨기는 데` | Identify the antecedent of `it` and retain the speaker's deliberate refusal to ask questions. | English leaves the object as `it`; Korean makes the location reading explicit with `이곳`, while Japanese/Chinese likewise imply a place. | Medium |
| 15391 | `Black Arick` / `Chernobog` -> `검은 아릭` / `체르노보그` | Verify whether `Black` is an epithet and align both names with recurring forms. | Korean translates the epithet and transliterates the second name; the isolated conjunction does not establish whether these are people, teams, or other entities. | Medium |
| 15396 | `Alder crashed here` -> `앨더가 이곳에 표류해 온` | Preserve the arrival/wreck implication without deciding whether Alder personally crashed or arrived in wreckage. | English says Alder “crashed here”; Korean and Chinese imply being washed/drifted ashore or wrecked here. The shared-work/hope sequence is retained. | Medium |
| 15397 | `Adept Fel` -> `숙련자 펠` | Verify `Adept` as a formal rank/title and preserve the uncertainty about what the tracked group carried. | English capitalizes `Adept`; Korean's `숙련자` can read as a generic skill description. Japanese uses a mage term, while Chinese uses an attendant term, so role evidence conflicts. | High |

## Historical Audit Reconciliation

- Rechecked historical question-log keys 15333 and 15380 against all four
  active locale rows. ID 15333 is `Maid of Windemere`; ID 15380 is a
  Sandstone Villa guest being invited to browse wares and is unrelated to the
  Maid. The historical combined key `15333, 15380` is therefore overbroad:
  retain the Maid question only for 15333 and record 15380 as a key-mapping
  error. Do not rewrite the preserved historical log.
- Rechecked this range for recurring Gallows End, Fae, Preordained, Rathir,
  Brattigan, Alserund, and Adept terminology. Variants remain provisional;
  no terminology decision or translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized brace/dollar/hash token
  class/order signatures match across all four locales. ID 15371 retains its
  six-line poem; no runtime marker or layout exception was found.
- The active Korean default CSV still matches the recorded SHA-256 baseline.

## Batch Status

IDs 15350-15399 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 15400-15449.
