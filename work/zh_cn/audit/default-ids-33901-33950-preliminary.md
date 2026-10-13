# Preliminary Language Scan: `default` IDs 33901-33950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33901-33950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33902 | `아리부스 엔진` / `열쇠를 풀어야겠어` for `Arrivus engine` / `free the key` | Identify what the engine does and what “free the key” means (release it, unlock it, or make it usable); standardize Guian Stebic and Motus Mining. | Korean translates the action as freeing/unlocking the key. Japanese says the key may become usable, and Chinese says to extract it. English itself is ambiguous; the historical audit explicitly leaves the engine/key mechanism open. | High |
| 33909 | `주문을 쏟아붓다` for source typo `loosing your most damaging spells` | Interpret `loosing` as the likely intended `loosing/releasing` spells, retain the resistance-free assault and survival claim, and keep the typo documented as source-side. | Korean uses “unleash,” matching the apparent intended meaning. Japanese and Chinese also read it as receiving/releasing a spell attack; historical notes explicitly flag the source spelling. | High |
| 33913 | `전승` for `your telling` | Determine whether Telling is an individual fate/story or a named tradition, and standardize its Korean form; preserve the finality of the threat. | Korean treats it as “tradition/tale.” Japanese says simply “this ends,” and Chinese says the listener's story ends. The historical audit flags Telling as a narrative/lore term. | Medium |
| 33916 | `폐하` for `Your Grace` | Verify the addressee's rank and use a Korean honorific matching “Your Grace”; avoid elevating it to a king/emperor title unless context supports that. | English says `Your Grace`; Japanese uses a general “Your Excellency” honorific and Chinese a generic “sir/lord.” Korean `폐하` specifically suggests royal majesty and may overstate rank. | Medium |
| 33917 | `절벽에서 떨어지는 꼴` for `my plummet from the cliffs` | Preserve the speaker's self-sacrifice/fall reference and the mother's inability to watch it, but keep the source's syntactic ambiguity and the unclear act done in her name unresolved. | Korean interprets `plummet` as falling from the cliffs because of an act committed in the mother's name. Japanese/Chinese also describe a fall, while the exact relation and intended consequence remain unclear. The historical audit flags this passage. | Medium |
| 33919 | `대여주인` / `지고왕의 길잡이` for `grand mistress of Ysa` / `High King's Guide` | Confirm both formal titles and standardize them; preserve the ceremonial introduction. | Korean translates the titles literally. Japanese renders the first as Grand Master and treats High King's Guide as a separate title; the intended institutional hierarchy is unresolved. The historical audit calls out these titles. | Medium |
| 33921 | `워스워른` for `Warsworn` | Standardize this named faction/group form with the corpus glossary while preserving the speaker's teasing “look in your eye” question. | Korean transliterates the group name; the term appears repeatedly with several active Korean renderings and remains a cross-corpus consistency issue. | Medium |
| 33926 | `레이븐스윙호` for `Ravenswing` | Confirm whether the name is a ship and retain the vessel suffix only if context supports it; standardize the proper name. | Korean appends the ship suffix `호`; Japanese and Chinese also treat it as a vessel. This is supported by the locale references but remains a proper-name convention candidate. | Low |
| 33929 | `니오르디르` for `Njordir` | Verify the deity's canonical spelling/transliteration and preserve the water-god and rebirth-blessing claim. | Korean transliterates the name; Japanese and Chinese use different phonetic forms. The historical audit specifically flags Njordir for lore-name confirmation. | Medium |
| 33932 | `스리 소드` for `Three Swords` | Determine whether Three Swords names a group/person/item or literally refers to three swords; standardize the name and preserve the search instruction. | English capitalizes the term; Japanese transliterates it as a name, while Chinese translates it as “three swords.” Korean uses a transliteration. Historical notes explicitly ask whether this is a named group. | High |
| 33934 | `{*1Shadow Strike}` / `{*1Twisted Claw}` payloads | Preserve both token wrappers, their order, two-paragraph layout, and the 5-hit maximum; determine whether the marker labels should be localized to Korean as they are in Japanese/Chinese. | Korean keeps the English payload strings and matches English wrapper order. Japanese and Chinese localize the labels inside the `{*1...}` markers. The two newline characters and maximum of five chained attacks are preserved. | Medium |
| 33938 | `교차의 앰풀라` for `Crossing ampulla` | Confirm whether Crossing is a named place/rite and ampulla a specific relic; preserve that Pura welded it atop the helm to strengthen the armor. | Korean transliterates ampulla and renders Crossing literally. Japanese and Chinese offer different religious/place readings; the historical audit explicitly leaves the object's identity open. | Medium |
| 33942 | `예정된 자들(Preordained)` for `Preordained` | Determine whether Preordained names a faction/group or a descriptive state here; standardize its Korean form while preserving indiscriminate slaughter of Wild Fae. | English capitalization and plural verb suggest a group; Korean adds the English form parenthetically. Chinese/Japanese also use a group-like reading, but the historical log leaves its faction status open. | Medium |
| 33946 | `와이번-기프르 가문` for `Wyvyrn-Gifre` | Confirm whether this is a hyphenated joined family name, and avoid adding “family” unless this row/context establishes it; standardize both family names. | Korean interprets the compound as a family name. The historical audit explicitly asks how the Wyvyrn/Gifre joined family name should be constructed. | Medium |
| 33950 | `음악 준비` for standalone label `Music Preparation` | Verify whether this is a player-facing UI label, an internal production/activity label, or a named menu; localize consistently with its actual function. | English and Japanese leave the label in English, while Chinese and Korean translate it. The row alone provides no UI context. | Low |

IDs 33901, 33903-33908, 33910-33912, 33914-33915, 33918, 33920,
33922-33925, 33927-33928, 33930-33931, 33933, 33935-33937, 33939-33941,
33943-33945, and 33947-33949 generally retain the English meaning on this
first reading. Proper names, lore, voice, and display conventions remain
integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33800-33999 explicitly flags
  Arrivus engine/key (33902), `loosing` (33909), the cliff/mother wording
  (33917), High King's Guide (33919), Warsworn (33921), Idylla (33923),
  Ravenswing (33926), Njordir (33929), Three Swords (33932), marker/value
  preservation (33934), Crossing ampulla (33938), Preordained (33942), and
  Wyvyrn/Gifre (33946). These questions were checked against active Korean
  and all locale references.
- At ID 33934, wrapper identities/order are retained and the `5`-hit limit
  is preserved; English marker payloads in Korean are recorded separately
  from wrapper integrity.
- ID 33947's Japanese-only explicit one-versus-three numeric wording was
  checked against English's singular “a mage” and “let alone three”; no
  count contradiction was found.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33901-33950 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 33934 retains
  two newline characters, separating the two ability instructions.
- ID 33934 preserves `{*1Shadow Strike}` and `{*1Twisted Claw}` in source
  order; the marker payload text is localized in Japanese/Chinese but
  remains English in Korean. The maximum of `5` chained hits is preserved.
- No gameplay-value discrepancy was detected. The Japanese-only `1` at
  ID 33947 corresponds to English's singular “a mage.”
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33901-33950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33951.
