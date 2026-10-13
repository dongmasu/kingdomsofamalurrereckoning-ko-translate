# Disposition Batch: `default` IDs 38301-38350

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and ten uncertain.
- CSV change: ID 38343 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38303 | The Offering / `봉헌 의식` | Uncertain: the line says the Offering will restore balance, but prior decisions and locale readings do not settle whether this names a rite, a sacrifice, or the thing offered. |
| 38310 | Shieldring / `실드링 요새` | Uncertain: Japanese specifies Shieldring Keep while English uses Shieldring and Chinese transliterates the name; the exact named location and canonical Korean form remain open. |
| 38313 | `of Diminishing` / `감소하는` | Uncertain: this is a clipped item-property suffix with no preceding item name; a natural complete Korean item label cannot be judged from this row alone. |
| 38317 | Circle / `결사단` | Uncertain: English and Japanese identify a Circle, while Chinese calls it a sect; the group's formal nature and Korean organization term remain unresolved. |
| 38318 | Gallows Tree / `교수대 나무` | Uncertain: the capitalized lore name is rendered literally, while Japanese uses a “great tree” form; the entity and canonical name remain subject to broader lore review. |
| 38326 | written exam / `필기시험은 이미 치렀으니` | Uncertain: English says the speaker administered the written copies and Japanese says they were reviewed; Korean can imply that the examinee already took the exam. The intended agency and sequence are not fully settled. |
| 38329 | Quarter / Reddle Mane / `구역` / `레들 메인` | Uncertain: the petition-board role is retained, but `Quarter` may name a district or organization and the locale references differ on its identity. |
| 38334 | The Baronett / `남작네트(The Baronett)` | Uncertain: English, Japanese, and Chinese support a named pirate, not a generic baron, but the Korean spelling is inconsistent across the corpus and lacks an accepted canonical form. Preserve the English name and defer this row rather than normalizing from an unapproved spelling. |
| 38337 | Codex Scaith / `스카이스의 서` | Uncertain: the ancestry-recording function is retained, but the codex's canonical Korean name is not established; Japanese and Chinese phonetics differ. |
| 38343 | Beckoned / `초대받은 자여` | Accepted: change to `부름받은 자여`, reusing the explicit approved player-title form in D-692 and subsequent accepted decisions. Preserve the debate request and speaker register. |
| 38350 | Tilera / Balor / Niskaru Lord / Mel Senshir | Uncertain: the sacrifice, fortress defense, enemy's weakened state, and pursuit objective are retained; proper-name spellings and the formal enemy-title terminology need broader alignment. |
| Other rows in IDs 38301-38350 | Dialogue, names, values, objectives, items, and labels | Not an issue: the preliminary comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349. No historical disposition is inferred for this
  batch.
- Decision D-692 and later accepted rows establish `Beckoned = 부름받은 자`.
  This exact title correction does not decide the separate Lykeios spelling
  at ID 38300.
- Existing audit notes leave Offering, Shieldring, Gallows Tree, Circle,
  Baronett, and Codex Scaith forms open. No global normalization is authorized.
- These are working dispositions, not independent linguistic approval.

## Verification

- The preliminary structural comparison reports IDs 38301-38350 once and in
  identical order across all four locales, with matching embedded line
  breaks, runtime-marker identities/order, and numeric values.
- English `Beckoned` at ID 38343 and Chinese's title-like address support the
  title correction; Japanese omits the title but does not conflict with it.
- Ruby's standard CSV parser cannot parse the active Korean file as a whole:
  with the semicolon delimiter and liberal parsing enabled, it stops at
  physical line 11029 with `CSV::MalformedCSVError` (“Unquoted fields do not
  allow new line”). No whole-file parse or round-trip is claimed. The changed
  target row was verified directly as a single physical record.
- Before this batch, the active CSV SHA-256 was
  `b39e1a7954c991a661161aad5e304460bb01a250049e71a652b97dcbf6ccbdc1`.
  After the one approved text-cell edit it is
  `c89b1a77fe34767ab2366daa1334945e920c5650eb4138255b9c01ff0ffa5136`.
- UTF-8 BOM, 72,046 CRLF endings, 39 bare-LF endings, and zero bare-CR
  endings are preserved. No immutable source file was edited.

## Checkpoint

Disposition is complete through ID 38350. Resume at ID 38351; 26,784
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38351-38400-preliminary.md`. The next unused decision ID is
D-12432.
