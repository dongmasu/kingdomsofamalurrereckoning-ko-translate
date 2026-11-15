# Dialogue Context Translation Edit Batch: IDs `21500`-`21749`

- Date: 2026-11-14.
- Rechecked the range's candidates against English, Japanese, Chinese, and
  Korean. English established meaning, Japanese was primary for
  voice/register, and Chinese was supporting evidence.
- Applied supported corrections to nine IDs in range and six linked IDs
  outside it, for 15 edited IDs total. No speaker or playback order was
  inferred.
- Preserved the distinct unresolved rank judgment for Gautliffe and refreshed
  only the 15 edited IDs' source fingerprints.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `21514` | Recast the effect in natural instructional Korean while preserving its temporary duration, attack trigger, freeze effect, and 60% chance. |
| `21541` | Replaced the misleadingly criminal-sounding `사기꾼` with `장난꾸러기` for the mythic Fae trickster; retained the treasure and key meanings. |
| `21555` | Changed the objective from ambiguous self-sacrifice `희생하기` to the altar-appropriate `제물 바치기`. |
| `21580` | Changed marked older `고맙네` to neutral conversational `고마워`, matching the thanks in Japanese and Chinese. |
| `21589`, `39623`, `58687` | Standardized the SQ66 name to `고틀리프(Gautliffe)`. `18873` already used the canonical spelling and pairing. The existing `일병`/`이병` rank wording was not normalized. |
| `21608` | Added the complete English book title inside the existing title brackets; left the direction of `Gnome Exploitation` unresolved. |
| `21634` | Removed the abrupt literary address and register switch; recast the whole line in conversational plain speech. |
| `21645` | Broadened `배짱` to `자질`, avoiding an unsupported claim that Hugues lacks courage specifically. |
| `21699` | Recast the stilted opening as the natural `저기, 누구세요?`. |
| `8897`, `31387`, `55119`, `55470` | Standardized the separate description `death cult` as `죽음의 교단인`; the faction remains the paired `벨렌의 성약단(Belen's Testament)`. |

## Retained Or Held

- The 20-ID `Belen's Testament` / `The Testament` group was checked. Its
  current full and short faction labels already follow
  `벨렌의 성약단(Belen's Testament)` and `성약단(The Testament)`;
  `21745` therefore needed no repeat edit. `35865` already used the aligned
  `죽음의 교단인` description.
- `21507` remains held for the Grian Sheen/Shane source discrepancy;
  `21512` for singular/plural reference; and `21545` for the identity of
  `the House`.
- The Korean rank for `Private` remains unresolved at `21589`, `39623`, and
  `58687`; name alignment did not select `일병` or `이병`.
- `21608`'s title is now paired, but the meaning of `Gnome Exploitation`
  remains ambiguous.
- `21616` (`the Circle`), `21623` (`Lucern Repeater`), `21627` (`Heel`),
  `21692` (`collections`), `21721` (`Mexico` text type), and `21738` (input
  label) remain held.
- `21745`'s current faction form was retained; no inference was made about
  the unidentified speaker or the line's place in a dialogue sequence.

## Verification

- The review ledger validates all 65,135 IDs against the four current
  language tables.
- The CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLFs, and
  244 LF-only newlines.
- The four Gautliffe labels and five `death cult` descriptions were checked
  as groups; no military rank was inferred.
- The 11 CSV-preservation tests and nine context-index tests passed (20 total).
- `git -c core.whitespace=cr-at-eol diff --check` passed.
- Current CSV SHA-256:
  `7f484c364db43d03bdc65d932059cb27de355c64632e01e8eb0be7cd988c36eb`.

The next sequential candidate range is `21750`-`21999`.
