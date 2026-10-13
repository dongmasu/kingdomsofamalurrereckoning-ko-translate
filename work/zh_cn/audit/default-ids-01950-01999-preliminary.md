# Preliminary Language Scan: `default` IDs 1950-1999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1950-1999.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for name, group, and idiom questions and reconciled
  historical `default` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1951 | 케이프 솔라스(Cape Solace) | Align the Korean name with the corpus-wide `Cape Solace` decision and distinguish the place from religious offices associated with it. | The name is marked bilingually here, but other occurrences use competing forms. The historical audit also warns that `Cape Solace` and the religious office are separate senses. | Medium |
| 1956 | ... 섬기는 신들을 잃고 그토록 절망에 빠져, 불려온 자와 사이퍼(Cipher)를 그런 일에 이용하려는 건가? | Keep the relationship among the lost gods, the Beckoned, and the Cipher open pending lore context. | This is a historical question. English, Japanese, and Chinese preserve a rhetorically fragmented question; the current Korean follows the English meaning, but the identity/function of the Cipher and what “such ends” refers to are not resolved. | Medium |
| 1963 | 대가문(Great House)이든 참새(Sparrow)든 병사든, 나는 누구에게나 겸손한 종복이지. | Determine whether `Sparrow` is a faction/House, person, title, or literal bird; avoid fixing a common-noun sense prematurely. | English capitalization and Japanese quotation marks suggest a named group or role. The sentence lists it alongside Great House and soldiers; Korean `참새` reads plainly as a bird and may be misleading. | High |
| 1971 | 머건 사냥꾼(Murghan Hunter) | Confirm whether `Murghan Hunter` is a creature/item category, person, or title, and settle its display form. | This remains the historical ambiguity. As an isolated label, the English does not reveal whether `Hunter` is a role or part of a named entity; Japanese transliterates the compound. | Medium |
| 1974 | 예배당들이 파괴됐어. | Confirm the in-world institution and preferred Korean term for `chantries`. | English and Japanese identify religious buildings; Chinese also supports a chapel/temple reading. `예배당` is plausible, but whether these are a specific order's chapels or generic buildings is unknown. | Medium |
| 1985 | 우리가 이렇게 만난 것도 그 때문이야. 힘을 합쳐 세상을 바꾸러 떠나기 전에 먼저 만나야 했으니까. | Verify the intended causal/fated-meeting relationship before refining the abstract wording. | English and Japanese both repeat the idea of meeting before joining to change the world. Korean preserves that relationship but adds an explicit “그 때문” cause not stated in the fragment. | Medium |
| 1993 | ... 프로스트의 비겁하고 부패한 면모가 모두에게 드러났다 ... | Retain the historical title/source-typo questions; confirm the passage's office hierarchy and the exact “corruption was shown” nuance in context. | The Korean follows the English/Japanese account and preserves the chronology and three Castellans. The English contains `corruptoin` and the malformed phrase `was shone`; current wording interprets these as corruption being exposed. | Medium |
| 1998 | ... 동굴이 너무 추워서 장화 신고 여섯 걸음도 떼기 전에 바위처럼 꽁꽁 얼어붙을 지경이었지. | Prefer a direct, natural account of freezing before taking six steps, while retaining the source's hyperbole. | This is a historical question. English is malformed; Japanese says the speaker froze solid after only a few steps. Korean conveys the sense but `얼어붙을 지경` means nearly froze rather than explicitly froze solid. | High |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 1956, 1963, 1971, 1974,
  1985, 1993, and 1998 against the active Korean and source locales. The lore
  relationships, `Sparrow` referent, `Murghan Hunter`, chantries, meeting
  logic, Warsworn titles/source wording, and cold idiom remain open or
  provisional.
- Same-numbered historical `base` findings were kept separate from these
  dialogue, quest, and UI rows.

## Other Checks

- ID 1980 retains 90 Lightning Damage, 35% chance, 4 seconds, 18 Shocking
  Damage, and 35 Mana; ID 1994 retains `{1}`, `{LINE_SPACE}`, and `{2}` in
  source order.
- The remaining inspected dialogue retains its main meaning and Japanese-
  aligned register; no runtime tokens or line breaks were changed.

## Batch Status

IDs 1950-1999 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
