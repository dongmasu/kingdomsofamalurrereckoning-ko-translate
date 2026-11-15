# Dialogue Context Translation Edit Batch: IDs `32750`-`32999`

- Date: 2026-11-14.
- Rechecked the candidate rows against current English, Japanese, Chinese,
  and Korean. English anchored meaning; Japanese guided voice and layout;
  Chinese provided supporting evidence.
- Applied nine supported corrections in range and four linked corrections
  for the Warsworn joining credential, changing 13 text rows relative to the
  prior committed state. One candidate pairing at `32891` was already
  present and was retained; its disputed rank/title remains on hold.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `32825` | Paired both the person and artifact as `아르케스(Arkes)의 서클릿(Circlet of Arkes)`. |
| `32860` | Clarified that `new Crow` means a new recruit: `새로 들어온 크로우(Crow)`. |
| `32881`, `22955`, `26414`, `38609`, `42785` | Standardized the Warsworn joining credential as `추천장`; corrected `26414` to `추천장과`, completed Osgar Krast's name there, and completed the Krast Brothers pairing at `38609`. |
| `32886` | Paired the named location as `랩터 랜드(Raptor Land)`. |
| `32898` | Recast the boast in conversational Korean: `다가오는 전투에서 영광을 거머쥐겠어!` |
| `32944` | Corrected the opening `Yes` to an affirmative and made the address conversational. |
| `32947` | Recast the complete ending as `엄청난 영감이 떠오르기 전에는 작품을 완성할 수 없다고 고집해`, preserving the source meaning in natural speech. |
| `32951` | Added the title pairing `템플러(Templar) 옥티엔(Octienne)`. |
| `32980` | Restored the speaker's hesitation: `난... 난 여기 남아서...`. |

The first four rows in the credential group outside the range (`22955`,
`26414`, `38609`, `42785`) were checked against their full English and
Japanese contexts. `Commendation` and `recommendation` refer here to the same
Warsworn joining credential; Japanese uses `推薦状` across the related
entries.

## Retained And Held

- `32891` already pairs `Amaldor` and `Mel Senshir` in the roster. The English
  `Ancient-of -War` conflicts with Japanese `大将軍` and the Chinese wording;
  the Korean title remains unchanged pending resolution of the malformed
  source.
- `32759`, `32802`, `32955`, and `32976` were already consistent with the
  source and established terminology; no changes were needed.
- `32771` (`Day XX`), `32878` (`Lycium` / `Lyceum`), and `32960`
  (`vision` / `thought`) remain held for conflicting or insufficient source
  evidence. Existing holds `32816`, `32853`, and `32868` were retained.
- No speaker identity or playback order was inferred from asset membership.

## Verification

- Refreshed only the `source_fingerprint` fields for the 14 reviewed IDs:
  the 13 text rows above and the already-paired roster at `32891`.
- Exact-English duplicate checks found no duplicate source group among the
  edited rows. The Korean line-break count at `32891` remains 18, matching
  English and Japanese; no layout change was made.
- The `default` CSV retains its UTF-8 BOM, 65,135 ordered records, 71,838
  CRLF sequences, 244 LF-only sequences, and no bare CR.
- The full 65,135-ID ledger validates. Index and both catalogs reproduce;
  all 20 CSV-preservation and context-index tests pass; the CRLF-aware
  `git diff --check` is clean.
- `src/`, extracted game assets, and game binaries were not changed. No
  commit was made.

The next sequential application range is `33000`-`33249`.
