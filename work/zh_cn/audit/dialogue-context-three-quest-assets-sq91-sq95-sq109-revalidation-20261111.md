# Three Quest-Asset Revalidations: SQ91, SQ95, and SQ109 Handler Clues

- Date: 2026-11-11.
- Scope: all 213 unique `default` IDs linked to three previously unrecorded
  quest assets (71 IDs each).
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Seven IDs are correction candidates. ID `37496` is held for insufficient
  speaker evidence. No translation CSV or extracted game asset was changed.
- The 213 rows have matching line-break counts and detected runtime-token and
  markup sequences across all four languages. Seventeen exact-English
  duplicate groups have no divergent Korean translations.

## Grouping Evidence and Limits

- `1310318.quest_bxml` has 29 `dialog_line_*` handlers with an `SQ91` prefix,
  but no explicit `QUEST_ID` or NPC symbol.
- `1320107.quest_bxml` has 25 handlers with an `SQ95` prefix, but no explicit
  `QUEST_ID` or NPC symbol.
- `1335981.quest_bxml` has 24 handlers with an `SQ109` prefix, but no explicit
  `QUEST_ID` or NPC symbol.

The handler prefixes and text support candidate topic groupings only. They do
not map localization keys to handlers, individual speakers, branches, or
playback order. Speaker attribution remains unassigned and dialogue order
remains unknown for all rows.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `61758` | Meaning | `Mine is right here beside me` is translated as `내 작업대는 바로 옆에 있어`. In this potion-making context, ID `10148` explicitly names the mortar and pestle, and the Chinese source for this row also names them; Japanese says “my tools.” Replace `작업대` with `절구와 공이`, for example `내 절구와 공이는 바로 옆에 있어.` | High |
| `30807`, `31978`, `44368`, `45168`, `46537`, `50431` | Terminology / format | The English ingredient name is `Fennwrac` (including `Fennwrac Leaf`); Japanese consistently uses `フェンラク`, and Chinese uses `芬恩瓦克`. Korean varies among `펜와락`, `펜락`, `펜우랙`, and `펜워랙`. ID `12843` already uses `펜라크(Fennwrac)`. Consider consistently using `펜라크` and pairing the full item label as `펜라크 잎(Fennwrac Leaf)`, while fitting the form to each sentence. | High |

The `Fennwrac` form is a scoped recommendation, not a newly approved
repository-wide glossary decision. A broader search also found
`default:53475` and `base` occurrences; those are outside this three-asset
review and remain for a separately scoped terminology disposition.

## Evidence-Limited Hold

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `37496` | Speech level | `On with you; I'll have no part in that` is rendered with `계속하게` and `끼지 않겠네`, an unusually formal/archaic register. English and Japanese support a direct, plain statement, but the asset has no NPC symbol or per-key speaker mapping. Retain as a possible voice/style issue; do not attribute it to the hermit or treat the register as a confirmed character mismatch. |

## Retained Questions and Repeated Text

At `50431`, `거미샘` follows the English `Spider gland` and Chinese `蜘蛛腺`;
it is not automatically changed to `거미낭 이코르(Spidersac Ichor)`, because
the sources do not establish that these are the same named ingredient.
`stew-grist` also remains context-sensitive: Japanese describes Jottun grain
stew, while Chinese uses porridge wording. The current Korean
`스튜용 곡물` is retained pending a separate ingredient-term decision.

The 17 exact-English duplicate groups within the three assets already have
identical Korean translations. Other rows were retained after comparing
meaning, Japanese register, Chinese support, and Korean naturalness. Quest
labels, objectives, status text, and dialogue-like strings were not assumed
to share a speaker merely because they occur in one asset.

## Complete ID Sets

- `1310318.quest_bxml` (71 IDs): `232`, `693`, `741`, `1485`, `1904`, `2607`,
  `3304`, `3735`, `5293`, `7769`, `8276`, `9170`, `9482`, `9977`, `10148`,
  `10237`, `12569`, `17067`, `17794`, `18645`, `19676`, `20630`, `20894`,
  `21892`, `22196`, `22492`, `23163`, `24030`, `26069`, `26947`, `27881`,
  `28038`, `28675`, `30250`, `30255`, `30483`, `31106`, `31152`, `31463`,
  `31998`, `32984`, `34922`, `35293`, `37078`, `38428`, `38567`, `38857`,
  `38912`, `38974`, `39458`, `40021`, `41081`, `42723`, `43355`, `44056`,
  `44326`, `45347`, `47975`, `48086`, `48946`, `49542`, `49560`, `51503`,
  `51578`, `53499`, `55226`, `55363`, `55643`, `56165`, `61758`, `63865`
- `1320107.quest_bxml` (71 IDs): `797`, `1989`, `2036`, `2368`, `4790`,
  `6725`, `6889`, `8039`, `13373`, `13505`, `13981`, `14906`, `15187`,
  `16636`, `17860`, `18126`, `19894`, `20210`, `20325`, `20608`, `21697`,
  `23363`, `24233`, `24357`, `25114`, `27128`, `27212`, `27522`, `29657`,
  `33197`, `33805`, `34357`, `35033`, `35875`, `35920`, `36086`, `36419`,
  `37302`, `37801`, `38150`, `38716`, `39873`, `41072`, `41400`, `41679`,
  `42840`, `43407`, `44239`, `44489`, `47019`, `47872`, `48245`, `48393`,
  `48623`, `48664`, `50358`, `55059`, `55099`, `55755`, `56590`, `56629`,
  `57062`, `57493`, `61035`, `62533`, `62600`, `64168`, `64210`, `64297`,
  `64365`, `64718`
- `1335981.quest_bxml` (71 IDs): `682`, `778`, `1606`, `3133`, `3973`,
  `4074`, `4710`, `8339`, `10854`, `12843`, `13042`, `13545`, `14349`,
  `15274`, `15738`, `16493`, `17708`, `18010`, `19184`, `19569`, `21624`,
  `22785`, `22962`, `26613`, `26825`, `26983`, `29525`, `29759`, `30404`,
  `30720`, `30799`, `30807`, `31399`, `31978`, `32227`, `32271`, `32316`,
  `34236`, `36313`, `36841`, `37496`, `37542`, `37654`, `38620`, `39524`,
  `42727`, `44368`, `45076`, `45168`, `45394`, `46537`, `47477`, `48518`,
  `48900`, `49390`, `49677`, `49982`, `50387`, `50431`, `51366`, `51495`,
  `51518`, `52408`, `52438`, `53076`, `55442`, `56439`, `57876`, `58416`,
  `59474`, `60422`

All 213 IDs are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv)
with current four-language source fingerprints. Findings remain review
proposals; no translation CSV changes were made.
