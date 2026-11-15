# Sequential `default` Revalidation: IDs `37750`-`37999`

- Date: 2026-11-12.
- Compared all 250 IDs in English, Japanese, Chinese, and active Korean; all
  four resources contain the same ordered ID set.
- Rechecked 75 existing ledger fingerprints and reviewed the other 175 IDs.
- Findings are review proposals, not approval to edit translation CSVs.
  No translation CSV, extracted game asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `37751` | Terminology / meaning | English says the potion temporarily increases total health; Japanese says maximum life. Korean `최대 생명력` is understandable, but the established stat term is `체력`. Consider `최대 체력` while retaining the moderate increase and duration. | High |
| `37757` | Name / format | `Verdant Blades` is a named item/group translated only as `푸른 칼날`; the separate `Seal of Ansilla` already has its English form. Add `(Verdant Blades)` to the complete Korean name without changing the return-to-Drewn objective. | High |
| `37772` | Meaning | English says the first of Gask's soldiers occupied the pass. Korean says only that Gask's soldiers occupied it, losing the vanguard/first-arrival detail. Restore that distinction without changing the severed Ashmoor–Eventide communication. | High |
| `37786` | Name / format / speech level | The line explicitly identifies its speaker as Ambyth. The active Korean `아므비스` differs from the established `앰비스` form used for Ambyth elsewhere and does not pair the name. Korean also shifts into marked 하오체, unlike the conversational English and Japanese. Use `앰비스(Ambyth)` and a consistent conversational register; do not infer the addressee's gender or dialogue order. | High |
| `37810` | Name / format | The source says `House of Gastyr`, but the Korean parenthetical is `House Gastyr`. Pair the complete source name as `House of Gastyr`; retain the distinct names and the sentence's account of Hillared and Racinon. | High |
| `37829` | Name / format | `Fireball` is the addressee's newly bestowed nickname. Korean `파이어볼` lacks its English pairing. Add `(Fireball)` without changing the friendly line. | High |
| `37830` | Meaning / naturalness | `In the youth of your people's memory` refers to the early reach of the people's memory; `너희 민족의 태동기에` can instead mean when the people themselves began. Consider wording such as `너희 민족의 기억이 시작된 초기에`, preserving the passage's pronoun shifts, named events, and line structure. | Medium-high |
| `37835` | Meaning | `master Almain assassin` describes Gedrick as a master/skilled assassin. `알마인 최고의 암살자` makes the stronger claim that he is the best. Prefer `암살의 대가` or an equally restrained rendering; Japanese omits the superlative. | Medium-high |
| `37862` | Address / consistency | `my liege` is rendered `전하`, while related Gravehal lines use `주군`; the Japanese `我が主` supports the established `주군` address without asserting royal rank. Use the consistent address and preserve the speaker's playful follow-up. | High |
| `37865` | Name / objective format | `Aisle of Flame` is unpaired, and this objective uses an imperative (`지나가라`) rather than the established `-하기` objective form. Consider `불꽃 회랑(Aisle of Flame) 지나가기`; the exact named-passage interpretation remains provisional. | High |
| `37889` | Terminology / naturalness / speech level | The established rank is `서약방패병(Pledgeshield)`, not the literal `방패에 서약한 자`. The line also shifts from `엄숙히 선언한다` to `환영하네` and `영광일세`. Restore the rank and keep the formal declaration and welcome in a coherent, dignified register, as detailed in the KV03 review. | High |
| `37901` | Name / format | `Prester's Path` is rendered `프레스터의 길` without the English name. Add `(Prester's Path)` while retaining the current provisional Korean; Japanese reads the phrase as a petition board, so do not use this pairing finding to settle the institution's exact nature. | Medium-high |
| `37909` | Meaning / naturalness | Sword `pommel` is the end fitting of the hilt; `칼자루 머리` is an awkward literal rendering. Consider `검자루 끝` or another established pommel term, preserving the gem-removal action and the dozen icy shards. | High |
| `37926` | Name / format | `The Truth` is the named card, but Korean has only `진실 카드`. Pair the complete card title, e.g. `진실(The Truth) 카드`, without duplicating the English elsewhere in the sentence. | High |
| `37936` | Terminology / consistency | `Headsman` varies across the active Korean corpus, and this row uses `교수형 집행인`. Align with the existing review's provisional `처형인(Headsman)` form; this is a terminology finding, not speaker evidence. | High |
| `37938` | Objective format | `Kill Urlik` is a quest objective, but `울릭(Urlik)을 처치하라` uses an imperative. Align with the established objective style, e.g. `울릭(Urlik) 처치하기`. | High |
| `37978` | Meaning / naturalness | English means the Champion funds/keeps the gambling den running; Korean `돈이 도박장을 굴려` is an unclear calque. Japanese explicitly uses `出資`. Consider `챔피언이 도박장에 돈을 대고 있어. 그러니 안 돼.` | High |
| `37980` | Naturalness / template | English, Chinese, and Korean present a status followed by a counterpart; Japanese confirms this is a relationship-status message. `우리는 이제 {1} 상태로 {2}와 함께합니다` is unnatural and obscures the relation. Consider `이제 {2}와의 관계가 {1}로 바뀌었습니다`, preserving both placeholders. Japanese alone orders `{2}` before `{1}`; Korean follows English and retains both tokens. | High |
| `37986` | Format | `Deadeye` is paired twice in one sentence as `데드아이(Deadeye)`. Pair the name at first mention and avoid repeating the same English parenthetical at the second mention, while preserving both Korean references. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `37858` | Meaning / naturalness | Retain the existing hold. The interrupted description of the speaker's head and the magic is incomplete in all locales; asset association does not establish the missing continuation or speaker. |
| `37882` | Meaning / referent | English `his order` can mean rule, command, or a religious order. Japanese uses `統治` (rule), Chinese uses `命令` (command), while Korean selects `교단` (religious order). The isolated line does not resolve the referent. |
| `37892` | Item meaning | `Paling Wand` is rendered as a named wand in English and Chinese, while Japanese calls it a “tilling/hoe wand.” The row alone does not establish the correct item identity; retain the current pairing provisionally. |
| `37943` | Meaning / referent | English and Japanese leave `it` unresolved; Korean interprets it as a `장치` (device), while Chinese specifies the people of Clyser in the levitation clause. Do not settle the antecedent or add a more specific subject without dialogue context. |

