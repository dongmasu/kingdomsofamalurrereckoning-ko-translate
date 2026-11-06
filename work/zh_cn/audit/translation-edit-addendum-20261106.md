# Translation Edit Addendum - 2026-11-06

## Outfit and Apparel labels

- Checked `default:7718` (`Outfit`) and `default:43004` (`Apparel`) against all available English, Japanese, Chinese, German, French, Spanish, Italian, and Russian rows. The Korean source labels are both `의상`.
- The locale references generally indicate clothing or attire: Japanese uses `服装` for `Outfit`, Chinese uses `套装`/`衣服`, and German, French, Italian, and Russian use clothing/attire terms. Japanese alone renders `Apparel` as `アーマー`; this conflicts with English and most other locales.
- The official game manual lists Armor as its own inventory category. Neither English label explicitly says Armor, so the evidence supports clothing/attire rather than specifically protective armor.
- Retained `의상` for both short labels: it is a natural broad rendering here, and the isolated strings do not establish separate UI categories that require distinct Korean terms.

## Weapon and armor terminology

- Applied the approved weapon-class terms throughout source-matched `default` rows: `Longsword` → `장검`, `Greatsword` → `대검`, `Dagger` → `단검`, `Hammer` → `망치`, `Greathammer` → `대형 망치`, `Longbow` → `장궁`, `Staff` → `지팡이`, and `Chakram` → `차크람`.
- Applied the approved exceptions `Sceptre` → `셉터` and `Faeblade(s)` → `페이블레이드` in `base` and `default`, including item labels, equipment descriptions, weapon skills, and class lists. Excluded the poetic/metaphorical `scepter` at `default:138` and `56581`, and unrelated text such as `홀더`.
- Standardized source-matched `Leggings` to `레깅스` (3 `base` and 10 `default` records) and `Circlet` to `서클릿` (1 `base` and 5 `default` records). The armor-type list is `Helm` → `투구`, `Circlet` → `서클릿`, `Cuirass` → `흉갑`, `Robe` → `로브`, `Gauntlets` → `건틀릿`, `Leggings` → `레깅스`, `Greaves` → `정강이 보호구`, `Chausses` → `각반`, and `Boots` → `장화`.
- A full source-ID cross-check found and corrected residual `Greaves`/`Chausses` mix-ups at `base:1338:11` and `base:48:11`, plus 11 `default` Greaves rows (`15644`, `18108`, `18610`, `19505`, `22509`, `22717`, `33532`, `45642`, `51922`, `64029`, and `64884`). Greaves and Chausses remain distinct terms; Boots were not changed.
- Corrected particles affected by the terminology changes and standardized `Greathammer` as `대형 망치`, without changing unrelated occurrences of similar Korean words.
- Verified edited rows against English IDs and variants. The `base` record IDs and line-ending counts and the `default` record IDs and mixed line-ending counts were unchanged; `base` parsed successfully and all four line-ending-preservation tests passed.

## Bolgans' Bane equipment labels

- Compared `base` IDs `810`, `989`, `4259`, and `4364` with the English, Japanese, and Chinese source rows. Each source names a specific equipment label in variant `11`.
- Added the complete English equipment names in parentheses: `Cuirass of Bolgans' Bane`, `Greaves of Bolgans' Bane`, `Gauntlets of Bolgans' Bane`, and `Chausses of Bolgans' Bane`.
- Preserved the existing Korean wording. The English labels identify the source items and do not resolve the Korean possessive or meaning of `Bolgans' Bane`.
- Verified the four IDs against the English CSV, confirmed all 4,845 parsed `base` records remain present, and passed all four line-ending-preservation tests.

## Remnant equipment series

- Compared the five `base` armor labels (`1261`, `1444`, `1900`, `3202`, and `4045`) with the English source. Added the four missing names: `Remnant Greaves`, `Remnant Chausses`, `Remnant Cuirass`, and `Remnant Gauntlets`; the existing `Remnant Helm` label at `3202` was retained.
- Also added `Remnant Plate` to `default:58448`, a matching standalone equipment label in the same set.
- Preserved the existing Korean wording and row variants.
- Verified all five `base` labels against the English CSV and confirmed the 4,845 parsed `base` records remain present. Confirmed the `default:58448` label against its English source; all four line-ending-preservation tests passed.

## Kukui Tree

