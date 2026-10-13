# Consolidated Context Review: `default` IDs 23301-23350

- Review date: 2026-10-11.
- Scope: the thirteen keys previously marked uncertain in IDs 23301-23350,
  checked by exact ID across English, Japanese source, Japanese-derived
  Korean, Chinese, active Korean, and accepted terminology.
- Result: all thirteen resolved (five accepted edits, eight `not an issue`);
  no uncertainty remains from this batch.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18603 | 23304 | Fae Adar / Tirin's Rest / Galafor Plain | not an issue | Imprisonment, release, and travel on Galafor Plain's verdant paths are preserved. Korean retains `Adar`, Tirin's Rest, and Galafor Plain in source-traceable forms. |
| D-18604 | 23308 | Archsage / Scholia Arcana | accepted | Add exact English spellings to the Korean transliterations: `숄리아 아르카나(Scholia Arcana)` and `대현자(Archsage)`. The command to make way and the setting's established Korean terms remain. |
| D-18605 | 23311 | deferential subordinate address | not an issue | Korean retains the subordinate's self-deprecation, gratitude that the addressee spoke with them, and the source's hesitant pause. |
| D-18606 | 23312 | Jottun / herald of the Hero | not an issue | The exclamation and question about the Jottun, identified as the Hero's herald, match English, Japanese, and Chinese. Korean does not need to decide whether Jottun is a species or title to preserve the phrase. |
| D-18607 | 23313 | Soulbind | not an issue | Korean `영혼 결속` directly translates Soulbind. The source locales also leave the term unexplained; skill/status/UI classification is not needed to establish this label's meaning. |
| D-18608 | 23320 | people's flaws / raised Hyperian | accepted | Pair `하이페리온` with the exact source spelling `Hyperian`. The English-led claim about saving the people from their flaws and raising the Hyperian remains intact; Japanese is a source-locale divergence. |
| D-18609 | 23323 | Maid of Windemere / Court of Enchantments | not an issue | Entry into Windemere Castle, finding the Maid, and demanding the release of Wencen and the Court members are all preserved. Korean pairs both names with English; locale differences on `Maid` do not show a row-level error. |
| D-18610 | 23330 | Hierophant / hideaway beneath Sun Camp | accepted | Pair the unresolved office rendering with `Hierophant`. Korean preserves the singular gender-neutral subject, the hideaway, and its location below Sun Camp. |
| D-18611 | 23334 | Docent / Anker Edmure | accepted | Replace `도슨트` with `강사`, reusing the instructional Docent term accepted at IDs 22699 and 23131 (D-18475/D-18557). Chinese's `讲师` supports this role; the meeting objective remains unchanged. |
| D-18612 | 23345 | Shieldring Keep / pledge your sword | not an issue | The direct destination, pledge of service, possible success, and the speaker's weighty commendation are all retained. The bilingual place-name preserves traceability. |
| D-18613 | 23346 | Ballads Library | not an issue | Korean directly translates the English label as `발라드 도서관`. The Japanese adds a House of Ballads reference, but English and Chinese do not require that extra institutional scope. |
| D-18614 | 23349 | gutters / spire-side / climber | not an issue | The climber's knowledge of gutters and the spire-side, gull comparison, and repeated grief are retained. Korean's path reading is compatible with the architectural wording and does not alter the event. |
| D-18615 | 23350 | Open Contracts | accepted | Change `공개 계약` to `수락 가능한 계약`. English `Open Contracts` and Japanese `受けられる依頼` indicate contracts available to accept, not contracts made public; Chinese also supports an open/available state. |

## Edits and Verification

Only active Korean `Texto` values at IDs 23308, 23320, 23330, 23334, and
23350 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23308 | `숄리아 아르카나의 대현자께서 지나가신다. 길을 비켜라.` | `숄리아 아르카나(Scholia Arcana)의 대현자(Archsage)께서 지나가신다. 길을 비켜라.` |
| 23320 | `네가 우리 백성을 그들의 결함에서 구해 냈어. 하이페리온을 들어 올려 줬고, 고맙네.` | `네가 우리 백성을 그들의 결함에서 구해 냈어. 하이페리온(Hyperian)을 들어 올려 줬고, 고맙네.` |
| 23330 | `히에로판트가 선 캠프(Sun Camp) 아래에 자기만의 은신처를 마련한 것 같아.` | `히에로판트(Hierophant)가 선 캠프(Sun Camp) 아래에 자기만의 은신처를 마련한 것 같아.` |
| 23334 | `도슨트로서 첫 임무는 서쪽으로 가서 앵커 에드뮤어(Anker Edmure)라는 남자를 만나는 것이다.` | `강사(Docent)로서 첫 임무는 서쪽으로 가서 앵커 에드뮤어(Anker Edmure)라는 남자를 만나는 것이다.` |
| 23350 | `공개 계약` | `수락 가능한 계약` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23308-23320-23330-23334-23350-D18604-D18615/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`f96ba8454db8767b67b9b2c95ec23e31fbca7835fa7b3e091d1a39298fb6b317`.
Post-edit SHA-256:
`cc899e2958feb37c44a2c45fb550a83f95b7ea303bee11307b2a1d54b53a9a4f`.
Physical-line comparison against the backup confirms only the five listed
IDs changed. The UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and
73 pre-existing bare-LF endings are preserved. All five source/draft/active
files have the same complete ID order; the three runtime wrappers at ID
23331 and their order remain unchanged.

D-18603-D-18615 resolves thirteen keys: five accepted and eight `not an
issue`. Totals are 2,053 accepted, 23,508 `not an issue`, and 12,963
uncertain (38,524 counted). Next D-18616 at `default` ID 23351. The earlier
working dispositions are reconciled in
[`disposition-batch-default-23301-23350-20261010.md`](disposition-batch-default-23301-23350-20261010.md).
