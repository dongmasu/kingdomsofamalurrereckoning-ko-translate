# D-21651: Source-Local Ysa Name Annotations

Date: 2026-10-18

## Scope

English names the exact source form `Ysa`; Japanese イーサ and Chinese
伊萨 corroborate it. Add only the missing English parenthetical to the
established Korean name. The referenced city/person/affiliation remains
unresolved; no entity classification or relationship is inferred.

| Key | English context | Korean old | Korean new |
| --- | --- | --- | --- |
| `default:5300:` | `Presenting the Master Mystic, wise Daughter of Ysa!` | `이사의 지혜로운 딸, 신비학의 대가를 소개합니다!` | `이사(Ysa)의 지혜로운 딸, 신비학의 대가를 소개합니다!` |
| `default:64930:` | `I was once a grand knight in the clan of Ysa, but misfortune befell me when I believed the lies of the witch. She lured me, wooed me, honored me, promised me power.` | `나는 한때 이사 일족의 위대한 기사였지만 마녀의 거짓말을 믿고 불행에 빠졌어. 그녀는 나를 유혹하고, 사랑을 속삭이고, 치켜세우며 힘을 약속했지.` | `나는 한때 이사(Ysa) 일족의 위대한 기사였지만 마녀의 거짓말을 믿고 불행에 빠졌어. 그녀는 나를 유혹하고, 사랑을 속삭이고, 치켜세우며 힘을 약속했지.` |

The existing `place:ysa` holds at these keys remain `uncertain` with
their original evidence. The source-local annotation neither resolves
nor recounts them. The already paired Ysa label at default:61515 and the
complete bilingual source phrase at default:57728 were checked and left
unchanged.

## Current Checkpoint

Latest verified proper-name batch: D-21651 (2026-10-18).
Reviewed two source-local Ysa labels; both received bilingual English annotations. No entity type, identity, alias, glossary entry, occurrence disposition, or historical tally was added or changed.
The place-versus-person/affiliation questions at default:5300 and default:64930 remain uncertain; this scope annotates only the exact source name and does not resolve those holds.
Indexed matches: 45672; accepted=30548, excluded=2978, not-an-issue=12043, uncertain=103.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 103, in 98 distinct CSV row keys; these are not the complete residual discovery set.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `0b9f479ef25ac8d98898a584e510b9d83ec021922c2796c1df8fc1a91aeb5379`.
- default: `353d6eb1becccd1cb24979f72cd71244dbbe4d8b7f2998613f68e66105e60fbb`.
Last batch pre-edit backups and byte validation:
- default: 2 cells; pre `da21268562f2dae988d638902eabce1114f57d493e7d0e601b946fa46ce32a1d`; post `353d6eb1becccd1cb24979f72cd71244dbbe4d8b7f2998613f68e66105e60fbb`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21651/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 2 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 353d6eb1becccd1cb24979f72cd71244dbbe4d8b7f2998613f68e66105e60fbb
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 3 cells; pre `8f1af775c1a844ad3c6b35eb5e4aa75d70d706114db4deb39ef370742d8b32a8`; post `0b9f479ef25ac8d98898a584e510b9d83ec021922c2796c1df8fc1a91aeb5379`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21647/locatexts_zh_cn.koalocatext_base.csv`.
- default: 2 cells; pre `da21268562f2dae988d638902eabce1114f57d493e7d0e601b946fa46ce32a1d`; post `353d6eb1becccd1cb24979f72cd71244dbbe4d8b7f2998613f68e66105e60fbb`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21651/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `cfd28b9d3074c9b874c0d480169e93b04bbcaaa18cf0bb0931973c96773617da`.
Occurrence index: 45672 rows; SHA-256 `f378293f21a930e074f1bc7ccbcb391b0a8ebabc117d8a17f8de408806fadcaa` (only the two target `korean_current` snapshots were synchronized; dispositions and evidence are unchanged).
Proper-name glossary: 2171 entries; SHA-256 `29f53ff36a2c7bb9a5d58f87ba1d27c28e7d6dcf3ed0f6bb0b2c9e93de724df8` (unchanged).
Report: `work/zh_cn/audit/named-scope-review-D21651-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21651-20261018.md`.
Source-label manifest: `work/zh_cn/audit/proper-name-edits-D21651.tsv`.
Residual source/index audit: PASS; Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0; Source/occurrence comparison: 44608 source matches, 45672 indexed matches, 73430 CSV rows; Terminal matches without a covering bilingual English label: 0; Documented row-scoped Syl place labels: 5.
Data validation: PASS 2171 unique entities; 45672 unique active-aligned occurrences
{"accepted"=>30548, "uncertain"=>103, "excluded"=>2978, "not-an-issue"=>12043}
Next: D-21652; continue source discovery/residual checks without reopening prior holds absent new evidence.


## Validation

- default: PASS 2 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 353d6eb1becccd1cb24979f72cd71244dbbe4d8b7f2998613f68e66105e60fbb
- Glossary and candidate shortlist remained unchanged. The occurrence index changed only in the two target `korean_current` snapshots; all dispositions and evidence remained unchanged. Non-target CSV resource bytes remained unchanged.
- Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0
- Source/occurrence comparison: 44608 source matches, 45672 indexed matches, 73430 CSV rows
- Terminal matches without a covering bilingual English label: 0
- PASS 2171 unique entities; 45672 unique active-aligned occurrences
{"accepted"=>30548, "uncertain"=>103, "excluded"=>2978, "not-an-issue"=>12043}

Full proper-name discovery remains incomplete. No PAK or PAK-derived
resource was consulted.