- Compared `base:34:11` across English (`Kukui Tree`), Japanese (`ククイノキ`), Chinese (`库库伊树`), and Korean.
- Hawaiʻi DLNR identifies kukui as the Hawaiian name and candle-nut tree as the common name; Kew's Plants of the World Online lists kukui among the common names of `Aleurites moluccanus`. This is a plant species' common name, not a unique person or place name. Sources checked 2026-11-06.
- Added the exact English source label, `Kukui Tree`, to the Korean row. No other English `Kukui` occurrence was found in the source CSVs.
- Verified `base:34:11` against English, confirmed all 4,845 parsed `base` records remain present, and passed all four line-ending-preservation tests.

## Warding Lining component

- Compared `base:38:11` with English `Master Warding Lining`, Japanese `マスター・ワーディングライニング`, and Chinese `大师封印内衬`.
- Game crafting references describe a lining as an armor component and Warding as an elemental-resistance effect. Replaced the unclear transliteration `워드` with the established Korean term `원소 저항`, retaining the source label: `장인급 원소 저항 안감(Master Warding Lining)`.
- The exact stat value for this Master-tier item was not established; no percentage or numerical effect was added. Sources checked 2026-11-06: the game manual and Kingdoms of Amalur crafting-component references.
- Verified the updated `base:38:11` against English, confirmed all 4,845 parsed `base` records remain present, and passed all four line-ending-preservation tests.

## Snakeroot

- Compared `base:4832:11` with English (`Snakeroot`), Japanese (`スネイクルート`), and Chinese (`蛇根草`).
- Botanical references use `snakeroot` as a common name for multiple plants, not as a unique species name. The game item label does not identify a more specific plant, so no species was inferred.
- Added the exact English item label: `스네이크루트(Snakeroot)`.
- Verified the target ID and variant against the English source and confirmed all 4,845 parsed `base` records remain present. Sources checked 2026-11-06: Kew Plants of the World Online and botanical references on snakeroot common-name usage.

## Greaves, Chausses, and Boots

- Replaced `정강이받이` with the clearer `정강이 보호구` in all 34 `base` rows whose English source is `Greaves`. Updated the four corresponding `default` uses at IDs `1930`, `4766`, `14301`, and `57283`.
- Source review distinguishes `Greaves` (lower-leg armor) from `Chausses` (mail leg armor/leg coverings) and `Boots` (footwear). Updated `default:39353`, whose English text says `chausses`, from `정강이받이` to `각반`; `Boots` translations remain unchanged.
- Sources checked 2026-11-06: Getty Art & Architecture Thesaurus and Royal Armouries for `Greaves`; Fitzwilliam Museum terminology for `Chausses`.

## Rose Court and Onyx Tower

- Compared `default:24342`, `31825`, and `45092` with the English source. `Rose Court` was consistently translated as `장미 궁정`; added `(Rose Court)` at all three occurrences.
- `Onyx Tower` appeared once as `흑옥탑` and twice as `오닉스 탑`. Standardized all three to `오닉스 탑(Onyx Tower)`.
- `Dominus` and `Magister` each occur once, together at `default:31825`; added `(Dominus)` and `(Magister)` to their Korean renderings.
- Distinguished the separate place name `Salon Magisterium`, found in `default:28030`, `32381`, `32965`, and `35870`; it is not the title `Magister` and was not changed in this scoped review.
- Verified all three edited IDs against English and confirmed the complete `default` record count was preserved. All four line-ending-preservation tests passed.

## Health terminology and Cora Banick dialogue

- Changed `default:20690` from recovering `활력` to recovering `체력`. English says “renewed vigor”; Japanese explicitly identifies the restored resource as `体力`, and Chinese also describes restoring life force. The upgrade marker and sentence structure remain unchanged.
- Changed `default:30018` to conversational 반말: `대장기술이나 연금술에 관심 있어? 우리 작업대는 마음껏 써도 돼.` This matches Cora Banick's informal line at `default:20323` and the casual Japanese source while preserving the existing workbench interpretation.
- Retained `활력` at `default:39166` as explicitly directed by the user.
- Verified the three IDs against the active CSV and English/Japanese/Chinese references. No other rows were targeted.

## Meropis name pairing

- Compared all Korean `메로피스` occurrences in the active `base` and `default` CSVs with the English source.
- Added `(Meropis)` to all 17 previously unpaired occurrences in `default`, including repeated mentions within a row and two repeated `Discoverer of the island of Meropis...` strings with no populated ID. Existing paired occurrences in `base` and `default` were retained.
- Verified the edited IDs against their English source rows and checked CSV record structure and line-ending preservation.

## Jory name pairing

