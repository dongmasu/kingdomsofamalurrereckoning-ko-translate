# Preliminary Language Scan: `default` IDs 44351-44400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44351-44400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44363 | Mixing Business / `사업과 사생활` | Preserve the idea of mixing business and personal matters; confirm whether this is a title, pun, or UI label. | English is ambiguous; Japanese interprets it as mixing public/private matters, while Korean names the two domains but omits the “mixing” relation. Historical audit explicitly flags the title. | Medium |
| 44366 | “fastidious” / `빈틈없는 사람` | Check whether this means meticulous/demanding rather than merely vigilant or thorough. | Korean conveys carefulness, but English also suggests exacting standards; Japanese calls him difficult to deal with. | Low |
| 44367 | “old Scion” / `늙은 스카이언` | Preserve `Scion` as the formal title/office rather than interpreting it as an elderly person; standardize with `사이온` elsewhere. | English capitalizes `Scion`; Japanese says “former Scion,” and Chinese retains Scion. Korean's `늙은` means old in age and `스카이언` diverges from the established transliteration, changing the likely referent. | High |
| 44375 | “It is what prevents...” / `방패다` | Avoid introducing a shield image unless the preceding context establishes that `it` is a shield. | English says the subject prevents enemies from burning the kingdom; Korean additionally calls it a shield. The subject remains context-dependent. | Medium |
| 44377 | Headsman quest summary / `페이, 처형관에게 ... 결투를 신청받았다` | Improve the apposition/word order so it clearly says the speaker was challenged by a Fae called the Headsman. | The Korean contains the relevant facts but the `페이, 처형관에게` construction is awkward and can momentarily obscure who issued the challenge. | Medium |
| 44380, 44398 | Font(s)/Fontmaster / `샘물`; `샘의 관리자` | Determine whether capitalized `Font` is a named magical source or generic spring, and standardize `Fontmaster`. | English capitalizes `Font` and refers to its flow; Korean uses generic spring/water-flow wording. The historical audit explicitly leaves this setting term open. | Medium |
| 44393 | `{*1Crossfire}` / `{*1Talon Strikes}` | Localize or standardize the skill-name payloads inside the markers, preserving marker identity and order. | English, Japanese, and Chinese all identify the same two special attacks; Japanese and Chinese localize their names, but Korean retains the English payloads verbatim. | High |
| 44396 | Banraun the Smithy / `대장장이 반론` | Confirm the character-name spelling and keep the proper name distinct from the Korean common noun `반론`. | English treats Banraun as a proper name; Japanese and Chinese transliterate it differently. Korean's `반론` is also the ordinary word for “objection,” making the name unclear. | Medium |

IDs 44351-44362, 44364-44365, 44368-44374, 44376, 44378-44379,
44381-44389, 44391-44392, 44394-44395, 44397, and 44399-44400
generally retain the English meaning on this first reading. Proper names,
setting terms, and UI terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 44350-44449 was checked for
  Hugues, the Cynric family, Kandrian/Mel Aglir, Gwyn Anwy, the Forsaken
  Plain, Ealfwig Grilricas, Scion, Fennwrac/Jottun, Mixing Business,
  Headsman/Midden, scrying mirrors, Fonts, White Nil, Niskaru Lord's Crown,
  Lyria, Adrith Deofrit, Crossfire/Talon Strikes, Banraun, and Fontmaster.
- The historical log specifically leaves Mixing Business, Scion, the Font
  term, ability labels, Banraun, and named locations open. ID 44367's
  current age/title ambiguity and ID 44393's untranslated payloads were
  checked against all locale references.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44351-44400 once
  and in identical ascending order.
- ID 44378 has two line-feed separators forming the source's single blank
  paragraph break; all four locales preserve it.
- ID 44393 retains both `{*1...}` marker identities and their order.
  Localized payload text differs: Korean retains the English names.
- No other numeric-value discrepancy or hidden formatting character was
  found. The eight-spider quantity at 44392 is retained.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44351-44400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44401.
