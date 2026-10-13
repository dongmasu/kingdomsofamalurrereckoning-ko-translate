# Preliminary Language Scan: `default` IDs 2300-2349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2300-2349.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked lore terminology,
  proper names, register, and runtime markers.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2300, 2333 | 프리스미어(Prismere) ... / 프리스미어(Prismere) | Confirm the canonical Korean spelling for `Prismere`; preserve the source typo `wordly` in the audit, not in Korean. | English `wordly` is likely a typo for `worldly`; the Korean “이 세상의 경험치 정수” gives the intended sense. Japanese/Chinese differ on the mineral's name, and ID 2333 repeats the same unresolved `Prismere` term. This repeats the historical question. | Medium |
| 2301 | 겨울 궁정, 즉 언실리(Unseelie)는 ... | Confirm whether `Winter Court` and `Unseelie` are interchangeable names for one faction and standardize both terms. | English explicitly equates the terms; Japanese says the faction reveres nature's decay, while Chinese says it embraces it. Korean's `받아들여` is close to “embrace” but the faction's stance and canonical names remain unsettled. This repeats the historical question. | Medium |
| 2303 | 감시자의 다리 | Confirm whether `Warden's Bridge` is a proper place name and standardize `Warden` with other game titles. | English capitalizes the name; Japanese translates it generically as a guardian's bridge, while Chinese transliterates the warden title. Korean's `감시자` is a plausible role reading but may not be the established title. This repeats the historical question. | Medium |
| 2308 | 도브(Dove), 우리는 이제 ... | Confirm whether `Dove` is a codename/name or a literal form of address; retain the conversational tone. | English addresses Dove directly; Japanese omits the name and Chinese translates it literally as “peace messenger.” Korean preserves English traceability without resolving the referent. This repeats the historical question. | Medium |
| 2309 | 파라라(Farrara) ... 블러디 본즈(Bloody Bones) ... 노래에 따르면 그렇다더군. | Confirm the two names and whether “So goes his song” identifies a ballad or is an idiomatic conclusion; preserve the tale-like tone. | English and Japanese include the names and song framing; Chinese calls it his ballad. The Korean keeps the names and reports the song's version, but the exact voice/referent needs surrounding text. This repeats the historical question. | Medium |
| 2313 | 사이온(Scion) | Establish whether `Scion` is a formal role/title and use one corpus-wide Korean form. | The English has a definite title; Japanese/Chinese transliterate it differently. Korean preserves `Scion` in parentheses, but the rank/office meaning remains unsettled. This repeats the historical question. | Medium |
| 2318 | 이사의 숨결(Ysa's Breath) | Determine whether this is a place, item, or named phenomenon before fixing the Korean title. | English capitalizes the phrase; Japanese transliterates it as a compound, and Chinese treats it as a named “breath.” The active bilingual form preserves traceability. This repeats the historical question. | Medium |
| 2329, 2331 | 프리모스(Primos) / 위나돈(Ynadon) | Confirm the identities/titles and canonical Korean spellings of `Primos` and `Ynadon`. | English/Japanese preserve the names, while Chinese translates `Primos` as “leader/boss” and renders the names differently. Korean retains the English forms; no unsupported title is added. This repeats the historical question. | Medium |
| 2337 | 메이드(The Maid)의 성에 걸린 마법 | Standardize `the Maid` as a named/lore-specific figure or title, not an ordinary household maid, if surrounding quest context confirms it. | English capitalization, Japanese's “Windemere heroine,” and Chinese's “maiden” indicate a specific figure. Korean's katakana-derived `메이드` plus the English is traceable but leaves the Korean title undecided. This repeats the historical question. | Medium |
| 2339 | 테스타먼트(Testament) | Confirm whether `Testament` names a faction/organization or means a generic testament, and align it with related quest text. | English capitalizes the term; Japanese and Chinese give organization-like names that differ from the English. Korean transliterates it, retaining traceability. This repeats the historical question. | Medium |
| 2345 | 컵의 왕 이리온(Irion) | Determine whether `King of Cups` is a tarot-like title or an in-world rank/epithet, and verify `Irion` spelling. | English/Japanese present a title; Chinese is more literal. Korean preserves both title and name but does not establish the reference. This repeats the historical question. | Medium |
| 2348 | 하우스 오브 소로우(House of Sorrows) | Confirm the canonical Korean form and whether `House` is a faction, institution, residence, or family. | English/Japanese treat it as a named group; Chinese calls it a family. Korean transliteration is traceable but inconsistent with more localized forms elsewhere. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2300-2301, 2303,
  2308-2309, 2313, 2318, 2329, 2331, 2337, 2339, 2345, and 2348 against
  the active Korean and source locales. The `Prismere` spelling, Winter
  Court/Unseelie relationship, place/name readings, Scion role, Maid title,
  Testament organization, and House of Sorrows form remain open.
- Same-numbered historical entries for other resource types were not applied
  to these dialogue, item, and journal rows.

## Other Checks

- ID 2314 preserves the 8% chance and 5-second duration; ID 2334 preserves
  `{1}` and its camera-control instruction.
- The remaining inspected dialogue and UI strings had no additional
  high-confidence meaning shift in this pass.

## Batch Status

IDs 2300-2349 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
