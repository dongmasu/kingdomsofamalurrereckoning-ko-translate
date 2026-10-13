# Default Scope Review D-19893 (50 IDs)

2026-10-13. Reviewed all 50 active default IDs 40901-40950 against the
English source, Japanese voice/register, Chinese supporting text, active
Korean, the official Korean manual reference, established terminology, and
applicable terminal decisions. English anchored meaning. Source CSVs were
read-only; no PAK or PAK-derived material was used.

| ID | Disposition | Evidence |
| ---: | --- | --- |
| 40902 | Accepted; resolves the Vraekor portion of D-12870 | The official Korean manual (PDF p. 2) establishes `Vraekor = 브래코르`; correct the inconsistent `브레이코르`. The relics, ashes, Lachlan's boast, and warning remain unchanged. |
| 40913, 40937, 40945 | Earlier terminal accepted D-12867/D-12868/D-12869 verified, not recounted | The active cells already use accepted `부름받은 자여`, `스콜리아 아르카나(Scholia Arcana)`, and the idiomatic `쓸데없는 말은 그만하고` correction. |
| 40917 | Earlier terminal D-19624 `not an issue` verified, not recounted | The active `스캐브` correctly preserves the source Scav creature in the kidnapping condition. |
| 40919 | Accepted; resolves the blade-master portion of D-12871 | English and Japanese identify the highest-ranked sword/blade master; Chinese also describes a senior sword fighter. Replace instructor-like `검술 사범` with the accepted, source-faithful `검술 대가` (compare D-6948); preserve the Alfar rank and Balor claim. |
| 40922 | Uncertain; retain D-12872 | The compact verse's `quarry` can mean prey/target or a quarry/mineral source, as reflected by the differing locale readings. Korean's `사냥감` is plausible, but the source does not resolve the image. |
| 40923 | Uncertain; retain D-12871 | `Knave of Pride` may be a named person/title, a House of Pride retainer, or a card-rank-style epithet. `오만의 잭` preserves a traceable title-like form, but the row alone does not settle its category. |
| 40935 | Not an issue; resolve this part of D-12872 | Korean preserves English `hollow gods` as `공허한 신들`; Japanese omission does not establish an error against the English anchor. |
| 40908, 40915, 40927, 40939, 40948-40949 | Not an issue; resolve the applicable D-12871 questions | `Quality Assurance` is translated as a role/label; `Collect the contract` as receiving the contract document; `Font` is explained in English as a fountainhead/source and Korean uses `샘`; `Gallows' Bloom` remains the established `교수대의 꽃`; and the ability/name prompts are directly represented. No unsupported UI or lore expansion is needed. |
| 40914, 40932-40934, 40938, 40940, 40943, 40947 | Not an issue | Tilera is consistent as `틸레라`; Quay, Ansilla, Cydan, Rathir, Skoria, and Skycrown remain identifiable source names. Locale transliteration variants alone do not establish row-local errors. |
| 40901, 40903-40907, 40909-40912, 40916, 40918, 40920-40921, 40924-40926, 40928-40931, 40936, 40941-40942, 40944, 40946, 40950 | Not an issue | Dialogue, DLC instruction, scone joke, quest/objective text, prisoner count, narrative, and the contextual physical case preserve the English-led meaning. No structure, runtime-marker, or numeric discrepancy was found. |

Two target `Texto` cells were edited. Pre-edit SHA-256
`d0a1e53b6f5a3f85ccdca7f8127972d0f6dc938a2329fb669b92f566a80151b9`;
byte-identical backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19893/locatexts_zh_cn.koalocatext_default.csv`;
post-edit SHA-256
`bcc14cb244505cfa700aa79043fb2487e3758d5586799d097dbd111d1d55ceee`.
The guarded edit script's inverse reconstruction matched the pre-edit file
byte-for-byte. UTF-8 BOM, 72,011 CRLF / 73 bare LF endings, all 65,135
ordered IDs, and four-locale scope alignment were preserved.

Last reviewed ID 40950; next D-19894 / IDs 40951-41000. There are 24,184
actual default rows through ID 65134 remaining. Review remains incomplete.
