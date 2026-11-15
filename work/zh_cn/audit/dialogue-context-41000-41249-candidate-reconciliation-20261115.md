# Candidate Reconciliation: IDs `41000`-`41249`

- Date: 2026-11-15.
- Rechecked the 27 valid candidates in the range against English, Japanese,
  Chinese, the active Korean CSV, and the existing application manifest.
- All 26 manifest-proposed corrections were already present in the CSV;
  `41134` also already had the proposed natural send-off.
- The sequential report's candidate at `41051` was a row-mapping error: the
  English source is about Brother Fallon, and the Korean already pairs
  `Brother Fallon`. It is cleared as not an issue. The separate Sister Ceanna
  candidate at `41150` is valid and already correctly paired.
- Exact-source follow-up found one missed title-pairing candidate at `4025`.
  It is identical in all three source languages to `41180`, but its Korean
  title omitted `Priestess`. ID `4025` now matches `41180`.
- Six evidence-limited holds remain; `41178` retains its separate location
  meaning hold in addition to its accepted wording correction.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `41016`, `41021`, `41040`, `41059`, `41063`, `41073` | Confirmed the complete Sprite Soldier pairing, the “wicked and undeserving” meaning without adding abandonment, the paired `As Winter Looms` title, `Waterhall`, full `Rathir Quays`, and `젊은 종족` / refuge wording. |
| `41122`, `41132`, `41134`, `41137`, `41147`, `41150`, `41153` | Confirmed Ice Blink spacing, both trader names, the natural send-off, `Maun`, Snowmelt Pass, complete `Sister Ceanna`, and `불명예를 입은 병사`. |
| `41169`, `41178`, `41180`, `41184`, `41188`, `41193`, `41195` | Confirmed the complete sobriquets, Ficon/Fae and Heartvine wording, full Priestess Jacinda title, Mercantile skill, Adessa Laboratories, the generalist Destiny without unsupported Seeker, and the established Kollossae rendering. |
| `41199`, `41217`, `41219`, `41220`, `41221`, `41226`, `41235` | Confirmed Ram's name, concise Ice Troll objective, Hoolgan's full sobriquet, ordinary Evenroot, complete Templar Jorielle title, Ost memorial meaning, and Gabrielle's pairing. |
| `41051` | Cleared. The actual row is about Brother Fallon, not Sister Ceanna; `팰런 수사(Brother Fallon)` is already complete. The ledger format flag and overall status were changed to `not_flagged` / `not-issue`. |
| `4025` | Newly identified and corrected to `여사제 자신다(Priestess Jacinda)`, matching the identical source label and Korean at `41180`. |

## Exact-Source Follow-up

- `4025` and `41180` have identical English (`Priestess Jacinda`), Japanese,
  and Chinese source strings. Their Korean labels now both read
  `여사제 자신다(Priestess Jacinda)`.
- This duplicate was missed by the sequential report's exact-English duplicate
  check, which had stated that every group touching the range matched in
  Korean. The linked discrepancy is corrected here; the historical report is
  left unchanged.
- No other exact English-source group touching the valid candidates had a
  Korean mismatch. The current source also confirms that `41051` is distinct
  from the Sister Ceanna objective at `41150`.
- The five multiline entries retain their source-supported line breaks and
  marker order; no multiline row was edited.

## Ledger and Verification

- Only Korean CSV row `4025` changed. Its four-language source fingerprint
  was refreshed. Ledger status changed for `4025` (new candidate) and `41051`
  (cleared false-positive candidate).
- The candidate pool gains the newly found `4025` and removes the invalid
  `41051`, so its total remains 4,020. Twenty-eight unique candidates were
  reconciled: 27 valid in-range candidates plus `4025`. Cumulative
  reconciliation is 2,679 / 4,020 (66.64%), with 1,341 remaining.
- All 65,135 ledger fingerprints and regenerated index/catalog checks
  passed. The 11 CSV-preservation tests and nine dialogue-context tests
  passed. The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840 CRLF
  sequences, 242 LF-only separators, and no bare CR. Exact-source checks and
  the CRLF-aware diff check passed.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
