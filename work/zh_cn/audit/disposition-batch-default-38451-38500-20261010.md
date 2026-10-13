# Disposition Batch: `default` IDs 38451-38500

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, one `not an issue`, and one uncertain.
- CSV changes: IDs 38487 and 38496 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38482 | Castellan / `성주` | Uncertain: the English identifies a formal office, but prior decisions and locale renderings do not establish the canonical Korean title or distinguish it from a generic castle lord. |
| 38487 | Ravenswing ship name / `레이븐스윙` | Accepted: change to `레이븐스윙호`. The surrounding quest decision at ID 27645 establishes that the name identifies a ship whose destination determines Walen's outcome; Japanese explicitly uses the ship suffix `号`. Retain the existing Korean transliteration rather than resolving the corpus-wide alternate spelling. |
| 38496 | Livrarium / `도서관 화재` | Accepted: change to `리브라리움(Livrarium) 화재`. English explicitly names the institution; this restores the omitted proper name using the established active-corpus transliteration and does not settle whether Livrarium should always be transliterated. |
| Other rows in IDs 38451-38500, including 38468 | Dialogue, names, values, objectives, items, labels, and marker order | Not an issue: no other supported row-local correction was found. At 38468 Korean preserves the English/Chinese marker order and all marker identities; only Japanese reorders `{1}` and `{2}`. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349. No historical disposition is inferred for this
  batch.
- Castellan's canonical Korean title and Livrarium's global naming convention
  remain unresolved; these local dispositions do not close those questions.
- ID 27645's prior disposition establishes the ship-choice context for
  Ravenswing, while the exact Korean transliteration remains subject to
  corpus-wide terminology review.
- These are working dispositions, not independent linguistic approval.

## Verification

- The preliminary structural comparison reports IDs 38451-38500 once and in
  identical order across all four locales, with matching line-break counts
  and runtime-marker identities. Korean preserves the English marker order
  at ID 38468.
- At ID 38487, English says “give him the name of ‘Ravenswing’” and send him
  to Klurikon; the quest context and Japanese ship suffix support clarifying
  the vessel name in Korean.
- At ID 38496, the English source names the Livrarium. The edit restores the
  institution while preserving the sentence's remaining content.
- Ruby's standard CSV parser cannot parse the active Korean file as a whole:
  with the semicolon delimiter and liberal parsing enabled, it stops at
  physical line 11029 with `CSV::MalformedCSVError` (“Unquoted fields do not
  allow new line”). No whole-file parse or round-trip is claimed. The two
  changed records were verified directly.
- Before this batch, the active CSV SHA-256 was
  `dbcb71dc28d39c1872150252fd07b17c6c5b85432ef59ef406b397f7916a2ee0`.
- UTF-8 BOM and the original 72,046 CRLF, 39 bare-LF, and zero bare-CR
  endings are preserved. No immutable source file was edited.

## Checkpoint

Disposition is complete through ID 38500. Resume at ID 38501; 26,634
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38501-38550-preliminary.md`. The next unused decision ID is
D-12458.
