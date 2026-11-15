# Dialogue Context Translation Edit Batch: IDs `3000`-`3999`

- Date: 2026-11-13.
- Scope: recheck the 36 correction candidates in four sequential review
  reports, plus exact-English duplicates and corpus-wide occurrences of
  directly related terms.
- Evidence order: English for meaning; Japanese for voice, register, and
  layout; Chinese as supporting evidence. No speaker or playback order was
  inferred from asset association.
- All 36 candidates were accepted after comparison with the current four
  language rows. Existing evidence-limited holds in the range reports were
  not converted into edits.

## Candidate Decisions

| ID(s) | Applied decision |
| --- | --- |
| `3073`, `3075`, `3077` | Used the established fighting-venue term `투기장`; paired `Spear of Light`, `Rum of Fate`, and `Eastern Shores` with their English names; changed the greeting from an affirmative-sounding `그래` to `아, 안녕`. |
| `3085`, `3092`, `3123`, `3124`, `3157`, `3177` | Standardized the action label; clarified the worsening disappearances; rewrote the blade description to preserve the deceptive simplicity and gateway meaning; aligned `Entry` headings to `기록`; restored Holden's courteous self-introduction in conversational Korean; corrected `nondescript` from “mysterious” to “unremarkable.” |
| `3201`, `3207`, `3216`, `3218`, `3223`, `3237`, `3241` | Corrected and paired `Caeled`; restored “be bound” as `속박당하다`; standardized the named Living Quarters and Viper Sorcerer labels; capitalized both Boggart references; rendered the Maid's effect as yielding rather than being trampled; restored the humble-believer sense. |
| `3269`, `3303`, `3312`, `3330`, `3351`, `3414`, `3447` | Localized both visible `destiny` labels; retained the intimidating sense of `fearsome`; identified the gladiator waiting area; restored the missing passage break and clarified the confession; kept `Fatesworn` as the word being asked about; naturalized the beneficial-effects label; simplified the poison phrase and aligned its conversational ending. |
| `3522`, `3553`, `3576`, `3587`, `3653`, `3695` | Used the established `신탁자(Oracle)` term for the plural group; naturalized the “don't get me started” idiom and the status-related obligations; preserved the dark `Grim`/birth irony as “음산한”; standardized the Longlegs epithet; used `챔피언` for the Maid's earned title. |
| `3768`, `3770`, `3842`, `3867`, `3902`, `3938`, `3996` | Completed the report sentence naturally; localized the Upgrade display label; corrected the Mitharan people and rarity meaning; translated “emerge together” without changing poem structure; restored the day-wish; used `지렛목`; and aligned `Blacksmithing` to `대장기술`. |

## Related-Occurrence Review

- `Activity -` occurs in 16 `default` labels. Fourteen rows were changed to
  `동작 -`; the other two already used that form.
- `Living Quarters` occurs in 16 rows. All now use `거주 구역(Living
  Quarters)`, including standalone labels and dialogue.
- Standalone `Entry` labels were aligned to `기록` in nine rows. The nested
  `기록 I`/`II`/`III` headings in ID `32598` already matched and were kept.
- All 16 `Longlegs` occurrences now use `장다리(Longlegs)` with Korean
  particles or plural marking as required; the already-correct ID `53146`
  was retained.
- All 15 `{*1[Upgrade]}` labels now display `{*1[업그레이드]}`. Seven rows
  already used the Korean form and were retained.
- The four institutional plural references to `Oracles` now use
  `신탁자들(Oracles)`. Both occurrences of “the Maid's true Champion”
  (`3695`, `40723`) now use `챔피언`.
- The exact-English confession at IDs `3330` and `25915` was updated
  identically. Both now follow the source's five-line paragraph structure.

The complete ID-scoped application manifest is
[`dialogue-context-edit-batch-20261113-3000-3999.json`](dialogue-context-edit-batch-20261113-3000-3999.json).
It records the pre-edit CSV SHA-256 and every expected source fragment.
Ninety-eight unique rows were applied sequentially with
`tools/replace_text_preserve_eol.py`.

## Verification

- All `65,135` CSV IDs remain present, ordered, and unchanged structurally;
  the UTF-8 BOM is present.
- The exact-English confession copies match and each has four embedded
  separators, yielding five lines.
- The CSV has `71,845` CRLF and `244` LF-only record endings. The increase of
  two CRLF separators is the intentional added line break in each duplicate
  confession.
- Fingerprints for only the 98 edited IDs were refreshed. The 65,135-row
  ledger validates against all four language tables; all three index/catalog
  reproducibility checks passed.
- The CSV-preservation suite passed 11 tests, the context-index suite passed
  nine tests, and the CRLF-aware `git diff --check` passed.
- No source CSV, extracted asset, generated binary, or release artifact was
  changed.
