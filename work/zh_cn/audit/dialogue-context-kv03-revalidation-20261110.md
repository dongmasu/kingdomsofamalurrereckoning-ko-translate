# KV03 / Ost Ordura Context Revalidation

- Date: 2026-11-10.
- Scope: all 96 `default` keys associated with `467727.quest_bxml` (`KV03`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID KV03`, the asset-level symbol `NPC_OstOrdura`,
`PLAYER`, and 47 serialized `dialog_line_*` handlers. Its keys cover the
patrol with Ost Ordura, Brigand Hall Caverns, Niskaru, the Heart of Sibun,
the Fahrlangi, and Warsworn history and ranks. The localization keys are not
mapped to individual handlers, speakers, branches, or playback order; the
NPC symbol does not prove that every key is spoken by Ost.

All 96 keys are unique to this asset in the current index and were not already
present in the review ledger.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `13724` | meaning / naturalness | The current final clause, `이 모든 일의 근원이 무엇이든 그곳에서 막기 위해`, is difficult to parse and obscures `stop this at the source`. Prefer `오스트 오르두라(Ost Ordura)는 니스카루(Niskaru) 사태에 책임이 있는 바로 그 마법사들에게 살해당했다. 이제 나 혼자 브리건드 홀 동굴(Brigand Hall Caverns)로 더 들어가 그와 다른 동료들의 복수를 하고, 이 사태를 근원부터 막아야 한다.` | High |
| `30265` | naturalness / format | `이 동굴들` is an awkward rendering of `these caves`, and the English names `Nera Red-Hand` and `Garreth Rill` should be paired consistently. Prefer `몇 년 전에 내가 직접 네라 레드핸드(Nera Red-Hand)를 이 동굴에서 쫓아냈어. 그보다 전에는 타인 델프릭(Tine Delfric)이 개러스 릴(Garreth Rill)을 뒤쫓아 이곳에 들어왔지.` | High |
| `34866` | meaning / naturalness | `sworn to war, one of the Order` is rendered literally as `싸울 것을 맹세하고 그 조직`, which is vague and stiff. Prefer `너도 전쟁에 몸 바치기로 맹세하고 우리 결사의 일원이 될 거야! 그런 영예를 누리는 사람은 극히 드물지.` | High |
| `37889` | meaning / naturalness / speech level | The rank `Pledged of Shield` is already consistently rendered `서약방패병(Pledgeshield)`. The current literal `방패에 서약한 자이자 전쟁을 맹세한 자` loses that established rank, and `엄숙히 선언한다` shifts abruptly into `환영하네`. Prefer `네 용감한 행동에 보답하고자, 지금 너를 서약방패병(Pledgeshield)이자 전쟁에 맹세한 자로 엄숙히 선포하네. 우리 결사에 온 걸 환영하네, 병사. 크나큰 영광일세.` | High |
| `41289` | naturalness | `이 일을 끝까지 마치면` is redundant for `Come through this whole`; Japanese and Chinese support completing the undertaking before earning the rank. Prefer `이 일을 무사히 마치면 서약방패병(Pledgeshield) 계급에 오르게 해주지.` | Medium-high |
| `57037` | naturalness | `머리가 좀 이상한 위험한 무리` is an awkward combination for `a bad lot, not right in the head`. Prefer `죽음을 숭배하는 자들이야. 위험한 악당들이지. 제정신이 아니라 니스카루(Niskaru)를 소환하려 들 수도 있어. 하지만...` | Medium-high |

## Holds

No additional source-conflict or insufficient-evidence hold was identified in
this bounded pass. Proposed corrections remain unapplied.

## Coverage

All 96 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Six correction findings affect six IDs. The sole
exact-English duplicate group is IDs `54927` and `59818` (`What now?`); all
four locales use identical text in both rows. No embedded line breaks,
runtime markers, or markup were found.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
