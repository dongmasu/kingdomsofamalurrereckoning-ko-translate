# Disposition Batch: `default` IDs 36351-36400

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, seven `not an issue`, and eleven
  uncertain.
- CSV changes: IDs 36374, 36384, and 36387 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36353 | Scion / Akara's chosen one / `his power` | Uncertain: Korean retains the source's possessive without resolving its referent; the canonical role name and lore relation need context. |
| 36357 | Templar / Jorielle | Uncertain: the religious/military status of Templar and the character's Korean spelling are not settled by this row. |
| 36358 | Rathir / `라시어` | Uncertain: both `라시어` and `라시르` occur in active Korean; defer normalization to a consolidated name pass. |
| 36359 | English/Japanese source divergence | Not an issue: Korean follows English and Chinese in asking why the addressee is doing this for the speaker. Japanese's different question is a source-locale divergence, not evidence for overriding English. |
| 36362 | Faelands / `패란즈` | Not an issue: the established Korean form is used, and the line retains the region's “heart” metaphor and concentration of Fae magic. |
| 36367 | Hero / heartbreaker / Fateweaver / failure | Not an issue: Korean retains all four self-descriptions and attributes the outcomes to cruel fate; its expanded heartbreaker wording is intelligible and does not change the claim. |
| 36370 | Hollowlands / `할로우랜드` | Uncertain: the proper-region status is plausible and a transliterated form is present, but the sentence also uses `황무지`; retain pending corpus terminology alignment. |
| 36374 | `rank energy` / `불길한 기운` | Accepted: English `rank` here means foul or unpleasant, supported by Japanese `不快な` and Chinese `令人厌恶`. Replace only `불길한 기운` with `불쾌한 기운`; do not imply an omen. |
| 36374 | Preordained / buckler / Telogrus | Uncertain: the item, cult, and proper-name forms are plausible but require glossary alignment. The accepted adjective correction above does not approve these terminology choices. |
| 36376 | Hyperian / `히페리온` | Uncertain: this matches the form at ID 36310, but the English spelling and established Korean lore name require global verification. |
| 36378 | Quoted account / `divine spirit` | Uncertain: the broad description is retained, but malformed English quotation marks and divergent locale readings do not establish the spirit's identity or exact lore sense. Paragraph structure is retained. |
| 36380 | The Concourse / `콘코스` | Uncertain: transliteration is plausible, but the row alone does not establish whether this is a proper location or how its canonical Korean name is written. |
| 36383 | Maid of Windemere / `윈더미어의 시녀` | Uncertain: the alliance and sardonic judgment are retained, but prior decisions leave the formal Maid title and whether `시녀` implies a domestic servant unresolved. |
| 36384 | `waif` / `계집애` | Accepted: English and Chinese describe a waif/vagrant, while Korean adds a specifically gendered slur not required by the source. Replace `이 계집애와 그 일당` with `이 부랑자와 그 일당`, retaining the speaker's contempt and the group reference without adding that gendered insult. |
| 36385 | Erathell / Drendhil sequence | Not an issue: Korean retains both locations and the source's apparent conflict between where the man fled and where the player is told to find him; it does not silently reconcile the source. |
| 36387 | `lost to Tywili` / `길을 잃은` | Accepted: English, Japanese, and Chinese describe a brother lost/disappeared/died at Tywili, not someone who lost his way. Replace `타이윌리에서 길을 잃은` with `타이윌리에서 사라진`, preserving the unresolved death/disappearance nuance. |
| 36390 | Mass Effect 3 reward markers | Not an issue: both `{*1...}` wrappers and their order are preserved; localized visible labels are consistent across the four locales. The broader branding convention remains open. |
| 36394 | Gold placeholder | Not an issue: `{1}` and the additive gold value are retained; localized spacing/order differences do not alter the variable. |
| 36395 | Star Camp / `별빛 야영지` | Uncertain: the name is plausible, but the established map-name form and consistency with Moon Camp remain unapproved. |
| 36397 | `adoring patron` / `열렬한 후원자` | Uncertain: English permits admirer/sponsor readings, while Japanese and Chinese diverge; speaker intent cannot be resolved from the isolated UI-like line. |
| Remaining ordinary text in IDs 36351-36400 | Dialogue, names, values, objectives, and labels | Not an issue: all other rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Historical source-keyed questions at IDs 36353, 36357, 36359, 36367,
  36374, 36378, 36383-36385, 36387, 36390, and 36397 were checked against
  the four active/reference texts.
- Prior decisions on Faelands, Hollowlands, Maid of Windemere, and other
  recurring names were reviewed. Only the established Faelands form at
  36362 supports a local no-issue disposition; unresolved competing forms
  remain uncertain elsewhere.
- These are working dispositions, not independent final linguistic
  approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36351-36400
  once in matching order.
- Embedded line breaks match across locales, including the quoted account at
  ID 36378. The two `{*1...}` wrappers at ID 36390 and `{1}` at ID 36394
  remain intact and in order.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `e4058b89d0801f65dfe264dd8d2ae8445f9b9adf4110c004e4d8b5c27c11d125`.
- Accepted changes are recorded in `edit-batch-20261010-addendum.md`.

## Checkpoint

Disposition is complete through ID 36400. Resume at ID 36401; 28,734
`default` IDs remain through ID 65134. The next unused decision ID is
D-11722. The next preliminary scan is
`default-ids-36401-36450-preliminary.md`.