- Compared every active Korean `조리` candidate with its matching English `default` row. Excluded ordinary `조리법` uses and the distinct name `Jorielle`.
- Added `(Jory)` to 12 previously unpaired mentions at `default:9974`, `1170`, `20250`, `23428`, `31821`, `33180`, `40319`, `41123`, `41939`, `49303`, `51412`, and `57893`. Rendered the full name at `20250` as `조리 데이스(Jory Dace)`; added the pairing to the second mention in `1170`.
- Retained existing English pairings in the other Jory rows.
- Verified the changed rows against English and checked CSV structure and line-ending preservation.

## Warsworn name pairing and review

- Cross-checked all 410 English `Warsworn` rows across `base` (14) and `default` (396) against the Korean CSVs. All had a Korean Warsworn rendering.
- Found one direct name mention without an English pairing at `default:17098`; added `(Warsworn)`. Compound labels already carrying the full English title in parentheses were retained without redundant additions.
- Compared `default:17098` with English, Japanese, and Chinese. The Korean meaning and dialogue were accurate; only the name pairing was missing.
- Rechecked the full source-matched set for missing pairings and verified the default CSV structure and line-ending preservation.

## Troll type name pairing

- Compared all English `default` rows containing named troll types with the active Korean rows. Added full English type names at 25 IDs, including `Mountain Troll`, `Rock Troll`, `Silverback Troll`, `Silvermane Troll`, `Chaos Troll`, `Prismere Troll`, `Stowaway Troll`, `Ice Troll`, and `Mithros Icy Troll`.
- Preserved the distinct source name `Mithros Prismere Troll` at `default:42332`; standardized the shortened Korean `산 트롤` at `default:23224` to `산악 트롤`. The generic `Troll` references and the `Two Knights and a Troll` title were excluded.
- Verified each changed type against its English source row, confirmed the default CSV record count and ID order, and checked that the UTF-8 BOM and CRLF line endings were preserved.

## Ability category and tree terminology

- Standardized direct Might, Finesse, and Sorcery ability-category wording by removing the inconsistent `계열` at `default:34502`, `55223`, and `35397`. In `35397`, added the English names inside the existing display wrappers: `힘(Might)`, `재주(Finesse)`, and `마법(Sorcery)`.
- Rendered explicit Ability Tree references as `능력 트리` at `default:33690`, `33991`, `47472`, and `51888`, distinguishing tree references from direct category labels.
- Kept `마법 계열` for Sorcery-based weapons at `default:8510`, `46988`, and `47873`; those entries describe weapon types, not abilities in the Sorcery tree.
- Compared all changed IDs with their English and Japanese source rows, preserved display-wrapper tokens, and checked CSV structure and line endings.

## Sir Airmer dialogue at 47557

- Compared `default:47557` with English and Japanese, and checked Airmer's conversational dialogue at `default:40723` and `60891`.
- The previous Korean shifted abruptly into formal `-습니다` speech and redundantly called the pair “기사들.” Reworded the introduction in conversational style and made Creth and Airmer the subject of “되찾았어.”
- Verified the revised text against the English source ID and preserved the CSV's line endings.

## Echostone terminology

- Compared all English `default` source rows using `Echostone` or `Echo Stone` with the corresponding Korean, Japanese, and Chinese rows. The English variants refer to the same magical device; `base` has no matching source entries.
- Standardized all 23 Korean source-matched IDs to `에코스톤(Echostone)`, including repeated mentions within the same row: `2470`, `3788`, `4414`, `6884`, `10816`, `27588`, `29492`, `29989`, `30479`, `30695`, `35035`, `36912`, `36940`, `38082`, `38972`, `50791`, `51514`, `54698`, `56286`, `57031`, `57847`, `58118`, and `58814`.
- Checked the row-level change set, confirmed physical line count, UTF-8 BOM, and CRLF line endings are unchanged, and found no remaining `메아리석`, `메아리돌`, or `에코 스톤` forms in the active Korean `base`/`default` files.
- A full Ruby CSV parse remains blocked by a pre-existing malformed unquoted newline at physical line 1172 of the `default` CSV; the 23 edited source rows are single-line records. The four line-ending-preservation tests passed.

## Dialogue register follow-up

