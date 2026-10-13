# Preliminary Language Scan: `default` IDs 56801-56850

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56801-56850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56804 | `Spellbinding` / `마법부여` | Confirm whether this is an ability/skill name, a binding spell, or an item enchantment, and align the Korean term with its UI context. | Japanese reads as a sealing/curse term, Chinese as “captivating,” and Korean as enchanting. The isolated label does not establish the mechanic. | Medium |
| 56809 | Bow's Charged Shot / `활 강공격` | Confirm the official Korean ability label and preserve the distinction between the Charged Shot ability and its three charged arrows. | English and Chinese describe a Bow Charged Shot firing three charged arrows; Japanese specifies a Longbow. Korean says “bow heavy attack,” which may conflate charge-shot and heavy-attack terminology. | Medium |
| 56810 | Fae-stone poem / `그녀만의 세계` | Preserve the poem's stanza/paragraph structure and the gendered “her own” ending; clarify who “her” refers to before settling the interpretation. | The sources retain the two quoted passages and the line breaks. English ends with the fragment `I will make her own`; Japanese and Chinese supply a “world” reading. Korean likewise makes “world” explicit, plausibly completing the fragment but resolving an open antecedent. | Medium |
| 56814 | tavern business / `여관 영업` | Keep the refusal and lack of clean mugs/beds, while confirming whether this is a tavern or inn rather than normalizing the establishment term in isolation. | English and Japanese say tavern; Korean uses the broader inn term. Chinese agrees the business is closed for the day. | Low |
| 56816 | Aster Inheritance / `아스터 상속권 찾기` | Preserve the note-title meaning and record the source typo without treating it as canonical spelling. | English misspells `Inheritance` as `Inheritence`; Japanese and Chinese render an inheritance/retrieval title. Korean expresses searching for the inheritance right. The historical audit specifically flags the source typo and title. | Medium |
| 56826 | Scion / `후계자` | Confirm whether `Scion` is the formal office/title here or a generic successor, and align the title only after corpus-wide review. | English capitalizes `Scion`; Japanese transliterates it, while Chinese reads it as a priest. Korean uses “successor,” a plausible but potentially generic reading. | Medium |
| 56828 | `took our pickings` / `쓸 만한 걸 챙겼지` | Preserve that the group took its share from the wreckage before it was cleared and then learned the secret. | English, Japanese, and Chinese agree on taking goods/pickings from the wreckage. Korean's “usable things” is natural but narrows the unspecified items to useful objects. | Low |
| 56829 | Fountain / Wellspring / `분수`, `샘의 근원` | Determine whether these are two proper names, alternate names, or the speaker's uncertain memory of one source of city magic. | All sources preserve the speaker's uncertainty between the two labels. English capitalizes them; Korean translates both descriptively, while the historical audit leaves their names and referents open. | Medium |
| 56836 | `The blood's on your hands` / `네 손에 피를 묻혔어` | Confirm that Korean is read as responsibility for deaths, not a literal accusation of physical blood. | English and Japanese make this a blame/responsibility idiom; Chinese says “you did it.” Korean's wording can function idiomatically but is also close to the literal image. | Medium |
| 56837 | King of Cups / `컵의 왕 이리온(Irion)` | Keep the current title but confirm its card/lore function and canonical Korean form against recurring occurrences. | English names Irion and King of Cups; prior decisions D-380 and D-1198 leave the title function and Korean card/suit wording unresolved. | Medium |
| 56841 | `dove` / `그대여` | Check whether `dove` is an affectionate nickname/vocative and preserve the apologetic intimacy. | English directly addresses the listener as `dove`; Japanese omits it and Chinese renders it as a messenger/peace-related term. Korean's poetic `그대여` avoids inventing a name but loses the explicit endearment. | Medium |
| 56843 | Sidhe / `시드` | Confirm whether Sidhe denotes a people, realm, or region here and use the established Korean form. | English and Chinese point to a location somewhere in the Sidhe; Japanese's reading is less clear. Korean transliterates the proper term, but its referent remains open in the historical audit. | Medium |
| 56844 | The Withering War / `쇠락 전쟁` | Confirm this as a named historical event and use the canonical Korean title consistently. | All sources identify the war between Summer and Winter Fae. Korean translates the title; the historical audit asks whether to treat it as a fixed event name. | Medium |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Names and terms remain provisional, including
Camden, Spellbinding, Chicken Hill, Garaner Vernt, Longbow, Varen Seawine,
Templar Jorielle, Scion, Wellspring, Irion, Adath Skoria, Ohn's Stand,
Sidhe, and Tirnoch.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56750-56849`.
  Relevant prompts in this active range include the Fae-stone poem and its
  gendered ending (56810), the Aster Inheritance typo/title (56816), the
  `madman` antecedent (56823), the city's Fountain/Wellspring names
  (56829), the Moon Goddess bow (56835), `dove` and Ohn's Stand (56841),
  and The Withering War as a named event (56844). These remain prompts,
  not accepted corrections.
- IDs 56801-56850 fall entirely within `56750-56849`; each active row is
  reviewed once.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56801-56850 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts match throughout the batch, including the quoted poem at
  56810.
- No runtime-marker identity/order difference or cross-locale numeric-value
  discrepancy was identified.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Initial Batch Status

IDs 56801-56850 received one preliminary reading. The subsequent disposition
pass is recorded below and in the linked batch report.

## Disposition Follow-up (2026-10-11)

All 50 rows were rechecked against the English, Japanese, and Chinese source
CSVs under `src/csv/`, the active Korean CSV, the historical audit, and
recurring decisions. Three corrections were applied at IDs 56809, 56816,
and 56836. Eleven uncertainty entries remain, including a separate
Charged Shot terminology question overlapping accepted ID 56809; 37 IDs
were dispositioned `not an issue`. See
[`disposition-batch-default-56801-56850-20261011.md`](disposition-batch-default-56801-56850-20261011.md).
These are working dispositions, not independent final linguistic approval.

The four locale CSVs contain 65,135 IDs in identical order. Batch
line-break counts, runtime markers, marker order, and numeric values match.
The active Korean default CSV SHA-256 is
`6c1897f4b72f83cb6fc239034020ac249cb31c6c950c68b89255d13ddcfb4244`.
UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved. Resume at ID 56851.
