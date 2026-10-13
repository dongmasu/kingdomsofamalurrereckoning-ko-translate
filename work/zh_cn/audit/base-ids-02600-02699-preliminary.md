# Preliminary Language Scan: `base` IDs 2600-2699

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 2600-2699.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked related item/name terminology where relevant.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2605 | 상급 보석 장식 곤봉 | Confirm the exact weapon category for `Shilelagh` and note the source spelling. | English misspells `Shillelagh`; Japanese calls it a staff and Chinese appears to read it as a shield, while it is a club/weapon name. Korean `곤봉` is plausible; align with the related `Shillelagh` item at ID 2322 after checking the inventory model. | Medium |
| 2610 | 서리 얼음석 | Recheck the redundant `Frost` + `Stone` wording and choose a natural material label without dropping the source distinction. | English says `Frost Stone`; Japanese compounds frost/ice and Chinese says frost stone. Korean `서리 얼음석` repeats the cold/ice sense and reads awkwardly. | Medium |
| 2609 | 콜로세(Kollossae)의 연도문 | Confirm the official Korean form of `Kollossae` before normalizing this and related entries. | English names the Kollossae; Japanese and Chinese use different phonetic renderings. Korean uses `콜로세`, while other corpus instances should be compared as a family. | Low |
| 2645 | 그림자 대장간의 트로카(Troca) | Recheck the apposition/title relationship in `Troca, the Shadow Forge`. | English's comma apposes `the Shadow Forge` to Troca; Japanese reads “Troca, the shadow smith.” Korean `그림자 대장간의 트로카` instead makes Troca sound like someone belonging to a forge. A title-like rendering may be intended, but retain the exact lore role as a candidate pending context. | High |
| 2680 | 파괴의 보석 | Confirm whether `Saboteur` is a named role/title or whether the current generic `파괴` is too broad. | English and Japanese name a saboteur; Chinese also refers to a saboteur. Korean `파괴의 보석` preserves destruction but removes the agent/role sense. | Medium |

## Other Checks

- IDs 2602 and 2619 identify `Scholia Arcana` as `아르카나 학회`; ID 2619's
  standalone organization name matches the longer form at ID 2602.
- ID 2604 preserves `Armored String` as a bow-crafting component; inspect
  assembled item/category context before changing the component term.
- ID 2620 `Detect Hidden Bonus Wealth` is a compressed mechanic label; the
  Korean wording is plausible but should be checked against the game's bonus
  loot/hidden-object behavior.
- ID 2630 `House Wyvyrn-Girfe` differs in spelling from `Wyvyrn-Gifre` in
  related source rows; retain the source-key spelling until the family name
  is confirmed.
- IDs 2657 and 2665 preserve the sceptre description and journal day number.
  The remaining inspected rows preserve their principal English meaning.

## Batch Status

IDs 2600-2699 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
