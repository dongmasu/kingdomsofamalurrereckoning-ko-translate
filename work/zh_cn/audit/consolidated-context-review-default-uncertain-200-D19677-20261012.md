# Grouped Default Uncertain Review: D-19677

Reviewed 200 exact four-locale keys in
`uncertain-200-D14883-D15163-20261012.jsonl`, grouped by cultural
adjective, faction, named rank, component and place. English anchors
meaning; Japanese voice, Chinese cross-check. Used prior accepted
Korean term decisions and official manual setting. No PAK material.

| IDs | Approved corrections | Basis |
| --- | --- | --- |
| 48727, 49280, 49526 | `미사루` -> `미타란` in Mitharan equipment | Mitharan cultural/item adjective is distinct from Mitharu deity (D-19670/71); 49280 also corrects *Rivets* from `결속구` to `리벳`. |
| 48866 | `서약검` -> `맹세의 칼날` | Formal Oathblade rank. |
| 48988 | `여행자 슬루프선` -> `트래블러 슬루프선` | Traveler faction-owned vessel, consistent with D-19675. |
| 49038 | `첫 번째 검` -> `제일검` | First Sword is the formal Alfar title. |
| 49045 | `교차점` -> `크로싱` | Named magical Crossing site, established in prior batches. |
| 49085, 49639, 49724 | `케이프 솔러스` -> `케이프 솔라스` | Established Cape Solace place-name form. |
| 49565 | `현자들` -> `사반트들` | Savants formally ranked within Scholia Arcana. |
| 49583 | `투아타` -> `투아사`; `하우스 오브 소로우` -> `비탄의 집`; `새터닌` -> `사투르닌` | Formal Tuatha faction, House of Sorrows and Saturnyn names. |
| 49616, 49773 | `히에로판트` -> `대사제` | Named Hierophant title. |
| 49623 | `근위병` -> `프레토리안` | Praetorian named rank. |

**15 accepted / 185 not an issue / 0 newly retained**. Other
keys remain source-faithful without grounded local corrections;
49668 already uses approved `숙련자` for Adept.

Pre-edit SHA-256:
`efd24ede4ad31e6359d333ff06739c974febd229b3d8b281e3019fabacc97837`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19677/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`69c9653b0e7383cdb3d10cb10f837130eaf9022b0fcd50c549570593df73dbd2`.
Applicator `REVIEW_BATCH=D19677 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified exact locale source cells 200 each, inverse byte
reconstruction, BOM, mixed record endings, ordered IDs and all
non-approved bytes.

Totals **3,178 accepted / 31,844 not an issue / 3,502 uncertain**
(38,524); separate affix 55 closed D-19565; default incomplete.
