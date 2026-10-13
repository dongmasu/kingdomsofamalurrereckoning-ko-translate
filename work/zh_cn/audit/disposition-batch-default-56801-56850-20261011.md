# Disposition Batch: `default` IDs 56801-56850

- Date: 2026-10-11. Rechecked all 50 active Korean rows against the
  English, Japanese, and Chinese source CSVs under `src/csv/`, the active
  Korean CSV, historical audit prompts, prior decisions, line breaks,
  runtime markers, and values. Japanese informed voice/register; Chinese
  was supporting evidence. These working dispositions are not independent
  final linguistic approval.
- Three accepted corrections, 37 `not an issue` IDs, and 11 uncertain
  findings. The uncertainty at 56809 overlaps its accepted semantic
  correction because the exact Korean ability-label convention remains
  unresolved.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56809 | `활 강공격으로 충전 화살 3발을 발사합니다.` | `활의 충전 사격으로 충전 화살 3발을 발사합니다.` | English names the Bow's `Charged Shot`, Japanese also says charge shot, and Chinese agrees. The old `강공격` means heavy attack and conflates a different attack type. The corrected phrase matches the established active wording at ID 6911; exact official UI naming remains separately uncertain. |
| 56816 | `이 시체에서 '아스터 상속권 찾기'라는 제목의 쪽지가 나왔다.` | `이 시체에서 '아스터의 유산 찾기'라는 제목의 쪽지가 나왔다.` | English's note title is `Retrieving the Aster Inheritence`; Japanese and Chinese both describe seeking/recovering the Aster inheritance. `상속권` means the legal right to inherit, not the inheritance/property being retrieved. The source typo is documented, not adopted as canonical spelling. |
| 56836 | `네 손에 피를 묻혔어.` | `네 손에 피가 묻었어.` | English and Japanese use the responsibility-for-deaths idiom, and Chinese says “you did it.” The revised Korean is the natural Korean idiomatic construction and retains the blame. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56804 | Uncertain | English `Spellbinding`, Japanese's sealing/curse reading, Chinese's “captivating,” and Korean's enchanting meaning conflict; the ability/mechanic is unknown. |
| 56809 | Uncertain | The semantic correction to `충전 사격` is supported and applied, but the official Korean UI name for `Charged Shot` is not established. |
| 56810 | Uncertain | The poem's lineation is retained, but English ends with `I will make her own`; Japanese/Chinese supply “world,” and the antecedent of `her` is unresolved. |
| 56814 | Uncertain | English/Japanese specify a tavern, while Korean uses the broader inn term. The establishment type should not be normalized without context. |
| 56826 | Uncertain | English capitalizes `Scion`, Japanese transliterates it, Chinese reads priest, and Korean says successor. Its formal title/office sense is unresolved. |
| 56828 | Uncertain | The group takes its pickings from wreckage in all sources; Korean's “usable things” narrows unspecified goods to useful items. |
| 56829 | Uncertain | `Fountain` and `Wellspring` may be two names, alternate names, or uncertain recollection; Korean translates both descriptively. |
| 56837 | Uncertain | `King of Cups` is retained as `컵의 왕`, but earlier decisions D-380, D-1198, and related findings leave its card/title function and canonical Korean form unresolved. |
| 56841 | Uncertain | English directly uses `dove` as an affectionate vocative; Japanese omits it and Chinese has a different rendering. Korean's `그대여` preserves intimacy but not the explicit endearment. |
| 56843 | Uncertain | English/Chinese point to a location in the Sidhe; the entity's type and canonical Korean form remain open in historical notes. |
| 56844 | Uncertain | `The Withering War` is capitalized and names the Summer/Winter Fae conflict; canonical Korean event-title wording needs corpus alignment. |

## Not an Issue

The remaining 37 IDs are 56801-56803, 56805-56808, 56811-56813, 56815,
56817-56825, 56827, 56830-56835, 56838-56840, 56842, and 56845-56850.
They preserve evident meaning, voice/register, and structure. The unresolved
`King of Cups` terminology is separately recorded at ID 56837.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56801-56850
  once in ascending order. Each default file has 65,135 records with
  identical full key order.
- Line-break counts match throughout, including the quoted poem at 56810
  and the two-stat-line text at 56811. No runtime-marker identity/order or
  cross-locale numeric-value discrepancy was found.
- Reconciled historical prompts in `56750-56849`, including the Aster
  Inheritance/title, Fountain/Wellspring, Moon Goddess bow, `dove`, and
  Withering War. Earlier decisions D-380/D-1198 and later repeated findings
  leave `King of Cups` unresolved; no one-row normalization was made.
- Only the approved `Texto` cells at 56809, 56816, and 56836 changed. The
  active CSV retains its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF
  endings, and 39 pre-existing bare-LF endings. Post-edit SHA-256:
  `6c1897f4b72f83cb6fc239034020ac249cb31c6c950c68b89255d13ddcfb4244`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56801/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `e051f447e5776fc286aaf2d9374391ef67e817189f4a961477f4758abf2d0c09`).

Decisions D-17117 through D-17119 record the accepted corrections;
D-17120 through D-17130 record 11 uncertain findings, including the
terminology uncertainty overlapping accepted ID 56809; D-17131 records the
remaining 37 `not an issue` IDs. Direct register totals: 1,671 accepted,
11,855 `not an issue`, and 10,594 uncertain (24,120 total); next D-17132.

Resume at `default` ID 56851; 8,284 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56851-56900-preliminary.md`](default-ids-56851-56900-preliminary.md).
These are working dispositions, not independent final linguistic approval.
