# Default Scope Review D-19876 (50 IDs)

2026-10-13. Compared all 50 active default rows 40051-40100
against English (meaning anchor), Japanese (voice), Chinese (support),
prior exact-key findings and official Korean manual background.
No PAK used; `src/csv/` read-only.

| ID | Result | Evidence |
| ---: | --- | --- |
| 40052 | Accepted: `철문과 마법진이 길을 막고 있지.` -> `철문이 길을 막고 마법진이 그를 가두고 있지.` | English separates the iron gate blocking passage from the magic circle holding Adar prisoner. Chinese confirms this distinction; Japanese identifies both as restraints. The earlier D-12693 concern about place/person names is not reclassified. |
| 40069, 40082, 40087, 40089 | Prior findings verified, not recounted | D-12698 and D-12701 corrections remain active; D-12700's two recruitment constraints remain intact; 40089's Pledgeshield is distinct from the medicinal Plagueshield. |
| 40052, 40058, 40063-40064, 40068, 40077, 40089, 40093, 40095 | Material uncertainties retained | Earlier D-12693-D-12697/D-12699/D-12702-D-12704 concern canonical names, role, missing source context or malformed Balor logic. ID 40052's referents are fixed, but its *names* remain unresolved. |

Remaining rows preserve source meaning. D-12705's terminal ordinary
row group and the earlier accepted keys are not duplicated; affix 55
remain closed D-19565. No global total asserted.

Pre-edit SHA-256:
`ec02a6466d6d6dd5b03ac451dffa6a50dfe4f78dcb88009878d291947bb21b37`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19876/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`413d845612cd2eb0906baebf16a3bbead05f7db7b539c915bf7448e6c54c90b9`.
Inverse reconstruction proved all bytes outside the one target Texto
unchanged; BOM, 72,011 CRLF / 73 bare LF, 65,135 ordered IDs and
four-locale 50-row alignment verified.

Last reviewed ID 40100; next D-19877 / IDs 40101-40150.
25,034 actual rows remain through 65134; overall review incomplete.
