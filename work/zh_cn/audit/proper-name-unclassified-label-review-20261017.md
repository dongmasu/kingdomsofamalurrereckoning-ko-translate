# Unclassified Source-Label Review

Date: 2026-10-17. Read-only follow-up after D-21620.
These are reviewed discovery candidates, not newly registered entities,
accepted CSV corrections, or additions to the 96 indexed uncertain matches.
English, aligned Japanese/Chinese, and the active Korean cells were checked
across affix/base/default. All 24 keys below lack glossary/occurrence ownership.
No PAK material was consulted. The two official Korean manual files provide
no direct identification for these labels.

This is the pre-D-21621 discovery snapshot. The proposals below were
subsequently processed in D-21621; the D-21621 manifest and report are the
authoritative record of the resulting source-local annotations. Their
referent categories remain unclassified.

## Evidence And Disposition

All 14 candidate groups retain **uncertain referent classification**.
Capitalization, phonetic Japanese, or a base-resource label alone does not
establish a person, deity, named item, monster, or skill.

| English | Exact Keys | Japanese / Chinese Evidence | Korean / Finding |
| --- | --- | --- | --- |
| Acae | default:25633 | アカエ / 艾珂 | 아카에; isolated label only. |
| Agathe | default:32264, 43088 | アガサ / 阿加瑟 | 아가테; repeated label, no referent context; pronunciation not settled. |
| Ainmere | default:49272 | アニメラ / 艾因米尔 | 아인미어; isolated label, differing phonetic references. |
| Anicetus | default:47221 | アネシタス / 安尼克托斯 | 아니케투스; isolated label only. |
| Arcaneid | base:3224:11; default:31616, 56850 | アーケネイド / 阿卡内德 | 아르카네이드 / 아케네이드 / 아르카네이드; a spelling-consistency candidate, but entity type remains unknown. |
| Ardinia | default:57610 | アーディニア / 阿迪尼亚 | 아르디니아; isolated label only. |
| Utricul | default:19592, 34310 | ウトリクル / 乌特里库尔 | 우트리쿨; repeated label, no further identity context. |
| Vandala | default:41488 | ヴァンダラ / 梵达拉 | 반달라; isolated label only. |
| Veshani | base:2011:11, 3266:11; default:30493, 50220 | ヴェシャーニ / 维莎妮 | First three rows already pair 베샤니(Veshani). At 50220 a woman's figurine has this inscription; the unpaired inscription could be annotated without claiming a deity or identifying the woman. |
| Woerlowe | default:34374 | ウォエロワ / 沃尔洛 | 워얼로; isolated label and differing phonetic references. |
| Ychen | default:25715 | ユーチェン / 伊琛 | 이첸; isolated label, no established pronunciation/category. |
| Yurele | default:16779, 33559 | ユエレの護衛 / ユエレ; 尤勒里护卫队 / 尤勒里 | 유렐레 호위 / 유렐레; shared name component is supported, but Escort could be a unit, quest, or another label. A row-local bilingual annotation need not assume its type. |
| Yzzzzhgoi | default:63091, 64752 | ンクナメヒク / 额啦巴是德拉 | 이즈즈고이 / 이즈고이(Yzzzzhgoi); strong locale/spelling disagreement, no supported normalization. |
| Zosime | default:34935, 47532 | ゾサイム / 佐塞姆 | 조시메; repeated label, pronunciation/category not established. |

**D-21621 follow-up:** Arcaneid's three labels were checked together; only
the inconsistent default:31616 spelling was normalized. The Veshani
inscription at default:50220 and the unpaired default:30493 label received
the existing `베샤니(Veshani)` annotation. Yurele at default:16779/33559
received source-local English pairing. The three Cynric labels at
default:16620/26408/58285 were aligned to `신릭(Cynric)`. These are
source-label decisions only: no person, item, deity, skill, or other entity
category or identity was inferred, and no occurrence ownership was added.
See `named-scope-review-D21621-20261017.md` and
`proper-name-edits-D21621.tsv`.

## Other Mining Residuals

- default:16620, 26408, 58285 are isolated `Cynric` labels, now source-locally
  paired as `신릭(Cynric)` in D-21621. Japanese シンリック and Chinese
  辛瑞克 support the localized stem where available; 58285 retains English
  in both supporting locales. Their identity is not linked to Wine Cynric,
  whose complete name occurs at default:63688, or to Lirin Cynric.
- default:34611 `Cynric Pit` has Japanese シンリック・ピット and Chinese
  辛瑞克洞穴. No source establishes equivalence to Cynric Mine/Quarry;
  neither identity nor a separate physical site is asserted.
- default:17112/21534 use `Skoria` in trespass/stranger contexts, and
  55666 says `miners of Skoria` while calling the group a family.
  These do not isolate mine, family property and membership clearly enough
  for the new mine-short-form scope. They remain outside D-21619.
- Darkvari/Zungar surname rows 38373/59457/61305 were handled in D-21619;
  do not return them to the queue or recount the old personal-name exclusions.

Earlier Eyrie Peak/Eryie Peak and ability-looking label holds remain in the
historical D-21614 queue. No new evidence for those holds was found here;
their dispositions were not reopened. This finite candidate review does
not establish exhaustive source discovery or an overall completion rate.
