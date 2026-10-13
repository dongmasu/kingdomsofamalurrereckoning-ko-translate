# Disposition Batch: `default` IDs 57901-57950

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 24 `not an issue` IDs, and 26 uncertain IDs
  recorded in 25 findings.
- Language references are the immutable sources in `src/csv/en_us/`,
  `src/csv/ja_jp/`, and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean
  migration draft, not the Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. Open terminology and context
questions remain explicitly uncertain.

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17447 | 57901 | The ownership and rebuild objective are preserved, but `Paling Wand` may be an established item name and `Adarus` a named Fae hollow; the current literal item form remains provisional. |
| D-17448 | 57902 | The approaching but unwritten end, feared change, and legacy are retained; `harbinger` may imply an ominous omen rather than the potentially positive `선구자`. |
| D-17449 | 57907 | Dokkalfar's expertise, willingness to face conflict, and preference for subtle/graceful or silent resolution are preserved; the people-name and diplomacy terminology need alignment. |
| D-17450 | 57908 | The report that Sir Elswin was killed, fear he will stay dead, and waning-magic cost are retained; name/title spelling and lore context remain open. |
| D-17451 | 57909 | The speaker dismisses `Scion` and says others know only what Akara reveals; established Korean `후계자` is used, but canonical title and Akara spelling remain provisional. |
| D-17452 | 57910 | Study, Lunar Gardens, and an audience with the Archsage are retained; the location/title forms need terminology alignment. |
| D-17453 | 57911 | The Fae/mortal decay contrast and grisly taint are preserved; capitalized `Midden` and `House` may be lore entities rather than generic `납골당` and `가문`. |
| D-17454 | 57912 | The Primos's divine favor and raising of all Idylla are retained; whether `Primos` is a name or title and canonical place spelling remain open. |
| D-17455 | 57915-57916 | The steady Mana supply for an aggressive caster and the separate offer/use of silver are preserved; `aggressive` may be a build/role label, and base-material terminology needs context. |
| D-17456 | 57919 | The masons' repair role and the city's separation from the land are retained; the city's origin event and exact force of “ripped” need lore context. |
| D-17457 | 57922 | The emotional source of energy and forceful grandeur of enchantments are retained; “seat of the emotions” may be a specific lore/anatomical concept. |
| D-17458 | 57923 | Remus's violent threat and match-end deadline are preserved; Remus and the weapon term remain subject to name consistency. |
| D-17459 | 57928 | The daytime period is retained; capitalization and whether this is a UI time-of-day label require interface context. |
| D-17460 | 57930 | The standalone mayoral title and name are retained; Eswin Ealfhelm's Korean spelling needs corpus alignment. |
| D-17461 | 57932 | The three-person expedition, narrator's roles, savior account, and four-paragraph structure are preserved; proper-name spellings differ across sources and remain provisional. |
| D-17462 | 57933 | The distinction between warship-only Burn and other ships using the Quays is preserved; whether both are named ports and canonical Korean forms remain unclear. |
| D-17463 | 57936 | Formal address, Seawatch, and renewed merriment are preserved; liege and place-name forms need consistency review. |
| D-17464 | 57937 | Completion of the Hierophant's assigned task and the Travelers' expected standard are retained; canonical title/faction forms and exact force of “all” remain open. |
| D-17465 | 57938 | The hostile imperative and insult are preserved; capitalized `Dustling` may be a creature/race name, not merely a generic insult. |
| D-17466 | 57940 | Device deactivation and the follow-up check on whether residents are cured are preserved; Cranalt and Rond Farm spelling remain provisional. |
| D-17467 | 57943 | The throat-slitting admission, vulgar wealth boast, and mockery of the Hierophant are retained; Apotyre spelling and register variants need consistency review. |
| D-17468 | 57944 | The wartime income statement, hesitation, and soldiers' pressure are retained; the euphemistic “other trades” and Dolve Arne context remain ambiguous across locales. |
| D-17469 | 57945 | The Amrynthian Band and crown's history are retained; `Band` may mean jewelry/headband or a group, which the row does not resolve. |
| D-17470 | 57946 | The right earned after defeating beasts and braving shadows is retained; `the seat` could be a throne, leadership position, or named place. |
| D-17471 | 57947 | The announcer's voice, Crows' formidable leader, and Jakin reward instruction are preserved; canonical team and name forms need alignment with earlier arena rows. |

## Not an Issue

The 24 IDs are 57903-57906, 57913-57914, 57917-57918, 57920-57921,
57924-57927, 57929, 57931, 57934-57935, 57939, 57941-57942, and
57948-57950. They preserve the evident meaning, voice, and item/UI function.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57901-57950 once
  and in identical ascending key order; each full default file has 65,135
  data records.
- The four-paragraph Teeth of Naros excerpt at 57932 retains six embedded
  newline characters in all locales.
- No runtime-marker or numeric discrepancy was identified in this range.
- Reconciled the historical source-keyed entry for IDs 57850-57949.
  Applicable prompts for this batch remain represented as uncertainties
  above; prompts outside this batch remain for their own reports.
- The preliminary scan's `fd5c...` CSV hash is a historical scan-time value.
  Decision D-17408 later changed only ID 57811; the active CSV hash is
  `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57901/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
  No translation CSV cell changed. The active CSV retains its UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings.

D-17447 through D-17471 record 25 uncertain findings covering 26 IDs;
D-17472 records the remaining 24 `not an issue` IDs. Direct register totals:
1,703 accepted, 12,139 `not an issue`, and 10,884 uncertain (24,726 total);
next D-17473.

Resume at `default` ID 57951; 7,184 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
