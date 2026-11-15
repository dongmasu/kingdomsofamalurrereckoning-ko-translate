# Asset Revalidation: `731979.quest_bxml` (Menetyre Regional Dialogue)

- Date: 2026-11-11.
- Scope: all 98 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  and layout reference; Chinese is secondary meaning evidence.
- Six correction-candidate IDs and four evidence-limited hold IDs.
- No translation CSV or extracted asset was changed. Candidates require
  separate approval and editing.

## Context Evidence and Limits

The asset explicitly contains `QUEST_ID` `SQ46`, three NPC symbols
(`NPC_DET_DOK_EfyrDynnwel`, its trainer variant, and
`NPC_DET_GNO_ObartPerigum`), and 66 serialized `dialog_line_*` handlers
prefixed `NQD_Region_Menetyre`. The explicit quest ID and the regional
handler prefix are distinct clues; neither identifies the speaker, handler,
branch, or playback order of any particular localization ID. Texts concern
regional characters, smithing, sagecrafting, the Warsworn, and
Haldebier's Blade. No individual speaker or order is assigned from this
asset-level association.

## Correction Candidates

| ID | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `39396` | Meaning / naturalness | The smith contrasts dying at the forge with the sword's owner's glorious battlefield death. English `behind this forge` can describe working at the forge, while Japanese `この鍛冶場で` means at this smithy; Korean `대장간 뒤에서` suggests dying physically behind the building. Consider `나는 이 대장간에서 비참하게 죽겠지만.` Preserve the sword's figurative death rather than asserting it was a person. | Medium-high |
| `40318` | Naturalness / speech | The first-person service introduction lists training and skills. Japanese uses conversational phrasing; Korean `수련했으며 ... 밝다 ... 없다` reads like a written profile. Consider `아데사(Adessa)에서 자라고 바실리카 그노스트라(Basilica Gnostra)에서 수련했지. 세상 물정에도 밝고, 보석과 소켓에 관해서라면 모르는 게 없어.` This does not establish a speaker for other lines. | Medium-high |
| `51595` | Naturalness / speech | A spoken assessment of the sword ends in Korean `검은 반드시 죽을 필요가 없다`, a literal and stiff way to express that swords need not share mortals' fate. Consider `위대한 일을 위해 벼린 훌륭한 검이지. 하지만 필멸자와 달리 검은 꼭 죽어야 하는 건 아니야.` Keep the contrast and figurative death. | Medium-high |
| `53104` | Naturalness / speech | English and Japanese express the observation conversationally; Korean `나는 모든 운명을 본다` sounds declarative in isolation. Consider `모든 운명이 내게는 보여... 하지만... 네 운명은 보이지 않는군. 참으로 기묘해.` Preserve the pauses and the existing tone without inferring a specific speaker. | Medium |
| `53956` | Terminology / naturalness | English `weaving Fate` names the activity, while Korean `운명을 직조하는` obscures its relationship to the established `운명 엮기(Fateweaving)` label at `23680`. Consider `운명을 엮는 훈련을 받는 이들도 있어. 나는 어린 시절부터 자연스레 그 재능을 깨달았지.` The source uses a verb, so an English parenthetical is optional rather than automatically treating it as an exact title. | Medium-high |
| `59953` | Title / English pairing | English capitalizes `the Hermit Smith`, and Japanese quotes it as a distinctive epithet. Korean `은둔 대장장이` conveys the meaning but omits the English. Consider `상상해 봐. 내가 은둔 대장장이(Hermit Smith)의 제자라니!` This is a local title proposal, not evidence for a new global alias. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| --- | --- | --- |
| `10556` | Meaning / referent | English `My work here won't keep me from it` depends on an unidentified antecedent; Japanese instead says the work will eventually end. Korean interprets `it` as going somewhere, but the isolated key does not prove that destination or action. Hold pending connected dialogue. |
| `37259` | Rank terminology | English orders `Decanus`, `Auxiliary`, and `Centurion`; Korean preserves the hierarchy but `데카누스, 즉 십인장`, `보조병`, and `백인대장` lack a confirmed unified rank/display convention. Historical disposition also leaves the equivalents open. Do not settle or globally replace ranks from this one row. |
| `36642`, `48464` | Speech level | Korean offers services politely while Japanese uses plain phrasing. The multi-NPC asset does not establish who speaks either line, the relationship, or whether polite customer service is intentional. Do not normalize to nearby plain-speech lines on asset proximity alone. |

## Retained Decisions and Structural Checks

- `11275`, `63287`: `마법물품 제작자` derives from the manual-backed
  `마법물품 제작` skill term; D-19973 previously accepted the practitioner
  form without asserting a separate rank. Do not substitute a speculative
  skill name or force bilingual notation on this generic occupation.
- `17192`, `20975`, `22641`: the identical item label follows confirmed
  `할데비어의 칼날(Haldebier's Blade)` in D-21249.
- `12774`: Japanese explicitly frames the troll transformation as a
  possibility; retain the Korean hypothetical despite English's compressed
  wording and Chinese's declarative reading.
- `43821`: `not long for Ironfast` concerns not staying long in English;
  Japanese instead says unsuitable. Retain Korean's English-based meaning.
- Six exact-English duplicate groups have matching Korean within each group:
  Blacksmithing, Adessa, Haldebier's Blade, Gavroche, Menetyre, and Warsworn.
- All 98 rows match across the four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not a playback/display test.

## Complete Asset ID Set

`2704`, `3555`, `3883`, `4436`, `6138`, `8853`, `9294`, `9906`,
`10556`, `11275`, `11734`, `12204`, `12716`, `12774`, `13701`, `14089`,
`14130`, `14189`, `14234`, `14885`, `15421`, `15631`, `16109`, `17192`,
`17193`, `19749`, `20975`, `21883`, `22641`, `23680`, `25387`, `25959`,
`26777`, `29008`, `29142`, `29446`, `30198`, `30570`, `31306`, `31552`,
`33463`, `36642`, `37259`, `37445`, `38074`, `38120`, `38870`, `39396`,
`39531`, `40318`, `40380`, `40621`, `40729`, `41964`, `42191`, `42796`,
`42890`, `42894`, `43821`, `44197`, `44503`, `45289`, `45767`, `48464`,
`48528`, `49623`, `49725`, `49931`, `50076`, `50151`, `50197`, `50415`,
`50955`, `51322`, `51545`, `51595`, `52583`, `53104`, `53204`, `53261`,
`53956`, `54483`, `55260`, `55445`, `55761`, `56364`, `56875`, `58312`,
`59395`, `59549`, `59953`, `60606`, `60942`, `61592`, `62647`, `63287`,
`63621`, and `65094`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