## Earlier Findings Rechecked

- Seven existing candidates remain supported at `37757`, `37772`, `37862`,
  `37889`, `37936`, `37938`, and `37978`; the candidate dimensions and
  cross-references are retained in the ledger.
- Existing `37810`, `37865`, and `37986` were promoted from `not-issue` to
  candidates; `37892` and `37943` were promoted from `not-issue` to
  evidence-limited holds. New findings were recorded at `37751`, `37786`,
  `37829`, `37830`, `37835`, `37901`, `37909`, `37926`, `37980`, and `37882`.
- Existing hold `37858` remains unresolved.
- The statements `Name's Eathe` (`37779`) and `I am Ambyth` (`37786`)
  directly identify their speakers as Eathe and Ambyth, respectively.
  Their playback order remains unknown; no asset, handler, or ID-order
  inference is used.

## Repeated Sources And Structure

- Sixty-nine exact-English duplicate groups (1,210 corpus rows across the
  complete resource) touch this range. Korean differs in two groups:
  `25595` / `37899` / `37948` / `59623` (`Check back now and then to see if
  more gifts have come.`) and `37760` / `51728` (`What happened?`). Japanese
  also differs in both groups, supporting the ID-specific Korean wording.
- Four rows contain embedded line breaks: `37797` (10), `37813` (2),
  `37830` (4), and `37904` (1). English, Chinese, and Korean each contain
  17 embedded breaks; Japanese contains 19 because `37797` has two
  additional breaks. Korean follows the English layout in all four rows.
- Runtime-token and markup inventories match across the four languages.
  At `37980`, Japanese reverses the `{1}` / `{2}` order; the Korean order
  follows English, and both placeholders are preserved.
- No speaker, addressee, branch, or playback order was inferred from asset
  membership, handler names, or ID order.

## Range Result

- The range contains 19 candidate IDs and four evidence-limited holds; the
  other 227 IDs have no new finding. Seventy-five existing ledger entries
  were rechecked, and 175 previously unrecorded IDs were added. Of the new
  IDs, nine are candidates and one is a hold; three existing entries were
  promoted to candidates and two to holds.
- The ledger now covers 45,135 of 65,135 unique `default` IDs (69.29%),
  leaving 20,000. Sequential coverage reaches `37999`; next is
  `38000`-`38249`.
- Of the 175 newly recorded IDs, 127 have indexed asset links and 48 do not.
  Asset links remain grouping clues, not proof of speaker or playback order.
  The catalogs and ledger fingerprint checks are regenerated and verified
  after recording this batch. Translation CSVs remain unchanged.
