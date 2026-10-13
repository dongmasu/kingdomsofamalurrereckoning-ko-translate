# Disposition Batch: `default` IDs 56401-56450

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English,
  Japanese, Chinese, the preliminary scan, source-keyed historical notes,
  prior decisions, structure, runtime markers, and values. These working
  dispositions are not independent final linguistic approval.
- Four accepted corrections, 40 `not an issue` IDs, and six uncertain
  findings. No uncertain finding overlaps an accepted correction.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56414 | `물리적 묘사로 보면 크로우 피크일 수 있어. 멀진 않지만 위험한 곳이야.` | `지형에 관한 묘사로 보면 크로우 피크일 수도 있어. 멀진 않지만 위험한 곳이야.` | In context, “physical description” describes a location's observable features, not someone's body; use natural geographic wording while retaining the tentative match. |
| 56420 | `네가 피리를 분다고 들었어.` | `네가 플루트를 분다고 들었어.` | English and Japanese explicitly identify a flute; `피리` can suggest a different traditional instrument. |
| 56426 | `과거를 보존하려고. 우리 주위에는 진보라는 거대한 끌과 망치가 도사리며, 내 백성을 깨우침으로 끌고 가려 하지.` | `과거를 보존하려고. 우리 주위에는 진보라는 거대한 끌과 망치가 있고, 내 백성을 깨우침으로 끌고 가려 해.` | Preserve the personified progress/enlightenment metaphor without making the tools sound as if they are lurking in wait. |
| 56428 | `용맹의 전당은 최고의 전사들만큼이나 웅장해. 달렌타스처럼 먼 곳에서도 경기를 보러 사람들이 찾아와.` | `용맹의 집은 최고의 전사들만큼이나 웅장해. 달렌타스처럼 먼 곳에서도 경기를 보러 사람들이 찾아와.` | Reuse the established Korean proper-name form `용맹의 집` for the House of Valor. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56402 | Uncertain | The isolated `Fae Champion of Valor` title does not settle whether Valor is a House affiliation, title, or another relation; locale renderings differ. |
| 56405 | Uncertain | Japanese explicitly describes completing a sewer race, while English and Chinese can describe running through a sewer. ID 56518 supports a named `Sewer Run` but does not prove this line's quest-log sense. |
| 56409 | Uncertain | `Hospitalis Quarters` has established competing institutional/location renderings; the short line does not resolve its canonical Korean form. |
| 56418 | Uncertain | English, Chinese, and Korean specify 25% Mana, while Japanese says 25% of maximum Mana. Preserve the current value pending mechanics/context confirmation. |
| 56423 | Uncertain | English capitalization and Japanese/Chinese describe Eamonn as the First Warsworn, but the Korean faction/title form is inconsistent with the established `워스워른(Warsworn)` usage. |
| 56450 | Uncertain | The five-paragraph report preserves its claims and paragraph structure, but `Scholia`, `Savant Engar`, `Shardfall`, and the competing origin theories need canonical-name and lore-context review. |

## Not an Issue

The remaining 40 IDs are 56401, 56403-56404, 56406-56408, 56410-56413,
56415-56417, 56419, 56421-56422, 56424-56425, 56427, and 56429-56449.
They preserve the evident meaning, voice, and structure for this pass.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56401-56450
  once in ascending order and share the full default key order.
- Logical line-break counts and normalized runtime-marker frame/order match
  throughout the range. ID 56450 retains eight line breaks, four blank
  separators, and five paragraphs; ID 56418 retains one line break.
- ID 56418 retains the 15% chance, 10 Poison Damage, five-second duration,
  and 25% cost value. The maximum-Mana qualifier differs in Japanese and
  remains uncertain.
- Rechecked the source-keyed historical notes for IDs 56350-56449 and
  56450-56549. The 56405 Sewer Run prompt, 56426 progress metaphor, and
  56450 Scholia/Savant/Shardfall questions remain open where context is
  insufficient. Historical questions are not accepted corrections.
- Pre-edit active CSV SHA-256:
  `1df89014fff45dd2484bc50157f47be409e969ba64dc15ad87c497ce647e7c43`.
  Post-edit active CSV SHA-256:
  `54558f9e0ff43277084861328d8d69bfc931d53f76f9c3032fbc564cacd9ad44`.
  Only the four accepted `Texto` cells above changed. UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56401/locatexts_zh_cn.koalocatext_default.csv`.

Decisions D-17019 through D-17022 authorize the four accepted corrections;
D-17023 through D-17028 record the six uncertain findings; D-17029 records
the remaining 40 `not an issue` IDs. Direct register totals: 1,657 accepted,
11,546 `not an issue`, and 10,515 uncertain (23,718 total); next D-17030.

Resume at `default` ID 56451; 8,684 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56451-56500-preliminary.md`](default-ids-56451-56500-preliminary.md).
