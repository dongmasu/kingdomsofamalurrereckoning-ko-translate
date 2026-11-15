# Dialogue Context Translation Edit Batch: IDs `33250`-`33499`

- Date: 2026-11-14.
- Rechecked the range's candidates and linked rows against English, Japanese,
  Chinese, and the active Korean CSV. English anchored meaning; Japanese
  guided voice and layout; Chinese was supporting evidence.
- Reconciled 32 ledger IDs: 24 in-range IDs and eight linked terminology or
  duplicate rows outside the range. Only their `source_fingerprint` fields
  were refreshed.
- No speaker identity or playback order was inferred from asset membership.

## Applied And Confirmed

| ID(s) | Correction or disposition |
| --- | --- |
| `33255` | Paired Lyra's name in the quest summary. |
| `33262`, `33861`, `59263` | Standardized the complete title as `개릭 제독(Commodore Garrick)`; the rank difference in Japanese and Chinese was not used to replace the established Korean rank. |
| `33273` | Paired `Adept Faber` in the full document while retaining paragraph breaks, sign-off, and all other supported names. |
| `33288`, `33290`, `33297` | Paired the company name and the named `Splinter of Fate` / `Elixir of Fate` labels. |
| `33304`, `33317`, `33322`, `33325`, `33332`, `33348` | Completed the attested English pairings for Nil the White, the Testament, Hakon, Decanus Paige, Veinrich the Peddler, and Fireball. |
| `33353` | Clarified that the three Masters asked for Anira's death so they could work independently rather than serve her. |
| `33387`, `33393`, `33402`, `33432` | Naturalized the war-wound sentence, starlight phrasing, notice location, and leg-pain spacing without changing their meaning. `T.P.` remains unexpanded. |
| `33435`, `41961`, `47926`, `49766`, `62087`, `63112`, `64469` | Standardized all reviewed Acyone references to `아시온(Acyone)`; the two exact `Speak with Acyone` rows now match. The other active `Acyone` references at `6755` and `45580` were also checked and already paired. |
| `33441`, `33442`, `33443`, `33472`, `33475`, `33491` | Confirmed the Templar Sable note was already paired; paired the remaining titled lore, potion, objective, and book labels while preserving the long-form note's line breaks. |
| `33266`, `33328`, `33430`, `33481` | Retained already-correct pairings for Aster, Freemen, Plagueshield, and Niels MacNutter. |

The exact English label `Commodore Garrick` matches at `33262` and `59263`;
the exact objective `Speak with Acyone` matches at `41961` and `47926`.
Other linked rows were checked individually rather than unified by frequency.

## Retained And Held

- The Aster, Freemen, Plagueshield, and Niels MacNutter rows above already
  matched their supported forms and were not rewritten.
- Holds `33298`, `33338`, `33418`, `33482`, and the previously recorded
  `33445` remain unresolved because the source evidence does not settle their
  meaning or referent.
- No other candidate was changed where its source did not support a clear
  correction.

## Verification

- Refreshed exactly the 32 reviewed IDs' `source_fingerprint` fields. The
  complete 65,135-ID ledger validates against English, Japanese, Chinese,
  and Korean.
- Index and both catalogs reproduce; all nine context-index tests and all 11
  CSV-preservation tests pass.
- The active `default` CSV retains its UTF-8 BOM, 65,135 ordered records,
  71,838 CRLF sequences, 244 LF-only sequences, and no bare CR.
- `git -c core.whitespace=cr-at-eol diff --check` is clean.
- No source CSV, extracted game asset, or game binary was modified. No
  commit was made.

Continue with `33500`-`33749`.
