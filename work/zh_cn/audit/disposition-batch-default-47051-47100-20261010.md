# Disposition Batch: `default` IDs 47051-47100

- Date: 2026-10-10. Compared active Korean against English meaning, Japanese
  voice/register, Chinese supporting evidence, source-keyed historical notes,
  terminology decisions, and row structure. These are working dispositions,
  not independent final linguistic approval.
- Decisions: one accepted correction already present in the active CSV,
  thirteen uncertain findings, and one grouped `not an issue` disposition
  covering the other 36 IDs.
- No Korean `Texto` cell was changed during this disposition pass.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 47053 | Uncertain | `my grace` may be an honorific, but the addressee's rank and the established Korean title are not established by the row or locale references. |
| 47055 | Uncertain | The ring's tarnished green color and age comparison are retained; Nell's identity and the teasing nuance need context. |
| 47058 | Uncertain | The alternate quest paths, improved rewards, and reduced guard-bribe cost are preserved; canonical UI wording for Persuasion remains unverified. |
| 47061 | Uncertain | The House of Sorrows faction name is retained bilingually, but its canonical Korean form remains open in the historical terminology record. |
| 47065 | Uncertain | `Master Makers` could be a named group or a generic description of master craftspeople; the locale references do not settle the entity type. |
| 47066 | Uncertain | The expected pursuit and planned departure are preserved; the canonical rendering and status of Adessan Praetorians remain provisional. |
| 47068 | Uncertain | The map, strongbox, and key chain are retained; `Toothpicks` may be a named cache or a literal humorous label, and the locale referents conflict. |
| 47071 | Uncertain | The Faeblades, authenticity, Fae makers, and Ysa are retained; `Honor Brands` may be a product/name and is not settled by rendering it as a mark. |
| 47075 | Uncertain | The search objective is clear, but whether Cairns names lore objects or generic stone piles remains a terminology question. |
| 47077 | Uncertain | The long-standing entry restriction and ancient-ruin identification are preserved; Vraekor and Aodh spellings are provisional. |
| 47090 | Uncertain | The childhood location and westward departure are preserved; the canonical realm name `Red Marches` remains unresolved. |
| 47094 | Uncertain | Four note sets, the Ysa-Ohn Fae war, and the return destination are preserved; the clustered proper-name spellings remain provisional. |
| 47095 | Accepted | The active Korean already read `파라곤 바게스트의 심장이라니! 정말 끈질긴 놈들이군. 잠깐만...` at session entry. This naturally conveys the creatures' exceptional toughness in context; English `Incredibly tough` and Japanese `信じられないほどタフ` support the sense. The earlier preliminary wording `질긴 생물` risked suggesting chewy texture. |
| 47096 | Uncertain | The intended paradox is that the speaker feared no fated opponent might exist; the Korean can express this but its syntax and literary nuance need integrated context. |
| 47051-47100 excluding the IDs above | Not an issue | The remaining dialogue, objectives, labels, names, and gameplay text preserve the source meaning and function. `FAIL LINE` remains verbatim as supported by English/Japanese and historical notes; quantities, marker identity, and row structure remain intact. |

Decision IDs D-14377 through D-14391. Direct register totals after this
batch: 1,441 accepted, 4,644 `not an issue`, and 8,340 uncertain (14,425
categorized dispositions). The next decision ID is D-14392.

At session entry, the active CSV already contained the accepted 47095 wording
and had SHA-256
`8b4e753bcb9587d550bb42d0eae8ea38218f3b1c1418ebd68cec9f971a1bb101`;
this differed from the previous documented checkpoint. The 47095 record
ended in a bare LF, so only that record terminator was restored to CRLF.
Current CSV SHA-256:
`851b423001513db84c94aeeb8c8e194c111a182d7aec7cbf0c0e664e78f6c506`.
The UTF-8 BOM, 72,046 CRLF record endings, and 39 pre-existing bare-LF
endings are present. The four locale files contain IDs 47051-47100 once in
the same ascending order; line-break counts and detected runtime-marker
signatures match.

## Structural and Historical Notes

- The Chinese source row at ID 47067 contains an embedded U+FEFF in the name;
  English, Japanese, and active Korean do not. This source-side hidden
  character is recorded, not copied into Korean.
- ID 47072 preserves `{*1[활성]}`, its single line break, Faer Gorta summon,
  and the 120-second duration. The Korean embedded break is CRLF in the cell;
  its count and rendered two-part layout match the locale rows.
- The nine warding principles/ten-word joke at 47092 and four record sets at
  47094 retain their quantities. No source discrepancy authorizes changing
  them.
- No global name or bilingual-parenthetical normalization was inferred from
  these rows. Uncertain findings remain open for integrated review.
