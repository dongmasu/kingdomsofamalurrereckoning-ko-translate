# Five Small-Asset Revalidation

- Date: 2026-11-11.
- Scope: all 208 previously unrecorded `default` IDs across five assets:
  41, 41, 42, 42, and 42 IDs respectively.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Twenty-seven correction-candidate IDs and three evidence-limited holds are
  recorded. No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

`1324179.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol and has 15
serialized `dialog_line_*` handlers with the `SQ99` prefix. Its text concerns
Captain Drefan's missing scouts in the Cursewood. This supports an SQ99
missing-scout topic group, not a per-key speaker, handler, branch, or playback
order.

`1327544.quest_bxml` likewise has no explicit `QUEST_ID` or `NPC_` symbol. Its
15 serialized dialogue handlers use the `SQ107` prefix. Its text concerns
Elias Hurk, Deadeye, and Shattertier Mines. The prefix and subject do not
establish an individual speaker or key-to-handler mapping.

`1458195.quest_bxml` explicitly identifies `SQ121`; it has no `NPC_` symbol
and has 20 serialized dialogue handlers. Its text concerns Lyria's temple,
Seila/Selia Twayn, and missing relics. The handlers do not map any of the 42
keys to a specific speaker or turn.

`1944005.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol and has 13
serialized dialogue handlers with the `DLC2_SQ05` prefix. Its subject is the
Lost Litanies and the Litany Altar. `1944329.quest_bxml` has no explicit
`QUEST_ID` or `NPC_` symbol and has 17 handlers with the `DLC2_SQ01` prefix;
its subject is Pagus's rat-trap task in Idylla. These are distinct topic
groups, and neither prefix maps individual keys to speakers or playback
positions.

All 208 rows were compared in English, Japanese, Chinese, and active Korean.
The exact-English repeat groups in each asset have matching Korean text:
`1324179` (`17101`/`34806`, `17814`/`19529`, `25943`/`27869`,
`27271`/`50797`, `42437`/`44655`); `1327544` (`10379`/`51968`,
`29992`/`62581`, `45807`/`56978`); `1458195` (`5378`/`7287`); and
`1944005` (`22091`/`29582`). `1944329` contains no exact-English repeats.
No embedded line breaks, runtime placeholders, or markup occur in this set.
Dialogue-like text, objectives, journal entries, item labels, and status text
were evaluated individually; asset membership was not treated as proof of a
shared speaker or conversational stage.

## Correction Candidates

