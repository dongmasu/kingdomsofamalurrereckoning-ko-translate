# Disposition Batch: `default` IDs 35851-35900

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, and source-keyed
  historical notes.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: two accepted, two `not an issue`, and seven uncertain.
- CSV changes: IDs 35866 and 35869 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35852-35853 | Hex / Leggings of Last Breath | Uncertain: Korean follows English/Japanese for Hex while Chinese says six; the winning-hand context does not establish the intended card/rank convention. The Last Breath equipment name is understandable, but set-name consistency remains open. |
| 35857-35858 | Private Lemalan / siblings `are lost` | Uncertain: the epitaph's fallen enemies, Lemalan's rank, and the lives she saved are retained. `They are lost` can indicate death, disappearance, or being missing; Korean preserves the missing/unknown-location reading, but references and the source do not settle the lore. |
| 35864-35865 | Maun's hoard / Eathe / Belen's Testament | Uncertain: the triple key, death, revenge, inability to help poison the cistern, and Testament are retained. The locales differ on Maun's hoard/treasure and the faction/institution form; no row-local terminology decision is safe. |
| 35866 | Copper tracings in protective fabric | Accepted: English says small copper tracings are woven through the fabric; Chinese specifies thin copper wire, and Japanese supports woven copper. Korean `작은 구리 조각` implies separate pieces rather than woven strands. Change to `천 곳곳에 가는 구리 선이 엮여 있다`; the protection effect remains unchanged. |
| 35869 | Walls that have lost their charm | Accepted: English, Japanese, and Chinese say the walls no longer have charm. Korean `더는 ... 잃었어` combines “no longer” with “lost” and can imply the opposite. Change to `하지만 이곳에 너무 오래 머문 탓에, 이 벽도 이제 매력을 잃었어. 이제 내게는 그저 감옥의 창살일 뿐이야.` |
| 35870, 35872 | Labor auction / St. Eadric's Mission | Uncertain: English says labor auction while Japanese specifies slave auction; Korean does not add slavery without English support. Mission is rendered as a mission station, while Japanese says monastery and Chinese a preaching station. Both context questions remain open. |
| 35874-35875 | Body specimens / Bloodbane | Uncertain: requested body parts and contained blood/sputum are retained. Bloodbane is clearly a named creature, but its canonical Korean spelling varies and the row does not establish it. |
| 35889-35890 | Octienne/Ventrinio evidence / House of Ballads and Telling | Uncertain: the collected records and their supporting role, approaching mortals, and the Telling's norm are retained. Formal institution, person, faction, and tradition spellings need corpus-level alignment. |
| 35897 | `a mess in the back` / `뒷일은 엉망진창` | Uncertain: English is elliptical; Chinese points to a rear area and Japanese to rear-duty service. Korean `뒷일` may instead mean later consequences. Without scene context, do not choose among them. |
| 35900 | `black power` / `흑색 화약` | Not an issue: although English likely has a source typo for `powder`, the sentence describes unrefined, highly flammable material used in Kobold explosives; Japanese and Chinese independently identify gunpowder/black powder. Korean's meaning is supported. |
| Remaining ordinary text in IDs 35851-35900 | Dialogue, objectives, labels, and values | Not an issue: the other 34 IDs were checked across all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed entry covering IDs 35800-35999 records questions at
  35947, 35953, 35979, and 35990 only. No row-specific historical finding
  exists for 35851-35900; absence was not treated as approval.
- Existing accepted lockpick decisions were not broadened to unrelated terms.
  The copper-strand and wall-polarity corrections are supported by the
  current English/Japanese/Chinese rows.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 35851-35900
  once in identical order.
- No embedded line-break or runtime-marker mismatch was found.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `6ab337d90ab7647af0b06999f9ab358fb80b17e8a35aab775701d2be22cadfc9`.
- The pre-existing checkpoint-hash discrepancy remains unresolved; it was
  not used to revert or rewrite unrelated rows.
- These are working dispositions, not independent final linguistic
  approval.

## Checkpoint

Disposition is complete through ID 35900. Resume at ID 35901; 29,234
`default` IDs remain through ID 65134. The next unused decision ID is
D-11597. Preliminary scan:
`default-ids-35901-35950-preliminary.md`.
