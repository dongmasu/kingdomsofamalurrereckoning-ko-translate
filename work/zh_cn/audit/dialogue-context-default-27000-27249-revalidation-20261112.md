# Sequential `default` Revalidation: IDs `27000`-`27249`

- Date: 2026-11-12.
- Read all 250 English, Japanese, Chinese, and active Korean entries.
  English supplies meaning; Japanese supplies register/layout evidence;
  Chinese is supporting evidence.
- Rechecked 69 recorded IDs and added 181 new IDs. Seven new correction
  candidates and three source/context holds are recorded below.
- Seven prior candidates remain; two prior candidates are closed because
  the current text already contains the proposed correction.
- No translation CSV, source file, or extracted game asset was changed.

## Correction Candidates

These findings are not approval to edit the translation CSV.

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `27012` | Meaning | `Except for the fishy parts` contrasts physical fish-like parts with an otherwise pleasingly familiar form; the next sentence explicitly mentions `the form`. `비린내 나는 부분` unnecessarily makes this a smell. Consider `물고기 같은 부분만 빼면 말이지` without assigning the unidentified creature a species or speaker. Japanese `怪しい部分` is ambiguous; the English physical description is primary. | Medium-high |
| `27071` | Meaning / terminology | English `the Testament`, Japanese `ベイレン結社`, and the Galette Tunnels context identify the faction already established as `벨렌의 성약단(Belen's Testament)`. Replace `유언단` with that form, as proposed for `26921`; preserve the speaker's thanks and the unfinished threat. | High |
| `27076` | Names / format | The self-introduction explicitly gives `Forstid of Forstid Traders`, but neither name is paired in Korean. The merchant organization also appears as `상단`, `상회`, and `상인들` at `175`, `9907`, `17587`, and `62280`. Consider `포스티드 상단(Forstid Traders)의 포스티드(Forstid)예요`; retain this ID's polite Korean delivery, not the plain delivery at `62280`. | High |
| `27095` | Rank / format | `Return to Savant Gefroy` is `현자 게프로이에게 돌아가기`, whereas the same named rank/person at `7806` is `사반트 게프로이(Savant Gefroy)`. Align the objective to `사반트 게프로이(Savant Gefroy)에게 돌아가기`; do not confuse the formal Savant rank with a generic wise person. | High |
| `27098` | Meaning / naturalness | `plant the Missives on him without his knowledge`, corroborated by Japanese `気づかれずに書を持たせよう`, means secretly putting the book among Grim's possessions. `밀서들을 그에게 심어야 한다` is awkward and obscures that action. Consider `그림(Grim)을 찾아 그가 눈치채지 못하게 세이블의 서신(Sable's Missives)을 소지품에 넣어야 한다`. Recheck the established item name and the entire journal before applying; preserve the magic's release, Phasmer's role, arrest, and attempted overthrow. | High |
| `27122` | Name / format | `Ysa's Summer` names Ysa, rendered `이사의 여름` without the established English pairing. Consider `이사(Ysa)의 여름`; do not add an unsupported full translated-title annotation. | High |
| `27130` | Meaning | English `all its details already known` describes what is already known, not what is predetermined. Japanese `情報も全部開示されている` supports available information; Chinese likewise says the details are known. Replace `세부 사항까지 이미 정해져 있지` with a form such as `세부 사항까지 이미 다 알려져 있지`, preserving the contrast with haphazard, surprising Rathir. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `27089` | Meaning / text type | `Just Fight` could be an imperative or a noun phrase meaning a righteous fight. Japanese `正義の戦い` and Chinese `正义之战` support the latter, while Korean `그냥 싸워` chooses the former. Verify the label's actual quest/UI context before choosing `정의로운 싸움` or an imperative. |
| `27142` | Meaning / context | English and Chinese use crown/왕관, but Japanese uses `樹冠` (tree canopy). Korean follows the English crown reading. The short fragment does not establish whether the speaker means a regal crown or a tree's crown; retain pending scene evidence. |
| `27245` | Meaning / source conflict | Korean follows English `most unrepentant` and `not his nature`; Japanese instead describes accepting the present circumstances and doubts that this is sincere. Chinese supports the unrepentant reading. Do not rewrite the character's psychology from the Japanese difference alone. |

## Existing Findings Rechecked

- `27005`: close the earlier sentry-term candidate. The current text already
  uses its proposed `마법사 보초`; the dangerous gauntlet and fire are conveyed.
- `27010`: close the earlier preparation-expression candidate. The current
  text exactly contains the proposed sentence about preparing troops for
  the party's arrival. Journal/plain ending variation alone does not
  establish a speaker-register error.
- Retain `27036` (silkfarmer terminology), `27067` (Savant rank),
  `27113` (city-destruction wording), `27135` (Sir Sagrell ballad title),
  `27146` (Gallery terminology), `27179` (awkward path/ambush phrasing),
  and `27213` (complete Rathir Bridge pairing), with their original reports.
- `27137` is the Brio line identified by the user in game. Japanese is
  plain here and Korean is plain; it does not justify changing every Brio
  line to a single register regardless of greeting/quest stage.

## Duplicate And Structural Checks

- 54 exact-English duplicate groups touch the range (507 corpus rows).
  Two groups have different Korean wording: `What do you mean?` at
  `22820`, `27084`, `32613`, `54185`, `58537`, and `Later, then.` at
  `27231`, `34708`, `45178`, `46780`, `56073`. Their Japanese forms also
  differ (`どういうことだ？` / `どういうこと？`, `後で` / `後でな`).
  Both Korean versions retain meaning and plain register; no automatic
  unification is proposed.
- All 250 entries have matching logical newline counts and normalized
  runtime/localized-markup token signatures across the four languages.
  Preserve the quoted passage at `27030` and verse at `27078`, `27099`.
- No speaker or playback order is inferred from asset association, row
  number, NPC-symbol co-occurrence, or handler serialization.
- Existing evidence links and fingerprints are preserved; the two closed
  findings and new hold at `27142` receive revised dispositions and this report.

After this range, the ledger contains 37,180 of 65,135 unique IDs (57.08%),
leaving 27,955. Sequential coverage reaches `27249`; next: `27250`-`27499`.
