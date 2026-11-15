# Sequential `default` Revalidation: IDs `47000`-`47249`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 66 previously recorded four-language fingerprints; all match.
  Added the other 184 IDs to the review ledger.
- Ten current correction candidates and four evidence-limited holds remain;
  the other 236 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `47004` | Naturalness / speech level | Japanese welcomes the addressee with plain, conversational `君` and `楽しんでくれ`; Korean shifts to formal `오신 것을 환영합니다` and `누리시길 바랍니다`. Consider preserving the meaning in a conversational register. The multi-NPC asset does not identify this row's speaker. | Medium |
| `47041` | Name / terminology consistency | `The Big Hunt` is translated `대사냥`, while the same establishment is `빅 헌트` at `47200` and `59258`; related lines `29900` and `41905` also vary. Japanese consistently uses `ビッグハント`. The earlier occurrence review supports aligning this named establishment as `빅 헌트(The Big Hunt)`. | High |
| `47052` | Meaning | Japanese and Chinese identify `Star` as a camp (`星のキャンプ`, `星之营地`), but Korean says only `별에 온 걸 환영해`, omitting the destination type and making `Star` read as a celestial star. Restore the camp meaning; settle the Korean place-name form separately. | High |
| `47143` | Name format | The line explicitly names the fungus `Sorrogweth`, but Korean gives only `소로그웨스`. Other rows, including `373`, `3734`, `7014`, and `8230`, use `소로그웨스(Sorrogweth)`. Add the established English pairing. | High |
| `47146` | Terminology consistency | This row is an exact English and Japanese duplicate of `14591`, but Korean spells the mineral `타이레니움(tyrenium)` here versus `티레니움(Tyrenium)` at `14591`. Align to the already-used `티레니움(Tyrenium)` form. | High |
| `47165` | Format | Korean inserts two embedded line breaks, splitting this prose into three lines; English, Japanese, and Chinese have no embedded breaks. Consider removing the two unsupported breaks while preserving the sentence's rhetorical fragments. | High |
| `47169` | Meaning / terminology | English is `Merchants Delegation`, without `United`, but Korean adds `연합`. The project distinguishes `상인 연합 대표단(United Merchants Delegation)` at `3601` from the shorter name. Consider `상인 대표단(Merchants Delegation)`. | High |
| `47192` | Meaning / terminology | `The Healer's` is the contraction `The Healer is`; Japanese `ヒーラー` and Chinese `治疗师` also mean a healer. `의무병` narrows this to a military medical role. Consider the established general term `치유사` or `치료사`; the asset does not establish an individual speaker. | Medium-high |
| `47224` | Name format | `Han` is a person named in the sentence, but Korean has only `한`. Add the English pairing, e.g. `한(Han)은`, without changing the insult or register. | High |
| `47243` | Terminology / name format | The weapon types `Katars` and `Claws` are transliterated as `카타르, 클로` without English pairings. Consider `카타르(Katars), 클로(Claws)` to make the named weapon classes identifiable and consistent. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `47068` | Proper name / meaning | `Toothpicks` is capitalized as a named item, while Japanese says knives and Chinese specifies a dagger-like item. The Korean literal `이쑤시개들(Toothpicks)` may preserve an intentional comic name; the row does not establish whether to translate it as a weapon type or retain the joke. |
| `47148` | Meaning | `Merchant's stores` can mean a merchant's stock/supplies or their shop premises. Korean `상인의 물건` selects the inventory reading, while Japanese and Chinese lean toward a shop. Retain pending context that resolves the intended referent. |
| `47222` | Proper name / format | The standalone `Syl` has no role or text-type context. Korean `실` matches the name used for the place at `9918`, but this row alone does not establish whether the label is a person, place, or another named entry. |
| `47249` | Proper name / terminology | The standalone `Sativa` could be a name, plant, or item label. Other uses include `Sativa Stalks`, `Sativa Fibers`, and `Sativa Road`, with mixed English-pairing practice. Do not force a pairing or category from this isolated label. |

## Rechecked Findings and Structure

- The prior `47010` interpretation remains supported: this `SQ147` text is
  about a donation box, consistent with Japanese `募金箱`, Chinese donations,
  and the related asset review. The current `모금함` is retained.
- The handoff's other priority rows were rechecked. `47095` preserves the
  creatures' toughness; `47191` is a faithful blessing; `47223` and `47236`
  preserve the source terms and meaning. `47243` is recorded above for weapon
  name pairing, not as a meaning or register error.
- Sixty exact-English duplicate groups touch the range and cover 1,515 corpus
  rows. Korean differs in one group only: `14591`/`47146` have identical
  English and Japanese, while their Korean mineral spelling differs. The
  remaining groups match in Korean.
- Six entries contain line breaks: `47047`, `47072`, `47133`, `47165`,
  `47186`, and `47196`. They contain 15 Korean embedded breaks in total.
  Per-row counts match all four languages except `47165`, which has two
  additional Korean breaks; Korean embedded separators are CRLF.
- Runtime/control markup occurs at `47072`, `47234`, and `47244`. Markup and
  variables are present; at `47234`, the `{1}` position differs from English
  but follows Japanese and Chinese. No token was normalized or reordered.
- Of 250 IDs, 201 have indexed asset associations, including 136 of the 184
  newly recorded IDs. The index contains 203 ID-asset links across 132
  assets; `47024` and `47128` each link to two assets. No individual speaker
  or playback order is inferred from asset, quest, NPC-symbol, or handler
  associations.

## Prior-Record Reconciliation

- The name-pairing finding at `47143` was not flagged in its earlier `SQ139`
  review. This four-language pass found that the same named fungus is
  consistently paired as `소로그웨스(Sorrogweth)` in other rows, so the
  current candidate is recorded here; the historical ledger row is unchanged.
- `47041`'s `The Big Hunt` consistency candidate was already recorded in the
  earlier `BigHunt` review and remains supported by the current rows. Its
  historical ledger disposition is unchanged.
- The earlier `47068` review retained `이쑤시개들(Toothpicks)`. The current
  pass still does not establish whether this is an intentionally comic item
  name or a weapon reference; it is a hold, not an approved replacement.

## Range Result

- The range has ten correction-candidate IDs and four evidence-limited holds;
  the other 236 IDs have no current finding.
- After appending 184 new IDs, the ledger covers 51,957 of 65,135 unique
  `default` IDs (79.77%), leaving 13,178. Sequential coverage reaches
  `47249`; next is `47250`-`47499`. Of reviewed IDs, 41,703 have indexed
  asset links and 10,254 do not.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
