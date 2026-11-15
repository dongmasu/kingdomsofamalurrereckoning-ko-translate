# Sequential `default` Revalidation: IDs `30750`-`30999`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 74 existing ledger entries and added 176 IDs. Findings are
  proposals, not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `30757` | Speech level | Japanese uses a direct, unmarked instruction (`物欲を思う存分満たしてくれ`), while Korean uses marked `-하게` speech (`사도록 하게`). Use a natural plain-conversational ending without inferring a specific speaker. | Medium-high |
| `30778` | Name / format | The line asks about Olaf, but Korean `올라프` lacks the English pairing used by other mentions in this asset. Add `(Olaf)` locally. | High |
| `30790` | Name / format | `The Flame` is the named Fate card, repeated three times in this description. Pair the first Korean occurrence, e.g. `불꽃(The Flame)`, and keep the repeated references readable. | High |
| `30806` | Terminology / naturalness | `Recipe for Trouble` is an alchemy-quest title. `문제를 부르는 조리법` is readable, but `조리법` can imply cooking; Japanese `レシピ` and Chinese `配方` support the recipe/formula sense. Consider an alchemy-appropriate form such as `문제를 부르는 조제법` while preserving the wordplay. | Medium |
| `30807` | Terminology / format | The exact-English duplicate at `44368` has the same Korean, but the ingredient `Fennwrac` varies across the quest asset. The prior asset review identifies `펜라크(Fennwrac)` as the established form; retain this scoped consistency candidate. | High |
| `30849` | Title / format | The source is `Irion, King of Cups`; Korean pairs `이리온(Irion)` but leaves the title unpaired. Pair the complete title and name, e.g. `컵의 왕 이리온(Irion, King of Cups)`. | High |
| `30852` | Terminology | This exact-English duplicate is also at `63854` and has the same Korean. The prior asset review notes that the named place is consistently `크로싱(The Crossing)`, while this title uses `교차점의 수호자들`; consider aligning the organization name with that place. | High |
| `30895` | Naturalness | `It is a popular locale for many` is rendered `이곳은 인기가 많고`, an awkward description of a place. Consider `이곳을 찾는 이가 많고` or another natural phrasing that preserves the sentence's continuation. | Medium-high |
| `30902` | Name / format | The speaker explicitly identifies himself as the `Knave of Pride`; Korean `교만의 시종` omits the English title pairing. Add `(Knave of Pride)` as recorded in the existing asset review. | High |
| `30926` | Terminology | `Health per Hit` is rendered with `타격당 생명력`; the established effect wording uses `적중당 생명력` for per-hit life-steal effects. Consider aligning `타격당` with `적중당` without changing the value or chance. | Medium-high |
| `30922` | Speech level | English and Japanese use plain conversational speech (`仲間に加わってくれ`, `準備をしていたところだ`), but Korean shifts to polite endings (`오세요`, `하시죠`, `있었어요`). Use one unmarked conversational register, for example `어서 와. 우리와 함께하자. 그냥 현장 조사를 준비하던 참이야.` Do not infer the individual speaker from the asset association. | Medium-high |
| `30936` | Consistency / register | This exact-English sentence family includes IDs `15581`, `42559`, and `44457`. All Japanese and Chinese versions use parallel past-tense descriptions, while Korean varies among passive narration, plain declarative prose, and casual speech. No source evidence supports this Korean-only variation; consider using one neutral rendering such as `야수들이 버트런(Bertran)을 죽였다.` and align the full group only after approval. | Medium-high |
| `30963` | Terminology | `Mana Steal per Hit` is rendered `타격당 마나 흡수`; align the per-hit term with the established `적중당` wording used for item effects. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `30794` | Source / format | English, Chinese, and Korean contain an opening paragraph about Brother Mason that is absent from Japanese. Korean has 11 embedded line breaks, matching English and Chinese; Japanese has 10. Preserve the current Korean layout and hold the cross-language discrepancy rather than deleting source-supported text. |
| `30843` | Markup / source | The localized `{*6...}` marker reads `Resisted` in English, Japanese, and Korean, while Chinese translates its contents as `抵抗`. The wrapper count is intact in all four languages, but the language-specific marker content remains unresolved. |
| `30920` | Meaning / format | The stone inscription is a sequence of clipped prophetic fragments. The translations preserve the same four-part structure, but the available sources do not establish which fragments are formal names or titles requiring English pairings. Do not expand or reinterpret them from capitalization alone. |
| `30993` | Speech level / source | This is one of 55 exact-English `Good day.` rows. Korean is `안녕하세요`, matching the greeting sense in English and Chinese, while Japanese uniquely says `またね` (“see you”). The linked asset contains multiple quests and speakers, so retain the Korean and hold the Japanese/source discrepancy without assigning a speaker. |

## Earlier Findings Rechecked

- Retain the existing candidates `30778`, `30806`, `30807`, `30852`, `30902`,
  `30922`, and `30936`; all seven four-language fingerprints still match.
- At `30921`, the English source says `the Maid`, and Korean pairs
  `시녀(The Maid)`. At `30982`, the source says `Maid of Windemere`, and
  Korean pairs `윈더미어의 시녀(Maid of Windemere)`. Neither row is missing
  its source wording.
- At `30964`, both localized ability labels remain inside their `{*1...}`
  wrappers and their English explanations follow outside; wrapper counts match
  all four languages. No markup change is proposed.
- At `30973`, Japanese identifies a drop-grille door and Korean `격자문`
  conveys the portcullis gate adequately; no terminology change is proposed.
- The other 67 existing entries were rechecked and remain not flagged.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

## Repeated Sources And Structure

- Eighty exact-English duplicate groups touch this range (993 corpus rows);
  all Korean translations match within their groups. Japanese wording varies
  in 19 groups and Chinese in one; these differences were not used to infer
  Korean speaker identity or playback order.
- The two exact-English duplicate groups wholly within the range are
  `Pride Before A Fall` (`30893`, `30994`) and `Quest Complete` (`30896`,
  `30975`); Korean wording matches within both.
- Runtime-argument and localized-wrapper counts match English across the
  range. Embedded line-break counts also match, except at `30794`, where
  Japanese has one fewer break because the opening paragraph is absent.

After this range, the ledger contains 39,926 of 65,135 unique IDs, leaving
25,209. Sequential coverage reaches ID `30999`; next: `31000`-`31249`.