- Corrected `default:42435` from `몰랐습니다` to `몰랐어요`. The same utterance already uses polite `-요` (`생각도 못 했어요`), while the final clause alone switched to formal `-습니다`; Japanese likewise ends in polite `知りませんでした`.
- Verified the English meaning (`I didn't know he drank it`) and Chinese supporting text. This is a local within-utterance register correction; no speaker identity or cross-ID continuity is inferred.
- A current-text scan found within-utterance Korean polite/formal shifts. Compared the high-confidence cases at `default:831`, `1155`, `1379`, `2693`, `2842`, `3506`, `6016`, `6385`, `7274`, `8569`, `15033`, and `51964` with English and Japanese, then aligned the outlying endings to the register already used in each utterance. Preserved wording and meaning beyond those endings.

## Full Japanese/Korean dialogue register audit

- Audited all 65,135 aligned `default` IDs in the current Korean, English, Japanese, and Chinese tables. Japanese was the main voice/register reference, English anchored meaning, and Chinese was supporting evidence.
- The first pass produced 772 local candidates. An independent second pass dropped 461 and retained 311. Manually screened the 116 retained candidates whose reasons directly concerned speech level, address, or spoken-vs-written style; source-matched mixed-register lines and intentional ritual or quoted styles were not mechanically normalized.
- Applied 58 ID-scoped replacements across 57 rows: `208`, `2426`, `6470`, `6787`, `8122`, `9043`, `9314`, `10346`, `12242`, `12884`, `13326`, `14903`, `15161`, `16125`, `17214`, `22779`, `25393`, `27119`, `31126`, `32238`, `32421`, `33024`, `33356`, `33436`, `33784`, `34166`, `34879`, `35623`, `37259`, `37315`, `37786`, `40610`, `45584`, `46060`, `46586`, `48164`, `49137`, `49420`, `50222`, `50589`, `52250`, `52924`, `53092`, `54069`, `54158`, `54475`, `55457`, `56170`, `56173`, `56260`, `56794`, `58672`, `60809`, `61127`, `61665`, `64011`, and `64133`.
- Corrections aligned inconsistent endings within an utterance, removed mismatched address/honorific forms, and replaced abrupt written-style clauses in spoken lines. For example, `default:9314` now correctly says the ambassador was waiting; `default:25393` no longer honorifically refers to the speaker as “스승님”; and `default:56173` uses consistent conversational endings.
- The full machine-audit evidence is in `work/zh_cn/audit/full-voice-20261106-current/`. It records complete 65,135-row coverage and the pre-edit input snapshot; the later 58 replacements are recorded above and were checked against the same English/Japanese IDs. No speaker continuity was inferred from IDs or row order.
- Reparsed the edited Korean table: 65,135 rows in original ID order, UTF-8 BOM retained, and line endings unchanged at 71,858 CRLF and 226 LF-only. The four line-ending-preservation tests passed, and the CRLF-aware diff check was clean.

## Nix at 23326

- Compared `default:23326` with English and Japanese, also checking German, Italian, and Spanish as corroborating translations. English and the European translations explicitly describe Nix as wishing to be a man/person; Japanese repeats Nix's name and avoids a gendered pronoun, though its phrasing is less explicit.
- Rephrased the Korean to make Nix the clear subject of the wish (`닉스는 그토록 바라던 대로 인간 대접을 받았다`) and retained the English-supported outcome that the knights killed him. Rendered `gentlemanly duel` as `신사다운 결투`.
- Verified the revised row against the English source ID; no claim about the character's appearance or in-game presentation was needed.

## Counter-spell and imprisonment spell terminology

- Checked every English `default` source row containing `counter-spell` or `imprisonment spell`: `7918`, `22384`, `24433`, `27311`, `27588`, `35463`, `35630`, and `63398`.
- These are distinct concepts: `imprisonment spell` is the spell that confines Tenhwa (`감금 주문` / `감금 마법` in context); `counter-spell` is the separate spell intended to oppose or end it (`대항 주문`). Japanese uses `幽閉の呪文` for the former and `対抗呪文` for the latter.
- Standardized the lone source-matched `반주문` at `default:63398` to `대항 주문`. Other source-matched counter-spell rows already use that term; retained the context-appropriate `감금 주문` and `감금 마법` for the imprisonment spell.
- Added the English source terms in parentheses for every occurrence in scope: `counter-spell` at `default:22384`, `27588`, `35463`, `35630`, and `63398`; `imprisonment spell` at `default:7918`, `24433`, and `27311`. At `24433`, the Korean wording remains `감금 마법` and receives the same source pairing.
- Verified the terminology against the English and Japanese rows for all eight IDs.

## White Hallam dialogue

