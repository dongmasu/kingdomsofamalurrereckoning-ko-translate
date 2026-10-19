# D21778 Read-Only Scout

Input: `proper-name-short-label-discovery-D21774.tsv` and the saved
`/private/tmp/proper-name-source-inventory.tsv`. English determines meaning
and identity. Japanese/Chinese corroborate the exact rows. This file is a
proposal, not an application or a change to any prior decision.

## Ready Registration Scope

These four definitions cover 21 distinct keys in one bounded stage. Each
listed full English phrase was searched case-insensitively with letter
boundaries across affix/base/default. No affix hits occur in these four
scopes. No bare component alias is proposed. Main must use the reviewed
discovery gate and preserve every existing entity/key status and evidence.

| Proposed entity_key | english_canonical | category | korean_canonical | Full source keys |
| --- | --- | --- | --- | --- |
| `item:rose-of-kandrian` | Rose of Kandrian | unique item | 칸드리안의 장미(Rose of Kandrian) | `base:1473:11`; `default:7723`, `11022`, `20046`, `28656`, `33698`, `59162` |
| `creature:rotclaw` | Rotclaw | creature | 로트클로(Rotclaw) | `default:27000`, `50926`, `50987`, `55629`, `63022`, `64223` |
| `plant:scarwood-tree` | Scarwood Tree | plant | 스카우드 나무(Scarwood Tree) | `base:2184:11`; `default:61206` |
| `place:scholia-arcana-grounds` | Scholia Arcana Grounds | place | 스콜리아 아르카나 구역(Scholia Arcana Grounds) | `base:329:11`; `default:17420`, `23434`, `25147`, `47028`, `55994` |

### Rose of Kandrian: Seven Reviews

English `default:7723` explicitly enumerates the Rose among three requested
items and locates it at Jera Dace's grave; `11022` says it is recovered and
used to reconstruct the Amrynthian Band. `20046` confirms acquisition;
`28656` requests collection; `59162` repeats its origin. Japanese
カンドリアンのバラ and Chinese 坎德利安玫瑰 corroborate the quest object.
This does not register generic roses, a plant species, or Kandrian as an
alias of the item.

Five accepted proposed reviews: replace exactly one unpaired
`칸드리안의 장미` with `칸드리안의 장미(Rose of Kandrian)` at
`base:1473:11` and `default:20046`, `28656`, `33698`, `59162`.
`default:7723` and `11022` already contain that complete pair: unchanged,
not-an-issue. No exclusions within this seven-key exact-phrase scope.

Preserve `place:kandrian=excluded` at both standalone item labels and at
`default:11022`; do not turn the item's internal Kandrian into a place
reference. Preserve all other owners, including Bloodstone, Amrynthian Band,
Derfel, Jera Soren, Kells Cafferty, Scholia Arcana, and the source's
Jera Dace wording.

### Rotclaw: Six Reviews

English `default:50987` identifies Rotclaw as a minor kobold warrior;
`64223` independently calls Rotclaw a warrior, and `63022` names the killed
kobolds. Japanese ロトクロー and Chinese 腐爪 corroborate the named
creature. Do not merge it with Blackshriek, King Fang, or the kobold species.

One accepted proposed review: at `default:27000`, the entire Korean label
is `부패 발톱`; replace it with `로트클로(Rotclaw)`.
`default:50926`, `50987`, `55629`, `63022`, `64223` already contain
`로트클로(Rotclaw)`: unchanged, not-an-issue. No exclusions within this
six-key exact-name scope. Japanese/Chinese at `55629` merely repeat English;
they do not supply an independent reading.

Preserve the existing `creature:blackshriek`, `creature:king-fang`,
`monster:kobold`, `person:niahm-kent`, `place:tala-rane`, and
`faction:warsworn` decisions in the shared rows. No old creature scope is
reopened.

### Scarwood Tree: Two Reviews

English `default:61206` explicitly explains the tree's name and its
diamond-hard bark spines, then describes the bark's potion effect.
Japanese スカーウッドの木 and Chinese 伤痕之木 corroborate the tree in
`base:2184:11`. Reuse the established `resource:scarwood-bark` stem
스카우드, rather than inventing a second plant identity from 상처나무.
The existing bark resource remains separate and terminal.

Two accepted proposed reviews:

| Key | Exact old span | Exact new span |
| --- | --- | --- |
| `base:2184:11` | 스카우드(Scarwood) 나무 | 스카우드 나무(Scarwood Tree) |
| `default:61206` | 상처나무(Scarwood Tree) | 스카우드 나무(Scarwood Tree) |

Do not add a global `Scarwood` alias. The isolated `default:8694` has
English-only Scarwood in both supporting locales and is uncertain.
The 50 lexical Scarwood hits are not 50 tree-entity reviews: longer
Scarwood Bark compounds belong to the existing resource scope and are
outside this two-key definition.

### Scholia Arcana Grounds: Six Reviews

The two complete place labels, `default:23434`'s distance statement, and
`55994`'s explicit meeting in the Main Hall of the Grounds in Rathir
establish the site. Japanese アルカナ大学の中庭 and Chinese 奥术学院场地
corroborate the labels. The narrative support in `25147`, `55994` is less
specific in Japanese/Chinese; English remains the authority.

Four accepted proposed reviews:

| Key | Exact old span | Exact new span |
| --- | --- | --- |
| `base:329:11` | 스콜리아 아르카나(Scholia Arcana) 구역 | 스콜리아 아르카나 구역(Scholia Arcana Grounds) |
| `default:17420` | 스콜리아 아르카나(Scholia Arcana) 경내 | 스콜리아 아르카나 구역(Scholia Arcana Grounds) |
| `default:25147` | 스콜리아 아르카나(Scholia Arcana) 구역 | 스콜리아 아르카나 구역(Scholia Arcana grounds) |
| `default:55994` | 스콜리아 아르카나(Scholia Arcana) 부지 | 스콜리아 아르카나 구역(Scholia Arcana Grounds) |

