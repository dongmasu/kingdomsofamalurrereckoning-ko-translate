# Disposition Batch: `default` IDs 57951-58000

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 26 `not an issue` IDs, and 24 uncertain IDs
  recorded in 17 findings.
- Language references are the immutable sources in `src/csv/en_us/`,
  `src/csv/ja_jp/`, and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean
  migration draft, not the Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. Open terminology and context
questions remain explicitly uncertain.

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17473 | 57953 | The Great Scale Sigil Stone is identified, but the canonical Korean item and Great Scale forms remain open. |
| D-17474 | 57954-57955 | Sagecraft +3 is preserved with the established `마법물품 제작` form; `Pristine Shard` quality terminology needs alignment. |
| D-17475 | 57963 | The comic scholar insult is preserved; English/Japanese/Chinese differ on whether the details are literal habits, cowardice, or excuses. |
| D-17476 | 57964 | The hidden exit, cliff treasure, and conditional discovery are retained; exact spatial relation remains uncertain across the source wording. |
| D-17477 | 57965 | The narrator did not find bosun Thorir or Asa among the dead and leaves open their survival; name forms vary across locales. |
| D-17478 | 57974 | Death is personified and arrives at Mel Aglir; Korean leaves gender unmarked naturally, while the canonical place spelling remains open. |
| D-17479 | 57976 | The death/cycle philosophy and pity for the addressee's suffering are preserved; the exact doctrinal nuance remains contextual. |
| D-17480 | 57979 | The speaker's personal attachment and the woman's status as a hero to the Ariad are retained; whether Ariad is a people, army, or faction is unresolved. |
| D-17481 | 57980-57981 | The slab recognition and tools' surgical purpose/extreme sharpness are preserved; what kind of slab and how the person returned are not stated. |
| D-17482 | 57983-57984 | The ironic bond with Skald and warning to guard belongings are retained; English omits the bond's subject and the visitors' pickpocket implication is unstated. |
| D-17483 | 57985 | The enchanted silver band is preserved with a broad Korean `고리`; ring, circlet, or other jewelry form is not resolved. |
| D-17484 | 57986-57988 | The item handoff, Champion's wish to meet, escape objective, and Prismere-corruption history are preserved; names, faction, and place forms need alignment. |
| D-17485 | 57991 | The Master's Tallow delivery, Hurvar's Doorsill, sword, and Ironfast are retained; ingredient interpretation differs by locale and proper-name forms remain open. |
| D-17486 | 57992-57993 | Abergast/Gifre and the House's corporeal versus Delver spiritual roles are retained; name forms and the House's setting-specific identity remain provisional. |
| D-17487 | 57996 | The Precise Weaponry I ability label and level are retained; canonical ability wording and level style need glossary alignment. |
| D-17488 | 57998-57999 | Wall of Thorns and Chaos Sword are identified, and the ugly/elegant paradox and apprentice clue are retained; canonical item/obstacle forms remain open. |
| D-17489 | 58000 | The quiet-to-savage change, rooks/crows, and rotten-flesh feeding are preserved; bird-name distinction and established Korean forms need review. |

## Not an Issue

The 26 IDs are 57951-57952, 57956-57962, 57966-57973, 57975, 57977-57978,
57982, 57989-57990, 57994-57995, and 57997. They preserve the evident
meaning, voice, and item/UI function.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57951-58000 once
  and in identical ascending key order; each full default file has 65,135
  data records.
- The recipe at 57973 has three embedded line breaks in all locales.
- At 57982, `$DLC1_Diplomacy.trade_cost_small$` and
  `#NAMED_ICON_GOLD#` match across locales. The +3 Sagecraft increase,
  Rat (2 Meat), and recipe quantities (2, 1) are preserved.
- Reconciled the historical source-keyed entry for IDs 57950-58049.
  Applicable prompts for this batch remain represented as uncertainties
  above; prompts outside this batch remain for their own reports.
- The preliminary scan's `fd5c...` CSV hash is a historical scan-time value.
  Decision D-17408 later changed only ID 57811; the active CSV hash is
  `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57951/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
  No translation CSV cell changed. The active CSV retains its UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings.

D-17473 through D-17489 record 17 uncertain findings covering 24 IDs;
D-17490 records the remaining 26 `not an issue` IDs. Direct register totals:
1,703 accepted, 12,165 `not an issue`, and 10,908 uncertain (24,776 total);
next D-17491.

Resume at `default` ID 58001; 7,134 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
