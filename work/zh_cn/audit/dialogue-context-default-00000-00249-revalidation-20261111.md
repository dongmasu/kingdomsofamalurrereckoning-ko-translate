# Sequential `default` Revalidation: IDs `0`-`249`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `0`-`249`; add only IDs that had no current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 178 new IDs were recorded. Existing ledger records in this range were kept
  intact and not counted again.
- Four correction candidates and seven evidence-limited holds were identified
  among the newly recorded IDs; ID `95` appears in both groups.
- The pass checked text meaning, Korean naturalness, speech/register where
  applicable, and line breaks/runtime markers. UI, objective, journal, item,
  and other non-dialogue text was judged according to its text type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approved edits:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `95` | Naturalness | `위대한 인물이라도 된 듯 망상에 빠진 되살아난 시체` is cumbersome for “a reanimated corpse with delusions of grandeur.” Consider `과대망상에 빠진 되살아난 시체 하나잖아요.` | High |
| `221` | Naturalness | `속국의 왕의 충성` has an awkward stacked genitive. Consider `속국 왕의 충성을 얻으려고 여름 궁정이 보낸 선물이야.` | High |
| `239` | Naturalness | `가 줄 생각이라면` is less idiomatic than the source's offer to go. Consider `가 줄 마음이 있다면 내가 줄 수 있는 걸 주겠어.` | Medium |
| `243` | Naturalness | The final clause `실제로 효과를 보고 있고` ends in a connective form despite the English being a complete sentence. Consider `실제로 효과를 보고 있어.` | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `52` | Speech level | Korean `그대` / `-는군` sounds more elevated than Japanese `お前` and its blunt rhetorical question. The row has no evidence identifying the speaker or scene relationship; hold rather than normalize by guess. |
| `95` | Speech level | Japanese uses casual feminine speech, while Korean uses polite `-죠/-잖아요`. The line-level difference is clear, but the speaker/addressee relationship is not established; retain pending context. |
| `146` | Speech level | Korean `무엇을 도와드릴까요?` is service-polite, while Japanese `何の用？` is casual and blunt. The multi-NPC asset does not identify the speaker or interaction type; hold. |
| `152` | Speech level | Korean uses polite forms, while Japanese uses casual feminine forms. The quest asset does not map this key to an individual speaker; hold. |
| `194` | Speech level | Korean `-소` is more marked than the plain Japanese ending. No key-level speaker or relationship evidence is available; hold. |
| `206` | Speech level | Korean is consistently polite, while Japanese is casual feminine. A customer-facing exchange could justify the Korean register, and no key-level speaker is established; hold. |
| `217` | Speech level | Korean `또 보자` is casual while Japanese `また会いましょう` is polite. The asset does not establish the speaker/addressee relationship; hold. |
| `222` | Speech level | Korean `안녕하세요` is polite, while Japanese `よく来たな` is plain. The asset has multiple NPC symbols and no key-level speaker mapping; hold. |

## Source Discrepancies and Structural Checks

- At `1`, Japanese recasts the Maid's encounter with Elswin as an encounter
  with a “heroine of Windemere.” Korean follows the English account; Chinese
  also describes the Maiden approaching him.
- At `8`, Japanese reverses the English/Chinese implication about claiming
  friendship with the House of Ballads. Korean follows English and Chinese.
- At `18`, Japanese says five blade projectiles, while English and Chinese say
  three. Korean follows English and Chinese.
- At `81`, English names the Pall of St. Eadric, while Japanese and Chinese
  describe a coffin. This ID already has an item-identity finding in
  [`dialogue-context-trsq01-revalidation-20261110.md`](dialogue-context-trsq01-revalidation-20261110.md),
  which prefers the glossary-established `성 이드릭의 수의`; that earlier
  finding remains in force and was not replaced here.
- At `203`, English and Chinese say “power,” while Japanese says “magic.”
  Korean follows English and Chinese.
- Exact-English duplicate groups in the inspected range (`97`/`199` and
  `149`/`155`) have identical Korean translations.
- At `138`, Chinese has one fewer line break than English and Japanese.
  Korean's line-break count matches English and Japanese. Runtime-marker and
  markup signatures match in the inspected range.
- Rows already present in the ledger were not rewritten or assigned duplicate
  records.

## Newly Recorded IDs

The 178 new ledger rows are:

`0`, `1`, `3`, `4`, `5`, `7`, `8`, `9`, `10`, `12`, `13`, `15`, `16`, `17`,
`18`, `19`, `20`, `21`, `22`, `24`, `25`, `27`, `28`, `30`, `31`, `32`, `33`,
`34`, `35`, `37`, `38`, `39`, `41`, `44`, `45`, `48`, `49`, `50`, `51`, `52`,
`54`, `55`, `56`, `58`, `60`, `61`, `62`, `64`, `69`, `70`, `72`, `75`, `76`,
`77`, `78`, `80`, `82`, `85`, `89`, `91`, `92`, `93`, `94`, `95`, `96`, `98`,
`99`, `101`, `102`, `103`, `104`, `107`, `108`, `111`, `112`, `113`, `115`,
`118`, `119`, `121`, `122`, `123`, `125`, `126`, `127`, `129`, `130`, `133`,
`135`, `136`, `137`, `138`, `139`, `140`, `141`, `142`, `144`, `145`, `146`,
`147`, `148`, `149`, `150`, `151`, `152`, `153`, `154`, `157`, `158`, `159`,
`160`, `161`, `162`, `163`, `165`, `166`, `167`, `168`, `171`, `172`, `175`,
`176`, `177`, `178`, `179`, `180`, `181`, `182`, `184`, `187`, `190`, `191`,
`192`, `194`, `195`, `197`, `198`, `200`, `201`, `202`, `203`, `204`, `205`,
`206`, `207`, `208`, `210`, `212`, `213`, `214`, `217`, `218`, `219`, `220`,
`221`, `222`, `223`, `224`, `226`, `227`, `228`, `229`, `230`, `231`, `233`,
`234`, `235`, `236`, `237`, `238`, `239`, `242`, `243`, `244`, `245`, `247`,
`248`, `249`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
