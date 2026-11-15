# SQ41 / Adar and the Tirin's Rest Prisoner Revalidation

- Date: 2026-11-11.
- Scope: all 108 `default` IDs linked to `1241289.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Sixteen correction-candidate IDs and six evidence-limited IDs across three
  hold groups are recorded. The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `SQ41`, three NPC symbols
(`NPC_POE_LJO_AurelaCorelon`, `NPC_POE_SEE_Korae`, and
`NPC_POE_VAR_FreynoldKorrast`), 45 serialized dialogue handlers, and 108
matched localization IDs. Its content concerns Adar, the prisoner in Burren
Cove, the magic circle, and the people of Tirin's Rest. The multi-NPC asset
does not map any individual key to a speaker, callback, dialogue branch, or
playback order. Per-key speaker attribution remains unassigned and playback
order unknown.

All 108 rows were compared across English, Japanese, Chinese, and active
Korean. Repeated source groups have matching Korean when the English,
Japanese, and Chinese sources are identical. No row contains an embedded
line break, runtime variable, or markup token. None of these IDs is already
recorded through another asset in the review ledger.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `21085` | Naturalness | `let slip` is rendered `실수로 입을 흘렸다`, an unnatural Korean collocation. Consider `죄수가 있다는 말을 무심코 흘렸다` or an equivalent natural phrasing. | High |
| `11617`, `28093`, `46686`, `51698`, `56642` | Terminology | These rows refer to Adar's binding magic circle but use `원`; the same asset uses `마법진` at `16609`, `27811`, `52150`, and `61908`, and Japanese explicitly uses `魔法陣` in related lines. Use `마법진` consistently where the context is the prison spell. | High |
| `27930`, `33795`, `36268`, `40766` | Terminology / naturalness | The phrase that breaks or releases Adar's circle varies among `마법의 문구`, `마법의 말`, and `암구호`. Japanese uses `魔法の呪文` for `27930` and `呪文` for the phrase in `36268`; nearby rows `5853`, `40052`, `61439`, and `61908` use `주문`. Align these same-quest references with `주문`, while retaining each row's sentence structure. | High |
| `33102`, `45341` | Name / format | Both English sources say `Nil the White`; Korean omits the English pairing, and `33102` also has the inconsistent form `흰 니르`. Match the established `백색의 닐(Nil the White)` form used at `1986` and `56763`. | High |
| `11829` | Meaning / syntax | The English stammers and breaks off at “of ‒ of ‒”; Korean introduces `그런 일로`, which supplies a referent absent from the source. Preserve the interruption without completing the accusation. | Medium |
| `27577` | Naturalness | `상처투성이 생각을 횡설수설 늘어놓으며` is difficult to parse in Korean. Recast the image naturally while retaining the speaker's wounded, rambling, boastful manner; the exact metaphor remains open. | Medium |
| `46403` | Terminology | The dialogue topic `Oracles` is translated `예언자들`, but the related spoken line `beg me for oracles` is rendered `신탁을 구걸하러`. Check whether this label names the requested prophecy (`신탁`) rather than the people who deliver it. | Medium |
| `49271` | Meaning | `I wish to see the enemy` is translated `적을 만나고 싶다`; English and Japanese both say to see the enemy, not necessarily meet them. Consider `적을 보고 싶다` unless the quest context establishes an encounter. | Medium |

The exact phrase `Gate Key` at `61002` is also used at `50977`, and both are
currently `관문 열쇠`; this pass records the consistency and does not propose
an isolated change.

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `10975`, `46595` | Speech level | Korean uses `자네` / `-게` and `-하게`, while Japanese is conversational. The asset has three NPC symbols but no key-to-speaker mapping; retain pending direct speaker or scene-stage evidence. |
| `36268`, `40052`, `62650` | Meaning / location | English says Adar is “behind the jail” in Burren Cove; Japanese and Chinese generally place him in the jail. Korean follows English. Do not change the location wording without confirming the map or intended meaning. |
| `57390` | Name / source conflict | English and Chinese say `Aurela`, while Japanese says `Corelon`; Korean follows English. The asset's `NPC_POE_LJO_AurelaCorelon` symbol is an asset-level compound identifier, not proof that the row's wording should be changed. Retain and record the source discrepancy. |

## Cross-Asset Terminology Check

The global `default` table also has `Learned magic words` at ID `13682`,
currently `마법의 단어를 배웠다`; it is not linked to this asset and is not
included in this report's ledger rows. `Gate Key` at ID `50977` is the
in-asset comparator noted above. The distinct terms `Dustling` and `Child of
Dust` were kept separate rather than treated as interchangeable.

## Complete Reviewed ID Set

`1986`, `2699`, `3006`, `3900`, `5853`, `7617`, `8058`, `8351`, `8958`,
`9119`, `9351`, `9470`, `10975`, `11241`, `11617`, `11829`, `11919`,
`12100`, `12117`, `13192`, `14794`, `15044`, `15643`, `15689`, `15701`,
`15914`, `16528`, `16609`, `17702`, `18049`, `18378`, `18981`, `19414`,
`19663`, `20747`, `21085`, `22584`, `22680`, `23090`, `23304`, `23729`,
`27494`, `27577`, `27811`, `27903`, `27930`, `28093`, `29977`, `31002`,
`31609`, `31957`, `32145`, `32854`, `33102`, `33396`, `33578`, `33778`,
`33795`, `35672`, `36268`, `36439`, `36482`, `37933`, `38090`, `38171`,
`38208`, `40052`, `40766`, `42153`, `43318`, `44942`, `45195`, `45341`,
`45460`, `45770`, `46403`, `46595`, `46686`, `48461`, `49271`, `49340`,
`50500`, `51221`, `51698`, `52150`, `52688`, `53374`, `56429`, `56430`,
`56585`, `56642`, `56763`, `57390`, `57673`, `58305`, `59060`, `60566`,
`61002`, `61439`, `61730`, `61908`, `62541`, `62650`, `62987`, `63018`,
`63089`, `64053`, `65122`.

All 108 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
