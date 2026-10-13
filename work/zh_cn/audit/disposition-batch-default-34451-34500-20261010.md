# Disposition Batch: `default` IDs 34451-34500

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: two accepted, twelve `not an issue`, and nine uncertain.
- CSV changes: IDs 34490 and 34499 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34452 | Five-line war poem | Uncertain: all five lines and narrative events are retained, but the source rhyme/enjambment is not reproduced. Defer whether cadence should be reworked to the integrated literary review. |
| 34455 | Ratofer / Ayten children taken to war | Uncertain: the children, Ratofer's return alone, and both parties' failure to recover are preserved; personal-name forms and the precise aftermath remain context-sensitive. |
| 34456 | Five seconds to flee | Not an issue: the five-second value and urgent instruction are exact; spelling the number out is consistent with Chinese and not a value discrepancy. |
| 34457 | Blessed that he cannot approach / Akara praise | Not an issue: `정말 다행이야` conveys the fortunate outcome and the following praise to Akara preserves the religious framing; the pronoun's referent remains outside this row. |
| 34461 | House of Pride / chantry | Uncertain: objective order and liberation condition are retained, but the House and chantry's canonical Korean institution terms are unresolved. |
| 34462 | Liege / omen / ascended the House of Ballads | Uncertain: address and omen are preserved, but “ascended” may refer to rank, throne, or status; locale readings do not settle the intended sense. |
| 34463 | Heart of Sibun | Uncertain: the compound is preserved, but whether Sibun is a place, relic, or other named entity and its canonical spelling are unresolved. |
| 34464 | Prayers, devotion, faith as offerings | Not an issue: all three elements, the speaker's willingness to offer what is in their heart, and the value claim are retained. |
| 34469 | Fateless addressee / Tapestry / completing the speaker's works | Not an issue: the elevated address and both actions remain; no source-supported omission or reversal is present. |
| 34471 | Hold and release Longbow attack | Not an issue: hold-then-release input, increased damage, and status-effect application are preserved. |
| 34473 | Adessa market essay / Arcadium / Basilica Gnostra | Uncertain: four-paragraph progression and market/craft account are retained, but proper institution names and a separate “Crossing” referent remain unsettled. |
| 34474 | Hospitalis Quarters insult and retreat | Not an issue: the speaker's dismissive prejudice and immediate “no offense” retreat are retained without strengthening the insult. |
| 34477 | Potion bench / no further house work | Not an issue: the donated private-use crafting station and limit on further house work/upgrades are retained. |
| 34480 | Full upfront payment for dagger recovery information | Not an issue: the revised payment condition and order before disclosure of the recovery location are preserved. |
| 34488 | Card-game ace / no luck | Not an issue: the card-game ace and disappointed response are recognizable; the short colloquial rendering does not change the outcome. |
| 34489 | Master-account access privilege | Uncertain: access denial and sign-in instruction are clear, but “master account” may be a product-specific tier or generic administrator account. |
| 34490 | Offering / Scion rite | Accepted: change `계승자(Scion)` to `사이온(Scion)`. This is an explicit Offering ceremony in which Akara blesses the chosen one; accepted decisions D-9899 and D-9905 establish `사이온(Scion)` for this specific ritual office, without authorizing global normalization. |
| 34491 | Tuatha landfall on the Plains of Erathell | Not an issue: `상륙` correctly preserves the landing event rather than Japanese's divergent victory reading; the ruin and ghost description remain. |
| 34493 | Keen is going to waste in Cape Solace | Not an issue: `재능을 썩히고 있어` naturally preserves the idiom about wasted talent and the speaker's qualified comparison. |
| 34495 | Codex | Uncertain: Korean retains a book sense, but capitalization and prior artifact usage leave open whether this is a specific named Codex; no title is inferred from this line alone. |
| 34498 | Herald | Uncertain: `전령관` is plausible, but the isolated label and locale translations do not establish whether Herald is a formal office or generic messenger role. |
| 34499 | Red Legion faction name | Accepted: change `레드 군단` to the previously accepted faction form `레드 리전`, following D-2554, D-10678, D-11065, D-11071, and D-11099. |
| Remaining ordinary text in IDs 34451-34500 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 28 IDs. |

## Historical Audit Reconciliation

- The historical entry for IDs 34400-34599 flags the poem, Ratofer's
  children, House of Pride/chantry, Sibun, Frostbreak Sea, Longbow control,
  Adessa's market history, Hospitalis Quarters, the potion bench, the dagger
  deal, ace, master account, Offering/Scion, Tuatha landfall, Keen, Codex,
  Herald, and Red Legion. These were checked against all locale sources and
  prior decisions.
- D-9899/D-9905 support `사이온(Scion)` only in explicit ceremonial-office
  contexts; D-2554 and its cited follow-up decisions support `레드 리전`.
- No unresolved historical question was treated as authorization to
  normalize other names or terms.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  source tables in identical key order. The Japanese-derived `work/ja_jp/`
  Korean draft was not treated as independent evidence.
- ID 34451's icon token is unchanged. ID 34452 retains five lines; ID 34473
  retains four paragraphs. Runtime markers, numeric values, and the five
  second countdown were checked; no structural or value discrepancy was
  found.
- Accepted Korean corrections are limited to IDs 34490 and 34499.
- Active default CSV SHA-256:
  `f643ced33883fbaada8f595a7f4e6a2ab22b799d9c12e6bea2ffef927d4d7a77`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34501; 30,634 default IDs remain through ID 65134.
