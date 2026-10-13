# Disposition Batch: `default` IDs 36151-36200

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  accepted terminology, and corpus-level variants.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, five `not an issue`, and seven uncertain.
- CSV changes: IDs 36155 and 36179 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36155 | `Beckoned` / `선택받은 자여` | Accepted: the capitalized player title is the established `부름받은 자` at D-692 and subsequent accepted decisions. Change only the inconsistent title to `부름받은 자여`; retain the greeting and voice. |
| 36157 | `the Authority` / St. Eadric's | Uncertain: English personifies the capitalized Authority as the source of natural gifts; Japanese reads “Creator,” Chinese is less specific, and Korean uses `권능자`. The religious referent and whether St. Eadric's is an institution remain unresolved. |
| 36168 | Uduath direction | Not an issue: Korean follows English `northwest`, supported by Chinese. Japanese alone says northeast; this source conflict does not support changing the English-based Korean direction. |
| 36170 | Warsworn Amaldor / Drystan Rydder | Uncertain: the unofficial security-chief role and person are present, but English's apposition leaves the boundary between the `Amaldor` title/rank and name unclear. Japanese calls him a Warsworn scout captain. Preserve the current reading until context establishes the office. |
| 36175 | Refusal to return to Gorhart | Not an issue: English and Japanese both say the speaker will not return and has no place there; Korean preserves both. Chinese reverses the return polarity, but that supporting-source divergence is not evidence against the English-based translation. |
| 36179 | `Her son` / `assume the mantle` | Accepted: English, Japanese, and Chinese identify the Executioner as female and Ferrin Shaw as her son. Korean's `그의 아들` introduces a male parent, and `이름을 이어받다` narrows assuming the role to inheriting a name. Replace with `처형자의 아들인 페린 쇼는 처형자의 자리를 이어받아`; retain the justice objective and item/location facts. |
| 36186 | Maid's army | Uncertain: Korean preserves the ballad and the army becoming a scattered mob, but English capitalizes `Maid`; Japanese uses a title-like Windemere epithet while Chinese is generic. The canonical role/title and Korean equivalent are not established. |
| 36188 | `Praetorian` / `근위병` | Uncertain: the row is a singular faction/rank label. Japanese says legionary and Chinese imperial guard; prior decisions have not established the exact organization or canonical Korean label. |
| 36189 | Rathir / `라시어` | Uncertain: English, Japanese, and Chinese identify the same destination, but the Korean corpus alternates `라시어` and `라시르`; prior decisions defer global place-name normalization. |
| 36191 | Dverga `fastings` | Uncertain: Japanese describes underground passages, Chinese transliterates the unusual term, and English leaves `fastings` unexplained. The same source term remains open at IDs 32740 and other historical entries; retain the current tunnel reading provisionally. |
| 36192 | `collections` / `수집품` | Not an issue: English and Japanese support the broad “collections” reading. Chinese specifies books, but this row does not establish that narrower category. |
| 36193 | `Death's Cryptic Hand` title | Not an issue: the unusual title is retained, and the sentence itself identifies it as one of the speaker's titles. The Korean `칭호` framing does not alter the announced title or its consequence. |
| 36197 | Queen Belmaid poem | Uncertain: Korean retains all 13 lines and the broad movement of the source, but the source's imagery and “I'd welcome it” referent are opaque; Japanese and Chinese also diverge. Defer poetic revision rather than inventing a reading. |
| Remaining ordinary text in IDs 36151-36200 | Dialogue, objectives, names, labels, and values | Not an issue: all other rows were checked in the four locales; no further supported row-local correction was identified. |

## Historical Audit Reconciliation

- Historical questions at IDs 36157, 36168, and 36197 remain unresolved; none
  was treated as approval to change Korean.
- Prior decisions establish `부름받은 자` for the player title, defer the
  Dverga `fastings` term, and defer Rathir spelling normalization.
- The preliminary scan stated that ID 36167 had two embedded line breaks.
  Direct comparison of all four rows found three in each; line structure
  matches and the preliminary count is corrected here.
- The gender-neutral `Executioner` reference at ID 36179 was checked against
  all three immutable locales. The accepted edit avoids a gendered pronoun.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36151-36200
  exactly once in identical order.
- Embedded breaks match across all four locales: three at ID 36167 and
  twelve in the 13-line poem at ID 36197. Runtime-token sequences match.
- Active default CSV SHA-256:
  `238156c5e1b85eb2ee390369255db67148b4134edf602def150191f2678d5657`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.

## Checkpoint

Disposition is complete through ID 36200. Resume at ID 36201; 28,934
`default` IDs remain through ID 65134. The next unused decision ID is
D-11661. Preliminary scan:
`default-ids-36201-36250-preliminary.md`.
