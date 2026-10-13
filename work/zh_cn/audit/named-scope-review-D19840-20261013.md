# Default Scope Reconciliation D-19840

2026-10-13. Reviewed every active `default` ID 36451-36550 against English,
Japanese voice/register, supporting Chinese, active Korean, and exact-key
history. English anchored meaning; Japanese informed voice and register;
Chinese was supporting evidence. No PAK or PAK-derived material was
consulted.

## Exact-Key Reconciliation

The D-19665 manifest contains four keys in this range, all terminal `not an
issue`: 36451, 36454, 36458, and 36460. The D-19666 manifest contains nine:
accepted 36487 and 36542, and `not an issue` at 36464, 36482, 36485, 36492,
36495, 36497, and 36500. Both 200-key manifests were matched against their
byte-identical pre-edit Korean snapshots and the English, Japanese, and
Chinese source rows (200/200 exact matches per locale). These terminal
keys were validated, not reclassified or recounted. ID 36487 retains the
final D-19671 wording `미타란 사람들은`; ID 36542 uses the official-manual
skill name `숨겨진 물건 찾기`.

| IDs | Existing disposition | Reconciliation |
| --- | --- | --- |
| 36451, 36454, 36458, 36460 | D-19665 `not an issue` | The active rows were checked against the exact source keys. The older D-11737, D-11738, D-11740, and D-11741 uncertainties are not reopened. |
| 36464, 36482, 36485, 36492, 36495, 36497, 36500 | D-19666 `not an issue` | Active source meaning remains supportable; validate only, with no duplicate classification. |
| 36487, 36542 | D-19666 accepted; 36487 corrected by D-19671 | The active final Mitharan form and official `숨겨진 물건 찾기` skill terminology remain applied. No recount. |
| 36462, 36478 | D-11742 and D-11745 accepted | `도전 타이머` and the corrected Great Order comparison remain applied. |

## Carried Findings Resolved

| ID | Result | Evidence |
| ---: | --- | --- |
| 36507 | Not an issue | `여름의 성소` directly preserves `Summer Sanctuary` and the sentence's seed-of-knowledge image. Capitalization alone does not establish a required Korean proper-name convention or a local meaning defect. |
| 36510 | Uncertain | `Warden` may denote a guard, prison official, or another office. Korean `워든` retains the title sound but not a settled role meaning; English, Japanese, and Chinese do not determine one Korean title here. |
| 36512 | Uncertain | English only identifies Beads; Korean `염주` specifies prayer beads, while Japanese transliterates the item and Chinese says monk's beads. The item subtype and canonical rendering remain materially unresolved. |
| 36524 | Accepted | English, Japanese, and Chinese identify Rathir. Use the source-checked Korean form `라시르`, consistent with D-19743/D-19773 and the corrected occurrences at 36092 and 36189; replace local `라시어`. |
| 36535 | Not an issue | `케이프 솔라스` is a source-traceable form for Cape Solace, supported by the Japanese phonetics and established active usage. Competing corpus spellings alone do not establish a local mistranslation. |
| 36545 | Uncertain | The capitalized `Paling Wand` may be a named quest item; Japanese instead suggests a cultivation/plowing staff and Chinese transliterates the item. Korean's “pale wand” reading cannot be confirmed from this objective alone. |
| 36546 | Not an issue | English and Japanese say Squire Brio arranges the four visitors for an audience with High King Titarion. Korean preserves the audience, four dignitaries, procession order, and their preferences; Chinese's support-seeking purpose does not override English. `종자` is a direct rendering of Squire. |
| 36549 | Not an issue | `대가문 - 아베르가웨인` preserves the Great House label and Abergawein name. No source evidence establishes a different local institution term or spelling. |

The other historical uncertainties at 36510, 36512, and 36545 remain the only
unresolved findings in this range. Previously terminal ordinary-text block
decisions were validated without recounting. No global category total is
asserted; the separate 55 affix findings remain closed by D-19565.

## Verification

All 100 IDs occur once and in identical order in the active Korean and three
source-locale CSVs; each contains 65,135 ordered IDs. The single `Texto`
change was ID 36524. The apply script verified exact inverse reconstruction,
the UTF-8 BOM, 72,011 CRLF / 73 bare-LF endings, all IDs, and the target row.

Pre-edit SHA-256:
`16d033cf3ff4c9a43f02b18cea7920ff0efe79799d60279e19897a999ef909b3`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19840/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`19a774e00f1f30983953659f63755750335b179d684b15d5be8bc588433d2759`.

The D-19840 range review is complete; the default review overall is not.
Resume D-19841 / IDs 36551-36650; 28,584 active default IDs remain through
65134.
