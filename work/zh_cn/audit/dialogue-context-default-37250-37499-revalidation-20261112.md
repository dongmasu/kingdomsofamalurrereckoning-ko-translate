# Sequential `default` Revalidation: IDs `37250`-`37499`

- Date: 2026-11-12.
- Compared all 250 IDs in English, Japanese, Chinese, and active Korean; all
  four resources have the same ordered ID set.
- Rechecked 71 existing ledger entries and added the other 179 in-range IDs.
- Findings are review proposals, not approval to edit translation CSVs.
  No translation CSV, extracted game asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `37261` | Naturalness / journal style | This contract-failure journal entry still uses polite endings, unlike the plain journal statements at `38921`, `42710`, and `45312`; Japanese is also plain narration. Consider a consistently plain journal form. Do not assign it to a character. | High |
| `37268` | Name / format | `Ereen` is identified by name, but Korean says only `이름은 이린이야`; elsewhere the name is `에린(Ereen)`. Use the established name and pair it, and pair `Orieator` in the same sentence. Preserve the comic “talk my ears off” exaggeration rather than following the different Japanese/Chinese interpretations. | High |
| `37274` | Name / title format | The title `Nil "The White" Kern` is rendered with a reordered, unpaired name (`백색의 닐 "컨"`). Consider a natural title with the complete source name, such as `백색의 닐 컨(Nil "The White" Kern)의 일대기`; also review unpaired names in the account, including Varlaine and `War of Parries`. Preserve all eight embedded line breaks and do not repair the source's unclear clauses by guessing. | Medium-high |
| `37275` | Terminology / format | The creature is `Faer Gorta` at `37250`, but the related singular `gorta` appears as lowercase `고르타(gorta)` here. Align the base creature form and its capitalization while retaining the source distinction between `Faer Gorta` and `gorta`. The canonical lore term remains provisional. | Medium |
| `37286`, `37436` | Name / format | These lines refer to `the Headsman` without the English name; `37286` also has unpaired `Tinehil`. Consider `처형인(Headsman)` and, at `37286`, the established `타인힐(Tinehil)`. This is a name/format proposal, not proof of a speaker. | High |
| `37303`, `37334` | Objective style / format | These objective labels use imperative or bare-noun forms (`텔로그루스(Telogrus)를 추적하라`, `꽃망울 반지 획득`) rather than the established `-하기` style. Consider `텔로그루스(Telogrus) 따라가기` and `꽃망울 반지(Bloom Ring) 획득하기`, subject to the quest-label convention. | Medium |
| `37310`, `37312`, `37333`, `37343`, `37400`, `37417`, `37488` | Name / title format | Several identified names or titles lack their English forms: `Gastyr's`, `Lir`, `Braxis`, `Madding Wind`, `Goodchild Estate`, `Storyteller`, and `Notice of Duty`. Pair the full named unit rather than only a partial name; examples include `매딩 윈드(Madding Wind)`, `브락시스(Braxis)`, and `복무 소집 통지서(Notice of Duty)`. At `37400`, verify whether `Estate` is best represented as a `저택` or a broader estate/property. | Medium-high |
| `37360`, `37387` | Naturalness | `교수대에 올랐지, 그랬어. 머리가 돌았지, 그랬어.` is a stiff calque of the source's marked cadence; smooth it without erasing the rough voice. At `37387`, `미래의 복잡한 짜임` is awkward for the future's intricate weave; retain the fate-weaving image in natural Korean. | Medium |
| `37367` | Title / format | `First Sword` is a formal title but is only `첫 검` in Korean. Consider pairing it as `첫 검(First Sword) 브론웬 센(Bronwen Senn)`; the rest of the sentence preserves the poet-with-a-blade image. | Medium-high |
| `37404` | Format | The source is the complete title `The Widow Walks`, while Korean pairs only `위도우(The Widow)` and leaves `Walks` untranslated in the parentheses. If retaining the current Korean title, pair the full source as `위도우의 행차(The Widow Walks)`. Title/quest status remains on hold below. | High |
| `37421` | Meaning / naturalness | `단검과 검날` obscures that both daggers and swords have codes engraved on their blades; `흔한 수색` is also unnatural for a typical search. Consider `단검과 검의 칼날에 암호를 새기면 통상적인 수색을 피할 수 있거든.` | High |
| `37473` | Name / format | The destination is `Great Spine`, rendered descriptively as `대척추산`, while the established paired form is `그레이트 스파인(Great Spine)` at `40`. Consider using that form here; keep the separate `Caverns of Ingress` and `Erathi sigil stones` wording intact. | High |
| `37486` | Equipment terminology | `buckler` is translated as `작은 방패`, but the established equipment term in `base` and `default` is `버클러`. Use `버클러` while preserving the description of its heated bracing and the scorching effect. | High |
| `37487` | Naturalness | The final `시들어 가는 것 같으니` leaves the sentence hanging, unlike English, Japanese, and Chinese. Finish the thought, for example: `세상의 마법은 강해지는데도 페이(Fae)는 시들어 가는 것 같아.` | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason |
| ---: | --- | --- |
| `37259` | Rank terminology | The Decanus/Auxiliary/Centurion hierarchy is retained, but official equivalents and display convention remain unsettled. |
| `37263` | Meaning / institution | English `the Court` is capitalized, while Japanese and Chinese identify different Fae institutions. The isolated line does not establish which institution Hallam is to advise about. |
| `37274` | Meaning / narrative | English contains malformed or unclear clauses, and Japanese/Chinese interpret the Orieator's Lance and pain description differently. Do not guess a repaired biography from the isolated row. |
| `37291` | Speech level | Korean uses polite `필요하신가요`, while Japanese is plain. No supported speaker or relationship evidence is available to normalize the register. |
| `37375` | Meaning | English `can't afford tainted grain` is interpreted as inability to send the grain in Japanese and Korean. The sources do not settle whether this is a financial constraint or a risk/acceptability statement. |
| `37390` | Meaning | English says `summoned`; Japanese says the messenger was sent, and Korean uses `파견된`. Preserve the source discrepancy rather than silently choosing `소환된` or `파견된`. |
| `37395` | Meaning / title | English `Curate`, Japanese `城主補佐` (lord's deputy), Chinese `副牧师` (assistant priest), and Korean `부제` conflict on the office. |
| `37404` | Meaning / title | Capitalization and Japanese's title-like reading suggest `The Widow Walks` may be a title, but the isolated key does not establish whether it is a quest, story, or ordinary phrase. |
| `37419` | Speech level | Korean's `안녕하시오` is marked against the neutral English/Japanese greeting, but no speaker or relationship is established. |
| `37441` | Meaning / reference | `maiden's light` may be a named object, and capitalized `Hollow` may be a place. The line and translations do not resolve either identity. |
| `37496` | Speech level | The archaic `계속하게` / `끼지 않겠네` may be a voice mismatch, but the asset supplies no per-key speaker mapping. Keep it as a possible issue without attributing it to a character. |

## Earlier Findings Rechecked

- `37264` was cleared: current `우리 민족의 타고난 권리를 주장해` expresses
  English `claim our people's birthright`, Japanese `皆の権利を手にする`, and
  Chinese `与生俱来的权利` without adding that the right was previously held
  and lost. Its prior candidate status is updated in the ledger; the historic
  accepted wording is retained.
- `37465` already contains the approved `호기심이 많지만 신중해`; no new
  finding is recorded.
- Existing candidates at `37261`, `37286`, `37421`, `37436`, `37473`, and
  `37487` remain supported by the current source rows.
- Existing holds at `37259` and `37496` remain evidence-limited.
- No speaker, addressee, branch, or playback order was inferred from asset
  membership, handler names, or ID order.

## Repeated Sources And Structure

- Three exact-English duplicate groups (six in-range rows) touch this range:
  `Good day.` (`37292`/`37478`), `Goodbye.` (`37378`/`37435`), and
  `Quest Complete` (`37391`/`37420`). Korean matches within all three groups.
- Four rows contain embedded line breaks: `37274` (8), `37304` (3), `37338`
  (1), and `37376` (2). Counts match across all four locales, totaling 14
  breaks per locale.
- Normalized runtime-token and markup signatures match across all 250 IDs.
- The range has 23 candidate IDs and 11 evidence-limited holds; `37274` and
  `37404` each have both a candidate and a separate hold. The other 218
  in-range IDs have no new finding.
- Adding 179 previously unrecorded IDs brings the ledger to 44,771 of 65,135
  unique `default` IDs (68.74%), leaving 20,364. Sequential coverage reaches
  `37499`; next is `37500`-`37749`.
- Catalogs cover all 530 quest assets and all 65,135 IDs. Asset links remain
  grouping clues, not proof of speaker or playback order. Catalog,
  fingerprint, test, and scoped diff results are recorded after regeneration.
  Translation CSVs remain unchanged.
