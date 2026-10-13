# Disposition Batch: `default` IDs 36251-36300

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, four `not an issue`, and eleven uncertain.
- CSV change: ID 36287 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36257 | `Still Laborer` | Uncertain: English capitalization and Japanese treat `Still` as a name; Chinese reads it adjectivally. The Korean possessive/name interpretation remains possible but unverified. |
| 36260 | `Dangerous Games` | Not an issue: Korean matches the English/Chinese “games” reading. Japanese's hunting interpretation is a source divergence, not support for changing the primary-English meaning. |
| 36262 | `berk` / `멍청아` | Not an issue: the direct insult and speaker's blunt refusal are preserved. The same Korean insult was accepted as an appropriate rendering of `berk` at D-6306. |
| 36266 | Emptying the amphora in the pool | Uncertain: English and Chinese say to empty the amphora's contents into the pool; Japanese says to fill an empty amphora. Korean follows English, but the actual quest action remains unverified. |
| 36268 | Fae Adar / Burren Cove / Nil Kern / Priestess Corelon / Sanctuary | Uncertain: the prisoner, iron gate, key-holder, magic circle, withheld password, and guard sent to the Sanctuary are preserved. The locale name forms and whether `Sanctuary` is a named institution need context. |
| 36274 | Moon Camp / `달빛 야영지` | Uncertain: the current form is plausible, but prior decisions record competing `달 야영지`, `달빛 야영지`, and `문 캠프` forms without an approved map-name standard. |
| 36277 | `Akara's Touch` / `아카라의 손길` | Uncertain: the Korean is a plausible rendering of the named Touch, supported by English and Chinese; Japanese says “finger.” The row does not establish whether this is an item, ability, or other title. |
| 36282 | `Flawless Mitharan Robust Grip` | Uncertain: quality, Mitharan association, and grip/handle concept are present, but the item's construction and canonical modifier order cannot be settled from this label. |
| 36285 | `them` / `this rock` | Uncertain: Korean preserves the need for someone to search for an unspecified plural and the plan to find an escape vessel. The source gives no antecedent for `them` or exact identity of `this rock`; no referent should be invented. |
| 36286 | Tenders / Cadoroc / Saturnyn | Uncertain: the leader, subordinate, flight, and suspected involvement are retained. `Tenders` is a formal House of Sorrows group in some contexts, while Japanese/Chinese give guardian/caretaker readings; canonical name forms remain open. |
| 36287 | Refusal and plural ownership | Accepted: English says `I will not` and `These are mine`, while Korean said `줄 수 없어` (“cannot give”) and singular `이건`. Replace with `안 돼! 절대 안 줄 거야. 이것들은 나만의 것이야, 필멸자여. 내가 순순히 내줄 거라 생각했나?`; this restores refusal and plural ownership without naming the unspecified objects. |
| 36288 | `Camera Smoothing` | Uncertain: Korean conveys smooth camera movement, but the isolated UI label does not establish whether it is a setting name, effect, or imperative. Preserve the concept pending interface context. |
| 36297 | Alserund pass / `its doors` | Uncertain: the narrow pass south of Alserund and key are retained, but the source's “its doors” antecedent is unclear and locale readings differ on tomb/ruins/monuments. Do not assign the doors to a specific place. |
| 36299 | Nearby-character awareness and theft probability | Not an issue: Korean preserves the inverse relation: greater awareness among nearby characters lowers theft success probability. The mechanic remains intelligible without replacing it with an unsupported suspicion stat. |
| 36300 | Southern eyries / wreath | Uncertain: Korean keeps the southern assault, nests, and wreath objective. English syntax is unusual, Japanese reads highland nests and making a flower crown, and Chinese specifies materials for a feather crown; the exact target/material remains open. |
| Remaining ordinary text in IDs 36251-36300 | Dialogue, names, values, objectives, and labels | Not an issue: all other rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Historical questions at IDs 36257, 36262, 36266, 36268, 36285-36286,
  36297, and 36300 were checked against the current four-locale rows.
- The “these” ambiguity at 36287 and Camera Smoothing label at 36288 were
  also rechecked. Only the number/refusal mismatch at 36287 warranted a
  supported edit.
- The Dverga/Sidhe/Moon Camp/Pledgeshield and named-item decisions remain
  provisional; no global terminology replacements were made.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36251-36300
  exactly once in identical order.
- No embedded line breaks or runtime-token differences were found in this
  range. The +2% XP value at ID 36292 is retained.
- Active default CSV SHA-256:
  `10b21ae21b050101329ca3f02a9807bb417bade9984c1f86b278af6105c772fc`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.

## Checkpoint

Disposition is complete through ID 36300. Resume at ID 36301; 28,834
`default` IDs remain through ID 65134. The next unused decision ID is
D-11689. Preliminary scan:
`default-ids-36301-36350-preliminary.md`.
