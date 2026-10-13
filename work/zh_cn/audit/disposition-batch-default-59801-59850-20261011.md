# Disposition Batch: `default` IDs 59801-59850

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, preliminary
  findings, source-keyed historical questions, terminology, line breaks,
  markers, and numeric values. These are working dispositions, not
  independent final linguistic approval.
- One accepted correction, 31 `not an issue` IDs, and 18 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17869 | 59849 | `혼돈 교단의 자칭 예언자라면 미스로스 어딘가에 있어. 하지만 실은 형편없는 호색한이야. 돼지 같은 놈이지.` | `혼돈 교단의 자칭 예언자라면 미스로스 어딘가에 있어. 하지만 실은 대체로 비열한 인간이야. 돼지 같은 놈이지.` | English `cad` is a broad character insult, not necessarily a womanizer. Chinese also uses a broad scoundrel term, while the Japanese-derived Korean narrowed it to `호색한`. Restore the broader negative character judgment and retain the separate pig insult. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17870 | 59803 | The canonical name and referent of Glass of Ambient are not established; the current descriptive rendering may be too generic. |
| D-17870 | 59807 | Lyana's Dance may be a named practice or a generic dance; the locales do not establish its formal status. |
| D-17870 | 59809 | Capitalized Wand may be a specific item; the farm's condition and the hoped-for fix remain context-dependent. |
| D-17870 | 59810 | Capitalized House may refer to House of Sorrows; supporting locales identify the family more specifically than English. |
| D-17870 | 59812 | Votive of Flame may name an object, wearable accessory, or offering; exact item type is unresolved. |
| D-17870 | 59816 | The antecedent of “them” and the nature of the Weeping King's continuing legacy are unspecified. |
| D-17870 | 59823 | Irion and King of Cups are retained, but canonical Korean card-title order/wording needs glossary consistency. |
| D-17870 | 59824 | Lords of Valor may be a formal champion-team name; the Korean form needs corpus-level alignment. |
| D-17870 | 59826 | Capitalized The Telling may be a named rite/tradition; current generic rendering is not confirmed. |
| D-17870 | 59828 | Last Entry may mean newest entry or final entry in sequence; the isolated UI label lacks direction context. |
| D-17870 | 59830 | English says to open the cage, while Korean says `감방`; scene context is needed to distinguish cage from cell. |
| D-17870 | 59834 | Akara is honored in Korean, but the short English line does not encode that register; verify the speaker's established voice. |
| D-17870 | 59839 | `Yield` may mean surrender, submit, or move aside in this encounter; the command's scene is unavailable. |
| D-17870 | 59841 | Acting Amaldor is retained as temporary/interim, but the formal rank and exact status remain unverified. |
| D-17870 | 59843 | The Quarters may be a named district, and the petitions' completion/action scope differs across locales. |
| D-17870 | 59845 | “Parts of himself he sacrificed” may be literal or figurative; do not infer body parts without the scene. |
| D-17870 | 59846 | The capitalized Player/Staff wording may be developer-facing text rather than player-facing UI. |
| D-17870 | 59848 | Shieldring Keep's canonical Korean place-name form and the rendering of Keep remain unverified. |

## Not an Issue

Decision D-17871 records these 31 IDs: 59801-59802, 59804-59806, 59808,
59811, 59813-59815, 59817-59822, 59825, 59827, 59829, 59831-59833,
59835-59838, 59840, 59842, 59844, 59847, and 59850. The current rows
preserve evident meaning and intentional ambiguity. The period at 59833
and source's unresolved pronoun at 59836 were checked; the two-request
quantity at uncertain ID 59843 is preserved despite unresolved task scope.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain the 50 target IDs
  exactly once and in ascending order. All four full resources contain
  65,135 records with matching key order.
- Rechecked historical prompts for Orieator's Tomb/Freemen, Glass of
  Ambient, Lyana's Dance, the House and war, Votive of Flame, the Weeping
  King's legacy, Irion/King of Cups, Lords of Valor, The Telling, Star Camp,
  Dvergan, acting Amaldor, Quarters/petitions, sacrificed parts, player/staff
  wording, Shieldring Keep, and the Chaos-cult prophet.
- Embedded newline counts match and no runtime markers occur. The period
  at 59833 is identical in all locales. Japanese alone includes the numeral
  `2` at 59843; the two-petition requirement is present in all four locales.
- Pre-edit CSV SHA-256:
  `6c99e14cd030efea39ef70b94e6ac00cb1893beee359113bbbc1d4b0eb9e2292`.
- Post-edit CSV SHA-256:
  `4d0c818192353a4179a6057e8d0eb4d576d0cbea62faae92a5caf536c99abe72`.
  Byte comparison against the backup confirms only ID 59849's `Texto`
  cell changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59801/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `6c99e14cd030efea39ef70b94e6ac00cb1893beee359113bbbc1d4b0eb9e2292`).

D-17869 records one accepted correction, D-17870 records 18 uncertain
findings, and D-17871 records 31 `not an issue` IDs. Direct register
totals: 1,741 accepted, 13,479 `not an issue`, and 11,410 uncertain
(26,630 dispositions total); next D-17872.

Resume at `default` ID 59851; 5,284 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
