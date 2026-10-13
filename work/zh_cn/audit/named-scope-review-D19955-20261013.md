# Consolidated Context Review D-19955

2026-10-13. Reviewed all 50 active `default` IDs 44001-44050 against
English, Japanese, Chinese, active Korean, exact-key history, and the
official Korean manual. English anchored meaning; Japanese informed
voice/register; Chinese was supporting evidence. No PAK material was used.

| ID | Result | English-led evidence |
| ---: | --- | --- |
| 44002 | Not an issue; supersedes D-13528 | `Crazy old wizard` is a dismissive, colloquial description; `괴팍한 늙은 마법사` preserves the eccentric/disparaging tone without asserting a clinical meaning. Japanese `おかしな` supports this register. |
| 44006 | Earlier terminal D-19504 verified, not recounted | `숙련자` is already the established rendering for the Adept title at this exact key. |
| 44010 | Uncertain; retain D-13530 | The isolated `Armor` label still does not distinguish the equipment category from the defensive stat; no broader UI context resolves it. |
| 44016 | Not an issue; supersedes D-13532 | Official manual PDF p. 1 gives Varani as `바라니`; established source-paired usage gives Erathell as `에라셀`. The unmarked barrow, shield origin, and good/bad-luck balance are all retained. |
| 44017 | Uncertain; retain D-13533 | `TEMP` and `Pride and Sorrow return` remain provisional; this row does not establish whether the placeholder or either title is player-facing/canonical. |
| 44019 | Accepted | English names the `Dispelling` skill. Official manual PDF p. 4 labels it `디스펠`; accepted D-19722 uses `디스펠 기술`. Preserve the exact nested `{*2{1}}` marker. |
| 44024 | Accepted | The same `Pall of St. Eadric` is identified at English ID 81 as resting in a sarcophagus; active Korean ID 81 calls it `관 덮개`, and D-19834 applied that evidence at ID 35937. Replace only `수의` with `관 덮개`; retain both theft objectives and the existing Mission/place wording. |
| 44027 | Earlier D-13542 `not an issue` verified, not recounted | English `Characters Pickpocketed` and Japanese `スリをした相手` identify characters who were pickpocketed, matching Korean `소매치기당한 캐릭터들`; the passive target meaning is not reversed. |
| 44028-44039 | Earlier D-13542 `not an issue` verified, not recounted | Active cells preserve the English dialogue, names, objective, and UI meaning; no new row-local defect was found. |
| 44040 | Uncertain; retain D-13538 | The three-line poem and land/citadel images remain, but the antecedent of `they` and relation of `Once pure` to the land/people remain materially ambiguous. |
| 44043, 44048 | Earlier accepted D-13539/D-13540 verified, not recounted | The active cells already use `스스로 해방자라고 자처하지만` and the established fate-lore term `운명의 태피스트리`. |
| 44049 | Not an issue; supersedes D-13541 | `폐허에서` preserves the source's place of emergence without forcing a possessive interpretation of `their ruin`; `쏟아져 나왔다` retains the sudden, forceful emergence. |
| Remaining IDs | Earlier D-13527/D-13531/D-13535-D-13536/D-13542 terminal keys checked, not recounted | Existing accepted corrections and source-faithful ordinary rows remain active. In particular, 44001 already says `그들을 보고`, and 44011 already uses the non-royal `주군`. |

The three material questions at 44010, 44017, and 44040 remain uncertain
after focused review. Exact-key decisions already terminal under D-19504
and D-13527/D-13531/D-13535-D-13542 were verified against active cells and
not recounted. No global category total is asserted.

Two `Texto` cells changed: 44019 and 44024. All 50 IDs align in English,
Japanese, Chinese, and Korean. The active Korean file retains its UTF-8
BOM, 72,011 CRLF endings, 73 pre-existing bare-LF endings, and all 65,135
ordered IDs. Inverse reconstruction verified every byte outside the two
target `Texto` cells.

Pre-edit SHA-256:
`b960af5b3f93605c123aba9a3057d55656cffc03ecc22b01ff9acfdf23b983cd`
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19955/locatexts_zh_cn.koalocatext_default.csv`
Post-edit SHA-256:
`e50ea58d3d4f6a72f99cdc8e73660c3a87c71cbce7068c364a0a598bdd5fbfa5`

D-19955 is complete. Default review remains incomplete. Resume D-19956 /
IDs 44051-44100; 21,084 actual rows remain through ID 65134.