- Compared `default:40273`, `19919`, and `23583` against English and Japanese, using the user's identification of White Hallam as speaker.
- Kept `40273` and `19919`: their plain/expository and tale-narration styles are consistent with the aligned Japanese text and do not show an honorific/register mismatch.
- At `23583`, changed `싸워` / `없애 버려` to `싸우지` / `없애 버리지`. English and Japanese narrate Wencen's actions rather than instructing the listener; the old endings could make the last clause sound like an abrupt command. The correction keeps the informal, legendary narration consistent with `19919`.
- Verified all three IDs against their English and Japanese source rows.

## White Hallam dialogue follow-up

- Compared `default:1`, `26513`, `40238`, `49980`, `26012`, and `34191` with English and Japanese, using the user's identification of White Hallam as speaker.
- Aligned the ballad narration and guidance with Hallam's established plain, conversational storytelling voice. Replaced stiff written endings at `1`, `26513`, and `34191`; made `40238` consistently conversational; and smoothed the instructions at `49980`.
- Rephrased `26513`'s unnatural `그를 돌파해야 한다` as `그를 넘어야 해`, and clarified `26012`'s `all that we've been through, all that we are` as `우리가 겪어 온 일과 우리라는 존재`.
- Verified all six revised rows against their English and Japanese source IDs; retained their existing named-term pairings.

## Stonewall and Brother Edwin

- Added the exact English name to `base:2305:11`: `돌담(Stonewall)`.
- Compared Brother Edwin's `default:6908` and `9488` with English and Japanese. Both Korean passages use plain declarative narration; Japanese does as well, and the reverent wording in `6908` is appropriate to the religious subject. No register correction was supported, so both rows remain unchanged.
- Verified the Stonewall label and both dialogue rows against their English and Japanese source IDs.

## Brother Wulf dialogue at 55950

- Checked `default:55950` against English and Japanese. The full voice audit classified it as Korean literary/written (`L`) against Japanese plain/casual (`C`), but it was not among the rows previously edited.
- Recast the stiff `그 사람이었다` / `강도` / `알려 주지 않았다` phrasing as conversational `그 사람이었어` / `힘` / `알려 주지 않았지`, retaining the source's meaning that he proposed lying and then revealed nothing.
- Verified the revision against the English and Japanese source row.

## Stellan Reitan dialogue at 36326

- Compared `default:36326` with the English and Japanese sources, using the user's identification of Stellan as speaker.
- Changed the stiff, written-sounding introduction to conversational Korean: `난 동부에 있는 광산 회사에서 일하는 측량사야. 이 지역을 조사하며 모은 자료는 전부 이 일지에 적어 뒀어.` The first revision only changed the endings and left the written-sounding `자료가 담겨 있어` construction; the user's follow-up correctly identified that register endings alone did not make it natural dialogue. Preserved the source's description of his employer and gathered information.

## Full Korean Naturalness Re-Review and Corrections

- On November 7, 2026, reviewed all 65,135 active Korean `default` IDs against the same-ID English and Japanese sources, with Chinese as supporting evidence. Two independently prompted reviewers each completed all 65,135 rows. Their candidate union contained 10,292 IDs, including 6,919 reviewer disagreements; disagreement did not remove any candidate.
- Source-based adjudication recorded every candidate as corrected, retained, or uncertain: 4,064 correction proposals, 5,441 retained rows, and 787 uncertain rows. An independent pass checked every correction proposal against the source rows and proposed Korean: 2,785 were approved for application and 1,279 were held. Final dispositions are 2,785 corrected, 5,441 retained, and 2,066 unresolved (787 uncertain candidates plus 1,279 held proposals). Unverifiable model quotations were preserved as held/uncertain decisions rather than discarded.
- Applied the 2,785 independently approved changes by exact ID and text-field match in the active `default` CSV. No global text replacement was used. The original file hash was checked before editing; reversing the complete applied-edit manifest restored that exact hash.
- The adjudication and verification evidence is stored under `work/zh_cn/audit/dialogue-naturalness-20261106/adjudication/`, including per-batch caches, `review-decisions.tsv`, `final-dispositions.tsv`, and `verification/verification-decisions.tsv`. The exact applied rows and source/result hashes are listed in `verification/applied-edits.tsv` and `verification/application-summary.json`.
- Reparsed the edited CSV and confirmed all 65,135 IDs remain unique and in order, the UTF-8 BOM is present, and the line-ending distribution is unchanged at 71,858 CRLF and 226 LF-only. The line-ending helper tests and audit/adjudication/application tests passed (23 tests total); Python compilation and the CRLF-aware diff check passed.
- The user continues in-game verification and may report further dialogue corrections.
