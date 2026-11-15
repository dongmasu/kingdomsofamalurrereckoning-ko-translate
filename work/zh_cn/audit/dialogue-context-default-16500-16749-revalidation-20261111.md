# Sequential `default` Revalidation: IDs `16500`-`16749`

- Date: 2026-11-11.
- Scope: compare all 250 active Korean rows with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-six existing ledger records were rechecked; their four-language
  fingerprints match. The other 184 IDs were reviewed and added.
- Five new correction candidates and ten new evidence-limited holds are
  recorded. One existing row was reclassified as a correction candidate and
  three as evidence-limited holds; three existing candidates and one existing
  uncertain finding were retained. No translation CSV, source resource,
  extracted game asset, or localization binary was changed.

## Correction Candidates

These are review proposals, not authorization to edit the active translation
CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `16518` | Naturalness | `부적을 제자리에서 꺼내는 자` is awkward and can suggest an ordinary position. English and Japanese specify removing the amulet from its resting place. Consider `부적을 안치된 곳에서 꺼내는 자는 누구든 벌을 받는다고 말이야.` | Medium-high |
| `16561` | Meaning | English and Chinese thank the player for bringing bad news; Korean instead apologizes for making the player deliver it, following Japanese. Keep the next sentence's acknowledgment of good intentions, and consider `이런 나쁜 소식을 전해 줘서 고마워. 네 뜻은 좋았다는 걸 알아.` | High |
| `16582` | Honorifics / register | The Korean pairs `딘웰 신부님` with the contemptuous `어리석은 늙은이`, while English and Japanese use the priest's title without a Korean honorific. Consider neutral `딘웰 신부` and retain the insult and the rest of the line's mocking tone. Speaker identity is not inferred from the asset. | Medium |
| `16584` | Naturalness | `필요한 물건이 있으면 살 수 있어` is understandable but reads as the player's ability to buy, rather than the speaker offering goods for sale. Consider `다시 왔군. 필요한 물건이 있으면 팔고 있어.` | Medium |
| `16665` | Terminology | The location name `Cliffbreak Fasting` is rendered as `클리프브레이크 지하 통로`. The corpus defines Fastings as a named Dverga-built bunker/tunnel network and already has the proposed `패스팅(Fastings)` form. Consider `클리프브레이크 패스팅(Cliffbreak Fasting)`; this remains a proposal. | High |
| `16719` | Format / name | The poem pairs `Ohn` and `Mihari` with English but leaves `Ysa` unpaired in `이사가`. Consider `이사(Ysa)가` so the proper name is unambiguous and the line follows its own name-pairing pattern. Preserve all four verse lines. | Medium-high |

## Existing Findings Rechecked

- `16561` was reclassified from not an issue to a meaning candidate: English
  and Chinese thank the player for bringing the news, while Korean apologizes
  for making them deliver it. Japanese supports the apology, so English
  controls the proposed correction.
- `16617`: retain the naturalness candidate for the abrupt archaic `보상을
  주마`. Exact-English duplicate `33194` has the same Korean wording; if this
  proposal is approved, review and update both IDs together.
- `16675`: retain the terminology hold. `hidden wing` may mean an architectural
  wing or a hidden area; the isolated text and locale differences do not
  settle the referent.
- `16681`: retain the meaning/naturalness candidate. `뜻밖의 습격을 받고
  쫓겨나면서` adds a specific attack and reads awkwardly; English, Japanese,
  and Chinese support that the startled owner was chased away and fled.
  Consider `주인이 놀라 달아나면서 책을 두고 온 모양이다.`
- `16687`: retain the terminology candidate. This is the Lost Litanies quest;
  the same asset and Japanese source identify the objects as litany texts,
  for which the established Korean form in the group is `연도문`, not
  generic `기도문`.
- `16609`, `16630`, and `16677` were reclassified as evidence-limited holds
  for the unresolved label, address, and passage meanings listed below.

## Evidence-Limited Holds

| ID | Question and disposition |
| ---: | --- |
| `16608` | `Summer` and `Luna` may be personified names or seasonal/celestial references. The locale readings do not settle whether Korean `여름` is intended as a proper name. Preserve the poem pending context. |
| `16609` | The isolated label `Circle` may mean a magical circle, a group, or another named concept. Korean `마법진` matches Japanese, but Chinese is generic; do not infer a UI referent. |
| `16618` | English and Japanese retain `Social Media Manager`, while Chinese and Korean translate it. Without display context, intended localization of this possibly internal/test label is unknown. |
| `16626` | `the Scale` may be an ordinary scale or a named Fateweaving device. Japanese's `Great Scale` is not corroborated by English or Chinese. |
| `16630` | `my Lady` is rendered as `부인`; the isolated address does not establish whether this means a noble title, a form of address, or a wife. |
| `16643` | `Cur of Vengeance` may be a creature name/title or a descriptive phrase. The locale readings diverge, and this objective does not identify the creature type. |
| `16655` | `Queen of Staves` is a card title, but this row does not establish the canonical Korean name for the `Staves` suit. Retain the current reading pending a corpus-level card-term decision. |
| `16668` | `Bane of Three Winds Crutch` has uncertain parsing and may contain a source-name anomaly. Japanese, Chinese, and Korean interpret the compound differently; do not normalize it from this row alone. |
| `16674` | `The Prester's Path` is rendered as a path in English/Chinese/Korean, while Japanese reads it as a petition board. The isolated label does not identify the referent. |
| `16677` | `the means to pass` may mean permission, a credential, or a way through the Narca curse. The references differ; retain the current wording without adding a specific mechanism. |
| `16704` | `The Taken` may be a named group or a generic description of abducted people. The locale strings alone do not establish its status as a proper name. |
| `16710` | The English source is malformed (`doesn't equally exist`); Japanese suggests rarity, Chinese suggests nonexistence, and Korean says an equivalent potion is rarely found. Do not invent a definitive reading. |
| `16729` | `the Sorrows` may be a named people/group or an abstract force. The Japanese, Chinese, and Korean readings diverge, and this line alone does not resolve it. |

## Existing Concerns Cleared

- `16534` already includes the total in `꽃 3송이 중 {1}송이가 피었습니다.`;
  the preliminary denominator concern is not an issue.
- `16614` follows English and Chinese `Lord Gorrenet`; Japanese's `great mage`
  does not establish that the Korean title is wrong.
- `16638` already renders `almost` as `거의`; the preliminary degree-of-
  comparison concern is cleared.
- `16747` uses `무시무시한 야수`, meaning fearsome beasts, not timid beasts;
  the preliminary adjective concern is cleared.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the four language tables.
- Fifty-six exact-English duplicate groups touch this range, covering 1,049
  corpus rows. Korean wording matches within every group.
- Logical line-break counts and normalized runtime/layout-marker signatures
  match across all four languages.
- Seven Korean strings contain 20 existing embedded CRLF breaks:
  `16535` (8), `16540` (1), `16551` (2), `16608` (4), `16641` (1),
  `16719` (3), and `16732` (1). These breaks were preserved.
- Of the 184 newly reviewed IDs, 129 have indexed quest-asset links and 55
  do not; five link to multiple assets. Asset links and NPC symbols do not
  establish per-key speakers, branches, addressees, or playback order.

The ledger now contains 29,398 of 65,135 IDs (45.13%), leaving 35,737
unreviewed. Four-language fingerprints and per-ID dispositions are recorded
in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
