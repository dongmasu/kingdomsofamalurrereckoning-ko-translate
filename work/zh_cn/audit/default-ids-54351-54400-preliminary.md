# Preliminary Language Scan: `default` IDs 54351-54400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 54351-54400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 54352 | shipwreck account / Gallows End | Preserve that this is an account of multiple shipwrecks discovered on the island. | Korean retains the island and plural shipwrecks. `Gallows End` has multiple Korean forms elsewhere, including this report's `갤로스 엔드`; keep name consistency open. | Medium |
| 54353 | totem made of magically endowed stones | Preserve that the stones themselves are magically endowed and the necklace-like totem is sought by wanderers/explorers. | Korean keeps the material, wearing method, and audience; no material shift found. | High |
| 54354 | Brother Egan as a baby, eyes wide | Preserve concern for Egan's soul and his naivety around Fae/Alfar, trust, and temptation. | Korean retains the vulnerable comparison and the full set of unfamiliar concepts. | High |
| 54360 | `TMP - 모래톱 동굴` | Determine whether `TMP` is a development/debug prefix; retain it until UI context confirms otherwise. | English and Chinese show `TMP`; Japanese marks the cave name as provisional. Korean keeps the prefix and translates the location. | High |
| 54361 | `마법에서 ... 남자애들에게서` | Preserve the speaker's unresolved question whether they were protecting her from magic or boys. | Korean keeps the two alternatives and lack of decision. The referent of “they” remains contextual. | Medium |
| 54362 | Elza Postlethwaite / Well of Souls / Hall of the Firstsworn | Reconcile English `Hall of the Firstsworn` with Japanese `祠` (shrine); preserve the letter's three-paragraph structure and invitation. | Korean follows English and retains all three paragraphs. Chinese also says Hall but introduces an internal hard wrap within its third paragraph; newline counts remain six in all locales. | High |
| 54365 | Jenniker / Cranalt damaged report | Keep the fragmentary, interrupted delivery without over-resolving whether Cranalt is a river source or the contamination site. | Korean follows the English fragment and adds that water flows from Cranalt into the river. The source is broken and Japanese/Chinese also infer details differently. | High |
| 54367 | partitioning one piece of earth from another | Preserve the speaker's disdain for people treating slightly different land parcels as grounds for meddling. | Korean keeps the land-division image and dismissive tone; exact political referent needs context. | Medium |
| 54368 | `누구도 넘볼 수 없는 자리` | Confirm whether “unassailable seat” is a literal throne or a figurative position of power. | Korean renders it figuratively and retains the claim that the war's victors will rule from it. | Medium |
| 54370 | mainland vs. island | Reconcile the English arrival on the mainland with Japanese's arrival on an island; the Korean draft follows English. | Chinese also supports mainland. Preserve the planned discussion with Captain Brattigan and the beach village as a possible first destination. | High |
| 54375 | ceremonial Faeblade / Gardens of Ysa | Preserve that the dull/unsharpened blade is ceremonial and serves as a badge of office; verify the established Korean rendering of Ysa. | Korean retains the ceremonial and office-badge functions. Its `이샤` spelling should be checked against the project's usual `Ysa` form. | Medium |
| 54377 | Fomorous Hugues fleeing “you” | Preserve the speaker's uncertainty (`for all I know`) and the possibility Hugues is fleeing the addressee. | Korean retains both hedge and direction of flight. Chinese says he is fleeing pursuit; Japanese is similarly indirect. | Medium |
| 54379 | Freemen lurking to murder and steal | Confirm `Freemen` as the faction/group term and preserve the contrast between a peaceful farming area and current threat. | Korean retains the faction label and both crimes; the exact regional scope remains contextual. | Medium |
| 54383 | `아우구르(Augur)` | Determine whether Augur is a person, title, or faction and retain the speaker's uncertainty about proving their troublemaking. | Korean preserves the name-like term and the proof question. Chinese instead reads Augur as a generic diviner. | Medium |
| 54385 | Arena ambush / Champion's money-making ploy | Preserve that the speaker saved their team from impending doom and that the market-pool ambush was another attempt by the Champion to profit from a fight. | Korean keeps both events and the accusation; no material shift found. | High |
| 54391 | Hierophant speaking/seeing for all Travelers | Confirm the formal title and preserve the parallel structure: the Hierophant's eyes see for all Travelers, and the Hierophant's words speak for all. | Korean retains the repetition and parallelism, using `대사제` as the title. | High |
| 54398 | Malwyn / General Tilera / Balor orders | Preserve the commander's dispatch, the objective to find and kill Malwyn before he brings Balor into the battle, and the outer-wall location. | Korean retains the action sequence and names. English syntax leaves the commander's exact name spelling and command context open. | High |
| 54400 | `다음 부품` location for a small price | Preserve the offer to provide the next piece's location in exchange for payment. | Korean retains the offer and fee; English has the source typo `it's location`, but the intended possessive is clear from context. | High |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain provisional, including Audern Reis, Dead
Kel, Night Barghest, Elza Postlethwaite, Well of Souls, Hall of the
Firstsworn, Nerotelos, Jenniker, Cranalt, Lord Kandrian, Erion Rheidarn,
Agraivin Hand, Varen Seawine, Captain Brattigan, Guran, Telogrus, Malwyn,
Balor, Fomorous Hugues, Freemen, Augur, Warsworn, Skald, Kollossae,
Rupert Jienne, and the Mitharan armor-gem terminology.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `54350-54449`.
  Relevant questions include TMP (54360), the Hall/shrine conflict and
  long letter (54362), the damaged Jenniker/Cranalt report (54365), the
  mainland/island discrepancy (54370), Giran (54376), Augur (54383), the
  Hierophant title (54391), the Malwyn/Tilera/Balor command sequence (54398),
  and the reward offer at 54400.
- The historical range starts with active ID 54350, covered in the
  preceding report; this batch begins at 54351. The next historical range
  starts at active ID 54450, outside this batch.
- The three-paragraph letter at 54362 has six newline characters in all
  locales. Chinese has one hard wrap at a different semantic position, but
  paragraph/newline counts are equal. The Korean follows English for the
  Hall name conflict.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 54351-54400 once
  and in identical ascending order.
- Physical newline counts match throughout the range, including the letter
  at ID 54362. No runtime markers or localized marker-order differences
  occur.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 54351-54400 received one preliminary reading. Their working dispositions
are recorded in
[`disposition-batch-default-54351-54400-20261010.md`](disposition-batch-default-54351-54400-20261010.md):
two accepted terminology corrections, five uncertain findings, and 43
`not an issue` IDs. The dispositions are not independent final linguistic
approval. Continue at `default` ID 54401.
