# Candidate Reconciliation: IDs `45250`-`45499`

- Date: 2026-11-15.
- Rechecked all 12 current correction candidates against English, Japanese,
  Chinese, the active Korean CSV, and linked terminology uses. English anchors
  meaning; Japanese is the primary reference for voice and register; Chinese
  is supporting evidence.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `45252` | Retained. The active text already reads `칼러(Callor)의 로어스톤 찾기`, resolving both the missing name pairing and the established `로어스톤` term. |
| `45287` | Retained. The current line is consistently conversational and follows Japanese `感謝するよ`; the asset association does not establish an individual speaker. |
| `45314` | Changed the abrupt signature `루비가` to `너의 루비(Ruby)`. English `Yours, Ruby`, Japanese `君のルビー`, and Chinese `你的，露比` support a direct, intimate sign-off; the wording does not specify a relationship beyond the source. |
| `45339` | Retained. `더는 못 끌 거다` preserves the threatening declarative that the stalling will end, without turning it into a direct order. |
| `45341` | Added the missing full-name pairing: `백색의 닐(Nil the White)`. The form matches other active references to the same English title without resolving the separate `Nil the White` / `White Nil` identity question. |
| `45351` | Retained. `이 사람 주머니를 털자` is a natural, appropriately informal rendering of the pickpocketing suggestion. |
| `45360` | Retained. `죽을 가능성은 거의 없어요` preserves the source's uncertainty; the following sentence retains its conversational explanation. |
| `45386` | Retained. The current row already uses the established full place-name pairing `아다루스 동굴(Adarus Hollow)`. |
| `45433` | Retained. The current quest entry already pairs Secandra, Primos, Jottun, Kahrunk, and Remes; its existing asset review also found no outstanding correction. |
| `45447` | Retained. `챔피언(Champion)` is already paired, and the remaining sentence preserves the source's continued waiting. |
| `45465` | Retained. The Korean already marks Mitharu's speech with opening and closing quotation marks and preserves the single embedded line break. |
| `45468` | Retained. The current `결국 감옥이나 묘지로 향할 처지지` conveys the source's impending fate naturally and does not add the previously flagged `그리고 지금은`. |

## Evidence-Limited Holds

The 13 existing holds remain open and unchanged: `45277` (Vagabonds
terminology), `45342` (address and honorific), `45356` (source conflict),
`45358` (the First), `45370` (Circle of Strife text type), `45375`
(`Bloody` referent), `45391` (`Tilera Redeemed`), `45396` (localized sprint
label), `45397` (speech level without a mapped speaker), `45414` (Will and
Waters), `45429` (Russian Federation text type), `45443` (indisposed), and
`45445` (Bayala's Spring).

No speaker or dialogue order was inferred from asset associations. The
unresolved question about whether `Nil the White` and `White Nil` identify
the same person remains outside this scoped name pairing.

## Changes and Verification

- Korean rows `45314` and `45341` changed using
  `tools/replace_text_preserve_eol.py`.
- Refreshed only those two rows' four-language ledger fingerprints.
- Reconciled all 12 range candidates; the 13 evidence-limited holds remain
  separate from the candidate total.
- The complete ledger fingerprint check, index and both catalog
  reproducibility checks, nine dialogue-context tests, 11 CSV-preservation
  tests, CSV record/order/BOM/newline checks, and CRLF-aware diff check passed.
- The active CSV remains at 65,135 ordered records with a UTF-8 BOM,
  71,839 CRLF, 242 LF-only, and no bare-CR line endings.
- No immutable source CSV, extracted asset, or game binary was changed.
- No commit was made.
