# Sequential `default` Revalidation: IDs `64000`-`64249`

- Date: 2026-11-13.
- Rechecked the active Korean text against English meaning, Japanese voice,
  register, and layout, and Chinese supporting evidence. Existing preliminary
  scans, disposition batches, context records, and current terminology
  decisions were reconciled against the active text.
- Revalidated 67 existing ledger fingerprints without rewriting those rows.
  Appended the other 183 IDs in ascending order: 138 with no new language
  issue, 43 evidence-limited holds, and two correction candidates.
- The current work-tree change at ID `64046` was preserved. The active
  translation CSV was not edited; neither were source CSVs or extracted
  assets.

## New Correction Candidates

| ID | Candidate | Evidence |
| ---: | --- | --- |
| `64193` | Align `디어드르(Dierdre)` with the established `디어드리(Deirdre)` name. | English has a local `Dierdre` typo at this objective, while the same character is identified as `Deirdre Gwint` at `64103` and consistently elsewhere. |
| `64240` | Review `권위(Authority)` and align it with the established divine name `권능(Authority)`. | The epitaph names Mitharu and the Authority's order; English, Japanese, and Chinese identify a divine order, and `default:6908` uses `권능(Authority)` for the same deity. |

These are review findings, not approval to edit the translation CSV.

## Rechecked Prior Holds

Fifteen prior uncertainties were resolved against established terms or
direct source evidence and are recorded as `not-issue`: `64057` (Lorestone
is `로어스톤`), `64058` (Health/vitality and Helius renderings are consistent),
`64079` (Sagecrafting terminology), `64087` (the assassin description is
preserved without requiring a formal-title decision), `64096` (English and
Chinese support “split up”; Japanese uses a tactical adaptation), `64098`
(Primal Damage is `원시 피해`), `64103` (Deirdre's established name and
Lorestone terminology), `64109` (the House of Ballads name and “end with a
flourish” are preserved), `64116` (the blessing is translated without
inventing a named formula), `64120` (the blessing and curse match the source),
`64123` and `64148` (established ingredient names, quantities, and layout),
`64136` (the Archsage honorific matches the source register), `64143` (Poison
Cloud values and `독 피해` terminology), and `64175` (Searstalk is consistently
rendered `시어스토크(Searstalk)`).

The following 43 new rows remain on hold:

| ID | Rechecked question |
| ---: | --- |
| `64001` | Unusual English imperative and the speaker's intended “supposition.” |
| `64003` | Whether “room enough for one” means one occupant total or one remaining place. |
| `64004` | Canonical spellings of Shepard and Ballegar. |
| `64015` | English fragment ends mid-sentence while Japanese completes it. |
| `64017` | Whether `Online Services Testers` is internal test text or a player-facing role. |
| `64018` | Whether `sailor's yarn` implies a tall tale; Korean adds `허풍`. |
| `64021` | Whether the daughter is missing, dead, or otherwise gone. |
| `64023` | Whether `FourthRoomEntrance` is an internal key or a visible label. |
| `64029` | Ambiguous sense of “Jokull has been right with you.” |
| `64033` | Whether `Hunting Herald` is a title or descriptive epithet. |
| `64047` | The poem's “befouled” imagery and final agency remain unclear. |
| `64056` | Whether `House of Ballads Rank` denotes rank, title, or family status. |
| `64090` | English/Chinese say the Winter Court spawned the Tuatha; Japanese differs. |
| `64093` | The setting-specific referent and canonical term for `Sorrows`. |
| `64095` | Conflicting UI readings of `No Items Salvaged`. |
| `64101` | Whether `fortify` means strengthen defenses or secure land for settlement. |
| `64107` | Exact role and established Korean term for `Second` in a duel. |
| `64112` | Culn's identity and spelling across the locale sources. |
| `64117` | Whether `cousin` is kinship or a familiar form of address. |
| `64125` | Setting-specific referent and canonical term for `Sorrows`. |
| `64128` | Whether `Scion` is a title, heir, or named role. |
| `64130` | Canonical terms/status for Scaith magic and the Solemn Bell ritual. |
| `64145` | Whether `Rialte Brocaire` names an item, person, or task object. |
| `64147` | Whether `Lyria's Lost` is a named relic or generic lost property. |
| `64150` | Whether `your grace` warrants the Korean honorific `각하`. |
| `64151` | Locale disagreement over “the charmed, the subtle, and the inspired.” |
| `64157` | English/Japanese differ on the inn-repair clause and monster damage. |
| `64166` | The reward is clear, but the item and Alfar/Banshaen title forms remain open. |
| `64177` | Project-standard Korean control labels for dodge and block. |
| `64186` | Whether the promised plural honor stones mean memorial stones or a monument. |
| `64189` | Locale spellings for the characters and place in the Jenniker entry. |
| `64202` | English location differs from Japanese, which also adds a son absent in English. |
| `64204` | Official Korean form and institutional meaning of `Domus Politica`. |
| `64213` | Whether `Ancient of War` is a formal title. |
| `64216` | Canonical spellings for Byrn Elgar and Seawatch. |
| `64218` | Exact referent of `Sorrows` and the two former House members called the Eldest. |
| `64219` | Locale disagreement on Basilica Gnostra and Forum terminology. |
| `64224` | Canonical forms for the Scholia Arcana chapterhouse and named characters. |
| `64231` | Whether this capitalized `Cairn` is a named artifact or another object. |
| `64237` | Whether `Quicklings` is a people-name or descriptive label. |
| `64242` | Likely staff-credit text; runtime context and credit style are unconfirmed. |
| `64245` | Whether `Banshaen Queen` is a creature name/title. |
| `64246` | Exact UI operation intended by `Salvageable Items`. |

