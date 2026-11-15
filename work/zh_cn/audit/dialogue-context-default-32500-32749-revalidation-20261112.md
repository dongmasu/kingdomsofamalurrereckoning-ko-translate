# Sequential `default` Revalidation: IDs `32500`-`32749`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 65 existing ledger entries and added 185 IDs. Findings are
  proposals, not approved translation edits.
- Nine new in-range correction candidates and two evidence-limited holds are
  recorded. Existing candidates and the hold at `32716` were rechecked against
  the current four-language sources; their prior dispositions remain.
- No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `32568` | Naturalness / voice | This is a father's affectionate letter to Nina. The closing `사랑을 담아, 아버지가` is understandable but sounds more formal than the gentle, child-directed letter. Consider `사랑을 담아, 아빠가` while preserving the source's closing and all 12 embedded line breaks. | Medium |
| `32585` | Name / format | `Well of Chickenhill` is a named location. Japanese and Chinese confirm the place name, while Korean has only `치킨힐의 샘`. Consider `치킨힐(Chickenhill)의 샘`. | High |
| `32591` | Name / format | `The Testament` names the same death-cult organization rendered elsewhere as `테스타먼트(Testament)` or `벨렌의 성약단(Belen's Testament)`. Pair the abbreviated reference as `테스타먼트(Testament)`. | High |
| `32598` | Meaning / name format | The sentence says Sveri owes the writer a favor; Japanese independently confirms that direction. Korean reverses the debtor and creditor (`스베리에게 진 빚을 갚으라고`). Change it to asking Sveri to repay the favor owed to the writer. The later `Cranwyn` family reference is also unpaired; consider `크랜윈(Cranwyn)이라는 도크알파르(Dokkalfar)`. Preserve all 13 embedded line breaks. | High |
| `32629` | Naturalness | `그런 자들은 없는 편이 세상에 나아` has a wrong/unnatural predicate. The English, Japanese, and Chinese all mean the world is better without such people. Consider `그런 자들은 없는 편이 세상에 낫지.` | High |
| `32711` | Format | Korean alone inserts two embedded line breaks. The English, Japanese, and Chinese keep the short rhetorical fragments in one paragraph. Consider removing the Korean-only breaks while retaining the fragmentary cadence; confirm the intended display layout before application. | Medium |
| `32712` | Terminology | `Castellan` is rendered `성채 관리관`, while the established title elsewhere is `성주(Castellan)` (for example, IDs `7634` and `60485`). Use the established title here, with English pairing if appropriate: `성주(Castellan)가 욕을 퍼부으면...`. | High |
| `32741` | Meaning / naturalness | English `the camp will need services` is clarified by Japanese as the speaker's own skill/service being needed. Korean `이곳에도 일손이 필요하겠어` loses that first-person offer. Consider `돌아왔다면 이곳에도 내 도움이 필요하겠어.` | Medium-high |
| `32748` | Name / format | `Return to Aedmon` is a named character objective. Korean `에드몬에게 돌아가기` omits the source pairing. Consider `에드몬(Aedmon)에게 돌아가기`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `32590` | Meaning / title | `Smuggler's Run` is rendered as `密輸業者の仕事` in Japanese and `走私者的逃亡` in Chinese, while Korean follows the escape sense (`밀수꾼의 도주`). Without a resolvable title/context reference, the intended sense of `Run` remains uncertain. |
| `32641` | Meaning / title / wordplay | `Murder Most Fowl` contains an English `fowl`/`foul` pun. Japanese and Chinese also differ in how they render the title, and the available context does not establish a Korean equivalent that preserves both senses. Keep the current title pending stronger context. |

## Earlier Findings Rechecked

- Existing candidates `32505`, `32511`, `32518`, `32525`, `32569`, `32610`,
  `32612`, `32700`, `32713`, and `32734` remain supported by their linked
  reports. Existing hold `32716` remains unresolved. The other 54 prior rows
  in this range remain not flagged.
- `32557` (`Captain Emotional`) is retained: the Japanese and Chinese
  references support the current meaning, and no evidence establishes a
  different title or speaker.
- `32675` already pairs `Nanne Hanri` as `난네 한리(Nanne Hanri)`; no name
  pairing correction is needed.
- `32632` uses a localized `[DO NOT USE]` warning. Its bracketed text is
  translated in each locale, so it is not a missing-token issue.
- No speaker or playback order was inferred from asset membership, NPC
  symbols, handler serialization, or ID order.

## Follow-up: Earlier `Mudhold Fasting` Hold

The earlier hold at `32325` is now a correction candidate. The lore entry at
`32740` explicitly defines `fastings` as Dverga tunnels, and `54487` describes
them as an underground tunnel network. Other named locations consistently
translate this feature as `지하 통로` (`소울딥 지하 통로(Souldeep Fasting)`,
`그레이브홀 지하 통로(Gravehal Fasting)`, and
`클리프브레이크 지하 통로(Cliffbreak Fasting)`). Consider
`머드홀드 지하 통로(Mudhold Fasting)` at `32325`; this supersedes the
earlier evidence-limited hold without changing the translation CSV.

## Repeated Sources And Structure

- Sixty exact-English duplicate groups touch this range (760 corpus rows).
  Korean differs in one group: `32613` uses `무슨 뜻이야?`, while
  `22820`, `27084`, `54185`, and `58537` use `무슨 뜻이지?`. Japanese also
  differs at `32613` (`どういうこと？` versus `どういうことだ？`), so retain
  the ID-specific Korean register rather than forcing identical wording.
- English, Japanese, and Chinese have matching embedded-line-break counts
  across the range. Korean has two additional breaks, both at `32711`; they
  are documented above. Existing line breaks, including the 13 at `32598`,
  were preserved.
- Runtime placeholders and markup were checked. The only raw bracket-text
  difference is the localized warning at `32632`; runtime and markup
  structures otherwise match.

After this range, the ledger contains 41,227 of 65,135 unique IDs (63.29%),
leaving 23,908. Sequential coverage reaches ID `32749`; next:
`32750`-`32999`.
