# Disposition Batch: `default` IDs 63751-63800

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- Two accepted targeted corrections, 37 `not an issue` IDs, and 11 uncertain
  IDs. These are working dispositions, not independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18087 | 63771 | `저들은 가장 천한 부류야. 신앙을 잃은 콜로사이(Kollossae), 생각도 없이 폭력만 휘두르고 영원히 절망에 빠진 자들이지.` | `저들은 가장 천한 자들이야. 신앙 없는 콜로사이(Kollossae), 생각도 없이 폭력만 휘두르고 영원히 절망에 빠진 자들이지.` | English says “Kollossae without faith”; Japanese and Chinese likewise say faithless/without faith. Remove the unsupported implication that they once had faith and lost it. |
| D-18087 | 63794 | `그대는 우리에게 정말 많은 것을 주었소. 신들이 줄곧 우리 민족의 삶에, 내 삶에 연민과 영향을 베풀어 왔다는 걸 이제야 알겠소.` | `그대는 우리에게 정말 많은 것을 주었소. 신들이 줄곧 우리 민족의 삶에, 내 삶에 연민을 베풀고 영향을 미쳐 왔다는 걸 이제야 알겠소.` | Separate the source's two relations: the gods showed compassion and had influence. The previous Korean used the unnatural collocation `영향을 베풀다`. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18088 | 63751 | “Failings of my race” may describe collective culpability or an inherent failing; Korean `종족의 결함` risks the latter, but the source and locale renderings do not settle the nuance. |
| D-18088 | 63752 | English says `Plagueshield` while Korean uses `Pledgeshield`; earlier occurrences also leave the name/rank/remedy distinction unresolved. Do not normalize from this line alone. |
| D-18088 | 63756 | The objective sequence is preserved, but transliterations of Desiderus Trav differ across locales and the canonical Korean form is not established. |
| D-18088 | 63758 | Japanese explicitly identifies the Aedics as a couple; English and Chinese leave the exact referent/number less clear. Korean's couple reading is plausible but remains provisional. |
| D-18088 | 63761 | English `fuddled` is less specific than Japanese and Chinese, which explicitly say drunk. Korean retains impaired thinking without deciding whether intoxication is meant. |
| D-18088 | 63776 | `Alfar Nation` may be a formal polity or a broader population; Korean `국가` is more specific, while the other locales differ. |
| D-18088 | 63777 | The `First Sword` role is described, but its canonical Korean title and glossary form remain unsettled. |
| D-18088 | 63785 | The Crows, Brogan's bow, and the speaker's team relation are compressed in English; retain the current result pending gameplay/context and group-name review. |
| D-18088 | 63788 | “The sins of the Kollossae were answered” may mean punishment or a response to the sins. Korean retains the response reading without resolving agency. |
| D-18088 | 63790 | The exact relation between the Ring of Keozai, the great tree, its branch, and the watchers remains cosmological/context-dependent. |
| D-18088 | 63792 | English is malformed and the Korean has an awkward repeated `정리`; the intended “distill ... into theorems, laws and axioms” is apparent, but the craft/effort wording merits a separate language pass. No edit made. |

## Not an Issue

Decision D-18089 records these 37 IDs: 63753-63755, 63757, 63759-63760,
63762-63770, 63772-63775, 63778-63784, 63786-63787, 63789, 63791,
63793, and 63795-63800. They preserve the available meaning, voice, labels,
values, and structure. ID 63786 uses the established `스콜리아 아르카나`
form; 63797 intentionally preserves the possessive fragment; and 63800's
`기금` is compatible with the village's saved money/fund in the other locales.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63751-63800 once,
  in identical ascending order.
- Embedded newline counts match for every row. Runtime-marker identities
  and order match; no numeric-value differences were detected.
- Rechecked the historical source-keyed questions covering this range,
  including the Plagueshield/Pledgeshield conflict, Aedics, First Sword,
  Scholia Arcana, the Hyperian sins, Ring of Keozai, and Basilica Gnostra.
- Pre-edit CSV SHA-256:
  `ff85c0bde3c2e577f690e25742121272b3aaa871fc13d8c8b21a44b62a5641da`.
  Post-edit CSV SHA-256:
  `e35b8ab1940b0612adbd8956fefe0d5a30a5df00d0464ee019d7d7e3a623ad47`.
  Byte-level comparison against the batch-start backup confirmed that only
  the `Texto` fields at IDs 63771 and 63794 changed. The UTF-8 BOM, 65,135
  records, key order, embedded lineation, and outer CRLF record separators
  are preserved. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63751/locatexts_zh_cn.koalocatext_default.csv`.
- D-18087 records two accepted corrections, D-18088 records 11 uncertain
  findings, and D-18089 records 37 `not an issue` IDs. Totals at D-18089:
  1,821 accepted, 16,261 `not an issue`, and 12,523 uncertain (30,605
  dispositions); next D-18090.

Resume at `default` ID 63801; 1,334 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