The 24 previously recorded sequential holds at existing IDs
`64009`, `64013`, `64046`, `64053`, `64054`, `64055`, `64066`, `64069`,
`64074`, `64075`, `64085`, `64097`, `64105`, `64110`, `64124`, `64133`,
`64162`, `64167`, `64169`, `64201`, `64223`, `64226`, `64234`, and `64241`
were also rechecked and remain report-only; their ledger rows were preserved.
Seven existing context findings were separately rechecked and not rewritten:
`64054` (address), `64074` and `64085` (meaning/terminology), `64110`
(naturalness), `64167` (meaning/naturalness), `64229` (meaning), and `64234`
(meaning).

Previously accepted corrections at `64114`, `64118`, `64155`, and `64195`
are present in the active Korean text. ID `64046`'s user-edited text was
preserved.

## Cross-Checks

- English, Japanese, Chinese, and Korean each contain all `65,135` IDs once
  and in identical order.
- Sixty exact-English duplicate groups touch this range, covering 63 range
  rows and 1,385 corpus rows. Korean matches within every group.
- Six rows contain 20 embedded line breaks in each language: `64036`, `64047`,
  `64123`, `64143`, `64148`, and `64184`. Korean's 20 embedded separators
  are CRLF; the source separators are LF. The line counts are unchanged.
- Runtime-marker skeletons and order match across all languages at `64020`,
  `64038`, and `64177`; localized display-marker payloads are translated.
  Numeric values, including `60%`, `275` Poison Damage, reagent quantities,
  and the `1474` epitaph date, are preserved.
- Of 250 IDs, 197 have indexed asset associations (200 links across 136
  assets) and 53 have none. Of the 183 new IDs, 130 are linked (133 links
  across 79 assets) and 53 are unlinked. Asset associations do not establish
  individual speakers or playback order.

## Range Result

- All 67 existing ledger rows remain unchanged; 183 new rows are appended in
  ascending order. The new rows contain 138 `not-issue` dispositions, 43
  evidence-limited holds, and two correction candidates.
- The ledger covers 64,496 of 65,135 unique `default` IDs (99.02%), leaving
  639 unrecorded. Sequential coverage reaches `64249`; next is
  `64250`-`64499`.
- Findings are separate from approval to edit translations. No translation
  CSV was changed.

## Verification

- The ledger validates all 64,496 source fingerprints; its prior bytes and
  all 64,313 existing rows were preserved.
- Regenerated index and catalogs reproduce exactly; all 530 quest assets and
  all 65,135 IDs are represented.
- All nine dialogue-context index tests pass.
- `git -c core.whitespace=cr-at-eol diff --check` reports no whitespace or
  line-ending errors in the edited tracked audit files. The new report has no
  trailing whitespace.
