# Disposition Batch: `default` IDs 64651-64700

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, accepted terminology, values, and
  structure.
- Three accepted targeted corrections, 37 `not an issue` IDs, and ten
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18134 | 64685 | `베팅하기 ($NQD_City_Rathir.ante_mid$골드)` | `베팅하기 ($NQD_City_Rathir.ante_mid$ 골드)` | Restore the source and other-locale spacing between the runtime bet amount and the `gold` unit; preserve the variable byte-for-byte. |
| D-18134 | 64690 | `멜 센시르는 7년간 고된 싸움을 치르는 동안 내 집이었어. 튼튼한 성벽은 고맙지만, 이제 새로운 세상도 보고 싶어.` | `멜 센시르는 7년간 고된 싸움을 치르는 동안 내 집이었어. 튼튼한 성벽은 고맙지만, 새로운 지평을 향해 나아가고 싶어.` | Restore English `new horizon` rather than broadening it to “a new world”; retain the speaker's contrast between gratitude for the walls and eagerness for change. |
| D-18134 | 64700 | `완벽한 미타루 화염 손잡이` | `완벽한 미타란 화염 손잡이` | Distinguish the `Mitharan` material/people adjective from the deity `Mitharu`, following the previously accepted distinction at ID 64483 (D-18122). |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18135 | 64653 | The English names only `the Blade`, while Japanese adds `Haldebir`; do not import that name without English support or an antecedent. |
| D-18135 | 64663 | Erlen Vanik's Korean transliteration varies across locales; the advisor role and qualified characterization are retained. |
| D-18135 | 64664 | The bargain and return for Besin's helm are preserved; Khamazandu's singular `its` and the source's lord/creature framing depend on lore context. |
| D-18135 | 64667 | `a couple` and `they` have context-dependent antecedents; the recent inspiration and ettin-war consequence remain. |
| D-18135 | 64671 | The formal role is translated as `총괄 디자인 디렉터`; whether this isolated label is an out-of-world staff credit is unknown. |
| D-18135 | 64674 | `Straton's narrator` may be a formal performance role; Korean preserves the late arrival and missed performance, but the title convention is unclear. |
| D-18135 | 64681 | `Ancient of War` is a formal title whose Korean equivalent is not established; keep the translated title provisional. |
| D-18135 | 64687 | `The Burn` may be a proper location or descriptive burned harbor/land; Korean keeps the uncertain `번` reading and invents no substance to apply. |
| D-18135 | 64694 | `Serpent's Speed` is a vessel name with varying locale transliterations; the record's source in its remains is preserved. |
| D-18135 | 64695 | `Property` could mean an object or legal property; Korean's broad `물건` is plausible, and Japanese's parchment is not supported by English. |

## Not an Issue

Decision D-18136 records these 37 IDs: 64651-64652, 64654-64662,
64665-64666, 64668-64670, 64672-64673, 64675-64680, 64682-64684,
64686, 64688-64689, 64691-64693, and 64696-64699. They preserve
available meaning, voice, values, and structure. In particular, the current
Korean at 64692 already includes the taunting motive (`조롱하러`), despite
the preliminary note suggesting it was omitted. `House of Valor` at 64680
already uses the accepted `용맹의 집` form.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 64651-64700 once,
  in identical ascending order.
- Embedded newline counts and runtime-marker identities/order match. `{1}`
  at 64662 and `$NQD_City_Rathir.ante_mid$` at 64685 are unchanged.
- Rechecked source-keyed historical questions for the Blade, Piercing Light,
  Khamazandu/Warsworn, Executive Design Director, Straton's narrator, House
  of Valor, Ancient of War, the Rathir bet variable, The Burn, and Mitharan
  handle terminology.
- Only the `Texto` cells at IDs 64685, 64690, and 64700 changed. UTF-8 BOM,
  all 65,135 data rows, key order, and line-ending counts are preserved.
  The file has 72,012 CRLF and 72 bare-LF endings, unchanged from the
  byte-identical batch-start backup.
- Pre-edit SHA-256:
  `de94a48b8e251d53037939da68d1b6ec4abe4597ae218b5965082c5f11076a0d`.
  Post-edit SHA-256:
  `480a376b85be9b4215e4a453acb9d25c48ee8c3ae9ecfbe56f33d2829caff586`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-64651/locatexts_zh_cn.koalocatext_default.csv`.

- D-18134 records three accepted corrections, D-18135 records ten uncertain
  findings, and D-18136 records 37 `not an issue` IDs. Totals at D-18136:
  1,843 accepted, 16,895 `not an issue`, and 12,767 uncertain
  (31,505 dispositions); next D-18137.

Resume at `default` ID 64701; 434 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