At `55994`, replace only the second institution mention, whose complete
local span includes 부지. Preserve the first independent institution
mention and `본관(Main Hall)`. At `25147`, the lower-case English `grounds`
is source-local; do not silently claim different source casing.

`default:23434` already has the complete canonical pair: unchanged,
not-an-issue.
`default:47028` is the longer atomic `Dreamworld - Scholia Arcana Grounds`
label: exclude the component match and preserve the entire Korean cell.
Do not infer that the Dreamworld instance is the real-world grounds.

Preserve every existing `faction:scholia-arcana` decision, including its
accepted decisions at both standalone labels. A complete place annotation
replaces a component annotation; it must not create nested English pairs or
change the institution's historical index disposition.

## Remaining Candidate-Only Findings

Counts below are lexical source hits across all three resources, not
confirmed entity counts or historical global totals. Case variants share
the same lexical scan. Only the stated D21774 candidate rows were locally
reviewed for these mixed/common scopes; no unchecked full-scope review or
registration is claimed.

| Candidate | Snapshot keys | Full lexical hits | Classification and disposition |
| --- | ---: | ---: | --- |
| Ring | 4 | 389 | Equipment noun at `base:3711:11`, `base:4365:11`, `default:53416`: keep 반지, no named-equipment registration. `default:1029` instead explicitly says "We are the Ring" about Vilaghru's Twelve: keep 고리(Ring); hold collective identity separately. Do not merge these senses. |
| SAGECRAFT / Sagecraft | 4 / 5 | 43 | Named gameplay skill, not a person or unique site. Manual PDF p.4 supports 마법물품 제작; exact existing pairs at `default:51079`, `54804`, `56034` are adequate. Candidate labels `47176`, `39412`, `41608` already use the manual Korean. No skill-wide transform is ready: full hits include compounds and altar references. |
| Sagecrafting | 14 | 58 | Same manual-supported crafting terminology, including ordinary activity uses; not a new institution/person. Twelve label keys use 마법물품 제작; `2712`, `3102` already pair Sagecrafting. No unchecked 58-key registration or blanket rewrite. |
| Sagecraft Altar | 3 | 14 | Repeatable workstation type, not one unique named place: English `50880` says "any Sagecraft Altar." Manual PDF p.8 supports 마법물품 제작 제단. Keep `base:3299:11`, `default:53167`, `50880`; the last already has the complete pair. |
| SORCERY | 2 | 50 | Gameplay discipline in `default:7982`, generic magic in other contexts. Manual extraction explicitly prints 마법(Sorcery), not 마법술. `default:65095` already uses manual 마법. Do not globally normalize the 50 lexical hits or reopen the terminal prose at `7982`. |
| Savant | 9 | 99 | Formal Scholia rank, explicitly second highest at `default:3673`, not a person. Existing glossary `person:aethan-engar` notes D21050's established 사반트. `58585` is unpaired 사반트, but the mixed 99-key rank/person/title scope is not a ready one-stage registration. Preserve 현자/학자-containing terminal rows pending explicit separate title scope. |
| Savant Aethan Engar | 4 | 12 | Existing `person:aethan-engar`; no new person or global Savant alias. `default:47690` already has 에이선 엥가르(Aethan Engar), with accepted owner. Other candidate keys `760`, `18347`, `54082` already pair the complete titled name. No edit recommended; all 12 full titled-name hits are not a new identity. |
| Scarwood | 2 | 50 | Bare `8694` remains uncertain; `base:2184:11` belongs to the separately scoped full tree label above. Preserve existing Scarwood Bark resource and do not add a global short alias. |
| Sceptre / Sceptres | 7 / 3 | 33 / 15 | Common weapon class, not a named item. Manual PDF p.7 establishes 셉터. Optional candidate-label-only normalization is listed below; it is not a new proper-name registration or a blanket compound rewrite. |

The twelve unpaired Sagecrafting label keys are
`default:7329`, `11286`, `11294`, `12184`, `14693`, `21513`, `23190`,
`32581`, `39107`, `52417`, `55436`, `55761`.

Sceptre candidate-label-only safe spans, if main chooses a separate
terminology stage:

| Keys | Exact old whole label | Proposed whole label |
| --- | --- | --- |
| `base:1074:11`, `base:1751:11`, `base:3071:11` | 홀 | 셉터(Sceptre) |
| `default:14097` | 셉터 | 셉터(Sceptre) |
| `base:2970:11` | 홀 | 셉터(Sceptres) |
| `default:64698` | 셉터 | 셉터(Sceptres) |

Japanese セプター and Chinese 权杖 corroborate these six exact weapon
labels. Preserve the existing `skill:sceptre-mastery` entity and every
named Sceptre compound. Already-paired candidate prose at `default:18589`,
`51672`, `54123`, `53542` needs no label annotation change.

## Manual And Ownership Limits

The official Korean manual reference lists Sagecraft/Sagecrafting on PDF
pp.4/8, Sagecraft Altar on p.8, and Sceptres on p.7. The extraction also
prints 마법(Sorcery). It does not establish the four new identities above;
their English quest, creature, flora, and site contexts do.

No CSV, glossary, occurrence index, checkpoint document, source, PAK, or
reference file was changed. The delegated investigator returned no result;
this scout records only the directly inspected saved snapshot/alignment
and existing glossary/index evidence. Historical translation holds and
global totals are neither resolved nor recounted.
