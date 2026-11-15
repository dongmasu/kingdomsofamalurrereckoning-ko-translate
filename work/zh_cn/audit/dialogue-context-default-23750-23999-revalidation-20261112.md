# Sequential `default` Revalidation: IDs `23750`-`23999`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese, including existing findings, terminology decisions, register, and
  layout.
- Rechecked 72 existing ledger records and added 178 previously unrecorded
  IDs. Fifteen new correction-candidate IDs were recorded. Five prior
  candidates were retained with updated evidence and two were cleared.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `23758` | Format | The Korean song has ten logical line breaks, matching English; Japanese has 17 and Chinese 14. Review the stanza/line layout against the Japanese-derived poem template before editing, without changing the verse sequence or inventing a new stanza structure. | Medium |
| `23800` | Format | This poem also has ten Korean line breaks matching English, versus 17 in Japanese and 14 in Chinese. Review its line layout against the Japanese-derived template; preserve all images and the closing contrast between past song and present heartbeat. | Medium |
| `23826` | Format / title pairing | The title `Leaky Faucets` is rendered as `새는 수도꼭지` without the English pairing. If this is the displayed quest/title label, consider `새는 수도꼭지(Leaky Faucets)`. | Medium |
| `23833` | Naturalness / terminology | `테스타먼트가 아무리 위대한 사람도 어떻게 타락시키는지 일깨워 줄 거야` is awkward and leaves the reminder construction incomplete. Consider a complete clause such as `테스타먼트(The Testament)가 아무리 위대한 사람도 타락시킬 수 있다는 걸 일깨워 줄 거야`, preserving the brother's pre-fall memory and the corruption warning. | High |
| `23854` | Naturalness / meaning | `두들겨 맞고 해진 일지` reads as if the journal itself was beaten. English `beaten and battered` describes a battered, worn journal. Consider `거의 알아볼 수 없을 만큼 너덜너덜해진 일지`. | High |
| `23906` | Meaning / format | The Korean ending `2초 동안` can attach to both damage types. Japanese places the duration with Freezing Damage. Clarify the intended mechanic as 30 Ice Damage plus 4 Freezing Damage over two seconds, without changing values or cost. | Medium-high |
| `23907` | Format / localization | `[DO NOT USE]` remains English in Korean, while Japanese and Chinese localize the warning. Consider `[사용 금지]`, preserving `최소 체력` and the bracket format. | Medium-high |
| `23910` | Format / item-name pairing | `Flawless Mitharan Clairty Bindings` is paired only at `Mitharan`; the remainder of the item label is not. Consider pairing the full source label, e.g. `완벽한 미타란 명료의 결속구(Flawless Mitharan Clairty Bindings)`. The English source spells `Clairty`; do not silently repair that source typo as part of the Korean edit. | High |
| `23921` | Terminology / name pairing | The creature label `Giant Rat` is rendered `거대 쥐` without its English name. If this is the enemy-type label, consider `거대 쥐(Giant Rat)` to make the type traceable. | Medium |
| `23930` | Format / localized marker payload | The three `{*1jump}` payloads remain English in Korean, while Japanese and Chinese localize them. Translate the marker contents using the established Korean jump/action label while preserving wrappers, sequence, `{1}`, and the line structure. | High |
| `23932` | Meaning / naturalness | `미치광이 덴릭(Denric the Crazed)의 기개를 본받아` can make `in the spirit of` sound like admiration for his courage. The line means exploring in the manner or adventurous spirit of Denric. Consider `미치광이 덴릭(Denric the Crazed)처럼 이 땅을 탐험하려 했는데`. | Medium-high |
| `23938` | Format / title pairing | The capitalized character/title label `The Gardener` is rendered only as `정원사`. Consider `정원사(The Gardener)` if this is the displayed named-character label. | Medium |
| `23942` | Meaning / reference | In `명예와 자신의 이름을 위해 싸우는지`, `자신의 이름` can refer to the wearer, although English specifies fighting in Thyrdon's name. Consider explicitly naming the deity: `명예를 지키며 사이르돈(Thyrdon)의 이름으로 싸우는지를 중히 여길 뿐이다.` Preserve the contrast that the god does not care whom the wearer fights. | High |
| `23986` | Meaning / naturalness | `머리 장식` suggests an ornament, but English `headwear`, Japanese `頭衣`, and Chinese `帽子` describe simple merchant headwear. Consider `여행 상인이 쓰는 소박한 모자`. | High |
| `23993` | Format / localized marker payload | The `{*1slot}` and `{*1abilities}` payloads remain English in Korean, while Japanese and Chinese localize them. Translate the payload contents using established Korean UI terms and preserve wrappers, button placeholders, `{LINE_SPACE}`, and their order. Also verify that the Korean sentence describes assigning abilities to buttons, not assigning them “to a slot.” | High |

## Rechecked Findings And Structure

- Existing candidate `23790` remains open for terminology consistency. In this
  quest, `the tome` refers to the previously identified Ordination Tome;
  consider the established `서품서(Ordination Tome)` rather than generic
  `고서`.
- Existing candidate `23851` remains open for meaning. Japanese clarifies
  “the one the Hierophant can't see” as someone the Hierophant cannot foresee.
  Korean `알아차리지 못하는 사람` may instead mean unnoticed physical
  presence. Do not infer a named ability.
- Existing candidates `23855` and `23898` remain open. `hollow` here is a
  Fae location type, not a physical depression; the established Lorestone
  term is `로어스톤(Lorestone)`.
- Existing candidate `23957` remains open: Korean omits the opening
  `What is this...` reaction and reverses the source's question/reaction
  progression.
- Existing candidate `23919` is cleared because the previously proposed
  shared-source wording `누군가 이 도시를 장악할 계획을 세우고 있어` is
  already present.
- Existing candidate `23959` is cleared. `하지만 누가 신경 써?` is a
  natural dismissive rhetorical question and retains the following reason
  that they want the book; the alternative `그게 무슨 상관이야?` is optional
  style, not a supported correction.
- The range touches 63 exact-English duplicate groups (873 corpus rows).
  Korean matches within every group except `Templar` (`23891`, `48712`).
  The Japanese entries differ (`Templar` / `聖堂騎士`) and the earlier
  context review found the isolated `Templar` label acceptable; preserve the
  source-supported Korean variation rather than mechanically normalizing it.
- ID `23785` preserves the 5-meter range, all attack counts, 5/35/10 damage
  values, five-second duration, and 7/10 Mana costs. ID `23800`'s Korean
  poem follows the English line breaks; the language-specific differences
  are recorded above rather than treated as missing text.
- The format checker found line-break differences at `23758` and `23800`.
  Runtime-marker structure otherwise matches English/Korean/Chinese at
  `23930` and `23993`; Japanese reorders localized marker content at
  `23930`. The untranslated Korean marker payloads are separate findings
  from wrapper integrity.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order.

After recording this range, the ledger contains 34,744 of 65,135 IDs
(53.34%), leaving 30,391. Sequential coverage reaches ID `23999`; the next
range is `24000`-`24249`.
