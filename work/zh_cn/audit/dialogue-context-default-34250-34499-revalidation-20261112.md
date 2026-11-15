# Sequential `default` Revalidation: IDs `34250`-`34499`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 67 existing ledger entries and added the other 183 IDs.
  Findings are review proposals, not approved translation edits.
- Thirteen new correction-candidate IDs were identified; two existing
  `not-issue` rows were promoted, and five existing candidates were retained.
  Sixteen new evidence-limited holds were recorded, one existing hold was
  retained, and the hold at `34251` was cleared after the current four-language
  comparison. `34291` and `34336` each have a formatting candidate and a
  separate meaning/context hold.
- No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `34254` | Creature-label format | The description identifies the enemy type `Kobold Rogues`, but Korean pairs only `Kobold` and leaves `도적` outside the source label. Consider pairing the complete type, such as `코볼트 도적(Kobold Rogue)`, without changing the established Korean species term. | Medium |
| `34256` | Name / format | The line names the noble homeland `Tolyndrae`; Korean `톨린드레이` has no source spelling. Add `(Tolyndrae)` while preserving the existing sentence and the distinct place reference. | High |
| `34259` | Name / format | `Osgar and Medgar Krast` names both brothers under their shared family name, but Korean pairs only Medgar's full name. Pair both complete names, e.g. `오스가르 크라스트(Osgar Krast)와 메드가르 크라스트(Medgar Krast)`. The linked group report also covers IDs `26414` and `30331`. | High |
| `34271` | Naturalness | The source contrasts the rescued man's strengths being a help rather than a hindrance. Korean `그 힘이 도움이 되면 좋겠어. 방해가 되지 말고` leaves the second clause awkwardly detached. Consider `그 힘이 방해가 아니라 도움이 되면 좋겠어.` | High |
| `34277` | Name / title format | `Captain Drefan` is rendered `드레판(Drefan) 대장`, pairing only the name. Match the complete title form used elsewhere, such as `드레판 대장(Captain Drefan)`. | High |
| `34291` | Name / title format | The source gives the full place description `Sinsear, the Hollow of the Weeping King`; Korean pairs `Sinsear` and `Weeping King` separately but not the complete named description. If the Hollow is the displayed place label, pair the full source phrase without resolving the separate `Sorrows` terminology question below. | Medium |
| `34302`, `34369` | Lore term / format | Both lines use capitalized `Font` as a named lore location, but Korean uses unpaired `샘`. Use the established `샘(The Font)` form at each actual reference; retain the existing Understyle and Ysa wording at `34302`. | High |
| `34306` | Meaning | English and Japanese do not say that humans captured the speaker. Korean adds `사람들이` in `사람들이 날 붙잡아 가뒀어`. Consider an unspecified subject such as `그놈들이 날 붙잡아 가뒀어`, preserving the following one-cage-into-another metaphor. | High |
| `34336` | Event-name format | The sentence lists the named battles `Tywili`, `the Dawn March`, `the War of Parries`, `Varlaine's Gambit`, and `Orieator's Stand`. Korean pairs only the last title and leaves the others translated or transliterated without their source forms. Pair the complete names consistently; the historical and identity questions remain held separately. | Medium-high |
| `34339` | Name / title format | `Master Mcleod` is rendered `맥클라우드(Mcleod) 대가`, pairing only the surname. Pair the complete name and title, e.g. `맥클라우드 대가(Master Mcleod)`, while preserving the list-like cadence. | High |
| `34347` | Creature-label format | The source label is `Niskaru Hunter`, while Korean pairs only `Niskaru` in `니스카루(Niskaru) 사냥꾼`. Pair the complete enemy label without changing the Korean term. | Medium |
| `34373` | Name / format | `Britt` is a named identity in `Your days as Britt are over`, but Korean `브릿으로 살던 날` omits the source spelling. Add `(Britt)` without inferring a title or surname. | High |
| `34387` | Meaning | `How do you know to believe?` asks how belief or faith is justified; Korean `무엇을 믿어야 하는지 어떻게 알지?` instead asks which thing to believe. Consider `무엇을 믿어야 할지 어떻게 알 수 있지?` or a context-supported equivalent. | Medium-high |
| `34411` | Name / format | The sentence names Lord Gastyr and Braxis, but Korean `가스티르 경` and `브락시스` have no English pairings. Add `(Lord Gastyr)` and `(Braxis)` at those references; preserve that only some scholars believe Braxis created the lights. | High |
| `34414` | Terminology / naturalness | This is the same Motus Mining branch handbook referenced elsewhere. The current `지점 운영 지침서` differs from the reviewed `지점 업무 안내서` form, and the repeated company/branch wording is cumbersome. Align the handbook term and streamline the sentence only as far as the source's two branch locations and purpose remain explicit. | Medium-high |
| `34417` | Place-name format | `Old Holn Millhouse` is rendered `올드 홀른 제분소` without the complete English place label. Pair the complete source name while preserving the established Korean wording. | Medium |
| `34432` | Naturalness | `그냥 옳게 느껴져요` is an unnatural rendering of “it just feels right.” Consider `그냥 옳은 일 같아요`, retaining the hesitant, reflective voice and the preceding fragments. | Medium-high |
| `34447` | Title format | The standalone title `Ghosts of the Past` is rendered `과거의 망령` without its English title. Add `(Ghosts of the Past)` if this is the displayed title; do not change the translation itself. | Medium |
| `34457` | Meaning | `Akara be praised` is a praise formula, while Korean `아카라(Akara)께 감사드려` says to thank Akara. Consider a praise expression, preserving the speaker's relief that he cannot approach the village. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason |
| ---: | --- | --- |
| `34275` | Meaning / fragment | `And you shall` is a context-dependent fragment. The locales differ, and the row alone does not establish what the addressee will do or receive; do not guess from the following acting-role question. |
| `34276` | Meaning / wordplay | `He up and ran ‒ Down` appears to depend on a joke or physical action not established by this isolated row. Korean's `펄쩍 뛰어 달아나더니…… 아래로` may not preserve the intended punch line, but the exact correction is unsupported. |
| `34291` | Meaning / place name | The references disagree on whether `Sorrows` is a power, place, or House-related entity and whether the `Hollow` is a named location. Retain the existing wording pending stronger lore context. |
| `34329` | Terminology | `Oathblade` is rendered as a literal blade, while Japanese and Chinese treat it differently. The standalone label does not establish whether it is a title, rank, faction, or weapon. |
| `34335` | Name / chronology | English says “Magnus ‒ the first, I mean”; Japanese and Chinese differ on the ordinal/title reading, while Korean supplies `Hroth Magnus`. The identity and “first” relationship need corroboration. |
| `34336` | Meaning / chronology | The listed campaign names and the relation of “the first” Magnus to the sequence differ across the available sources. The complete English pairings are a separate format candidate; do not canonicalize the event names or chronology here. |
| `34353` | Meaning / title | `Quintessence of Debauchery` may be a title, named entity, or descriptive phrase. The direct Korean translation is plausible, and the label alone does not settle its status. |
| `34372` | Literary form | The ten-line poem preserves its story beats and line structure, but not the English end-rhyme pattern. Do not force rhyme or rewrite the poem without a separately reviewed literary solution. |
| `34378` | Meaning / title | `Reverie` could be an ordinary state or a named concept; Japanese and Chinese differ. `몽상` is plausible but should not be normalized without context. |
| `34380` | Meaning / entity | `Pengaras House` could refer to a family, political House, or building. Korean preserves the House reading, but this row does not settle the entity type. |
| `34391` | Meaning / lore | English describes the Sorrows as a monument to the House's work and questions their use as a tool of war. Korean shifts among `비탄의 힘`, `비탄의 집`, and `비탄의 집이 이룬 업적`; the lore relationship and tense need context before correction. |
| `34392` | Title / role | `Primos` and `Beckoned` are title-like terms. Korean preserves both source names, but the office/title sense of Primos is not established by this line alone. |
| `34405` | Meaning / religious context | English says the brothers are preparing to give Father Etair last rites; Japanese describes funeral preparation, and Chinese says last rites. Korean follows the funeral reading. The source conflict prevents a safe timing or ritual correction. |
| `34421` | Title / meaning | `Tyrannus Bolganus` is proclaimed as a title, while Japanese and Chinese interpret it as a conqueror/king title. Korean preserves the Latin form; the intended title meaning remains unresolved. |
| `34429` | Role / entity | `Tender of this House` is rendered as `이 가문을 돌보는 이(Tender)`. Japanese and Chinese suggest different caretaker/protector roles, and `House` may be more than a family; do not invent a formal office. |
| `34442` | Terminology | `Drawpower` may be a named mechanic or a generic action. Japanese transliterates it and Chinese interprets bow power; its standalone label does not authorize a canonical Korean term. |
| `34462` | Register / address | The row's respectful `주군` address coexists with plain style, and the earlier source review found no basis to recast the omen phrase or infer a different speaker relationship. Retain the existing hold. |

## Repeated Sources And Structure

- One exact-English duplicate group (three rows: `34270`, `34294`, and
  `34410`) occurs in the range. All three Korean strings match; no wording
  was mechanically unified.
- The Krast brothers at `34259` were checked with the already-recorded
  occurrences at `26414` and `30331`. The `Red "the Dead" Idward` spelling at
  `34250` was checked against `16927`; the existing cross-range finding was
  retained rather than changing either CSV row.
- Embedded line-break counts match across all four languages. The poem,
  lore passage, battle list, stat text, and long book entry retain their
  existing paragraph/line structure.
- Normalized runtime-token and markup inventories match across all four
  languages. No Korean token or numeric-value loss was found.
- No speaker identity or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

The ledger now contains 42,521 of 65,135 unique IDs; the exact verified
percentage and asset-link counts are recorded in the cumulative metadata.
Sequential coverage reaches ID `34499`; next: `34500`-`34749`.
