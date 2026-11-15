# Sequential `default` Revalidation: IDs `35000`-`35249`

- Date: 2026-11-12.
- Compared every in-range row in English, Japanese, Chinese, and active Korean.
- Rechecked 57 existing ledger entries and reviewed the other 193 in-range IDs.
- Added eight out-of-range IDs to the ledger for the exact-English duplicate
  group `Irion, King of Cups`; these are separately identified below.
- Findings are proposals, not approved translation edits. No translation CSV,
  source asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `35006` | Naturalness | `Before I report to patrol duty` is awkwardly rendered `순찰 임무에 보고하기 전에`. Consider `순찰 임무를 시작하기 전에` while preserving the need to find Wyl first. | High |
| `35030` | Meaning | English, Japanese, and Chinese say `page` (`ページ`, `页`), but Korean calls it a `쪽지`, which means a note. Use `찢어진 페이지` or another page-specific term; retain the monster-cache context. | High |
| `35038` | Terminology / naturalness | `the weave` is rendered `운명의 직조`, an unnatural literal phrase. Consider a natural description such as `운명의 짜임` while preserving the metaphor. Do not mechanically replace this descriptive reference with the separate name of the Fateweaving practice. | Medium |
| `35043` | Title / format | The standalone title `The Cast Anvil` is translated as `주문 시전 모루` without the English title. Consider `주문 시전 모루(The Cast Anvil)`. | High |
| `147`, `2345`, `4961`, `6644`, `9748`, `12159`, `13670`, `15598`, `20444`, `30849`, `33018`, `35070`, `49949`, `52369`, `54932`, `56837`, `57745`, `59823`, `61570`, `63233` | Title / format | All 20 rows have the exact English label `Irion, King of Cups` and identical Korean `컵의 왕 이리온(Irion)`. The name is paired, but the title is not. Consider the consistent form `컵의 왕(King of Cups) 이리온(Irion)`. Six earlier candidate records remain supported; five previously unflagged records are promoted, and eight previously unrecorded out-of-range IDs are added to this review. Japanese has two renderings of the title, but the English label and Korean text are identical across all 20. | High |
| `35103` | Title / format | The capitalized title `A Careless Passage` appears only as `무심한 항로`. Consider adding the complete source title, e.g. `무심한 항로(A Careless Passage)`, without deciding the title's exact sense; that semantic question is held separately below. | Medium |
| `35107` | Terminology / format | The named Shard grades are rendered as `흐린`, `은은히 빛나는`, and `순수`, while standalone `Lambent` is `은은한 빛` (`13913`) and `Pristine` is `최상급` (`50904`); `Pristine Shard` also varies between `최상급 파편` (`49818`) and `순수한 파편` (`57955`). Standardize the three grade names and the `Shard` term as a set after confirming the intended in-game tiers; retain the distinct English labels `Cloudy Shard`, `Lambent Shard`, and `Pristine Shard`. | Medium-high |
| `35128` | Terminology / name | `the Teeth` refers to the established region `Teeth of Naros`, consistently rendered `나로스의 이빨(Teeth of Naros)` throughout the active `default` and `base` resources. Current `나로스의 송곳니` is inconsistent with that name. Use the established Korean and pair the source name. | High |
| `35147` | Name consistency / title format | The existing candidate that standardizes `Castor Redhand` as `캐스터` remains supported. This title, `Castor's Wrath`, currently uses `카스토르의 분노` and omits the title's English form. Consider `캐스터의 분노(Castor's Wrath)`; keep this title finding separate from the character-name consistency correction. | High |
| `35162` | Meaning / format | English `hoarded by the Foundry Guild` means the guild stockpiled the metal, not that it monopolized it; Korean `독점했다` changes that action. Consider `탐욕스럽게 비축했다` and pair the organization as `주조 길드(Foundry Guild)`. In the final sentence, English `never speak` and Japanese/Chinese “never mention” are weakened by Korean `거의 말하지 않는다` (“rarely”); use an absolute negative such as `입에 올리지 않는다`. | High |
| `35190` | Title / format | `Grave of Private Lemalan` is a complete grave label, rendered `레마란 일병의 무덤` without the English label. Consider `레마란 일병의 무덤(Grave of Private Lemalan)`. | High |
| `35197` | Title / format | `Ballads Squire` is rendered `발라드의 집(House of Ballads) 종자`, pairing only the house name. Consider pairing the complete label, e.g. `발라드의 집 종자(Ballads Squire)`. | Medium-high |
| `35210` | Name / title format | The complete name `Witchknight Anira` is rendered `마녀 기사 아니라(Anira)`, pairing only the personal name. Consider `마녀 기사 아니라(Witchknight Anira)` while retaining the sentence and the separate item-name pairing. | High |
| `35212` | Title / type format | The named role/type `Pride Wand Knight` is rendered `긍지의 마법봉 기사` without its English source. Consider `긍지의 마법봉 기사(Pride Wand Knight)`. | Medium-high |
| `35216` | Creature type / format | The species name `Boggart Urchins` is rendered as `보가트(Boggart) 성게`, pairing only `Boggart`. Pair the complete species label, e.g. `보가트 성게(Boggart Urchins)`, without duplicating the partial parenthetical. | High |
| `35218` | Divine name / format | `Authority` is the established divine name rendered `권능(Authority)` elsewhere, including `6908`. Current `권능께서` omits its English form. Consider `권능(Authority)께서 그대를 보살피시길.` | High |
| `35219` | Quest title / format | The title `A Preordained Encounter` appears only as `정해진 만남`. Consider `정해진 만남(A Preordained Encounter)`; this is a title-pairing proposal, not a change to the term `Preordained`. | Medium-high |
| `35077`, `35245` | Name / format | In both rows, `Bloody` is the named Fae character, not the adjective “bloody”; Korean transliterates it as `블러디` but omits the source name. Consider `블러디(Bloody)` in both. Keep the distinct full epithet `Bloody Bones` and the unresolved source form at `34994` separate. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `35053` | Address / register | The prior hold remains: the wording uses `자네` and `가 보게`, but the asset does not map this key to a speaker or dialogue stage. Do not normalize its register based only on neighboring rows. |
| `35103` | Meaning | English `A Careless Passage` is a title; Japanese transliterates it and Chinese gives a broad “passage” reading. The isolated title does not establish whether `Passage` means a journey, route, or physical passage. The English-pairing proposal above is independent. |
| `35144` | Meaning | Retain the earlier hold: English `St. Eadric's Remains` and Chinese say remains, while Japanese says a pall/shroud. The surrounding quest context does not resolve this label's source conflict. |
| `35145` | Meaning | English `seniority`, Japanese `年長者` (“elder”), and Chinese `资历` (“seniority/credentials”) do not establish whether the speaker means age or rank/experience. Korean `연장자` commits to age; hold pending stronger context. |
| `35176` | Speech level | Japanese is plain, whereas Korean and Chinese are polite. The asset does not identify the speaker or stage for this row, and the references conflict on register. Do not normalize solely from asset membership. |

## Rechecked Findings and Structure

- Fifty-seven existing ledger fingerprints in the range match the current four
  language rows. The existing `35147` and `35164` candidates remain supported;
  the holds at `35053` and `35144` remain open.
- Fifty-one exact-English duplicate groups (513 corpus rows) touch this range.
  The only group with divergent Korean is `35013` / `38536` / `56591` /
  `56942` (`Hello?`); Japanese and Chinese also differ, so the Korean variants
  are preserved rather than forcibly unified.
- Six rows contain embedded line breaks: `35111`, `35124`, `35159`, `35162`,
  `35229`, and `35239`. Their line-break counts match across all four
  languages. Normalized runtime-token and markup signatures also match.
- Asset membership remains grouping evidence only. No per-key speaker or
  playback order is inferred.
- The review adds 193 new in-range IDs and eight newly recorded IDs from the
  `Irion, King of Cups` duplicate group. It promotes five previously
  unflagged members of that group and preserves earlier dispositions.
- The updated ledger contains 43,088 of 65,135 unique `default` IDs (66.15%),
  leaving 22,047. Sequential coverage reaches ID `35249`; the next range is
  `35250`-`35499`. Translation CSVs remain unchanged.
