# Disposition Batch: `default` IDs 57501-57550

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and values. These are working
  dispositions, not independent final linguistic approval.
- One accepted correction, 39 `not an issue` IDs, and ten uncertain findings.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57524 | `좋아. 그걸 내게 주면 충분히 보상해 줄게.` | `좋아. 그것들을 내게 주면 충분히 보상해 줄게.` | English `them` and Chinese `它们` are plural. Preserve the plural while leaving the payment object's identity unspecified, as the source row does. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17317 | 57501 | Brogan and his rogues are ready; whether `Pit` is a named Arena location and its canonical Korean form need game-context review. |
| D-17318 | 57502 | The relic's maker is explicitly uncertain; Amman the Clever's epithet/name form remains unresolved. |
| D-17319 | 57507 | The journal's 8-paragraph/14-break structure matches all locales, but its “fixture” image and the Korean text's explicit dying implication need context. Historical paragraph count is wrong. |
| D-17320 | 57510 | `The Authority` may be a named entity/title or abstract divine power; locale readings differ. |
| D-17321 | 57515 | Dorian's Chronicler role is clear, but whether this is a formal title or descriptive profession and its Korean form need alignment. |
| D-17322 | 57528 | The possessing force's departure at Cadoc's death and the search objective are clear; Frost Stone's canonical Korean item term is not. |
| D-17323 | 57530 | The changing popularity and rising canceled orders are preserved; `Asker's Ale` is a named drink whose Korean form remains provisional. |
| D-17324 | 57546 | The Boggart Tumbler summon and cap of three are present; the exact per-hit trigger and canonical proc wording need gameplay-term review. |
| D-17325 | 57548 | The claim about tyrenium being exhausted is preserved; its material-name spelling needs consistency review. |
| D-17326 | 57550 | The one-lifetime telling and song are retained; `Dame`, Fenian Cycle, and “Oleyn, Cureseeker” need title/term alignment. |

## Not an Issue

The 39 IDs are 57503-57506, 57508-57509, 57511-57514, 57516-57523,
57525-57527, 57529, 57531-57545, 57547, and 57549. They preserve evident
meaning, voice, values, or source ambiguity. This includes the unknown
payment offer at 57511, the siege-trauma contrast, the outward/upward
construction contrast, the speaker's unresolved feminine referent, the
Fateweaver's tactical value, and the suggestive but euphemistic invitation.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57501-57550 once
  and in ascending order.
- ID 57507 contains 14 embedded newline characters and eight paragraphs in
  all four locales; preserve that structure. This contradicts the historical
  note's seven-paragraph count. The journal's wording questions remain open.
- Numeric values and runtime structure checked: the Boggart Tumbler maximum
  of three at 57546 is preserved; no other numeric or marker discrepancy
  was identified.
- Rechecked source-keyed historical questions in `57450-57549` and
  `57550-57649`, including the Brogan/Pit, Amman, Rundamir journal,
  Authority, Chronicler, payment pronoun, Cadoc/Frost Stone, Asker's Ale,
  Boggart Tumbler, tyrenium, Nesta, and Dame Oleyn prompts. The old audit
  paragraph count was not changed; its mismatch is recorded here.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57501/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `29718d93889718a13a59d3c0c2537add7e3e40cf7581d7433fd2e99e3c391344`).
  Only the accepted `Texto` cell at ID 57524 changed. The UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 bare-LF endings
  are preserved.
- Post-edit active default CSV SHA-256:
  `b0636ddaf2ef52ac466f0e9bc800197e0444238e09bfdd76f48ebccbff8e83e6`.

D-17317 through D-17326 record the ten uncertain findings; D-17327 records
the accepted correction; D-17328 records the remaining 39 `not an issue`
IDs. Direct register totals: 1,699 accepted, 12,082 `not an issue`, and
10,750 uncertain (24,531 decisions total); next D-17329.

Resume at `default` ID 57551; 7,584 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-57551-57600-preliminary.md`](default-ids-57551-57600-preliminary.md).
These are working dispositions, not independent final linguistic approval.
