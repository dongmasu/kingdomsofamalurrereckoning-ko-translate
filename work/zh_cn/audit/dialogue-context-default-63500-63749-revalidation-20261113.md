# Sequential `default` Revalidation: IDs `63500`-`63749`

- Date: 2026-11-13.
- Rechecked the current Korean text against English meaning, Japanese voice,
  register, and layout, and Chinese supporting evidence. Prior preliminary
  scans and disposition batches were used as evidence, not copied as current
  findings without checking the active text.
- Revalidated all 73 existing ledger fingerprints without rewriting those
  rows. Appended the remaining 177 IDs in ascending order: 39 new
  evidence-limited holds and 138 with no new language issue.
- Twelve other evidence-limited findings concern IDs already present in the
  append-only ledger; they are documented as report-only rechecks rather than
  duplicated or overwritten rows.
- No new clear correction candidate was found. Five corrections accepted in
  the earlier disposition batches (`63507`, `63562`, `63600`, `63603`, and
  `63708`) are already reflected in the current Korean text.
- Candidate findings remain separate from approval to edit translations.
  No translation CSV, immutable source CSV, or extracted game asset was
  changed during this review.

## Existing Ledger Rechecks

The 73 existing rows and their fingerprints were preserved. Eight already
recorded context candidates were rechecked and not overwritten:
`63517`, `63566`, `63576`, `63578`, `63585`, `63612`, `63620`, and `63672`.
ID `63578` now uses the standardized `연도문` in the active translation.
That resolves the earlier prayer-term inconsistency; the distinction between
a litany text and a specific book/ritual remains evidence-limited. Its
existing append-only row remains unchanged.

Twelve additional questions concern existing ledger IDs and remain
report-only: `63503` (Chaos Essence collection), `63519` (Gnarsh/Prismere),
`63543` (Dark Empyrean naming), `63558` (Moondown/charity), `63587` (stone
feather image), `63601` (Altar of Doubt/objective), `63618` (`pint`),
`63649` (General Fynn), `63650` (Lykeios/Kollossae), `63653` (`Mission`),
`63687` (`Searstalk`), and `63749` (“our order”). Their existing ledger rows
were not changed.

## New Evidence-Limited Holds

| ID | Rechecked question |
| ---: | --- |
| `63508` | Canonical forms for Paragon Barghest, Anker Edmure, and Shardfall. |
| `63512` | Poem imagery, compressed clauses, and the substantial Japanese adaptation. |
| `63518` | `Order` versus university/academy; the language sources conflict. |
| `63535` | English “draw this out” versus Japanese's possible draw/tie reading. |
| `63544` | Exact UI action and whether `Cache` is a named container. |
| `63545` | Whether the 30% Mana cost is based on maximum or current Mana. |
| `63549` | `Tester Barclay` versus `Kester Barclay`, and title versus name. |
| `63552` | Erathell, Mithros, and Preordained canonical forms. |
| `63572` | Whether `pup` identifies a dog or a young creature more generally. |
| `63577` | Whether `Hireling` is generic or a formal rank. |
| `63580` | Deirdre Gwint spelling and Dverga/Lorestone terminology. |
| `63581` | Malformed “next to the Archsage, once, up spire-top” wording. |
| `63584` | Whether `order`, Delvers, and Tenders are formal institutional titles. |
| `63593` | Canonical `Court of Summer` and ballad terminology. |
| `63613` | Cann-Rane spelling and the barrier potion's precise scope. |
| `63622` | Whether `Century Plants` is a formal species or UI term. |
| `63627` | Malformed `require region` phrase and territorial-right interpretation. |
| `63631` | Whether Delving brethren denotes a formal group. |
| `63633` | Pledgeshield Fenan's status and the Customs House location phrase. |
| `63635` | Whether `knight-hand` is a formal role or a poetic companion. |
| `63646` | Physical/lore identity of the warding Cairns. |
| `63651` | Beckry Aideh spelling across conflicting locale renderings. |
| `63652` | Nard Caloss spelling across conflicting locale renderings. |
| `63661` | Canonical Ljosalfar terminology. |
| `63664` | `Cycle, the First: The Erathi` title and Erathi terminology. |
| `63667` | Whether the centered Havok corporate attribution is intended in-world text or metadata. |
| `63681` | Whether the Travelers are specifically an organization or a broader group. |
| `63688` | Shacklefish enclosure terminology and unexplained manifest codes. |
| `63693` | Whether Faer Gorta literally originate from Angharad's staff or are summoned by it. |
| `63696` | Canonical Korean term for the `sagecrafter` profession. |
| `63699` | Whether `Pendulum` is a named trap or mechanism; Japanese instead says guillotine trap. |
| `63703` | Malformed English clause about what prompted Gadflow to send troops. |
| `63704` | Rast's `cove`: English/Chinese say cove or bay; Japanese says cave. |
| `63720` | Canonical forms for Hroth Magnus, Engard, and related setting names. |
| `63723` | Whether Dolve Arne is a house, territory, or seat. |
| `63731` | Malformed English description of the merchant's pack being thrown from its owner. |
| `63737` | Referent/number in “him and his,” and the group sense of `Rathiri`. |
| `63743` | Literal river/waterfall walk versus an idiomatic or ironic Ysa-pass outcome. |
| `63748` | Whether capitalized `Authority` names a deity, official, or generic authority. |

## Cross-Checks

- The four language CSVs each contain the full `65,135` IDs in matching order.
- Sixty-two exact-English duplicate groups touch this range, comprising 65
  range IDs and 1,362 corpus rows; Korean wording matches within every group.
- Five rows contain 60 embedded line breaks in each language. Korean retains
  its existing CRLF separators while English, Japanese, and Chinese use LF.
- Runtime-marker skeletons and order match across the four languages,
  including both `{LINE_SPACE}` markers at `63638`, `{LINE_CENTER}` at
  `63667`, and both `{*1...}` display markers at `63708`. Localized marker
  payloads are not required to be text-identical.
- Of 250 IDs, 195 have indexed asset associations (200 links across 138
  assets) and 55 have none. Of the 177 new IDs, 122 are linked (126 links
  across 73 assets) and 55 are unlinked. Asset associations do not establish
  per-key speakers or playback order.

## Range Result

- All 73 existing ledger rows remain unchanged; 177 new IDs are appended in
  ascending order. The new rows contain 39 evidence-limited holds and 138
  `not-issue` dispositions. Twelve further hold findings at existing IDs are
  report-only.
- The ledger covers 64,136 of 65,135 unique `default` IDs (98.47%), leaving
  999 unrecorded. Sequential coverage reaches `63749`; next is
  `63750`-`63999`.
- Findings are not translation-edit approvals. No translation CSV was
  changed.

## Verification

- Ledger fingerprints validate for all 64,136 IDs.
- The regenerated index and catalogs reproduce exactly; related tests and
  the CRLF-aware audit diff check pass.
