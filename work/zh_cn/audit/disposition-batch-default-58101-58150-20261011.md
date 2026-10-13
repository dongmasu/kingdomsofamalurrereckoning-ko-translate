# Disposition Batch: `default` IDs 58101-58150

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction at ID 58143, 30 `not an issue` IDs, and 19
  uncertain IDs.
- Language references are the immutable sources in `src/csv/en_us/`,
  `src/csv/ja_jp/`, and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean
  migration draft, not the Japanese-language reference.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58143 | `네가 쫓는 표적이야. 꽤나 값진 사냥감이기도 하지. 노움의 소유물치곤 별나지만, 의뢰인이 걸어 둔 현상금은 받을 만해.` | `네가 쫓는 사냥감이야. 말 그대로 꽤 괜찮은 채석장이기도 하지. 노움 소유라니 별나긴 하지만, 의뢰인이 현상금을 걸었으니 어쨌든 잡아야 해.` | Restore both English senses of `quarry` (the pursued prey and a stone quarry), while retaining the gnome ownership and patron's bounty. |

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17533 | 58101 | Ten years and failure to return with the young of Ayten are preserved; English is ambiguous between children/offspring and young people, with Japanese and Chinese differing. |
| D-17534 | 58103 | The palace chronicle, five embedded line breaks, threat sequence, and repeated resurrection are preserved; lore terms and the “wither” ending remain open. |
| D-17535 | 58105 | Light/solace and the jewel theft are retained as a fragment; the thief, entry route, and whether the light is a person/object/clue are unstated. |
| D-17536 | 58110 | The Speakstone communication item is translated descriptively; its canonical Korean item name is unconfirmed. |
| D-17537 | 58116 | Feride's completed experiment and identity check on city observers are retained; name spelling and whether “scrutinizing” means formal surveillance need context. |
| D-17538 | 58118 | Unresolved plural “they,” magic, and Echostone reference are retained without inventing an antecedent; the item/context is unknown. |
| D-17539 | 58119 | Theft, sympathy, and suspected Darkvari identity are retained; whether Darkvari is a people, family, or group and the name form remain open. |
| D-17540 | 58123 | Whitestone exclusion threat and partnership question are preserved; place spelling and the scope of “walk away from this, from me” need context. |
| D-17541 | 58126 | The mages' compensation conditional on killing the fighters is preserved; the bargain's broader context remains unstated. |
| D-17542 | 58129 | Joint objective and pond location are retained; capitalized `Wolves` may be a named group rather than generic wolves. |
| D-17543 | 58133 | Alder Malloi's key and Tari's escape objective are preserved; Korean `우리 열쇠` can momentarily read as “our key” instead of a cage key. |
| D-17544 | 58135 | The remains and forge are retained; English leaves the remains unspecified while Chinese identifies a warhammer, and Korean chooses bodily remains. |
| D-17545 | 58137 | Shadow Pass and the life/death wordplay are retained; Korean makes the implicit “alive” explicit and the place-name form remains provisional. |
| D-17546 | 58142 | Possession, escape, death, corpse search, and Skycrown artifact objective are retained; proper names and artifact terminology need alignment. |
| D-17547 | 58145 | Written orders and price offer are retained; whether `orders` means instructions or a faction/order is unresolved. |
| D-17548 | 58147 | Witch Knight Anira's ongoing work for Gadflow and civilian deaths are retained; name/title transliteration remains provisional and the Korean name `아니라` is visually ambiguous in the sentence. |
| D-17549 | 58148 | Petition board and improvement purpose are preserved; capitalized `Quarters` may be a named district rather than generic lodging quarters. |
| D-17550 | 58149 | Gadflow's killing of the High King, ensuing war, and Titarion's melancholy/distance are retained; canonical title and name forms need alignment. |
| D-17551 | 58150 | Standalone Jordan name is retained phonetically; canonical Korean spelling varies across locale renderings. |

## Not an Issue

The 30 IDs are 58102, 58104, 58106-58109, 58111-58115, 58117, 58120-58122,
58124-58125, 58127-58128, 58130-58132, 58134, 58136, 58138-58141, 58144,
and 58146. They preserve evident meaning, structure, runtime markers, and
numeric values.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58101-58150 once
  and in identical ascending key order; each full default file has 65,135
  data records.
- The five line breaks at 58103 are preserved in all locales.
- At 58131, localized `{*1...}` Longbow label and `{1}` control marker stay
  in the same order. The ten-year duration at 58101 and +5% Fire Resistance
  at 58141 match. No other numeric discrepancy was found.
- Reconciled historical source-keyed prompts for IDs 58050-58149 and the
  Jordan boundary at 58150. Applicable open questions are retained above;
  prompts outside this batch remain for their respective reports.
- The preliminary scan's `fd5c...` CSV hash is a historical scan-time value.
  Decision D-17408 later changed only ID 57811 before this batch's baseline.
- The byte-identical pre-edit backup is
  `/private/tmp/ko-translate-backups/20261011/before-58101/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
  Only the `Texto` cell at 58143 changed. The active CSV retains its UTF-8
  BOM, 65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings.
- Post-edit active default CSV SHA-256:
  `85450fbeeb4974a39be47f5e6121c88cdba450642f645b1e665ea21a83c45218`.

D-17532 records the accepted correction; D-17533 through D-17551 record
19 uncertain findings; D-17552 records the remaining 30 `not an issue` IDs.
Direct register totals: 1,704 accepted, 12,248 `not an issue`, and 10,974
uncertain (24,926 total); next D-17553.

Resume at `default` ID 58151; 6,984 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