| ID(s) | Asset / dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1901` | `1327544` / meaning | English and Chinese say the speaker and addressee crossed paths, but Korean says `그와 마주친`, introducing an unsupported third person. Japanese also describes their meeting without a third person. Consider `우리 둘이 이 숲에서 마주친 지 반나절도 지나지 않았어.` | High |
| `10786`, `32414`, `34277`, `42096` | `1324179`, `1327544` / name-title format | These English rows say `Captain Drefan`, but Korean attaches English only to `Drefan` (`드레판(Drefan) 대장...`). Other rows for the same title use `드레판 대장(Captain Drefan)` (`6800`, `29992`, `62581`). Align the full name-and-title parenthetical, retaining `대장님` in the direct address at `32414` if desired. | High |
| `61325` | `1327544` / terminology / naturalness | In the military context, `my brothers` means fellow soldiers. Korean `형제들` is less precise than the same asset's `전우` for `fallen brothers` at `61924`. Consider `전우들의 복수 기회를 놓칠 수는 없어.` | Medium-high |
| `11704` | `1944329` / naturalness | `절벽턱` is an awkward rendering of a ledge/platform overlooking the route; Japanese says a protruding ledge and Chinese says a platform. Consider `길이 내려다보이는 바위턱에 설치되어 있어.` | Medium-high |
| `49491` | `1458195` / meaning | “I'll keep watch for them” refers to the missing relics, not people. `그들을 계속 지켜볼게` assigns a human pronoun. Consider `유물을 계속 찾아볼게` or another natural “keep an eye out for them” rendering. | High |
| `47111`, `61724` | `1458195` / terminology | The same title `High Priestess` appears as `여사제장` in the sentence and `대여사제` as the standalone title. Japanese `大神官` and Chinese `大女祭司` support a single title form; consider aligning `47111` with `대여사제`. | High |
| `41926` | `1458195` / format | The named rite is explicitly `The Orison`; the Korean parenthetical says only `(Orison)`, unlike the established title form `오리슨(The Orison)` elsewhere. Preserve the Korean sentence and include the full English title. | High |
| `6433`, `16687`, `20294`, `44961`, `45085`, `50073`, `62087`, `62181`, `63112`, `63578` | `1944005` / terminology / consistency | In this Litany Altar quest, English `litany/litanies` and Japanese `連祷書` consistently refer to the collectible prayer texts. Korean varies among `연도`, `연도서`, and `기도문`, while `연도문` is already used throughout the same group. Standardize these references to `연도문`, adjusting counters and particles per sentence; at `6433`, restore the omitted `문` in `연도`. | High |
| `33435`, `47926`, `49766`, `62087`, `63112`, `64469` | `1944005` / name consistency / format | The Korean uses both `아시온` and `아키오네`; several mentions omit `Acyone` in parentheses. Other active rows use `아시온(Acyone)`, and Japanese uses `アシオン`. Standardize this quest's name to `아시온(Acyone)` at each occurrence, including both occurrences in `63112`. | High |
| `38166` | `1458195` / format | The Korean name lacks an English parenthetical. If retaining this row's source spelling, add `(Selia Twayn)` to `셀리아 트웨인` without changing its Korean spelling while the cross-row name discrepancy remains unresolved. This format-only candidate coexists with the name-canonicalization hold below. | High |
| `47937` | `1944329` / speech level | The line begins in plain style (`틀렸던 모양이군`) but shifts into marked `하오체` (`필요하오`, `퍼지고 있소`). Japanese uses plain assertions. Consider keeping the whole utterance in one natural register, e.g. `하지만 여전히 그대의 신성한 도움이 필요해. 역병이 퍼지고 있어!` No individual speaker is inferred. | Medium-high |

## Evidence-Limited Holds

| ID(s) | Asset / dimension | Evidence and disposition |
| --- | --- | --- |
| `63902` | `1324179` / meaning | English `lost` and Chinese `走丢` can mean missing or astray, while Japanese explicitly says “may have died.” Korean follows English/Chinese with `길을 잃었다`. The quest context does not settle whether this means lost, missing, or dead; retain pending stronger evidence. |
| `9894`, `38166` | `1458195` / proper-name canonicalization | English spells the same-looking name `Seila Twayn` and `Selia Twayn`; Japanese uses `セリア・トゥワイン` for both, and Chinese also uses matching forms. The Korean currently follows each row's English spelling. Do not force a single Korean canonical spelling without better evidence. The format-only parenthetical finding for `38166` above does not resolve this name discrepancy. |

## Retained Text

The other 179 IDs were retained after four-language comparison. In
particular, all exact-English repeated lines listed above already have
matching Korean, and the short greetings and responses were not normalized
across asset rows without per-key speaker evidence.
ID `38166` has a format-only candidate while its cross-row proper-name
canonicalization remains held, so it is counted in both dispositions.

The broader `default` search found additional `Acyone` occurrences outside
these five assets, including `41961` (`Speak with Acyone`) without an English
parenthetical. That row is not part of this batch and remains for its linked
asset review. The search also found several existing Korean renderings of
`High Priestess` outside SQ121; this report does not claim a corpus-wide title
standardization.

## Complete Newly Reviewed ID Sets

- `1324179.quest_bxml` (`SQ99` handler-prefix clue; 41 IDs): `199`, `1984`,
  `3336`, `3375`, `6800`, `7267`, `7436`, `7937`, `8494`, `8681`, `8792`,
  `10786`, `12784`, `13150`, `13900`, `17101`, `17337`, `17814`, `17955`,
  `19264`, `19529`, `21474`, `22275`, `22339`, `25943`, `26891`, `27271`,
  `27869`, `33989`, `34277`, `34431`, `34806`, `35944`, `39895`, `42096`,
  `42437`, `44655`, `47522`, `50305`, `50797`, `63902`.
- `1327544.quest_bxml` (`SQ107` handler-prefix clue; 41 IDs): `1901`, `5019`,
  `6866`, `9206`, `10379`, `16009`, `18632`, `18748`, `18827`, `19689`,
  `20829`, `22452`, `22994`, `23489`, `23767`, `24163`, `29992`, `30914`,
  `31273`, `32035`, `32414`, `36030`, `37435`, `37553`, `37986`, `39775`,
  `43697`, `45807`, `46473`, `47641`, `47729`, `51968`, `54449`, `54637`,
  `56978`, `57572`, `57670`, `61325`, `61784`, `61924`, `62581`.
- `1458195.quest_bxml` (`SQ121`; 42 IDs): `29`, `155`, `1523`, `3760`,
  `5092`, `5378`, `7287`, `9894`, `10097`, `17121`, `21020`, `21654`,
  `21784`, `22420`, `24389`, `29115`, `29682`, `30209`, `30260`, `34285`,
  `34706`, `36165`, `38166`, `38933`, `40910`, `41926`, `45405`, `47111`,
  `47466`, `48306`, `49491`, `51234`, `51614`, `53609`, `55372`, `55779`,
  `56874`, `59882`, `61724`, `62735`, `62940`, `64075`.
- `1944005.quest_bxml` (`DLC2_SQ05` handler-prefix clue; 42 IDs): `389`,
  `1794`, `2898`, `4054`, `6433`, `9225`, `9273`, `13906`, `14081`,
  `16040`, `16687`, `20294`, `20802`, `20821`, `22091`, `23590`, `29582`,
  `29889`, `30205`, `33435`, `33454`, `33608`, `40752`, `43434`, `43571`,
  `44961`, `45085`, `45717`, `47926`, `49733`, `49766`, `50073`, `51482`,
  `52066`, `60400`, `62087`, `62181`, `63112`, `63578`, `64469`, `64723`,
  `65069`.
- `1944329.quest_bxml` (`DLC2_SQ01` handler-prefix clue; 42 IDs): `1528`,
  `3101`, `4532`, `4610`, `5633`, `5904`, `6788`, `9261`, `11704`, `15275`,
  `15398`, `15641`, `18252`, `21599`, `21682`, `21853`, `21855`, `22632`,
  `23984`, `25493`, `27666`, `27880`, `28546`, `29715`, `30183`, `34064`,
  `34337`, `36361`, `36769`, `39147`, `40930`, `43463`, `45224`, `47937`,
  `48040`, `49143`, `50207`, `51430`, `56349`, `56617`, `60035`, `64625`.

All 208 reviewed IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
